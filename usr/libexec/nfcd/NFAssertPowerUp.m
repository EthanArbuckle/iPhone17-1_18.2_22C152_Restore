@interface NFAssertPowerUp
- (BOOL)isEntitled:(id)a3;
- (BOOL)isSupported;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertPowerUp

- (BOOL)isEntitled:(id)a3
{
  return 1;
}

- (BOOL)isSupported
{
  v2 = +[_NFHardwareManager sharedHardwareManager];
  v3 = [v2 controllerInfo];
  if ([v3 siliconName] == (id)14)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v2 controllerInfo];
    if ([v5 siliconName] == (id)15)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [v2 controllerInfo];
      if ([v6 siliconName] == (id)16)
      {
        BOOL v4 = 1;
      }
      else
      {
        v7 = [v2 controllerInfo];
        BOOL v4 = [v7 siliconName] == (id)17;
      }
    }
  }
  return v4;
}

- (void)onAssertWithCompletion:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v6 = +[_NFHardwareManager sharedHardwareManager];
  v7 = [(NFAsserter *)self remoteAssertion];
  v8 = sub_10017F3AC(v6, v7);

  if (v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", v13, ClassName, Name, 34, v8);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v20 = v16;
      __int16 v21 = 2082;
      v22 = object_getClassName(self);
      __int16 v23 = 2082;
      v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 34;
      __int16 v27 = 2114;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", buf, 0x2Cu);
    }
  }
  v5[2](v5, v8);
}

- (void)onDeassertWithCompletion:(id)a3
{
  v6 = (void (**)(id, void))a3;
  BOOL v4 = +[_NFHardwareManager sharedHardwareManager];
  v5 = [(NFAsserter *)self remoteAssertion];
  sub_10017FFBC(v4, v5);

  if (v6) {
    v6[2](v6, 0);
  }
}

@end