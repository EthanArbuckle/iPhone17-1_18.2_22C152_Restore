@interface FRUserInfoUserIDProvider
- (FCUserInfo)userInfo;
- (FRUserInfoUserIDProvider)init;
- (FRUserInfoUserIDProvider)initWithUserInfo:(id)a3;
- (NSString)userID;
@end

@implementation FRUserInfoUserIDProvider

- (FRUserInfoUserIDProvider)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRUserInfoUserIDProvider init]";
    __int16 v7 = 2080;
    v8 = "FRUserInfoUserIDProvider.m";
    __int16 v9 = 1024;
    int v10 = 23;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRUserInfoUserIDProvider init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRUserInfoUserIDProvider)initWithUserInfo:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100078B24();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRUserInfoUserIDProvider;
  v6 = [(FRUserInfoUserIDProvider *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userInfo, a3);
  }

  return v7;
}

- (NSString)userID
{
  id v2 = [(FRUserInfoUserIDProvider *)self userInfo];
  v3 = [v2 feldsparID];

  return (NSString *)v3;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end