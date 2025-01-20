@interface NACIDSClient
- (NACIDSClient)init;
- (NACIDSClientDelegate)delegate;
- (void)_handleAudioRoutesDidChange:(id)a3;
- (void)_handleEUVolumeLimitDidChange:(id)a3;
- (void)_handleHapticIntensityDidChange:(id)a3;
- (void)_handleHapticStateDidChange:(id)a3;
- (void)_handleListeningModesDidChange:(id)a3;
- (void)_handleMutedStateDidChange:(id)a3;
- (void)_handleProminentHapticStateDidChange:(id)a3;
- (void)_handleRouteObservationCancelled:(id)a3;
- (void)_handleSystemMutedStatedDidChange:(id)a3;
- (void)_handleVolumeControlAvailabilityDidChange:(id)a3;
- (void)_handleVolumeObservationCancelled:(id)a3;
- (void)_handleVolumeValueDidChange:(id)a3;
- (void)_handleVolumeWarningDidChange:(id)a3;
- (void)_sendMessage:(id)a3 type:(int64_t)a4 timeout:(double)a5 queueOne:(id)a6 priority:(int64_t)a7;
- (void)beginObservingAudioRoutesForCategory:(id)a3;
- (void)beginObservingListeningModesForTarget:(id)a3;
- (void)beginObservingVolumeForTarget:(id)a3;
- (void)endObservingAudioRoutesForCategory:(id)a3;
- (void)endObservingListeningModesForTarget:(id)a3;
- (void)endObservingVolumeForTarget:(id)a3;
- (void)pickAudioRouteWithIdentifier:(id)a3 category:(id)a4;
- (void)playToneWithConfiguration:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setCurrentListeningMode:(id)a3 forTarget:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticState:(int64_t)a3;
- (void)setMuted:(BOOL)a3 forTarget:(id)a4;
- (void)setProminentHapticEnabled:(BOOL)a3;
- (void)setSystemMuted:(BOOL)a3;
- (void)setVolumeValue:(float)a3 forTarget:(id)a4;
- (void)stopToneWithOptions:(id)a3;
@end

@implementation NACIDSClient

- (NACIDSClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)NACIDSClient;
  v2 = [(NACIDSClient *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanoaudiocontrol.ids.client.outgoing", v4);
    idsOutgoingQueue = v2->_idsOutgoingQueue;
    v2->_idsOutgoingQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nanoaudiocontrol.ids.client.dispatch", v3);
    idsDispatchQueue = v2->_idsDispatchQueue;
    v2->_idsDispatchQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.audiocontrol.music"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v9;

    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeValueDidChange_ forIncomingRequestsOfType:2];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeControlAvailabilityDidChange_ forIncomingRequestsOfType:5];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleMutedStateDidChange_ forIncomingRequestsOfType:6];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleEUVolumeLimitDidChange_ forIncomingRequestsOfType:14];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeWarningDidChange_ forIncomingRequestsOfType:15];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleAudioRoutesDidChange_ forIncomingRequestsOfType:11];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleVolumeObservationCancelled_ forIncomingRequestsOfType:16];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleRouteObservationCancelled_ forIncomingRequestsOfType:17];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleSystemMutedStatedDidChange_ forIncomingRequestsOfType:18];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleHapticStateDidChange_ forIncomingRequestsOfType:22];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleListeningModesDidChange_ forIncomingRequestsOfType:24];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleHapticIntensityDidChange_ forIncomingRequestsOfType:12];
    [(IDSService *)v2->_idsService setProtobufAction:sel__handleProminentHapticStateDidChange_ forIncomingRequestsOfType:20];
    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_idsDispatchQueue];
  }
  return v2;
}

- (void)beginObservingVolumeForTarget:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  dispatch_queue_t v5 = [v4 originIdentifier];

  objc_msgSend(v6, "setOriginIdentifier:", objc_msgSend(v5, "intValue"));
  [(NACIDSClient *)self _sendMessage:v6 type:3 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)endObservingVolumeForTarget:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  dispatch_queue_t v5 = [v4 originIdentifier];

  objc_msgSend(v6, "setOriginIdentifier:", objc_msgSend(v5, "intValue"));
  [(NACIDSClient *)self _sendMessage:v6 type:4 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)setVolumeValue:(float)a3 forTarget:(id)a4
{
  id v6 = a4;
  id v11 = (id)objc_opt_new();
  *(float *)&double v7 = a3;
  [v11 setVolumeValue:v7];
  v8 = [v6 originIdentifier];
  objc_msgSend(v11, "setOriginIdentifier:", objc_msgSend(v8, "intValue"));

  uint64_t v9 = [v6 category];
  [v11 setCategory:v9];

  v10 = NACQueueOneIdentifierVolumeValue((uint64_t)v6);

  [(NACIDSClient *)self _sendMessage:v11 type:1 timeout:v10 queueOne:300 priority:5.0];
}

