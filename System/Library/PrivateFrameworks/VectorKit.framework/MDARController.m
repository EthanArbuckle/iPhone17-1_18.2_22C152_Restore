@interface MDARController
+ (BOOL)isSupported;
+ (unint64_t)vkARTrackingStateFromARTrackingState:(int64_t)a3;
+ (unint64_t)vkARTrackingStateReasonFromARTrackingStateReason:(int64_t)a3;
- (ARSession)session;
- (MDARController)init;
- (MDARControllerDelegate)delegate;
- (unint64_t)sessionInterruptedReason;
- (void)_avCaptureSessionWasInterrupted:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)run:(BOOL)a3;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MDARController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setDelegate:(id)a3
{
}

- (MDARControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MDARControllerDelegate *)WeakRetained;
}

- (unint64_t)sessionInterruptedReason
{
  return self->_sessionInterruptedReason;
}

- (ARSession)session
{
  return self->_session;
}

- (void)_avCaptureSessionWasInterrupted:(id)a3
{
  id v4 = a3;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "AR AV capture session was interrupted", v11, 2u);
  }

  v6 = [v4 userInfo];
  v7 = getAVCaptureSessionInterruptionReasonKey();
  v8 = [v6 objectForKey:v7];
  uint64_t v9 = [v8 integerValue];

  if ((unint64_t)(v9 - 1) >= 4) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = qword_1A29C3378[v9 - 1];
  }
  self->_sessionInterruptedReason = v10;
}

- (void)sessionInterruptionEnded:(id)a3
{
  self->_sessionInterruptedReason = 0;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 arControllerSessionInterruptionEnded:self];
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  id v4 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t sessionInterruptedReason = self->_sessionInterruptedReason;
    int v9 = 134217984;
    unint64_t v10 = sessionInterruptedReason;
    _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "AR sessions was interrupted: %lu", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v7 = WeakRetained == 0;

  if (!v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 arController:self arSessionWasInterrupted:self->_sessionInterruptedReason];
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  id v6 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "AR did fail with error: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v7 = [v5 code];
  if (v7 > 101)
  {
    if (v7 == 102)
    {
      uint64_t v8 = 3;
      goto LABEL_15;
    }
    if (v7 == 200)
    {
      uint64_t v8 = 4;
      goto LABEL_15;
    }
  }
  else
  {
    if (v7 == 100)
    {
      uint64_t v8 = 1;
      goto LABEL_15;
    }
    if (v7 == 101)
    {
      uint64_t v8 = 2;
      goto LABEL_15;
    }
  }
  uint64_t v8 = 0;
LABEL_15:
  int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Maps.AR" code:v8 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v11 = WeakRetained == 0;

  if (!v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 arController:self didEncounterError:v9];
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  id v6 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218240;
    uint64_t v11 = [v5 trackingState];
    __int16 v12 = 2048;
    uint64_t v13 = [v5 trackingStateReason];
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "AR Tracking state changed: %ld, reason: %ld", (uint8_t *)&v10, 0x16u);
  }

  self->_trackingState = +[MDARController vkARTrackingStateFromARTrackingState:](MDARController, "vkARTrackingStateFromARTrackingState:", [v5 trackingState]);
  self->_trackingStateReason = +[MDARController vkARTrackingStateReasonFromARTrackingStateReason:](MDARController, "vkARTrackingStateReasonFromARTrackingStateReason:", [v5 trackingStateReason]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v8 = WeakRetained == 0;

  if (!v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 arController:self didChangeTrackingState:self->_trackingState reason:self->_trackingStateReason];
  }
}

- (void)pause
{
}

- (void)run:(BOOL)a3
{
  if (self->_sessionConfiguration)
  {
    session = self->_session;
    if (a3) {
      -[ARSession runWithConfiguration:options:](session, "runWithConfiguration:options:");
    }
    else {
      -[ARSession runWithConfiguration:](session, "runWithConfiguration:");
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(ARSession *)self->_session pause];
  session = self->_session;
  self->_session = 0;

  sessionConfiguration = self->_sessionConfiguration;
  self->_sessionConfiguration = 0;

  v6.receiver = self;
  v6.super_class = (Class)MDARController;
  [(MDARController *)&v6 dealloc];
}

- (MDARController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MDARController;
  v2 = [(MDARController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_trackingStateReason = 0;
    v2->_unint64_t sessionInterruptedReason = 0;
    v2->_trackingState = 2;
    if (LoadARKit(void)::loadPredicate != -1) {
      dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_28654);
    }
    id v4 = (ARSession *)objc_alloc_init((Class)getARSessionClass());
    session = v3->_session;
    v3->_session = v4;

    [(ARSession *)v3->_session setDelegate:v3];
    sessionConfiguration = v3->_sessionConfiguration;
    v3->_sessionConfiguration = 0;

    if ([(id)getARPositionalTrackingConfigurationClass() isSupported])
    {
      getARPositionalTrackingConfigurationClass();
      uint64_t v7 = (ARPositionalTrackingConfiguration *)objc_opt_new();
      [(ARPositionalTrackingConfiguration *)v7 setPlaneDetection:0];
      [(ARPositionalTrackingConfiguration *)v7 setWorldAlignment:0];
      [(ARPositionalTrackingConfiguration *)v7 setLightEstimationEnabled:0];
      BOOL v8 = v3->_sessionConfiguration;
      v3->_sessionConfiguration = v7;
    }
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v10 = getAVCaptureSessionWasInterruptedNotification();
    [v9 addObserver:v3 selector:sel__avCaptureSessionWasInterrupted_ name:v10 object:0];

    uint64_t v11 = v3;
  }

  return v3;
}

+ (unint64_t)vkARTrackingStateFromARTrackingState:(int64_t)a3
{
  unint64_t v3 = 1;
  if (a3 != 1) {
    unint64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (unint64_t)vkARTrackingStateReasonFromARTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (BOOL)isSupported
{
  if (LoadARKit(void)::loadPredicate != -1) {
    dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_28654);
  }
  Class ARPositionalTrackingConfigurationClass = getARPositionalTrackingConfigurationClass();
  return [(objc_class *)ARPositionalTrackingConfigurationClass isSupported];
}

@end