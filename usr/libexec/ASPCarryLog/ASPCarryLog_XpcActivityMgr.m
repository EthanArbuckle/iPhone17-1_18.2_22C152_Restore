@interface ASPCarryLog_XpcActivityMgr
- (ASPCarryLog_XpcActivityMgr)initWithXpcActivity:(id)a3;
- (BOOL)isActivityDeferred;
- (BOOL)shouldDeferXpcActivity;
- (BOOL)tryDeferXpcActivity;
- (OS_xpc_object)xpcActivity;
- (void)forceDeferXpcActivity;
- (void)setIsActivityDeferred:(BOOL)a3;
- (void)setXpcActivity:(id)a3;
@end

@implementation ASPCarryLog_XpcActivityMgr

- (ASPCarryLog_XpcActivityMgr)initWithXpcActivity:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASPCarryLog_XpcActivityMgr;
  v6 = [(ASPCarryLog_XpcActivityMgr *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcActivity, a3);
    v7->_isActivityDeferred = 0;
    v8 = v7;
  }

  return v7;
}

- (BOOL)shouldDeferXpcActivity
{
  v2 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];
  BOOL should_defer = xpc_activity_should_defer(v2);

  return should_defer;
}

- (BOOL)tryDeferXpcActivity
{
  if ([(ASPCarryLog_XpcActivityMgr *)self isActivityDeferred])
  {
    v3 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEBUG)) {
      sub_100046278(v3);
    }
  }
  else
  {
    uint64_t v4 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];
    if (v4)
    {
      id v5 = (void *)v4;
      unsigned int v6 = [(ASPCarryLog_XpcActivityMgr *)self shouldDeferXpcActivity];

      if (v6)
      {
        [(ASPCarryLog_XpcActivityMgr *)self setIsActivityDeferred:1];
        v7 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];
        BOOL v8 = xpc_activity_set_state(v7, 3);

        v9 = (void *)oslog;
        BOOL v10 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          if (v10) {
            sub_100046318(v9);
          }
        }
        else if (v10)
        {
          sub_1000463B0(v9);
        }
      }
    }
  }
  return [(ASPCarryLog_XpcActivityMgr *)self isActivityDeferred];
}

- (void)forceDeferXpcActivity
{
  [(ASPCarryLog_XpcActivityMgr *)self setIsActivityDeferred:1];
  v3 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];

  if (v3)
  {
    uint64_t v4 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];
    BOOL v5 = xpc_activity_set_state(v4, 3);

    unsigned int v6 = (void *)oslog;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        BOOL v8 = [(ASPCarryLog_XpcActivityMgr *)self xpcActivity];
        int v9 = 134217984;
        BOOL v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "xpc_activity %p force deferred!", (uint8_t *)&v9, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100046448(v6);
    }
  }
}

- (BOOL)isActivityDeferred
{
  return self->_isActivityDeferred;
}

- (void)setIsActivityDeferred:(BOOL)a3
{
  self->_isActivityDeferred = a3;
}

- (OS_xpc_object)xpcActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end