- (void)setMuted:(BOOL)a3 forTarget:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v10 = (id)objc_opt_new();
  [v10 setMuted:v4];
  double v7 = [v6 originIdentifier];
  objc_msgSend(v10, "setOriginIdentifier:", objc_msgSend(v7, "intValue"));

  v8 = [v6 category];
  [v10 setCategory:v8];

  uint64_t v9 = NACQueueOneIdentifierMutedState((uint64_t)v6);

  [(NACIDSClient *)self _sendMessage:v10 type:7 timeout:v9 queueOne:300 priority:5.0];
}

- (void)setHapticIntensity:(float)a3
{
  id v7 = (id)objc_opt_new();
  *(float *)&double v5 = a3;
  [v7 setIntensity:v5];
  id v6 = NACQueueOneIdentifierHapticIntensity();
  [(NACIDSClient *)self _sendMessage:v7 type:13 timeout:v6 queueOne:300 priority:5.0];
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setEnabled:v3];
  double v5 = NACQueueOneIdentifierProminentHapticState();
  [(NACIDSClient *)self _sendMessage:v6 type:21 timeout:v5 queueOne:300 priority:5.0];
}

- (void)setHapticState:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Setting haptic state to: %ld", (uint8_t *)&v8, 0xCu);
  }

  id v6 = objc_opt_new();
  [v6 setState:a3];
  id v7 = NACQueueOneIdentifierHapticState();
  [(NACIDSClient *)self _sendMessage:v6 type:23 timeout:v7 queueOne:300 priority:5.0];
}

- (void)setSystemMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setMuted:v3];
  double v5 = NACQueueOneIdentifierSystemMutedState();
  [(NACIDSClient *)self _sendMessage:v6 type:19 timeout:v5 queueOne:300 priority:5.0];
}

- (void)_handleVolumeValueDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACVolumeValueMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACVolumeValueMessage *)v5 initWithData:v6];
  if ([(NACVolumeValueMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACVolumeValueMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [NACProxyVolumeControlTarget alloc];
  uint64_t v10 = [(NACVolumeValueMessage *)v7 category];
  id v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle volume change for target: %@", (uint8_t *)&v14, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NACVolumeValueMessage *)v7 volumeValue];
  objc_msgSend(WeakRetained, "client:volumeValue:didChangeForTarget:", self, v11);
}

- (void)_handleVolumeControlAvailabilityDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACVolumeControlAvailabilityMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACVolumeControlAvailabilityMessage *)v5 initWithData:v6];
  if ([(NACVolumeControlAvailabilityMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACVolumeControlAvailabilityMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [NACProxyVolumeControlTarget alloc];
  uint64_t v10 = [(NACVolumeControlAvailabilityMessage *)v7 category];
  id v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle volume availability for target: %@", (uint8_t *)&v14, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:volumeControlAvailable:didChangeForTarget:", self, -[NACVolumeControlAvailabilityMessage volumeControlAvailable](v7, "volumeControlAvailable"), v11);
}

- (void)_handleMutedStateDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACMutedMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACMutedMessage *)v5 initWithData:v6];
  if ([(NACMutedMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACMutedMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [NACProxyVolumeControlTarget alloc];
  uint64_t v10 = [(NACMutedMessage *)v7 category];
  id v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle muted state for target: %@", (uint8_t *)&v14, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:mutedState:didChangeForTarget:", self, -[NACMutedMessage muted](v7, "muted"), v11);
}

- (void)_handleHapticIntensityDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle haptic intensity change", v10, 2u);
  }

  id v6 = [NACHapticIntensityMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACHapticIntensityMessage *)v6 initWithData:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NACHapticIntensityMessage *)v8 intensity];
  objc_msgSend(WeakRetained, "client:hapticIntensityDidChange:", self);
}

