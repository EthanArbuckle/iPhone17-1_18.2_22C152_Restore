@interface ULOdometryProvider
- (BOOL)_checkIfExitedBubble;
- (NSDate)previousStatusUpdateDate;
- (NSNumber)deltaPositionX;
- (NSNumber)deltaPositionY;
- (NSNumber)deltaPositionZ;
- (NSUUID)trajectoryUUID;
- (OS_dispatch_queue)queue;
- (ULOdometryBridge)odometryBridge;
- (ULOdometryProvider)initWithQueue:(id)a3 delegate:(id)a4;
- (ULOdometryProviderDelegate)delegate;
- (id)_getDateFromTimestamp:(double)a3;
- (void)_resetPosition;
- (void)_resetTrajectory;
- (void)_updatePosition:(id)a3;
- (void)didReceiveOdometryUpdate:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeltaPositionX:(id)a3;
- (void)setDeltaPositionY:(id)a3;
- (void)setDeltaPositionZ:(id)a3;
- (void)setOdometryBridge:(id)a3;
- (void)setPreviousStatusUpdateDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTrajectoryUUID:(id)a3;
- (void)startBackgroundUpdates;
- (void)stopBackgroundUpdates;
@end

@implementation ULOdometryProvider

- (ULOdometryProvider)initWithQueue:(id)a3 delegate:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if (+[ULOdometryBridge isBackgroundAvailable])
  {
    v15.receiver = self;
    v15.super_class = (Class)ULOdometryProvider;
    v8 = [(ULOdometryProvider *)&v15 init];
    dispatch_assert_queue_V2(v6);
    if (v8)
    {
      [(ULOdometryProvider *)v8 _resetPosition];
      [(ULOdometryProvider *)v8 setTrajectoryUUID:0];
      [(ULOdometryProvider *)v8 setQueue:v6];
      [(ULOdometryProvider *)v8 setDelegate:v7];
      v9 = [MEMORY[0x263EFF910] now];
      [(ULOdometryProvider *)v8 setPreviousStatusUpdateDate:v9];

      v10 = [ULOdometryBridge alloc];
      v11 = [(ULOdometryProvider *)v8 queue];
      v12 = [(ULOdometryBridge *)v10 initWithQueue:v11 delegate:v8];
      [(ULOdometryProvider *)v8 setOdometryBridge:v12];
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)startBackgroundUpdates
{
  v3 = [(ULOdometryProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ULOdometryProvider *)self setTrajectoryUUID:0];
  id v4 = [(ULOdometryProvider *)self odometryBridge];
  [v4 startBackgroundUpdates];
}

- (void)stopBackgroundUpdates
{
  v3 = [(ULOdometryProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ULOdometryProvider *)self setTrajectoryUUID:0];
  id v4 = [(ULOdometryProvider *)self odometryBridge];
  [v4 stopBackgroundUpdates];
}

- (void)_resetPosition
{
  [(ULOdometryProvider *)self setDeltaPositionX:&unk_2704F1878];
  [(ULOdometryProvider *)self setDeltaPositionY:&unk_2704F1878];
  [(ULOdometryProvider *)self setDeltaPositionZ:&unk_2704F1878];
}

- (void)_resetTrajectory
{
  id v3 = [MEMORY[0x263F08C38] UUID];
  -[ULOdometryProvider setTrajectoryUUID:](self, "setTrajectoryUUID:");
}

- (BOOL)_checkIfExitedBubble
{
  id v3 = +[ULDefaultsSingleton shared];
  id v4 = [v3 defaultsDictionary];

  v5 = [NSString stringWithUTF8String:"ULOdometerUpdateDistanceIntervalMeters"];
  v6 = [v4 objectForKey:v5];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = &unk_2704F0E30;
  }

  [v7 doubleValue];
  double v9 = v8;

  v10 = [(ULOdometryProvider *)self deltaPositionX];
  [v10 doubleValue];
  double v12 = v11;
  v13 = [(ULOdometryProvider *)self deltaPositionX];
  [v13 doubleValue];
  double v15 = v14;
  v16 = [(ULOdometryProvider *)self deltaPositionY];
  [v16 doubleValue];
  double v18 = v17;
  v19 = [(ULOdometryProvider *)self deltaPositionY];
  [v19 doubleValue];
  double v21 = v20;
  v22 = [(ULOdometryProvider *)self deltaPositionZ];
  [v22 doubleValue];
  double v24 = v23;
  v25 = [(ULOdometryProvider *)self deltaPositionZ];
  [v25 doubleValue];
  BOOL v27 = v18 * v21 + v12 * v15 + v24 * v26 > v9 * v9;

  return v27;
}

