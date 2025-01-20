@interface DADeviceDecoratorWithSync
+ (id)decorateDevice:(id)a3;
- (BOOL)_isDeviceLocked;
- (BOOL)isKindOfClass:(Class)a3;
- (DADevice)original;
- (DADeviceDecoratorWithSync)initWithDevice:(id)a3;
- (DADeviceDelegate)delegate;
- (DAIDSDestination)destination;
- (DAIDSMessageSender)messenger;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_deviceStateDidChange:(id)a3;
- (void)_syncState:(id)a3;
- (void)end;
- (void)forwardInvocation:(id)a3;
- (void)idle;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)resumeTests;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setOriginal:(id)a3;
- (void)start;
- (void)suspendTests;
@end

@implementation DADeviceDecoratorWithSync

+ (id)decorateDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

- (DADeviceDecoratorWithSync)initWithDevice:(id)a3
{
  objc_storeStrong((id *)&self->_original, a3);
  id v5 = a3;
  v6 = +[NSNotificationCenter defaultCenter];
  v7 = [(DADeviceDecoratorWithSync *)self original];
  v8 = [v7 state];
  [v6 addObserver:self selector:"_deviceStateDidChange:" name:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v8];

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a3);
    v7 = [(DADeviceDecoratorWithSync *)self original];
    int v12 = 138412546;
    v13 = v6;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fast forwarding %@ to %@", (uint8_t *)&v12, 0x16u);
  }
  v8 = [(DADeviceDecoratorWithSync *)self original];
  if (objc_opt_respondsToSelector()) {
    v9 = v8;
  }
  else {
    v9 = self;
  }
  v10 = v9;

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector((SEL)[v4 selector]);
    v7 = [(DADeviceDecoratorWithSync *)self original];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Slow forwarding %@ to %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(DADeviceDecoratorWithSync *)self original];
  [v4 invokeWithTarget:v8];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(DADeviceDecoratorWithSync *)self original];
  id v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v4 = [(DADeviceDecoratorWithSync *)self original];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  BOOL v8 = a6;
  id v27 = a3;
  __int16 v11 = (void (**)(id, __CFString *, id))a7;
  id v12 = a5;
  v13 = [(DADeviceDecoratorWithSync *)self destination];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15 = @"messageReceived";
    if ([v27 isEqualToString:@"wakeDevice"])
    {
      if ([(DADeviceDecoratorWithSync *)self _isDeviceLocked])
      {
        v16 = off_100018A90;
LABEL_19:
        v26 = *v16;

        id v22 = 0;
        v15 = v26;
        goto LABEL_20;
      }
      v17 = [(DADeviceDecoratorWithSync *)self original];
      v18 = [v17 state];
      if ([v18 phase] == (id)1)
      {

LABEL_14:
        [(DADeviceDecoratorWithSync *)self start];
        goto LABEL_15;
      }
      v19 = [(DADeviceDecoratorWithSync *)self original];
      v20 = [v19 state];
      id v21 = [v20 phase];

      if (!v21) {
        goto LABEL_14;
      }
    }
    else if ([v27 isEqualToString:@"endDevice"])
    {
      [(DADeviceDecoratorWithSync *)self end];
    }
    else
    {
      if (![v27 isEqualToString:@"idleDevice"])
      {
        if (![v27 isEqualToString:@"requestDeviceState"])
        {
          v16 = off_100018A98;
          goto LABEL_19;
        }
        v23 = [(DADeviceDecoratorWithSync *)self original];
        v24 = [v23 state];
        id v22 = [v24 copy];

        v25 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
        [v22 setTimestamp:v25];

LABEL_20:
        if (v8) {
          v11[2](v11, v15, v22);
        }

        goto LABEL_23;
      }
      [(DADeviceDecoratorWithSync *)self idle];
    }
LABEL_15:
    id v22 = 0;
    goto LABEL_20;
  }
  if (v8) {
    v11[2](v11, @"destinationMismatch", 0);
  }
LABEL_23:
}

- (void)start
{
  id v2 = [(DADeviceDecoratorWithSync *)self original];
  [v2 start];
}

- (void)idle
{
  id v2 = [(DADeviceDecoratorWithSync *)self original];
  [v2 idle];
}

- (void)suspendTests
{
  id v2 = [(DADeviceDecoratorWithSync *)self original];
  [v2 suspendTests];
}

- (void)resumeTests
{
  id v2 = [(DADeviceDecoratorWithSync *)self original];
  [v2 resumeTests];
}

- (void)end
{
  id v2 = [(DADeviceDecoratorWithSync *)self original];
  [v2 end];
}

- (void)_syncState:(id)a3
{
  id v4 = a3;
  if ([(DADeviceDecoratorWithSync *)self _isDeviceLocked])
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is locked. Will not sync device state: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [v4 copy];
    v7 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v6 setTimestamp:v7];

    BOOL v8 = dispatch_get_global_queue(0, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002270;
    v9[3] = &unk_1000185C8;
    id v10 = v6;
    __int16 v11 = self;
    id v5 = v6;
    dispatch_async(v8, v9);
  }
}

- (void)_deviceStateDidChange:(id)a3
{
  id v11 = a3;
  id v4 = [v11 userInfo];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"info"];

    id v5 = v11;
    if (v7)
    {
      BOOL v8 = [v11 userInfo];
      int v9 = [v8 objectForKeyedSubscript:@"info"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 snapshot];
        [(DADeviceDecoratorWithSync *)self _syncState:v10];
      }
      id v5 = v11;
    }
  }
}

- (BOOL)_isDeviceLocked
{
  int v2 = MKBGetDeviceLockState();
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Current device lock state: %i", (uint8_t *)v6, 8u);
  }

  return v2 == -1 || (v2 - 1) < 2;
}

- (DAIDSMessageSender)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DADevice)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_messenger, 0);
}

@end