@interface ULCMPDRFenceProvider
+ (BOOL)_isAvailable;
- (BOOL)isFenceActive;
- (BOOL)isSessionStarted;
- (CMPedestrianFenceManager)fenceManager;
- (NSNumber)radius;
- (NSString)fenceIdentifier;
- (NSString)fenceName;
- (OS_dispatch_queue)queue;
- (ULCMPDRFenceProvider)initWithFenceIdentifier:(id)a3 queue:(id)a4 radiusInMeters:(id)a5 callback:(id)a6 statusCallback:(id)a7 errorCallback:(id)a8;
- (id)onErrorIndication;
- (id)onMotionMeasurements;
- (id)onStatusReport;
- (void)_handleFenceCross:(id)a3 error:(id)a4;
- (void)_handleStatusUpdate:(id)a3 withError:(id)a4;
- (void)_handleStatusUpdateError:(id)a3;
- (void)clearFence;
- (void)endSession;
- (void)setFence;
- (void)setFenceIdentifier:(id)a3;
- (void)setFenceManager:(id)a3;
- (void)setFenceName:(id)a3;
- (void)setFenceRadius:(id)a3;
- (void)setIsFenceActive:(BOOL)a3;
- (void)setIsSessionStarted:(BOOL)a3;
- (void)setOnErrorIndication:(id)a3;
- (void)setOnMotionMeasurements:(id)a3;
- (void)setOnStatusReport:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRadius:(id)a3;
- (void)startSession;
@end

@implementation ULCMPDRFenceProvider

- (ULCMPDRFenceProvider)initWithFenceIdentifier:(id)a3 queue:(id)a4 radiusInMeters:(id)a5 callback:(id)a6 statusCallback:(id)a7 errorCallback:(id)a8
{
  id v14 = a3;
  v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ULCMPDRFenceProvider;
  v20 = [(ULCMPDRFenceProvider *)&v24 init];
  dispatch_assert_queue_V2(v15);
  if (v20)
  {
    v21 = [@"com.apple.milod.ULCMPDRFenceManager." stringByAppendingString:v14];
    [(ULCMPDRFenceProvider *)v20 setFenceIdentifier:v21];

    [(ULCMPDRFenceProvider *)v20 setFenceName:v14];
    v22 = objc_opt_new();
    [(ULCMPDRFenceProvider *)v20 setFenceManager:v22];

    [(ULCMPDRFenceProvider *)v20 setQueue:v15];
    [(ULCMPDRFenceProvider *)v20 setRadius:v16];
    [(ULCMPDRFenceProvider *)v20 setOnMotionMeasurements:v17];
    [(ULCMPDRFenceProvider *)v20 setOnStatusReport:v18];
    [(ULCMPDRFenceProvider *)v20 setOnErrorIndication:v19];
  }

  return v20;
}

- (void)setFenceRadius:(id)a3
{
  id v4 = a3;
  if ([(ULCMPDRFenceProvider *)self isFenceActive])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_ERROR, "Setting radius when fence is already active -- radius will *NOT BE APPLIED TO FENCE* ", v6, 2u);
    }
  }
  [(ULCMPDRFenceProvider *)self setRadius:v4];
}

