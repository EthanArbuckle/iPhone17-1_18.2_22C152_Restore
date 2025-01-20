@interface AccountStatusHandler
+ (id)handlerForAccount:(id)a3;
+ (id)handlerForConfigurationType:(id)a3;
- (BOOL)statusHasChangedForAccount:(id)a3 oldAccount:(id)a4;
- (id)getStatusInfoFromAccount:(id)a3;
- (id)getStatusKeyPathFromAccount:(id)a3;
@end

@implementation AccountStatusHandler

+ (id)handlerForConfigurationType:(id)a3
{
  id v3 = a3;
  if (qword_100022280 != -1) {
    dispatch_once(&qword_100022280, &stru_10001C890);
  }
  if ([(id)qword_100022278 objectForKeyedSubscript:v3]) {
    v4 = objc_opt_new();
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)handlerForAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"RemoteManagementConfigurationType"];
  if (v4)
  {
    v5 = +[AccountStatusHandler handlerForConfigurationType:v4];
  }
  else
  {
    v6 = +[RMLog accountStatusHandler];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014E14((uint64_t)v3, v6);
    }

    v5 = 0;
  }

  return v5;
}

- (id)getStatusKeyPathFromAccount:(id)a3
{
  return 0;
}

- (id)getStatusInfoFromAccount:(id)a3
{
  return &__NSDictionary0__struct;
}

- (BOOL)statusHasChangedForAccount:(id)a3 oldAccount:(id)a4
{
  id v6 = a4;
  v7 = [(AccountStatusHandler *)self getStatusInfoFromAccount:a3];
  v8 = [(AccountStatusHandler *)self getStatusInfoFromAccount:v6];

  LOBYTE(v6) = [v7 isEqualToDictionary:v8] ^ 1;
  return (char)v6;
}

@end