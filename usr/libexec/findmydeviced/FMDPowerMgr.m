@interface FMDPowerMgr
+ (id)sharedInstance;
- (FMDConcurrentMutableDictionary)assertionsDict;
- (FMDPowerMgr)init;
- (void)_disableAssertion:(unsigned int)a3 withName:(id)a4;
- (void)powerAssertionDisableWithReason:(id)a3;
- (void)powerAssertionEnableWithReason:(id)a3;
- (void)powerAssertionEnableWithReason:(id)a3 timeout:(int64_t)a4;
- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4;
- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 appliesOnLidClose:(BOOL)a5;
- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5;
- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5 appliesOnLidClose:(BOOL)a6;
- (void)setAssertionsDict:(id)a3;
@end

@implementation FMDPowerMgr

+ (id)sharedInstance
{
  if (qword_10031EBA0 != -1) {
    dispatch_once(&qword_10031EBA0, &stru_1002DCAC0);
  }
  v2 = (void *)qword_10031EB98;

  return v2;
}

- (FMDPowerMgr)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDPowerMgr;
  v2 = [(FMDPowerMgr *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FMDConcurrentMutableDictionary);
    assertionsDict = v2->_assertionsDict;
    v2->_assertionsDict = v3;
  }
  return v2;
}

- (void)powerAssertionEnableWithReason:(id)a3
{
}

- (void)powerAssertionEnableWithReason:(id)a3 timeout:(int64_t)a4
{
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4
{
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 appliesOnLidClose:(BOOL)a5
{
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5
{
}

- (void)powerAssertionEnableWithReason:(id)a3 type:(id)a4 timeout:(int64_t)a5 appliesOnLidClose:(BOOL)a6
{
  id v27 = a3;
  v9 = (char *)a4;
  v10 = +[NSBundle mainBundle];
  v11 = [v10 bundleIdentifier];

  v12 = +[NSString stringWithFormat:@"%@-%@", v11, v27];
  v13 = [(FMDPowerMgr *)self assertionsDict];
  v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    uint64_t v15 = (uint64_t)[v14 intValue];
    v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100242530();
    }
  }
  else
  {
    uint64_t v15 = 0xFFFFFFFFLL;
  }
  v17 = sub_100004238();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v12;
    __int16 v31 = 2112;
    v32 = v9;
    __int16 v33 = 2048;
    int64_t v34 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Enable power assertion %@ with type %@ & timeout %ld", buf, 0x20u);
  }

  v18 = +[NSMutableDictionary dictionary];
  [v18 setObject:v12 forKeyedSubscript:@"AssertName"];
  v19 = +[NSNumber numberWithInteger:a5];
  [v18 setObject:v19 forKeyedSubscript:@"TimeoutSeconds"];

  [v18 setObject:@"TimeoutActionTurnOff" forKeyedSubscript:@"TimeoutAction"];
  if (v9) {
    [v18 setObject:v9 forKeyedSubscript:@"AssertType"];
  }
  [v18 setObject:&off_1002F2050 forKeyedSubscript:@"AssertLevel"];
  if (([v9 isEqualToString:@"ApplePushServiceTask"] & 1) == 0) {
    [v18 setObject:kCFBooleanTrue forKeyedSubscript:@"AppliesToLimitedPower"];
  }
  IOPMAssertionID AssertionID = 0;
  IOReturn v20 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v18, &AssertionID);
  if (v20)
  {
    v21 = sub_100004238();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = SCErrorString(v20);
      *(_DWORD *)buf = 138412802;
      v30 = v18;
      __int16 v31 = 2080;
      v32 = v22;
      __int16 v33 = 1024;
      LODWORD(v34) = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithProperties %@ failed with error: %s (%d)", buf, 0x1Cu);
    }
  }
  else
  {
    v23 = sub_100004238();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1002424B4((uint64_t)v12, &AssertionID, v23);
    }

    if (v14)
    {
      v24 = sub_100004238();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10024244C();
      }

      [(FMDPowerMgr *)self _disableAssertion:v15 withName:v12];
    }
    v21 = +[NSNumber numberWithUnsignedInt:AssertionID];
    v25 = [(FMDPowerMgr *)self assertionsDict];
    [v25 setObject:v21 forKeyedSubscript:v12];
  }
}

- (void)powerAssertionDisableWithReason:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 bundleIdentifier];

  v7 = +[NSString stringWithFormat:@"%@-%@", v6, v4];
  v8 = [(FMDPowerMgr *)self assertionsDict];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    -[FMDPowerMgr _disableAssertion:withName:](self, "_disableAssertion:withName:", [v9 intValue], v7);
  }
  else
  {
    v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Did not find any existing assertion with name %@ when trying to disable it", buf, 0xCu);
    }
  }
}

- (void)_disableAssertion:(unsigned int)a3 withName:(id)a4
{
  id v6 = a4;
  v7 = [(FMDPowerMgr *)self assertionsDict];
  [v7 removeObjectForKey:v6];

  v8 = sub_100004238();
  v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100242600();
    }

    IOReturn v10 = IOPMAssertionRelease(a3);
    v11 = sub_100004238();
    v9 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138413058;
        id v16 = v6;
        __int16 v17 = 1024;
        unsigned int v18 = a3;
        __int16 v19 = 2080;
        IOReturn v20 = SCErrorString(v10);
        __int16 v21 = 1024;
        IOReturn v22 = v10;
        v12 = "IOPMAssertionRelease failed for assertion %@ with ID 0x%x: %s (%d)";
        v13 = v9;
        uint32_t v14 = 34;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      sub_100242598();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    v12 = "Found Null assertionID for assertion with name %@ when trying to disable it";
    v13 = v9;
    uint32_t v14 = 12;
    goto LABEL_9;
  }
}

- (FMDConcurrentMutableDictionary)assertionsDict
{
  return self->_assertionsDict;
}

- (void)setAssertionsDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end