- (void)_updatePosition:(id)a3
{
  id v25 = a3;
  id v4 = NSNumber;
  v5 = [(ULOdometryProvider *)self deltaPositionX];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v25 deltaPositionX];
  [v8 doubleValue];
  v10 = [v4 numberWithDouble:v7 + v9];
  [(ULOdometryProvider *)self setDeltaPositionX:v10];

  double v11 = NSNumber;
  double v12 = [(ULOdometryProvider *)self deltaPositionY];
  [v12 doubleValue];
  double v14 = v13;
  double v15 = [v25 deltaPositionY];
  [v15 doubleValue];
  double v17 = [v11 numberWithDouble:v14 + v16];
  [(ULOdometryProvider *)self setDeltaPositionY:v17];

  double v18 = NSNumber;
  v19 = [(ULOdometryProvider *)self deltaPositionZ];
  [v19 doubleValue];
  double v21 = v20;
  v22 = [v25 deltaPositionZ];
  [v22 doubleValue];
  double v24 = [v18 numberWithDouble:v21 + v23];
  [(ULOdometryProvider *)self setDeltaPositionZ:v24];
}

- (id)_getDateFromTimestamp:(double)a3
{
  id v4 = [MEMORY[0x263EFF910] now];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  double v7 = v6 + (double)mach_continuous_time() / -24000000.0;
  double v8 = (void *)MEMORY[0x263EFF910];
  double v9 = v7 + a3;
  return (id)[v8 dateWithTimeIntervalSinceReferenceDate:v9];
}

- (void)didReceiveOdometryUpdate:(id)a3 withError:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(ULOdometryProvider *)self queue];
  dispatch_assert_queue_V2(v8);

  double v9 = [(ULOdometryProvider *)self delegate];
  [(ULOdometryProvider *)self _updatePosition:v6];
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_43);
    }
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      id v27 = v7;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "Received error from odometry, trajectory invalid until update, error: %@", (uint8_t *)&v26, 0xCu);
    }
    [(ULOdometryProvider *)self setTrajectoryUUID:0];
    double v11 = [(ULOdometryProvider *)self previousStatusUpdateDate];
    [v9 didReceiveOdometryError:v7 withDate:v11];
  }
  else
  {
    [v6 timestamp];
    double v11 = -[ULOdometryProvider _getDateFromTimestamp:](self, "_getDateFromTimestamp:");
    double v12 = [(ULOdometryProvider *)self trajectoryUUID];

    if (!v12)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_43);
      }
      double v13 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "got update after nil trajectory, starting new trajectory", (uint8_t *)&v26, 2u);
      }
      [(ULOdometryProvider *)self _resetTrajectory];
      [(ULOdometryProvider *)self _resetPosition];
    }
    [(ULOdometryProvider *)self setPreviousStatusUpdateDate:v11];
    if (v12)
    {
      if (![(ULOdometryProvider *)self _checkIfExitedBubble]) {
        goto LABEL_24;
      }
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_43);
      }
      double v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "odometer exited maximum radius, sending update to delegate", (uint8_t *)&v26, 2u);
      }
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_43);
    }
    double v15 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [(ULOdometryProvider *)self deltaPositionX];
      double v17 = [(ULOdometryProvider *)self deltaPositionY];
      double v18 = [(ULOdometryProvider *)self deltaPositionZ];
      v19 = [(ULOdometryProvider *)self trajectoryUUID];
      int v26 = 138413314;
      id v27 = v11;
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      __int16 v32 = 2112;
      v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_25631F000, v15, OS_LOG_TYPE_DEFAULT, "sending odometry update with date: %@, deltaX: %@, deltaY: %@, deltaZ: %@, uuid: %@", (uint8_t *)&v26, 0x34u);
    }
    double v20 = [ULOdometryStatus alloc];
    double v21 = [(ULOdometryProvider *)self deltaPositionX];
    v22 = [(ULOdometryProvider *)self deltaPositionY];
    double v23 = [(ULOdometryProvider *)self deltaPositionZ];
    double v24 = [(ULOdometryStatus *)v20 initWithDate:v11 deltaPositionX:v21 deltaPositionY:v22 deltaPositionZ:v23];
    id v25 = [(ULOdometryProvider *)self trajectoryUUID];
    [v9 didReceiveOdometryUpdate:v24 uuid:v25];

    [(ULOdometryProvider *)self _resetPosition];
  }
LABEL_24:
}

- (ULOdometryProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ULOdometryProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ULOdometryBridge)odometryBridge
{
  return self->_odometryBridge;
}

- (void)setOdometryBridge:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUUID)trajectoryUUID
{
  return self->_trajectoryUUID;
}

- (void)setTrajectoryUUID:(id)a3
{
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
}

- (NSDate)previousStatusUpdateDate
{
  return self->_previousStatusUpdateDate;
}

- (void)setPreviousStatusUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStatusUpdateDate, 0);
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
  objc_storeStrong((id *)&self->_trajectoryUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_odometryBridge, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end