- (void)startSession
{
  v3 = [(ULCMPDRFenceProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  if (+[ULCMPDRFenceProvider _isAvailable])
  {
    if (![(ULCMPDRFenceProvider *)self isSessionStarted])
    {
      id v4 = [(ULCMPDRFenceProvider *)self fenceManager];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __36__ULCMPDRFenceProvider_startSession__block_invoke;
      v6[3] = &unk_2653F9068;
      objc_copyWeak(&v7, &location);
      [v4 startSessionWithStatusHandler:v6];

      [(ULCMPDRFenceProvider *)self setIsSessionStarted:1];
      objc_destroyWeak(&v7);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Failed to start PDR session, PDR not available", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __36__ULCMPDRFenceProvider_startSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ULCMPDRFenceProvider_startSession__block_invoke_2;
    block[3] = &unk_2653F9040;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __36__ULCMPDRFenceProvider_startSession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStatusUpdate:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)endSession
{
  v3 = [(ULCMPDRFenceProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  if (+[ULCMPDRFenceProvider _isAvailable]
    && [(ULCMPDRFenceProvider *)self isSessionStarted])
  {
    if ([(ULCMPDRFenceProvider *)self isFenceActive]) {
      [(ULCMPDRFenceProvider *)self clearFence];
    }
    id v4 = [(ULCMPDRFenceProvider *)self fenceManager];
    [v4 endSession];

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    id v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Ending PDR session", v6, 2u);
    }
    [(ULCMPDRFenceProvider *)self setIsSessionStarted:0];
  }
}

- (void)setFence
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [(ULCMPDRFenceProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  if (+[ULCMPDRFenceProvider _isAvailable])
  {
    if (![(ULCMPDRFenceProvider *)self isSessionStarted])
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
      }
      id v4 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        int v24 = 0;
        __int16 v25 = 2082;
        v26 = "";
        _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Requested PDR fence without an active session! starting session\"}", buf, 0x12u);
      }
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
      }
      id v5 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)buf = 68289026;
        int v24 = 0;
        __int16 v25 = 2082;
        v26 = "";
        _os_signpost_emit_with_name_impl(&dword_25631F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Requested PDR fence without an active session! starting session", "{\"msg%{public}.0s\":\"Requested PDR fence without an active session! starting session\"}", buf, 0x12u);
      }
      [(ULCMPDRFenceProvider *)self startSession];
    }
    if ([(ULCMPDRFenceProvider *)self isFenceActive])
    {
      id v6 = [(ULCMPDRFenceProvider *)self fenceManager];
      id v7 = [(ULCMPDRFenceProvider *)self fenceIdentifier];
      [v6 clearFence:v7];
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    v8 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(ULCMPDRFenceProvider *)self radius];
      [v9 floatValue];
      float v11 = v10;
      BOOL v12 = [(ULCMPDRFenceProvider *)self isFenceActive];
      *(_DWORD *)buf = 68289538;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2050;
      double v28 = v11;
      __int16 v29 = 1026;
      BOOL v30 = v12;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting PDR fence \", \"fence size in m\":\"%{public}.2f\", \"previous fence state\":%{public}hhd}", buf, 0x22u);
    }
    [(ULCMPDRFenceProvider *)self setIsFenceActive:1];
    v13 = [(ULCMPDRFenceProvider *)self fenceManager];
    id v14 = [(ULCMPDRFenceProvider *)self fenceIdentifier];
    v15 = [(ULCMPDRFenceProvider *)self radius];
    [v15 floatValue];
    int v17 = v16;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __32__ULCMPDRFenceProvider_setFence__block_invoke;
    v20[3] = &unk_2653F9090;
    objc_copyWeak(&v21, &location);
    LODWORD(v18) = v17;
    [v13 setFence:v14 withRadius:v20 withCompletion:v18];

    objc_destroyWeak(&v21);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    id v19 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25631F000, v19, OS_LOG_TYPE_DEFAULT, "Failed to set pedestrian fence, PDR not available", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __32__ULCMPDRFenceProvider_setFence__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ULCMPDRFenceProvider_setFence__block_invoke_2;
    block[3] = &unk_2653F9040;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __32__ULCMPDRFenceProvider_setFence__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFenceCross:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)clearFence
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(ULCMPDRFenceProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULCMPDRFenceProvider *)self isFenceActive])
  {
    id v4 = [(ULCMPDRFenceProvider *)self fenceManager];
    id v5 = [(ULCMPDRFenceProvider *)self fenceIdentifier];
    [v4 clearFence:v5];

    [(ULCMPDRFenceProvider *)self setIsFenceActive:0];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    uint64_t v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      fenceIdentifier = self->_fenceIdentifier;
      int v12 = 138412290;
      v13 = fenceIdentifier;
      v8 = "Clearing PDR fence, with identifier: %@ -- will not receive any more fence breach notifications";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_10:
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    uint64_t v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "No fence active -- ignoring request to clear fence";
      v9 = v11;
      uint32_t v10 = 2;
      goto LABEL_10;
    }
  }
}

