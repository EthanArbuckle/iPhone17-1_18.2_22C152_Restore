@interface ULOdometryBridge
+ (BOOL)isBackgroundAvailable;
- (BOOL)backgroudUpdatesRunning;
- (CMOdometryManager)odometryManager;
- (OS_dispatch_queue)queue;
- (ULOdometryBridge)initWithQueue:(id)a3 delegate:(id)a4;
- (ULOdometryBridgeDelegate)delegate;
- (void)setBackgroudUpdatesRunning:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setOdometryManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)startBackgroundUpdates;
- (void)stopBackgroundUpdates;
@end

@implementation ULOdometryBridge

- (ULOdometryBridge)initWithQueue:(id)a3 delegate:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F01790] isBackgroundAvailable])
  {
    v12.receiver = self;
    v12.super_class = (Class)ULOdometryBridge;
    v8 = [(ULOdometryBridge *)&v12 init];
    dispatch_assert_queue_V2(v6);
    if (v8)
    {
      [(ULOdometryBridge *)v8 setQueue:v6];
      [(ULOdometryBridge *)v8 setDelegate:v7];
    }
    self = v8;
    v9 = self;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    }
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "requested odometry, but background updates are unavailable", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)startBackgroundUpdates
{
  objc_initWeak(&location, self);
  v3 = [(ULOdometryBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULOdometryBridge *)self backgroudUpdatesRunning])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    }
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "odometry updates requested but already running, ignoring request", buf, 2u);
    }
  }
  else
  {
    v5 = [(ULOdometryBridge *)self odometryManager];

    if (!v5)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
      }
      v6 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "starting odometry manager", buf, 2u);
      }
      id v7 = objc_alloc_init(MEMORY[0x263F01790]);
      [(ULOdometryBridge *)self setOdometryManager:v7];
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    }
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "requesting odometry updates", buf, 2u);
    }
    id v9 = objc_alloc_init(MEMORY[0x263F08A48]);
    v10 = [(ULOdometryBridge *)self queue];
    [v9 setUnderlyingQueue:v10];

    v11 = [(ULOdometryBridge *)self odometryManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__ULOdometryBridge_startBackgroundUpdates__block_invoke;
    v12[3] = &unk_2653F9EF8;
    objc_copyWeak(&v13, &location);
    [v11 startBackgroundUpdatesUsingReferenceFrame:8 toQueue:v9 withHandler:v12];

    [(ULOdometryBridge *)self setBackgroudUpdatesRunning:1];
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __42__ULOdometryBridge_startBackgroundUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained queue];
    dispatch_assert_queue_V2(v8);

    id v9 = [ULOdometryState alloc];
    [v17 timestamp];
    double v11 = v10;
    objc_super v12 = [v17 deltaPositionX];
    id v13 = [v17 deltaPositionY];
    v14 = [v17 deltaPositionZ];
    v15 = [(ULOdometryState *)v9 initWithTimestamp:v12 deltaPositionX:v13 deltaPositionY:v14 deltaPositionZ:v11];

    v16 = [v7 delegate];
    [v16 didReceiveOdometryUpdate:v15 withError:v5];
  }
}

- (void)stopBackgroundUpdates
{
  v3 = [(ULOdometryBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULOdometryBridge *)self backgroudUpdatesRunning])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    }
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "stopping odometry updates", v7, 2u);
    }
    id v5 = [(ULOdometryBridge *)self odometryManager];
    [v5 stopBackgroundUpdates];

    [(ULOdometryBridge *)self setOdometryManager:0];
    [(ULOdometryBridge *)self setBackgroudUpdatesRunning:0];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_80);
    }
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_ERROR, "requested to stop odometry updates but already stopped, ignoring request", buf, 2u);
    }
  }
}

+ (BOOL)isBackgroundAvailable
{
  return [MEMORY[0x263F01790] isBackgroundAvailable];
}

- (ULOdometryBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ULOdometryBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CMOdometryManager)odometryManager
{
  return self->_odometryManager;
}

- (void)setOdometryManager:(id)a3
{
}

- (BOOL)backgroudUpdatesRunning
{
  return self->_backgroudUpdatesRunning;
}

- (void)setBackgroudUpdatesRunning:(BOOL)a3
{
  self->_backgroudUpdatesRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odometryManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end