- (void)_handleEUVolumeLimitDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACEUVolumeLimitMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACEUVolumeLimitMessage *)v5 initWithData:v6];
  if ([(NACEUVolumeLimitMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACEUVolumeLimitMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [NACProxyVolumeControlTarget alloc];
  uint64_t v10 = [(NACEUVolumeLimitMessage *)v7 category];
  id v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    [(NACEUVolumeLimitMessage *)v7 eUVolumeLimit];
    int v15 = 138412546;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = v13;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handling EU limit change for target: %@ value: %f", (uint8_t *)&v15, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NACEUVolumeLimitMessage *)v7 eUVolumeLimit];
  objc_msgSend(WeakRetained, "client:EULimit:didChangeForTarget:", self, v11);
}

- (void)_handleVolumeWarningDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACVolumeWarningMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACVolumeWarningMessage *)v5 initWithData:v6];
  if ([(NACVolumeWarningMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACVolumeWarningMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [NACProxyVolumeControlTarget alloc];
  uint64_t v10 = [(NACVolumeWarningMessage *)v7 category];
  id v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    int v15 = v11;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handling volume warning change for target: %@", (uint8_t *)&v14, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:volumeWarningEnabled:volumeWarningState:didChangeForTarget:", self, -[NACVolumeWarningMessage volumeWarningEnabled](v7, "volumeWarningEnabled"), -[NACVolumeWarningMessage volumeWarningState](v7, "volumeWarningState"), v11);
}

- (void)_handleAudioRoutesDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle audio routes changed", v12, 2u);
  }

  id v6 = [NACAudioRoutesMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACAudioRoutesMessage *)v6 initWithData:v7];
  int64_t v9 = [(NACAudioRoutesMessage *)v8 category];
  uint64_t v10 = [(NACAudioRoutesMessage *)v8 audioRoutes];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained client:self audioRoutes:v10 didChangeForCategory:v9];
}

- (void)_handleVolumeObservationCancelled:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [NACOriginIdentifierMessage alloc];
  id v6 = [v4 data];

  id v7 = [(NACOriginIdentifierMessage *)v5 initWithData:v6];
  if ([(NACOriginIdentifierMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACOriginIdentifierMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  int v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  int64_t v9 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v8 category:0];
  uint64_t v10 = NMLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    float v13 = v9;
    _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle volume observation cancelled for target: %@", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained client:self volumeObservationCancelledForTarget:v9];
}

- (void)_handleRouteObservationCancelled:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle route observation cancelled", v11, 2u);
  }

  id v6 = [NACCategoryMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACCategoryMessage *)v6 initWithData:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = [(NACCategoryMessage *)v8 category];
  [WeakRetained client:self routeObservationCancelledForCategory:v10];
}

- (void)_handleSystemMutedStatedDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle system muted state did change", v10, 2u);
  }

  id v6 = [NACMutedMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACMutedMessage *)v6 initWithData:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:systemMutedStateDidChange:", self, -[NACMutedMessage muted](v8, "muted"));
}

- (void)_handleProminentHapticStateDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle prominent haptic state did change", v10, 2u);
  }

  id v6 = [NACProminentHapticStateMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACProminentHapticStateMessage *)v6 initWithData:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:prominentHapticStateDidChange:", self, -[NACProminentHapticStateMessage enabled](v8, "enabled"));
}

- (void)_handleHapticStateDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle haptic state did change", v10, 2u);
  }

  id v6 = [NACHapticStateMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACHapticStateMessage *)v6 initWithData:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "client:hapticStateDidChange:", self, -[NACHapticStateMessage state](v8, "state"));
}

- (void)beginObservingListeningModesForTarget:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  double v5 = [v4 originIdentifier];

  objc_msgSend(v6, "setOriginIdentifier:", objc_msgSend(v5, "intValue"));
  [(NACIDSClient *)self _sendMessage:v6 type:26 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)endObservingListeningModesForTarget:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  double v5 = [v4 originIdentifier];

  objc_msgSend(v6, "setOriginIdentifier:", objc_msgSend(v5, "intValue"));
  [(NACIDSClient *)self _sendMessage:v6 type:27 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)setCurrentListeningMode:(id)a3 forTarget:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = NMLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_237CD4000, v8, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Setting current listening mode: %@ for target: %@", (uint8_t *)&v13, 0x16u);
  }

  int64_t v9 = objc_alloc_init(NACListeningModesMessage);
  [(NACListeningModesMessage *)v9 setCurrentListeningMode:v6];
  uint64_t v10 = [v7 originIdentifier];
  -[NACListeningModesMessage setOriginIdentifier:](v9, "setOriginIdentifier:", [v10 intValue]);

  id v11 = [v7 category];
  [(NACListeningModesMessage *)v9 setCategory:v11];

  int v12 = NACQueueOneIdentifierListeningModes((uint64_t)v7);
  [(NACIDSClient *)self _sendMessage:v9 type:25 timeout:v12 queueOne:300 priority:5.0];
}

