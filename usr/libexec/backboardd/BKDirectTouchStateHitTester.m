@interface BKDirectTouchStateHitTester
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKDirectTouchStateHitTester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_touchDeliveryPolicyServer, 0);
}

- (void)invalidate
{
  state = self->_state;
  if (state)
  {
    self->_state = 0;

    eventProcessor = self->_eventProcessor;
    self->_eventProcessor = 0;

    displayInfo = self->_displayInfo;
    self->_displayInfo = 0;

    touchDeliveryPolicyServer = self->_touchDeliveryPolicyServer;
    self->_touchDeliveryPolicyServer = 0;
  }
}

- (void)dealloc
{
  if (self->_state)
  {
    v4 = +[NSString stringWithFormat:@"must invoke -invalidate"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDirectTouchHitTesting.mm";
      __int16 v17 = 1024;
      int v18 = 70;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10001C098);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKDirectTouchStateHitTester;
  [(BKDirectTouchStateHitTester *)&v8 dealloc];
}

@end