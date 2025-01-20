@interface RTDaemonClientRegistrarVehicleEvent
- (BOOL)invocationsPending;
- (BOOL)registered;
- (OS_dispatch_queue)queue;
- (RTDaemonClientRegistrarVehicleEvent)initWithVehicleLocationProvider:(id)a3 queue:(id)a4;
- (RTDaemonClientRegistrarVehicleEventProtocol)delegate;
- (RTInvocationDispatcher)dispatcher;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (int64_t)countOfPendingInvocations;
- (void)addPendingVehicleEventBlock:(id)a3 failBlock:(id)a4 description:(id)a5;
- (void)onVehicleEventNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setVehicleLocationProvider:(id)a3;
- (void)startMonitoringVehicleEvents;
- (void)stopMonitoringVehicleEvents;
@end

@implementation RTDaemonClientRegistrarVehicleEvent

- (void)setDelegate:(id)a3
{
}

- (RTDaemonClientRegistrarVehicleEvent)initWithVehicleLocationProvider:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)RTDaemonClientRegistrarVehicleEvent;
    v11 = [(RTDaemonClientRegistrarVehicleEvent *)&v18 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_queue, a4);
      v13 = [RTInvocationDispatcher alloc];
      v14 = [(RTDaemonClientRegistrarVehicleEvent *)v12 queue];
      uint64_t v15 = [(RTInvocationDispatcher *)v13 initWithQueue:v14];
      dispatcher = v12->_dispatcher;
      v12->_dispatcher = (RTInvocationDispatcher *)v15;

      objc_storeStrong((id *)&v12->_vehicleLocationProvider, a3);
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)startMonitoringVehicleEvents
{
  if ([(RTDaemonClientRegistrarVehicleEvent *)self invocationsPending])
  {
    v3 = [(RTDaemonClientRegistrarVehicleEvent *)self dispatcher];
    [v3 dispatchPendingInvocations];
  }
  if (![(RTDaemonClientRegistrarVehicleEvent *)self registered])
  {
    v4 = [(RTDaemonClientRegistrarVehicleEvent *)self vehicleLocationProvider];
    v5 = +[RTNotification notificationName];
    [v4 addObserver:self selector:sel_onVehicleEventNotification_ name:v5];

    [(RTDaemonClientRegistrarVehicleEvent *)self setRegistered:1];
  }
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)registered
{
  return self->_registered;
}

- (BOOL)invocationsPending
{
  v2 = [(RTDaemonClientRegistrarVehicleEvent *)self dispatcher];
  BOOL v3 = [v2 countOfPendingInvocations] != 0;

  return v3;
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)stopMonitoringVehicleEvents
{
  BOOL v3 = [(RTDaemonClientRegistrarVehicleEvent *)self dispatcher];
  [v3 removeAllPendingInvocations];

  if ([(RTDaemonClientRegistrarVehicleEvent *)self registered])
  {
    v4 = [(RTDaemonClientRegistrarVehicleEvent *)self vehicleLocationProvider];
    v5 = +[RTNotification notificationName];
    [v4 removeObserver:self fromNotification:v5];

    [(RTDaemonClientRegistrarVehicleEvent *)self setRegistered:0];
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTDaemonClientRegistrarVehicleEvent *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__RTDaemonClientRegistrarVehicleEvent_onVehicleEventNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__RTDaemonClientRegistrarVehicleEvent_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      v2 = [*(id *)(a1 + 32) vehicleEvents];
      [v3 vehicleEventRegistrar:*(void *)(a1 + 40) didReceiveVehicleEvents:v2 error:0];
    }
  }
}

- (int64_t)countOfPendingInvocations
{
  v2 = [(RTDaemonClientRegistrarVehicleEvent *)self dispatcher];
  int64_t v3 = [v2 countOfPendingInvocations];

  return v3;
}

- (void)addPendingVehicleEventBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(RTDaemonClientRegistrarVehicleEvent *)self dispatcher];
    [v11 enqueueBlock:v10, v9, @"%@", v8 failureBlock description];
  }
}

- (RTDaemonClientRegistrarVehicleEventProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTDaemonClientRegistrarVehicleEventProtocol *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (void)setVehicleLocationProvider:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end