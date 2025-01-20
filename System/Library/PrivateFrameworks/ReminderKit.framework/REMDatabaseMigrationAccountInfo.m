@interface REMDatabaseMigrationAccountInfo
- (BOOL)isCloudKit;
- (NSString)identifier;
- (NSString)name;
- (REMDatabaseMigrationAccountInfo)initWithAccountType:(int64_t)a3 identifier:(id)a4 name:(id)a5;
- (int64_t)type;
@end

@implementation REMDatabaseMigrationAccountInfo

- (REMDatabaseMigrationAccountInfo)initWithAccountType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMDatabaseMigrationAccountInfo;
  v11 = [(REMDatabaseMigrationAccountInfo *)&v15 init];
  if (!v11)
  {
LABEL_7:
    v12 = v11;
    goto LABEL_11;
  }
  if (a3 && v9)
  {
    if (!v10)
    {
      NSStringFromREMAccountType(a3);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v11->_identifier, a4);
    objc_storeStrong((id *)&v11->_name, v10);
    v11->_type = a3;
    goto LABEL_7;
  }
  v13 = +[REMLogStore write];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[REMDatabaseMigrationAccountInfo initWithAccountType:identifier:name:](v13);
  }

  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isCloudKit
{
  int64_t v3 = [(REMDatabaseMigrationAccountInfo *)self type];
  return v3 == _auto_REMAccountTypeForPrimaryCloudKit() || [(REMDatabaseMigrationAccountInfo *)self type] == 6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithAccountType:(os_log_t)log identifier:name:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "REMDatabaseMigrationAccountInfo cannot be initialized without an account type and an identifier.", v1, 2u);
}

@end