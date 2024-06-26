import React, { useEffect } from 'react';
import { Table } from 'antd';
import { useDispatch, useSelector } from 'react-redux';
import { ImEye } from 'react-icons/im';
import { AiFillPrinter } from 'react-icons/ai';

import Button from '../../../components/Button';
import {
  fetchFavorite,
  selectFavorites,
  // selectWatchIsLoading,
} from '../../../store/slices/paymentsSlice';
import { formatDateAndTime } from '../../../helpers/formatDate';
import { Link } from 'react-router-dom';
import { deleteItemInCart } from '../../../store/slices/cartSlice';

export default function Watch() {
  const dispatch = useDispatch();
  const payments = useSelector(selectFavorites);
  // const isLoading = useSelector(selectWatchIsLoading);

  useEffect(() => {
    dispatch(fetchFavorite());
  }, [dispatch]);

  const paymentColumns = [
    {
      title: 'Favorite ID',
      key: 'ID',
      dataIndex: 'favorite_id',
    },
    {
      title: 'Product Name',
      key: 'Product_Name',
      dataIndex: 'product.title',
    },
    {
      title: 'Thumnail',
      key: 'Product_Image',
      dataIndex: 'product.documents.document',
      width: '20%',
      height: '100',
      render: Product_Image => <img style={{ width: '50%'}} alt={Product_Image} src={`http://localhost:3001/documents/${Product_Image}`} />
    },
    {
      title: 'Created Date',
      key: 'created date',
      render: (record) => formatDateAndTime(record.created_date),
    },
    {
      title: 'Actions',
      key: 'actions',
      render: (record) => (
        <div className="button-container">
          <Button
            className="button button--main--book rounded"
          >
            Delete
        </Button>
        </div>
      ),
    },
  ];

  return (
    <Table
      rowClassName="payment-row"
      x={true}
      // loading={isLoading}
      scroll={{ x: 300 }}
      pagination={{
        position: ['bottomCenter'],
      }}
      columns={paymentColumns}
      dataSource={payments}
      rowKey={(record) => record.order_id}
    />
  );
}
