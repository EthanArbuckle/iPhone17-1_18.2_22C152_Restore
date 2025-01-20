@interface MSDBackgroundActivityTask
- (BOOL)allowBattery;
- (BOOL)repeats;
- (BOOL)requireInexpensiveNetworkConnection;
- (BOOL)requireNetworkConnection;
- (MSDBackgroundActivityTask)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (double)interval;
- (id)activityBlock;
- (int64_t)qualityOfService;
- (void)checkIn;
- (void)invalidate;
- (void)schedule;
- (void)setActivityBlock:(id)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3;
- (void)setRequireNetworkConnection:(BOOL)a3;
@end

@implementation MSDBackgroundActivityTask

- (MSDBackgroundActivityTask)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)MSDBackgroundActivityTask;
    v6 = [(MSDBackgroundActivityTask *)&v18 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      v7->_qualityOfService = 9;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = sub_100031A80();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100004250(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v8 = 0;
  }

  return v8;
}

- (void)checkIn
{
  v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v13 = 136315395;
    uint64_t v14 = "-[MSDBackgroundActivityTask checkIn]";
    __int16 v15 = 2113;
    uint64_t v16 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Checking-in with identifier %{private}@", (uint8_t *)&v13, 0x16u);
  }

  if (self->_activityBlock)
  {
    id v5 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:self->_identifier];
    [v5 setPreregistered:1];
  }
  else
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100004288(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)invalidate
{
  id v2 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:self->_identifier];
  [v2 invalidate];
}

- (void)schedule
{
  id activityBlock = self->_activityBlock;
  v4 = sub_100031A80();
  id v5 = v4;
  if (activityBlock)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      BOOL repeats = self->_repeats;
      BOOL allowBattery = self->_allowBattery;
      BOOL requireNetworkConnection = self->_requireNetworkConnection;
      BOOL requireInexpensiveNetworkConnection = self->_requireInexpensiveNetworkConnection;
      double interval = self->_interval;
      int64_t qualityOfService = self->_qualityOfService;
      int v21 = 138479363;
      v22 = identifier;
      __int16 v23 = 1024;
      BOOL v24 = repeats;
      __int16 v25 = 2048;
      double v26 = interval;
      __int16 v27 = 1024;
      BOOL v28 = allowBattery;
      __int16 v29 = 1024;
      BOOL v30 = requireNetworkConnection;
      __int16 v31 = 1024;
      BOOL v32 = requireInexpensiveNetworkConnection;
      __int16 v33 = 2048;
      int64_t v34 = qualityOfService;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling block for execution at a later time: identifier %{private}@, repeats: %d, interval %f, allowBattery: %d, networkConnection: %d, inexpensiveNetworkConnection: %d, Quality of service %ld", (uint8_t *)&v21, 0x38u);
    }

    id v5 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:self->_identifier];
    [v5 setInterval:fmax(self->_interval, 2.0)];
    [v5 setQualityOfService:self->_qualityOfService];
    [v5 setRepeats:self->_repeats];
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, self->_allowBattery);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, self->_requireInexpensiveNetworkConnection);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, self->_requireNetworkConnection);
    [v5 _setAdditionalXPCActivityProperties:v13];
    [v5 scheduleWithBlock:self->_activityBlock];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000042C0(v5, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_BOOL allowBattery = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_double interval = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_int64_t qualityOfService = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_BOOL repeats = a3;
}

- (BOOL)requireInexpensiveNetworkConnection
{
  return self->_requireInexpensiveNetworkConnection;
}

- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3
{
  self->_BOOL requireInexpensiveNetworkConnection = a3;
}

- (BOOL)requireNetworkConnection
{
  return self->_requireNetworkConnection;
}

- (void)setRequireNetworkConnection:(BOOL)a3
{
  self->_BOOL requireNetworkConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityBlock, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end