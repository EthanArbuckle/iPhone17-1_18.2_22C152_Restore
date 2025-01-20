@interface NFAssertDontReset
- (BOOL)isEntitled:(id)a3;
- (BOOL)isSupported;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertDontReset

- (BOOL)isEntitled:(id)a3
{
  v3 = [a3 NF_whitelistChecker];
  unsigned __int8 v4 = [v3 dontResetAssertion];

  return v4;
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

  if (!v8)
  {
    v17 = [v6 driverWrapper];
    v8 = sub_100219648((uint64_t)v17, 1);

    if (v8)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v19 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v22 = 45;
        if (isMetaClass) {
          uint64_t v22 = 43;
        }
        v19(3, "%c[%{public}s %{public}s]:%i Failed to set don't reset flag: %{public}@", v22, ClassName, Name, 47, v8);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = object_getClass(self);
        if (class_isMetaClass(v24)) {
          int v25 = 43;
        }
        else {
          int v25 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v31 = v25;
        __int16 v32 = 2082;
        v33 = object_getClassName(self);
        __int16 v34 = 2082;
        v35 = sel_getName(a2);
        __int16 v36 = 1024;
        int v37 = 47;
        __int16 v38 = 2114;
        v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set don't reset flag: %{public}@", buf, 0x2Cu);
      }
    }
    goto LABEL_24;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(self);
    BOOL v12 = class_isMetaClass(v11);
    v26 = object_getClassName(self);
    v28 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v12) {
      uint64_t v13 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", v13, v26, v28, 38, v8);
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
    int v31 = v16;
    __int16 v32 = 2082;
    v33 = object_getClassName(self);
    __int16 v34 = 2082;
    v35 = sel_getName(a2);
    __int16 v36 = 1024;
    int v37 = 38;
    __int16 v38 = 2114;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session for assertion: %{public}@", buf, 0x2Cu);
  }

  if (v5) {
LABEL_24:
  }
    v5[2](v5, v8);
}

- (void)onDeassertWithCompletion:(id)a3
{
  v8 = (void (**)(id, void))a3;
  BOOL v4 = +[_NFHardwareManager sharedHardwareManager];
  v5 = [v4 driverWrapper];
  id v6 = sub_100219648((uint64_t)v5, 0);

  v7 = [(NFAsserter *)self remoteAssertion];
  sub_10017FFBC(v4, v7);

  if (v8) {
    v8[2](v8, 0);
  }
}

@end