- (void)_handleListeningModesDidChange:(id)a3
{
  id v4 = a3;
  double v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Handle listening modes did change", buf, 2u);
  }

  id v6 = [NACListeningModesMessage alloc];
  id v7 = [v4 data];

  int v8 = [(NACListeningModesMessage *)v6 initWithData:v7];
  if ([(NACListeningModesMessage *)v8 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACListeningModesMessage originIdentifier](v8, "originIdentifier"));
  }
  else {
  int64_t v9 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v10 = [NACProxyVolumeControlTarget alloc];
  id v11 = [(NACListeningModesMessage *)v8 category];
  int v12 = [(NACProxyVolumeControlTarget *)v10 initWithOriginIdentifier:v9 category:v11];

  if ([(NACListeningModesMessage *)v8 availableListeningModesCount])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = (void *)MEMORY[0x263EFF9D8];
    __int16 v15 = [(NACListeningModesMessage *)v8 availableListeningModes];
    id v16 = [v14 orderedSetWithArray:v15];
    [WeakRetained client:self availableListeningModes:v16 didChangeForTarget:v12];
  }
  if ([(NACListeningModesMessage *)v8 hasCurrentListeningMode])
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    double v18 = [(NACListeningModesMessage *)v8 currentListeningMode];
    [v17 client:self currentListeningMode:v18 didChangeForTarget:v12];
  }
  if ([(NACListeningModesMessage *)v8 hasError])
  {
    uint64_t v19 = (void *)MEMORY[0x263F08928];
    v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_msgSend(MEMORY[0x263F087E8], "classForKeyedUnarchiver"));
    v21 = [(NACListeningModesMessage *)v8 error];
    id v28 = 0;
    v22 = [v19 unarchivedObjectOfClasses:v20 fromData:v21 error:&v28];
    id v23 = v28;

    if (v23)
    {
      v24 = NMLogForCategory(2);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[NACIDSClient _handleListeningModesDidChange:]((uint64_t)v23, v24);
      }
    }
    if (v22) {
      v25 = v22;
    }
    else {
      v25 = v23;
    }
    id v26 = v25;
    id v27 = objc_loadWeakRetained((id *)&self->_delegate);
    [v27 client:self didFailToSetCurrentListeningModeForTarget:v12 error:v26];
  }
}

- (void)beginObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setCategory:v4];

  [(NACIDSClient *)self _sendMessage:v5 type:8 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)endObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setCategory:v4];

  [(NACIDSClient *)self _sendMessage:v5 type:9 timeout:0 queueOne:200 priority:*MEMORY[0x263F49E68]];
}

- (void)pickAudioRouteWithIdentifier:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [v8 setCategory:v6];

  [v8 setIdentifier:v7];
  [(NACIDSClient *)self _sendMessage:v8 type:10 timeout:0 queueOne:200 priority:15.0];
}

- (void)playToneWithConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Requesting to play tone with configuration: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = objc_alloc_init(NACPlayToneMessage);
  [v4 type];
  id v7 = NSStringFromTLAlertType();
  [(NACPlayToneMessage *)v6 setAlertType:v7];

  id v8 = [v4 topic];
  [(NACPlayToneMessage *)v6 setTopic:v8];

  int64_t v9 = [v4 toneIdentifier];
  [(NACPlayToneMessage *)v6 setToneIdentifier:v9];

  -[NACPlayToneMessage setShouldRepeat:](v6, "setShouldRepeat:", [v4 shouldRepeat]);
  -[NACPlayToneMessage setForPreview:](v6, "setForPreview:", [v4 isForPreview]);
  [(NACIDSClient *)self _sendMessage:v6 type:28 timeout:0 queueOne:300 priority:5.0];
}

