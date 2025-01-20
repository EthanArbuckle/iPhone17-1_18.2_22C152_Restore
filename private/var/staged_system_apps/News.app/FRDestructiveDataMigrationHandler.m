@interface FRDestructiveDataMigrationHandler
- (FCDestructivePrivateDataActionProvider)privateDataActionProvider;
- (FRDestructiveDataMigrationHandler)init;
- (FRDestructiveDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 defaultsDataDestructionItems:(id)a4;
- (NSArray)defaultsDataDestructionItems;
- (void)handleMigration;
- (void)setDefaultsDataDestructionItems:(id)a3;
- (void)setPrivateDataActionProvider:(id)a3;
@end

@implementation FRDestructiveDataMigrationHandler

- (void)handleMigration
{
  v3 = [(FRDestructiveDataMigrationHandler *)self privateDataActionProvider];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000076CC;
  v4[3] = &unk_1000C9FD8;
  v4[4] = self;
  [v3 consumeActionsUpToDestructiveActionSyncWithBlock:v4];
}

- (FRDestructiveDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 defaultsDataDestructionItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007A678();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007A598();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRDestructiveDataMigrationHandler;
  v9 = [(FRDestructiveDataMigrationHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateDataActionProvider, a3);
    v11 = (NSArray *)[v8 copy];
    defaultsDataDestructionItems = v10->_defaultsDataDestructionItems;
    v10->_defaultsDataDestructionItems = v11;
  }
  return v10;
}

- (FCDestructivePrivateDataActionProvider)privateDataActionProvider
{
  return self->_privateDataActionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDataDestructionItems, 0);

  objc_storeStrong((id *)&self->_privateDataActionProvider, 0);
}

- (FRDestructiveDataMigrationHandler)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRDestructiveDataMigrationHandler init]";
    __int16 v7 = 2080;
    id v8 = "FRDestructiveDataMigrationHandler.m";
    __int16 v9 = 1024;
    int v10 = 29;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRDestructiveDataMigrationHandler init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)setPrivateDataActionProvider:(id)a3
{
}

- (NSArray)defaultsDataDestructionItems
{
  return self->_defaultsDataDestructionItems;
}

- (void)setDefaultsDataDestructionItems:(id)a3
{
}

@end