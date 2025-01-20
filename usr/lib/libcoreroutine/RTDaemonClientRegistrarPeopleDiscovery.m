@interface RTDaemonClientRegistrarPeopleDiscovery
+ (BOOL)supportsSecureCoding;
- (BOOL)invocationsPending;
- (BOOL)registered;
- (NSString)clientIdentifier;
- (OS_dispatch_queue)queue;
- (RTDaemonClientRegistrarPeopleDiscovery)init;
- (RTDaemonClientRegistrarPeopleDiscovery)initWithCoder:(id)a3;
- (RTDaemonClientRegistrarPeopleDiscovery)initWithPeopleDiscoveryProvider:(id)a3 queue:(id)a4;
- (RTDaemonClientRegistrarPeopleDiscoveryProtocol)delegate;
- (RTInvocationDispatcher)dispatcher;
- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider;
- (RTPeopleDiscoveryServiceConfiguration)configuration;
- (int64_t)countOfPendingInvocations;
- (void)_onPeopleDensityUpdateNotification:(id)a3;
- (void)addPendingPeopleDensityUpdateBlock:(id)a3 failBlock:(id)a4 description:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)onPeopleDensityUpdateNotification:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setPeopleDiscoveryProvider:(id)a3;
- (void)startMonitoringForPeopleDiscoveryWithIdentifier:(id)a3 configuration:(id)a4;
- (void)stopMonitoringForPeopleDiscovery;
@end

@implementation RTDaemonClientRegistrarPeopleDiscovery

- (void)setDelegate:(id)a3
{
}

- (RTDaemonClientRegistrarPeopleDiscovery)initWithPeopleDiscoveryProvider:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  v9 = [(RTDaemonClientRegistrarPeopleDiscovery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_peopleDiscoveryProvider, a3);
    v11 = [[RTInvocationDispatcher alloc] initWithQueue:v10->_queue];
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v11;
  }
  return v10;
}

- (RTDaemonClientRegistrarPeopleDiscovery)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPeopleDiscoveryProvider_queue_);
}

- (RTDaemonClientRegistrarPeopleDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  v5 = [(RTDaemonClientRegistrar *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (RTPeopleDiscoveryServiceConfiguration *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  id v4 = a3;
  [(RTDaemonClientRegistrar *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_configuration forKey:@"configuration" v5.receiver, v5.super_class];
  [v4 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMonitoringForPeopleDiscoveryWithIdentifier:(id)a3 configuration:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(RTDaemonClientRegistrarPeopleDiscovery *)self invocationsPending])
  {
    v9 = [(RTDaemonClientRegistrarPeopleDiscovery *)self dispatcher];
    [v9 dispatchPendingInvocations];
  }
  v10 = [v8 densityCallbackConfiguration];

  if (v10)
  {
    peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
    v12 = +[RTNotification notificationName];
    [(RTNotifier *)peopleDiscoveryProvider addObserver:self selector:sel_onPeopleDensityUpdateNotification_ name:v12];
  }
  [(RTPeopleDiscoveryProvider *)self->_peopleDiscoveryProvider addClient:self withIdentifier:v7 withConfiguration:v8];
  objc_storeStrong((id *)&self->_configuration, a4);
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
  v13 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "received service configuration %@ for client %@ using identifier %@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)onPeopleDensityUpdateNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__RTDaemonClientRegistrarPeopleDiscovery_onPeopleDensityUpdateNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __76__RTDaemonClientRegistrarPeopleDiscovery_onPeopleDensityUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    [v2 _onPeopleDensityUpdateNotification:v3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_super v5 = [*(id *)(a1 + 32) name];
      int v6 = 138412802;
      id v7 = v5;
      __int16 v8 = 2080;
      v9 = "-[RTDaemonClientRegistrarPeopleDiscovery onPeopleDensityUpdateNotification:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 98;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "unknown notification with name received, %@ (in %s:%d)", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)_onPeopleDensityUpdateNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v4 densityBundles];
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        int v9 = 134217984;
        uint64_t v10 = [v6 count];
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "#RTDaemonClientRegistrarPeopleDiscovery, received people density events update, count %lu", (uint8_t *)&v9, 0xCu);
      }

      [WeakRetained peopleDiscoveryRegistrar:self didReceivePeopleDensityUpdate:v6 error:0];
    }
    else
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "received nil people density in notification, returning.", (uint8_t *)&v9, 2u);
      }

      int v6 = 0;
    }
  }
  else
  {
    int v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "no delegate or does not respond to selector, returning", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)stopMonitoringForPeopleDiscovery
{
  [(RTInvocationDispatcher *)self->_dispatcher removeAllPendingInvocations];
  [(RTDaemonClientRegistrarPeopleDiscovery *)self setConfiguration:0];
  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  id v4 = +[RTNotification notificationName];
  [(RTNotifier *)peopleDiscoveryProvider removeObserver:self fromNotification:v4];

  objc_super v5 = self->_peopleDiscoveryProvider;
  clientIdentifier = self->_clientIdentifier;

  [(RTPeopleDiscoveryProvider *)v5 removeClient:clientIdentifier];
}

- (void)addPendingPeopleDensityUpdateBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
}

- (int64_t)countOfPendingInvocations
{
  return [(RTInvocationDispatcher *)self->_dispatcher countOfPendingInvocations];
}

- (BOOL)invocationsPending
{
  return [(RTInvocationDispatcher *)self->_dispatcher countOfPendingInvocations] != 0;
}

- (BOOL)registered
{
  return self->_configuration != 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTPeopleDiscoveryServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (RTDaemonClientRegistrarPeopleDiscoveryProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTDaemonClientRegistrarPeopleDiscoveryProtocol *)WeakRetained;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end