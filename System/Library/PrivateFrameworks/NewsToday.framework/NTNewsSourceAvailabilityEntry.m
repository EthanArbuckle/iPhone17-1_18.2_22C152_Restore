@interface NTNewsSourceAvailabilityEntry
- (BOOL)isAvailable;
- (Class)todayResultsFetchDescriptorClass;
- (FCNetworkReachability)networkReachability;
- (NTNewsSourceAvailabilityEntry)init;
- (NTNewsSourceAvailabilityEntry)initWithNetworkReachability:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)availabilityChangedNotificationBlock;
- (void)setAvailabilityChangedNotificationBlock:(id)a3;
- (void)setNetworkReachability:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NTNewsSourceAvailabilityEntry

- (NTNewsSourceAvailabilityEntry)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsSourceAvailabilityEntry init]";
    __int16 v9 = 2080;
    v10 = "NTNewsSourceAvailabilityEntry.m";
    __int16 v11 = 1024;
    int v12 = 28;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsSourceAvailabilityEntry init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsSourceAvailabilityEntry)initWithNetworkReachability:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:]();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:]();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)NTNewsSourceAvailabilityEntry;
  __int16 v9 = [(NTNewsSourceAvailabilityEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_networkReachability, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_available = [v7 offlineReason] != 3;
  }

  return v10;
}

- (Class)todayResultsFetchDescriptorClass
{
  return (Class)objc_opt_class();
}

- (id)availabilityChangedNotificationBlock
{
  return self->_availabilityChangedNotificationBlock;
}

- (void)setAvailabilityChangedNotificationBlock:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);

  objc_storeStrong(&self->_availabilityChangedNotificationBlock, 0);
}

- (void)initWithNetworkReachability:queue:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queue");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTNewsSourceAvailabilityEntry.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithNetworkReachability:queue:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTNewsSourceAvailabilityEntry initWithNetworkReachability:queue:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTNewsSourceAvailabilityEntry.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end