- (void)_handleFenceCross:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      uint32_t v10 = [v7 localizedDescription];
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "PDR fence completion error, PDR fence completed with error: %@ and identifier %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v11 = [(ULCMPDRFenceProvider *)self onErrorIndication];
    int v12 = [MEMORY[0x263EFF910] now];
    v13 = [(ULCMPDRFenceProvider *)self fenceName];
    ((void (**)(void, id, void *, void *))v11)[2](v11, v7, v12, v13);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    uint64_t v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "PDR fence completed sucessfully, with identifier: %@", (uint8_t *)&v15, 0xCu);
    }
    [(ULCMPDRFenceProvider *)self setIsFenceActive:0];
    uint64_t v11 = [(ULCMPDRFenceProvider *)self onMotionMeasurements];
    int v12 = [MEMORY[0x263EFF910] now];
    v13 = [(ULCMPDRFenceProvider *)self fenceName];
    ((void (*)(void (**)(void, void, void, void), void *, void *))v11[2])(v11, v12, v13);
  }
}

- (void)_handleStatusUpdateError:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
  }
  id v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 localizedDescription];
    v8 = [(ULCMPDRFenceProvider *)self fenceIdentifier];
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"));
    uint32_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"));
    int v11 = 138413058;
    int v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "PDR fence error, PDR fence cleared with error: %@ and identifier %@, session is started: %@, fence is active: %@", (uint8_t *)&v11, 0x2Au);
  }
  if ([(ULCMPDRFenceProvider *)self isFenceActive]) {
    [(ULCMPDRFenceProvider *)self clearFence];
  }
  if ([(ULCMPDRFenceProvider *)self isSessionStarted])
  {
    [(ULCMPDRFenceProvider *)self endSession];
    [(ULCMPDRFenceProvider *)self startSession];
  }
}

- (void)_handleStatusUpdate:(id)a3 withError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(ULCMPDRFenceProvider *)self _handleStatusUpdateError:v7];
    v8 = [(ULCMPDRFenceProvider *)self onErrorIndication];
    v9 = [MEMORY[0x263EFF910] now];
    uint32_t v10 = [(ULCMPDRFenceProvider *)self fenceName];
    ((void (**)(void, id, void *, void *))v8)[2](v8, v7, v9, v10);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_2);
    }
    int v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "get PDR status: %@", (uint8_t *)&v14, 0xCu);
    }
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
    int v12 = [(ULCMPDRFenceProvider *)self fenceName];
    [v8 setObject:&stru_2704E2F50 forKeyedSubscript:v12];

    __int16 v13 = [(ULCMPDRFenceProvider *)self onStatusReport];
    v13[2](v13, v8);
  }
}

+ (BOOL)_isAvailable
{
  int v2 = [MEMORY[0x263F01798] isAvailable];
  if (v2) {
    LOBYTE(v2) = ([MEMORY[0x263F01798] availableFenceTypes] & 3) != 0;
  }
  return v2;
}

- (CMPedestrianFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
}

- (NSString)fenceName
{
  return self->_fenceName;
}

- (void)setFenceName:(id)a3
{
}

- (BOOL)isFenceActive
{
  return self->_isFenceActive;
}

- (void)setIsFenceActive:(BOOL)a3
{
  self->_isFenceActive = a3;
}

- (BOOL)isSessionStarted
{
  return self->_isSessionStarted;
}

- (void)setIsSessionStarted:(BOOL)a3
{
  self->_isSessionStarted = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
}

- (id)onMotionMeasurements
{
  return self->_onMotionMeasurements;
}

- (void)setOnMotionMeasurements:(id)a3
{
}

- (id)onStatusReport
{
  return self->_onStatusReport;
}

- (void)setOnStatusReport:(id)a3
{
}

- (id)onErrorIndication
{
  return self->_onErrorIndication;
}

- (void)setOnErrorIndication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onErrorIndication, 0);
  objc_storeStrong(&self->_onStatusReport, 0);
  objc_storeStrong(&self->_onMotionMeasurements, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fenceName, 0);
  objc_storeStrong((id *)&self->_fenceIdentifier, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
}

@end