- (void)stopToneWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Requesting to stop tone with options: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = objc_alloc_init(NACStopToneMessage);
  [v4 fadeOutDuration];
  -[NACStopToneMessage setFadeOutDuration:](v6, "setFadeOutDuration:");
  -[NACStopToneMessage setShouldWaitUntilEndOfCurrentRepetition:](v6, "setShouldWaitUntilEndOfCurrentRepetition:", [v4 shouldWaitUntilEndOfCurrentRepetition]);
  [(NACIDSClient *)self _sendMessage:v6 type:29 timeout:0 queueOne:300 priority:5.0];
}

- (void)_sendMessage:(id)a3 type:(int64_t)a4 timeout:(double)a5 queueOne:(id)a6 priority:(int64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  idsOutgoingQueue = self->_idsOutgoingQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__NACIDSClient__sendMessage_type_timeout_queueOne_priority___block_invoke;
  v17[3] = &unk_264CFCAC0;
  double v22 = a5;
  id v18 = v12;
  id v19 = v13;
  int64_t v23 = a7;
  v20 = self;
  int64_t v21 = a4;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(idsOutgoingQueue, v17);
}

void __60__NACIDSClient__sendMessage_type_timeout_queueOne_priority___block_invoke(uint64_t a1)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A098]);
  BOOL v3 = [*(id *)(a1 + 32) data];
  id v4 = (void *)[v2 initWithProtobufData:v3 type:*(unsigned __int16 *)(a1 + 56) isResponse:0];

  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  v37[0] = *MEMORY[0x263F49F80];
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v37[1] = *MEMORY[0x263F49F08];
  v38[0] = v6;
  v38[1] = MEMORY[0x263EFFA88];
  int v7 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  id v8 = (void *)[v5 initWithDictionary:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  if (*(void *)(a1 + 72) == 300)
  {
    uint64_t v10 = MEMORY[0x263EFFA88];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EF8]];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F49EC0]];
  }
  id v11 = *(void **)(*(void *)(a1 + 48) + 8);
  id v12 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  uint64_t v13 = *(void *)(a1 + 72);
  id v25 = 0;
  id v26 = 0;
  char v14 = [v11 sendProtobuf:v4 toDestinations:v12 priority:v13 options:v8 identifier:&v26 error:&v25];
  id v15 = v26;
  id v16 = v25;

  id v17 = NSStringFromNACMessageType(*(void *)(a1 + 56));
  id v18 = NMLogForCategory(4);
  id v19 = v18;
  if ((v14 & 1) == 0)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v23 = *(void *)(a1 + 40);
    int64_t v21 = [*(id *)(a1 + 32) data];
    uint64_t v24 = [v21 length];
    *(_DWORD *)buf = 138413314;
    id v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v23;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2048;
    uint64_t v34 = v24;
    __int16 v35 = 2112;
    id v36 = v16;
    _os_log_error_impl(&dword_237CD4000, v19, OS_LOG_TYPE_ERROR, "[NACIDS] Failed to request delivery of IDS message, type: %@, queueOne: %@, identifier: %@, payload size: %tu, error: %@", buf, 0x34u);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    int64_t v21 = [*(id *)(a1 + 32) data];
    uint64_t v22 = [v21 length];
    *(_DWORD *)buf = 138413058;
    id v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2048;
    uint64_t v34 = v22;
    _os_log_impl(&dword_237CD4000, v19, OS_LOG_TYPE_DEFAULT, "[NACIDS] Successfully requested delivery of IDS message, type: %@, queueOne: %@, identifier: %@, payload size: %tu", buf, 0x2Au);
LABEL_8:
  }
LABEL_10:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a7;
  id v11 = NMLogForCategory(4);
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Successfully sent message (ID: %@).", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[NACIDSClient service:account:identifier:didSendWithSuccess:error:]((uint64_t)v9, (uint64_t)v10, v12);
  }
}

- (NACIDSClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NACIDSClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsOutgoingQueue, 0);
  objc_storeStrong((id *)&self->_idsDispatchQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)_handleListeningModesDidChange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive error with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)service:(os_log_t)log account:identifier:didSendWithSuccess:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_237CD4000, log, OS_LOG_TYPE_ERROR, "[NACIDS] Failed to send message (ID: %@) with error \"%@\".", (uint8_t *)&v3, 0x16u);
}

@end