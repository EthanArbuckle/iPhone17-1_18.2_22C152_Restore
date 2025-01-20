@interface DDWatchMessageReceiver
- (BOOL)isDeviceLocked;
- (DAIDSDestination)destination;
- (DDWatchMessageReceiver)initWithDestination:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)setDestination:(id)a3;
@end

@implementation DDWatchMessageReceiver

- (DDWatchMessageReceiver)initWithDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDWatchMessageReceiver;
  v6 = [(DDWatchMessageReceiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_destination, a3);
  }

  return v7;
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  id v17 = a3;
  v10 = (void (**)(id, __CFString *, void))a7;
  id v11 = a5;
  v12 = [(DDWatchMessageReceiver *)self destination];
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    if ([v17 isEqualToString:@"wakeDevice"])
    {
      v14 = @"messageReceived";
      if ([(DDWatchMessageReceiver *)self isDeviceLocked])
      {
        v15 = @"deviceIsLocked";

        v14 = v15;
      }
      v10[2](v10, v14, 0);
    }
    else
    {
      if (![v17 isEqualToString:@"requestDeviceState"]) {
        goto LABEL_9;
      }
      v14 = objc_alloc_init(DADeviceState);
      v16 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [(__CFString *)v14 setTimestamp:v16];

      ((void (**)(id, __CFString *, __CFString *))v10)[2](v10, @"messageReceived", v14);
    }
  }
LABEL_9:
}

- (BOOL)isDeviceLocked
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

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end