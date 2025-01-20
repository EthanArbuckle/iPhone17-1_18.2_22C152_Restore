@interface PRBeaconRangingSession
- (PRBeaconRangingSession)init;
- (PRBeaconRangingSession)initWithQueue:(id)a3;
- (PRBeaconRangingSessionDelegate)delegate;
- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4;
- (void)beaconListener:(id)a3 didFailWithError:(id)a4;
- (void)beaconListener:(id)a3 didOutputRangeResults:(id)a4;
- (void)didFailWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startRangingInternal;
- (void)startRangingWithBeaconsMatchingDescriptor:(id)a3;
- (void)stopRangingInternal;
- (void)stopRangingWithBeaconsMatchingDescriptor:(id)a3;
@end

@implementation PRBeaconRangingSession

- (PRBeaconRangingSession)init
{
  return 0;
}

- (PRBeaconRangingSession)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRBeaconRangingSession;
  v6 = [(PRBeaconRangingSession *)&v12 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.Proximity", "Beacon");
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    v9 = [[PRBeaconListener alloc] initWithDelegate:v6 queue:v6->_queue];
    beaconListener = v6->_beaconListener;
    v6->_beaconListener = v9;

    v6->_beaconListenerState = 0;
  }

  return v6;
}

- (void)startRangingWithBeaconsMatchingDescriptor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_activeDescriptor, a3);
  if (self->_beaconListenerState)
  {
    [(PRBeaconRangingSession *)self startRangingInternal];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:999 userInfo:0];
    [WeakRetained beaconRangingSession:self didFailWithError:v6];
  }
}

- (void)stopRangingWithBeaconsMatchingDescriptor:(id)a3
{
}

void __67__PRBeaconRangingSession_stopRangingWithBeaconsMatchingDescriptor___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
}

- (void)startRangingInternal
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_activeDescriptor)
  {
    v3 = [PRRemoteDevice alloc];
    v4 = [(PRBeaconDescriptor *)self->_activeDescriptor UUID];
    id v5 = [(PRRemoteDevice *)v3 initWithCompanionUUID:v4];

    beaconListener = self->_beaconListener;
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__PRBeaconRangingSession_startRangingInternal__block_invoke;
    v8[3] = &unk_1E5999C08;
    v8[4] = self;
    [(PRBeaconListener *)beaconListener pushBeaconAllowlist:v7 completionHandler:v8];
  }
}

void __46__PRBeaconRangingSession_startRangingInternal__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_19DFF5000, v6, OS_LOG_TYPE_INFO, "allowlist beacon success: %d, error: %@", (uint8_t *)v7, 0x12u);
  }
}

- (void)stopRangingInternal
{
  if (self->_activeDescriptor)
  {
    beaconListener = self->_beaconListener;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PRBeaconRangingSession_stopRangingInternal__block_invoke;
    v5[3] = &unk_1E5999C08;
    v5[4] = self;
    [(PRBeaconListener *)beaconListener clearBeaconAllowlistWithCompletionHandler:v5];
    activeDescriptor = self->_activeDescriptor;
    self->_activeDescriptor = 0;
  }
}

void __45__PRBeaconRangingSession_stopRangingInternal__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_19DFF5000, v6, OS_LOG_TYPE_INFO, "unallowlist beacon success: %d, error: %@", (uint8_t *)v7, 0x12u);
  }
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
    -[PRBeaconRangingSession didFailWithError:]((uint64_t)v4, logger);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained beaconRangingSession:self didFailWithError:v4];
}

- (void)beaconListener:(id)a3 didOutputRangeResults:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    -[PRBeaconRangingSession beaconListener:didOutputRangeResults:]((uint64_t)v6, logger);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "range_m", v27);
        double v14 = v13;
        objc_msgSend(v12, "range_unc_m");
        v16 = +[PRRangeMeasurement measurementWithRange:v14 uncertainty:v15];
        if (objc_msgSend(v12, "az_valid"))
        {
          objc_msgSend(v12, "az_deg");
          double v18 = v17;
          objc_msgSend(v12, "az_unc_deg");
          v20 = +[PRAngleMeasurement measurementWithAngle:v18 uncertainty:v19];
        }
        else
        {
          v20 = 0;
        }
        if (objc_msgSend(v12, "el_valid"))
        {
          objc_msgSend(v12, "el_deg");
          double v22 = v21;
          objc_msgSend(v12, "el_unc_deg");
          v24 = +[PRAngleMeasurement measurementWithAngle:v22 uncertainty:v23];
        }
        else
        {
          v24 = 0;
        }
        objc_msgSend(v12, "mach_absolute_time_sec");
        v25 = +[PRRelativePosition relativePositionWithTimestamp:range:azimuth:elevation:](PRRelativePosition, "relativePositionWithTimestamp:range:azimuth:elevation:", v16, v20, v24);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained beaconRangingSession:self didMeasureBeaconMatchingDescriptor:self->_activeDescriptor atPosition:v25];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }
}

- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:999 userInfo:0];
    [WeakRetained beaconRangingSession:self didFailWithError:v6];
  }
}

- (void)beaconListener:(id)a3 didFailWithError:(id)a4
{
}

- (PRBeaconRangingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRBeaconRangingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDescriptor, 0);
  objc_storeStrong((id *)&self->_beaconListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)didFailWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19DFF5000, a2, OS_LOG_TYPE_ERROR, "daemon session failed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)beaconListener:(uint64_t)a1 didOutputRangeResults:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19DFF5000, a2, OS_LOG_TYPE_DEBUG, "received new results: %@", (uint8_t *)&v2, 0xCu);
}

@end