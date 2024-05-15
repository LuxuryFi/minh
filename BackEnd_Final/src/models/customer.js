module.exports = (sequelize, type) => sequelize.define('customers', {
  user_id: {
    type: type.INTEGER, autoIncrement: true, primaryKey: true, allowNull: false,
  },
  email: { type: type.STRING(30), allowNull: false },
  full_name: { type: type.STRING(30), allowNull: true },
  first_name: { type: type.STRING(15), allowNull: true },
  last_name: { type: type.STRING(15), allowNull: true },
  phone: { type: type.STRING(11), allowNull: true },
  avatar: { type: type.STRING(100), allowNull: true },
  password: { type: type.TEXT, allowNull: false },
  profile_status: { type: type.BOOLEAN, allowNull: false, defaultValue: 0 },
  created_date: { type: type.DATE, allowNull: true, defaultValue: new Date()   },
  updated_date: { type: type.DATE, allowNull: true,  },
  refresh_token: { type: type.TEXT, allowNull: true },
  reset_password_token: { type: type.TEXT, allowNull: true },
  reset_token_expires: { type: type.DATE, allowNull: true },
  gender: { type: type.STRING(20), allowNull: true },
}, {
  timestamps: false,
  // hooks: {
  //   beforeBulkCreate: beforeBulkCreateHandler,
  //   beforeBulkUpdate: beforeBulkOtherHookHandler,
  //   beforeBulkDestroy: beforeBulkOtherHookHandler,
  //   afterCreate: afterHookHandler(HOOK_TYPE.CREATE),
  //   afterDestroy: afterHookHandler(HOOK_TYPE.DESTROY),
  //   afterUpdate: afterHookHandler(HOOK_TYPE.UPDATE),
  // },
});
