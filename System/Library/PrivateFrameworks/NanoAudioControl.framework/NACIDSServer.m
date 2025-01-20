@interface NACIDSServer
- (BOOL)_hasRequestedVolumeAtLeastOnce;
- (BOOL)_shouldForceVolumeWarning;
- (NACIDSServer)initWithVolumeAudioCategories:(id)a3;
- (id)_nacVolumeControllerForTarget:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_targetForNACVolumeController:(id)a3;
- (id)_targetForVolumeController:(id)a3;
- (void)_beginObservingHapticState;
- (void)_beginObservingProxyVolumeForTarget:(id)a3 withEndpointRoute:(id)a4;
- (void)_beginObservingSystemMutedState;
- (void)_beginObservingSystemVolume;
- (void)_cancelProxyVolumeObservationForTarget:(id)a3;
- (void)_cancelRouteObservationForCategory:(id)a3;
- (void)_cancelSystemVolumeObservation;
- (void)_handleBeginObservingAudioRoutes:(id)a3;
- (void)_handleBeginObservingListeningModes:(id)a3;
- (void)_handleBeginObservingProxyVolumeForTarget:(id)a3;
- (void)_handleBeginObservingSystemVolume;
- (void)_handleBeginObservingVolume:(id)a3;
- (void)_handleEndObservingAudioRoutes:(id)a3;
- (void)_handleEndObservingListeningModes:(id)a3;
- (void)_handleEndObservingVolume:(id)a3;
- (void)_handlePickAudioRoute:(id)a3;
- (void)_handlePlayTone:(id)a3;
- (void)_handleSetCurrentListeningMode:(id)a3;
- (void)_handleSetHapticIntensity:(id)a3;
- (void)_handleSetHapticState:(id)a3;
- (void)_handleSetMuted:(id)a3;
- (void)_handleSetProminentHapticEnabled:(id)a3;
- (void)_handleSetSystemMuted:(id)a3;
- (void)_handleSetVolume:(id)a3;
- (void)_handleStopTone:(id)a3;
- (void)_hapticIntensityDidChangeNotification:(id)a3;
- (void)_sendAvailableListeningModes:(id)a3 currentListeningMode:(id)a4 error:(id)a5 forTarget:(id)a6;
- (void)_sendCurrentObservingSystemVolumeValues;
- (void)_sendEUVolumeLimit:(float)a3 forTarget:(id)a4;
- (void)_sendHapticState:(int64_t)a3;
- (void)_sendMessage:(id)a3 type:(int64_t)a4 timeout:(double)a5 queueOne:(id)a6 retry:(BOOL)a7;
- (void)_sendMutedState:(BOOL)a3 forTarget:(id)a4;
- (void)_sendSystemMutedState:(BOOL)a3;
- (void)_sendVolumeControlAvailability:(BOOL)a3 forTarget:(id)a4;
- (void)_sendVolumeValue:(float)a3 forTarget:(id)a4;
- (void)_sendVolumeWarningEnabled:(BOOL)a3 volumeWarningState:(int64_t)a4 forTarget:(id)a5;
- (void)_setRequestedVolumeAtLeastOnce;
- (void)_updateHapticIntensityValue;
- (void)_updateHapticState;
- (void)_updateProminentHapticState;
- (void)_updateSystemMutedState;
- (void)beginObservingHapticState;
- (void)beginObservingSystemMutedState;
- (void)dealloc;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)updateProminentHapticState;
- (void)volumeController:(id)a3 EUVolumeLimitDidChange:(float)a4;
- (void)volumeController:(id)a3 didFailToSetCurrentListeningModeWithError:(id)a4;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
- (void)volumeController:(id)a3 volumeWarningStateDidChange:(int64_t)a4;
- (void)volumeControllerDidUpdateAvailableListeningModes:(id)a3;
- (void)volumeControllerDidUpdateCurrentListeningMode:(id)a3;
@end

@implementation NACIDSServer

- (NACIDSServer)initWithVolumeAudioCategories:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NACIDSServer;
  v6 = [(NACIDSServer *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.audiocontrol.music"];
    idsService = v6->_idsService;
    v6->_idsService = (IDSService *)v7;

    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetVolume_ forIncomingRequestsOfType:1];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetMuted_ forIncomingRequestsOfType:7];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleBeginObservingVolume_ forIncomingRequestsOfType:3];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleEndObservingVolume_ forIncomingRequestsOfType:4];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleBeginObservingAudioRoutes_ forIncomingRequestsOfType:8];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleEndObservingAudioRoutes_ forIncomingRequestsOfType:9];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handlePickAudioRoute_ forIncomingRequestsOfType:10];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetSystemMuted_ forIncomingRequestsOfType:19];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetHapticState_ forIncomingRequestsOfType:23];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetCurrentListeningMode_ forIncomingRequestsOfType:25];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleBeginObservingListeningModes_ forIncomingRequestsOfType:26];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleEndObservingListeningModes_ forIncomingRequestsOfType:27];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handlePlayTone_ forIncomingRequestsOfType:28];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleStopTone_ forIncomingRequestsOfType:29];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetHapticIntensity_ forIncomingRequestsOfType:13];
    [(IDSService *)v6->_idsService setProtobufAction:sel__handleSetProminentHapticEnabled_ forIncomingRequestsOfType:21];
    objc_storeStrong((id *)&v6->_volumeAudioCategories, a3);
    uint64_t v9 = objc_opt_new();
    routesObservers = v6->_routesObservers;
    v6->_routesObservers = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    messageRecords = v6->_messageRecords;
    v6->_messageRecords = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    systemVolumeObservers = v6->_systemVolumeObservers;
    v6->_systemVolumeObservers = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    proxyVolumeObservers = v6->_proxyVolumeObservers;
    v6->_proxyVolumeObservers = (NSMutableDictionary *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.nanoaudiocontrol.ids.server", v17);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v18;

    [(IDSService *)v6->_idsService addDelegate:v6 queue:v6->_serialQueue];
    v20 = v6->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__NACIDSServer_initWithVolumeAudioCategories___block_invoke;
    block[3] = &unk_264CFC388;
    v21 = v6;
    v25 = v21;
    dispatch_async(v20, block);
    v22 = v21;
  }
  return v6;
}

uint64_t __46__NACIDSServer_initWithVolumeAudioCategories___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingSystemVolume];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_systemSilentModeNotificationToken)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self->_systemSilentModeNotificationToken];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)NACIDSServer;
  [(NACIDSServer *)&v6 dealloc];
}

- (void)beginObservingHapticState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NACIDSServer_beginObservingHapticState__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __41__NACIDSServer_beginObservingHapticState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingHapticState];
}

- (void)beginObservingSystemMutedState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACIDSServer_beginObservingSystemMutedState__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __46__NACIDSServer_beginObservingSystemMutedState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingSystemMutedState];
}

- (void)_handleBeginObservingVolume:(id)a3
{
  id v4 = a3;
  id v5 = [NACOriginIdentifierMessage alloc];
  objc_super v6 = [v4 data];

  uint64_t v9 = [(NACOriginIdentifierMessage *)v5 initWithData:v6];
  if ([(NACOriginIdentifierMessage *)v9 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACOriginIdentifierMessage originIdentifier](v9, "originIdentifier"));
  }
  else {
  uint64_t v7 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  v8 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v7 category:0];
  if ([(NACProxyVolumeControlTarget *)v8 isPairedDevice]) {
    [(NACIDSServer *)self _handleBeginObservingSystemVolume];
  }
  else {
    [(NACIDSServer *)self _handleBeginObservingProxyVolumeForTarget:v8];
  }
}

- (void)_handleEndObservingVolume:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACOriginIdentifierMessage alloc];
  objc_super v6 = [v4 data];

  uint64_t v7 = [(NACOriginIdentifierMessage *)v5 initWithData:v6];
  if ([(NACOriginIdentifierMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACOriginIdentifierMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v9 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v8 category:0];
  BOOL v10 = [(NACProxyVolumeControlTarget *)v9 isPairedDevice];
  uint64_t v11 = NMLogForCategory(4);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_237CD4000, v11, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle end observing system volume", (uint8_t *)&v17, 2u);
    }

    systemVolumeRunAssertion = self->_systemVolumeRunAssertion;
    self->_systemVolumeRunAssertion = 0;
  }
  else
  {
    if (v12)
    {
      int v17 = 138412290;
      dispatch_queue_t v18 = v9;
      _os_log_impl(&dword_237CD4000, v11, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle end observing volume for target: %@", (uint8_t *)&v17, 0xCu);
    }

    systemVolumeRunAssertion = [(NSMutableDictionary *)self->_proxyVolumeObservers objectForKeyedSubscript:v9];
    v14 = NMLogForCategory(4);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (systemVolumeRunAssertion)
    {
      if (v15)
      {
        int v17 = 138412290;
        dispatch_queue_t v18 = v9;
        _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACIDS] End observing volume for target: %@", (uint8_t *)&v17, 0xCu);
      }

      [(NSMutableDictionary *)self->_proxyVolumeObservers removeObjectForKey:v9];
    }
    else
    {
      if (v15)
      {
        int v17 = 138412290;
        dispatch_queue_t v18 = v9;
        _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACIDS] Received attempt to end observing volume for target (%@), but observing was not in progress", (uint8_t *)&v17, 0xCu);
      }
    }
    if (![(NSMutableDictionary *)self->_proxyVolumeObservers count])
    {
      proxyVolumeRunAssertion = self->_proxyVolumeRunAssertion;
      self->_proxyVolumeRunAssertion = 0;
    }
  }
}

- (void)_handleSetVolume:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set volume", (uint8_t *)&v29, 2u);
  }

  objc_super v6 = [NACVolumeValueMessage alloc];
  uint64_t v7 = [v4 data];

  v8 = [(NACVolumeValueMessage *)v6 initWithData:v7];
  if ([(NACVolumeValueMessage *)v8 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACVolumeValueMessage originIdentifier](v8, "originIdentifier"));
  }
  else {
  uint64_t v9 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  BOOL v10 = [NACProxyVolumeControlTarget alloc];
  uint64_t v11 = [(NACVolumeValueMessage *)v8 category];
  BOOL v12 = [(NACProxyVolumeControlTarget *)v10 initWithOriginIdentifier:v9 category:v11];

  [(NACVolumeValueMessage *)v8 volumeValue];
  float v14 = v13;
  if ([(NACProxyVolumeControlTarget *)v12 isPairedDevice])
  {
    BOOL v15 = [(NACProxyVolumeControlTarget *)v12 category];
    NACCategoryStringWithVolumeCategory(v15);
    v16 = (NACProxyVolumeControlTarget *)objc_claimAutoreleasedReturnValue();

    int v17 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v12];
    dispatch_queue_t v18 = [v17 volumeController];
    [v18 EUVolumeLimit];
    float v20 = v19;
    [v18 volumeValue];
    float v22 = v21;
    if ([v18 volumeWarningEnabled] && v14 > v20 && v22 <= v20)
    {
      v23 = [MEMORY[0x263F544E0] sharedAVSystemController];
      [v23 allowUserToExceedEUVolumeLimit];
    }
    v24 = NMLogForCategory(4);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134218242;
      double v30 = v14;
      __int16 v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_237CD4000, v24, OS_LOG_TYPE_DEFAULT, "[NACIDS] Requested value: %f for category: %@", (uint8_t *)&v29, 0x16u);
    }

    *(float *)&double v25 = v14;
    [v18 setVolumeValue:v25];
    if ([(NACProxyVolumeControlTarget *)v16 isEqualToString:@"Ringtone"])
    {
      objc_super v26 = +[NACXPCServer server];
      [v26 playAudioAndHapticPreview];
    }
  }
  else
  {
    v16 = [(NSMutableDictionary *)self->_proxyVolumeObservers objectForKeyedSubscript:v12];
    int v17 = [(NACProxyVolumeControlTarget *)v16 volumeController];
    v27 = NMLogForCategory(4);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134218242;
      double v30 = v14;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_237CD4000, v27, OS_LOG_TYPE_DEFAULT, "[NACIDS] Requested value: %f for target: %@", (uint8_t *)&v29, 0x16u);
    }

    *(float *)&double v28 = v14;
    [v17 setVolumeValue:v28];
  }
}

- (void)_handleSetMuted:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACMutedMessage alloc];
  objc_super v6 = [v4 data];

  uint64_t v7 = [(NACMutedMessage *)v5 initWithData:v6];
  if ([(NACMutedMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACMutedMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v9 = [NACProxyVolumeControlTarget alloc];
  BOOL v10 = [(NACMutedMessage *)v7 category];
  uint64_t v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  if ([(NACProxyVolumeControlTarget *)v11 isPairedDevice])
  {
    BOOL v12 = [(NACProxyVolumeControlTarget *)v11 category];
    NACCategoryStringWithVolumeCategory(v12);
    float v13 = (NACProxyVolumeControlTarget *)objc_claimAutoreleasedReturnValue();

    float v14 = NMLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      float v19 = v13;
      _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set muted for category: %@", (uint8_t *)&v18, 0xCu);
    }

    BOOL v15 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v11];
  }
  else
  {
    v16 = NMLogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      float v19 = v11;
      _os_log_impl(&dword_237CD4000, v16, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set muted for target: %@", (uint8_t *)&v18, 0xCu);
    }

    BOOL v15 = [(NSMutableDictionary *)self->_proxyVolumeObservers objectForKeyedSubscript:v11];
  }
  int v17 = [v15 volumeController];
  objc_msgSend(v17, "setMuted:", -[NACMutedMessage muted](v7, "muted"));
}

- (void)_handleSetSystemMuted:(id)a3
{
  id v3 = a3;
  id v4 = NMLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set system muted", v9, 2u);
  }

  id v5 = [NACMutedMessage alloc];
  objc_super v6 = [v3 data];

  uint64_t v7 = [(NACMutedMessage *)v5 initWithData:v6];
  v8 = [MEMORY[0x263F544E0] sharedInstance];
  objc_msgSend(v8, "setSilentMode:untilTime:reason:clientType:", -[NACMutedMessage muted](v7, "muted"), 0, @"NanoAudioControl handling system mute setting", 7);
}

- (void)_handleSetProminentHapticEnabled:(id)a3
{
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set prominent haptic enabled", v11, 2u);
  }

  objc_super v6 = [NACProminentHapticStateMessage alloc];
  uint64_t v7 = [v4 data];

  v8 = [(NACProminentHapticStateMessage *)v6 initWithData:v7];
  uint64_t v9 = [(NACProminentHapticStateMessage *)v8 enabled];
  if (self->_prominentHapticEnabled != v9)
  {
    [MEMORY[0x263F7FC68] _setWatchPrefersSalientToneAndVibration:v9];
    [(NACIDSServer *)self _updateProminentHapticState];
    BOOL v10 = +[NACXPCServer server];
    [v10 playProminentHapticPreview];
  }
}

- (void)_handleSetHapticIntensity:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [NACHapticIntensityMessage alloc];
  id v5 = [v3 data];

  objc_super v6 = [(NACHapticIntensityMessage *)v4 initWithData:v5];
  [(NACHapticIntensityMessage *)v6 intensity];
  float v8 = NACSystemHapticValueForUIValue(v7);
  uint64_t v9 = NMLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    double v15 = v8;
    _os_log_impl(&dword_237CD4000, v9, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle set haptic intensity. Setting haptic intensity: %f", (uint8_t *)&v14, 0xCu);
  }

  BOOL v10 = [MEMORY[0x263F544E0] sharedAVSystemController];
  *(float *)&double v11 = v8;
  int v12 = [v10 setVibeIntensityTo:v11];

  if (v12)
  {
    float v13 = +[NACXPCServer server];
    [v13 playAudioAndHapticPreview];
  }
}

- (void)_handleSetCurrentListeningMode:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACListeningModesMessage alloc];
  objc_super v6 = [v4 data];

  float v7 = [(NACListeningModesMessage *)v5 initWithData:v6];
  if ([(NACListeningModesMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACListeningModesMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  float v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v9 = [NACProxyVolumeControlTarget alloc];
  BOOL v10 = [(NACListeningModesMessage *)v7 category];
  double v11 = [(NACProxyVolumeControlTarget *)v9 initWithOriginIdentifier:v8 category:v10];

  int v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    float v13 = [(NACListeningModesMessage *)v7 currentListeningMode];
    int v16 = 138412546;
    int v17 = v13;
    __int16 v18 = 2112;
    float v19 = v11;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Handle set current listening mode: %@ for target: %@", (uint8_t *)&v16, 0x16u);
  }
  int v14 = [(NACIDSServer *)self _nacVolumeControllerForTarget:v11 createIfNeeded:1];
  double v15 = [(NACListeningModesMessage *)v7 currentListeningMode];
  [v14 setCurrentListeningMode:v15];
}

- (void)_handleBeginObservingListeningModes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACOriginIdentifierMessage alloc];
  objc_super v6 = [v4 data];

  float v7 = [(NACOriginIdentifierMessage *)v5 initWithData:v6];
  if ([(NACOriginIdentifierMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACOriginIdentifierMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  float v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v9 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v8 category:0];
  BOOL v10 = NMLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    double v15 = v9;
    _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Handle begin observing listening modes for target: %@", (uint8_t *)&v14, 0xCu);
  }

  double v11 = [(NACIDSServer *)self _nacVolumeControllerForTarget:v9 createIfNeeded:1];
  [v11 beginObservingListeningModes];
  int v12 = [v11 availableListeningModes];
  float v13 = [v11 currentListeningMode];
  [(NACIDSServer *)self _sendAvailableListeningModes:v12 currentListeningMode:v13 error:0 forTarget:v9];
}

- (void)_handleEndObservingListeningModes:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACOriginIdentifierMessage alloc];
  objc_super v6 = [v4 data];

  float v7 = [(NACOriginIdentifierMessage *)v5 initWithData:v6];
  if ([(NACOriginIdentifierMessage *)v7 hasOriginIdentifier]) {
    objc_msgSend(NSNumber, "numberWithInt:", -[NACOriginIdentifierMessage originIdentifier](v7, "originIdentifier"));
  }
  else {
  float v8 = NACProxyVolumeControlLocalOriginIdentifier();
  }
  uint64_t v9 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v8 category:0];
  BOOL v10 = NMLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    float v13 = v9;
    _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Handle end observing listening modes for target: %@", (uint8_t *)&v12, 0xCu);
  }

  double v11 = [(NACIDSServer *)self _nacVolumeControllerForTarget:v9 createIfNeeded:0];
  [v11 endObservingListeningModes];
}

- (void)_handlePlayTone:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACPlayToneMessage alloc];
  objc_super v6 = [v4 data];
  float v7 = [(NACPlayToneMessage *)v5 initWithData:v6];

  float v8 = NMLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(NACPlayToneMessage *)v7 alertType];
    BOOL v10 = [(NACPlayToneMessage *)v7 topic];
    double v11 = [(NACPlayToneMessage *)v7 toneIdentifier];
    *(_DWORD *)buf = 138412802;
    v38 = v9;
    __int16 v39 = 2112;
    v40 = v10;
    __int16 v41 = 2112;
    v42 = v11;
    _os_log_impl(&dword_237CD4000, v8, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle request to play alertType: %@, topic: %@, toneIdentifier: %@", buf, 0x20u);
  }
  id v12 = objc_alloc(MEMORY[0x263F7FC70]);
  float v13 = [(NACPlayToneMessage *)v7 alertType];
  uint64_t v14 = (void *)[v12 initWithType:TLAlertTypeFromString()];

  double v15 = [(NACPlayToneMessage *)v7 topic];
  [v14 setTopic:v15];

  uint64_t v16 = [(NACPlayToneMessage *)v7 toneIdentifier];
  [v14 setToneIdentifier:v16];

  objc_msgSend(v14, "setShouldRepeat:", -[NACPlayToneMessage shouldRepeat](v7, "shouldRepeat"));
  objc_msgSend(v14, "setForPreview:", -[NACPlayToneMessage forPreview](v7, "forPreview"));
  objc_initWeak((id *)buf, self);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v17 = self->_playingAlerts;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v33;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * v20++) stop];
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  [(NSMutableSet *)self->_playingAlerts removeAllObjects];
  float v21 = [MEMORY[0x263F7FC68] alertWithConfiguration:v14];
  playingAlerts = self->_playingAlerts;
  if (!playingAlerts)
  {
    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    double v25 = self->_playingAlerts;
    p_playingAlerts = &self->_playingAlerts;
    *p_playingAlerts = (NSMutableSet *)v23;

    playingAlerts = *p_playingAlerts;
  }
  [(NSMutableSet *)playingAlerts addObject:v21];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __32__NACIDSServer__handlePlayTone___block_invoke;
  v28[3] = &unk_264CFC640;
  objc_super v26 = v7;
  int v29 = v26;
  objc_copyWeak(&v31, (id *)buf);
  id v27 = v21;
  id v30 = v27;
  [v27 playWithCompletionHandler:v28];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

void __32__NACIDSServer__handlePlayTone___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NMLogForCategory(4);
  objc_super v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __32__NACIDSServer__handlePlayTone___block_invoke_cold_1((uint64_t)a1, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      float v7 = [a1[4] alertType];
      float v8 = [a1[4] topic];
      uint64_t v9 = [a1[4] toneIdentifier];
      *(_DWORD *)buf = 138412802;
      double v15 = v7;
      __int16 v16 = 2112;
      int v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_237CD4000, v6, OS_LOG_TYPE_DEFAULT, "[NACIDS] Finished playing play alertType: %@, topic: %@, toneIdentifier: %@", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_super v6 = WeakRetained;
    if (WeakRetained)
    {
      double v11 = *((void *)WeakRetained + 9);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __32__NACIDSServer__handlePlayTone___block_invoke_165;
      v12[3] = &unk_264CFC3B0;
      v12[4] = WeakRetained;
      id v13 = a1[5];
      dispatch_async(v11, v12);
    }
  }
}

uint64_t __32__NACIDSServer__handlePlayTone___block_invoke_165(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeObject:*(void *)(a1 + 40)];
}

- (void)_handleStopTone:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACStopToneMessage alloc];
  objc_super v6 = [v4 data];
  float v7 = [(NACStopToneMessage *)v5 initWithData:v6];

  float v8 = NMLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v8, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle request to stop tone.", buf, 2u);
  }

  id v9 = objc_alloc_init(MEMORY[0x263F7FC78]);
  [(NACStopToneMessage *)v7 fadeOutDuration];
  objc_msgSend(v9, "setFadeOutDuration:");
  objc_msgSend(v9, "setShouldWaitUntilEndOfCurrentRepetition:", -[NACStopToneMessage shouldWaitUntilEndOfCurrentRepetition](v7, "shouldWaitUntilEndOfCurrentRepetition"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v10 = self->_playingAlerts;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "stopWithOptions:", v9, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }

  [(NSMutableSet *)self->_playingAlerts removeAllObjects];
}

- (id)_nacVolumeControllerForTarget:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [v6 isPairedDevice];
  uint64_t v8 = 32;
  if (v7) {
    uint64_t v8 = 24;
  }
  id v9 = [*(id *)((char *)&self->super.isa + v8) objectForKeyedSubscript:v6];
  BOOL v10 = [v9 nacVolumeController];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v4;
  }
  if (!v11)
  {
    uint64_t v12 = [v6 category];
    BOOL v10 = +[NACVolumeController localVolumeControllerWithAudioCategory:v12];

    [v10 setDelegate:self];
    [v9 setNacVolumeController:v10];
  }

  return v10;
}

- (void)_handleSetHapticState:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NACHapticStateMessage alloc];
  id v6 = [v4 data];

  int v7 = [(NACHapticStateMessage *)v5 initWithData:v6];
  int v8 = [(NACHapticStateMessage *)v7 state];
  uint64_t v9 = v8;
  if (self->_hapticState == v8)
  {
    BOOL v10 = NMLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      double v21 = *(double *)&v9;
      _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] Haptic state is the same (%lu). Skipped setting haptic state.", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    float v11 = NACIntensityFromState(v8);
    BOOL v12 = NACProminentEnabledFromState(v9);
    uint64_t v13 = NMLogForCategory(4);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = @"NO";
      if (v12) {
        uint64_t v14 = @"YES";
      }
      int v20 = 134218242;
      double v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_237CD4000, v13, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handling set haptic state. Setting haptic intensity to %f, prominent haptic enabled to %@", (uint8_t *)&v20, 0x16u);
    }

    long long v15 = NMLogForCategory(4);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v16)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_237CD4000, v15, OS_LOG_TYPE_DEFAULT, "[NACIDS] Playing prominent haptic preview", (uint8_t *)&v20, 2u);
      }

      long long v17 = +[NACXPCServer server];
      [v17 playProminentHapticPreview];
    }
    else
    {
      if (v16)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_237CD4000, v15, OS_LOG_TYPE_DEFAULT, "[NACIDS] Playing default haptic preview", (uint8_t *)&v20, 2u);
      }

      long long v17 = +[NACXPCServer server];
      [v17 playDefaultHapticPreview];
    }

    [MEMORY[0x263F7FC68] _setWatchPrefersSalientToneAndVibration:v12];
    long long v18 = [MEMORY[0x263F544E0] sharedAVSystemController];
    *(float *)&double v19 = v11;
    [v18 setVibeIntensityTo:v19];

    self->_prominentHapticEnabled = v12;
    self->_hapticIntensity = v11;
    [(NACIDSServer *)self _updateHapticState];
  }
}

- (void)_handleBeginObservingAudioRoutes:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle begin observing audio routes", buf, 2u);
  }

  id v6 = [NACCategoryMessage alloc];
  int v7 = [v4 data];

  int v8 = [(NACCategoryMessage *)v6 initWithData:v7];
  uint64_t v9 = [(NACCategoryMessage *)v8 category];
  BOOL v10 = NACCategoryStringWithRouteCategory(v9);

  float v11 = [(NSMutableDictionary *)self->_routesObservers objectForKeyedSubscript:v10];
  BOOL v12 = NMLogForCategory(4);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Received attempt to begin observing audio routes for category [%@], but observing had already begun", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Begin observing routes for category: %@", buf, 0xCu);
    }

    BOOL v12 = objc_opt_new();
    uint64_t v14 = [(NACCategoryMessage *)v8 category];
    [v12 setCategory:v14];

    [v12 setDiscoveryMode:3];
    float v11 = objc_opt_new();
    [v11 setRoutingController:v12];
    long long v15 = objc_opt_new();
    [v11 setRunAssertion:v15];

    [(NSMutableDictionary *)self->_routesObservers setObject:v11 forKeyedSubscript:v10];
    [v12 setDelegate:self];
    objc_initWeak((id *)buf, v11);
    dispatch_time_t v16 = dispatch_time(0, 30000000000);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__NACIDSServer__handleBeginObservingAudioRoutes___block_invoke;
    block[3] = &unk_264CFC668;
    objc_copyWeak(&v21, (id *)buf);
    id v19 = v10;
    int v20 = self;
    dispatch_after(v16, serialQueue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

void __49__NACIDSServer__handleBeginObservingAudioRoutes___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v3 = NMLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Route observation of category [%@] has been active for 30 seconds, cancelling and informing client", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 40) _cancelRouteObservationForCategory:*(void *)(a1 + 32)];
  }
}

- (void)_handleEndObservingAudioRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle end observing audio routes", (uint8_t *)&v15, 2u);
  }

  uint64_t v6 = [NACCategoryMessage alloc];
  uint64_t v7 = [v4 data];

  int v8 = [(NACCategoryMessage *)v6 initWithData:v7];
  uint64_t v9 = [(NACCategoryMessage *)v8 category];
  BOOL v10 = NACCategoryStringWithRouteCategory(v9);

  float v11 = [(NSMutableDictionary *)self->_routesObservers objectForKeyedSubscript:v10];
  BOOL v12 = NMLogForCategory(4);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v15 = 138412290;
      dispatch_time_t v16 = v10;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] End observing audio routes for category: %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v14 = [v11 routingController];
    [v14 setDiscoveryMode:0];

    [(NSMutableDictionary *)self->_routesObservers removeObjectForKey:v10];
  }
  else
  {
    if (v13)
    {
      int v15 = 138412290;
      dispatch_time_t v16 = v10;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Received attempt to end observing audio routes for category [%@], but observing was not in progress", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handlePickAudioRoute:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle pick audio route", buf, 2u);
  }

  uint64_t v6 = [NACPickAudioRouteMessage alloc];
  uint64_t v7 = [v4 data];
  int v8 = [(NACPickAudioRouteMessage *)v6 initWithData:v7];

  uint64_t v9 = [(NACPickAudioRouteMessage *)v8 category];
  BOOL v10 = [(NSMutableDictionary *)self->_routesObservers objectForKeyedSubscript:v9];
  if (v10)
  {
    float v11 = [(NACPickAudioRouteMessage *)v8 identifier];
    BOOL v12 = NMLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Pick audio route with identifier: %@, category: %@", buf, 0x16u);
    }

    BOOL v13 = [v10 routingController];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v30 = __Block_byref_object_copy_;
    id v31 = __Block_byref_object_dispose_;
    id v32 = [v13 availableRoutes];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    objc_super v26 = __Block_byref_object_copy__182;
    id v27 = __Block_byref_object_dispose__183;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __38__NACIDSServer__handlePickAudioRoute___block_invoke;
    v19[3] = &unk_264CFC690;
    __int16 v22 = buf;
    uint64_t v14 = v11;
    int v20 = v14;
    id v15 = v13;
    id v21 = v15;
    id v28 = (id)MEMORY[0x237E2D700](v19);
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      (*(void (**)(void))(v24[5] + 16))();
      self->_shouldPickRouteAfterFetching = 0;
    }
    else
    {
      self->_shouldPickRouteAfterFetching = 1;
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __38__NACIDSServer__handlePickAudioRoute___block_invoke_187;
      v16[3] = &unk_264CFC6E0;
      v16[4] = self;
      objc_copyWeak(&v17, &location);
      v16[5] = buf;
      v16[6] = &v23;
      [v15 fetchAvailableRoutesWithCompletionHandler:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v14 = NMLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACIDS] Received attempt to pick audio route for category [%@], but observing was not in progress", buf, 0xCu);
    }
  }
}

void __38__NACIDSServer__handlePickAudioRoute___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v8 = +[NACAudioRoute audioRouteWithMPAVRoute:v7];
        uint64_t v9 = [v8 uniqueIdentifier];
        if ([v9 isEqualToString:a1[4]])
        {
          BOOL v10 = NMLogForCategory(4);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] Found audio route, attempting to pick", buf, 2u);
          }

          float v11 = (void *)a1[5];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __38__NACIDSServer__handlePickAudioRoute___block_invoke_185;
          v12[3] = &unk_264CFC2D0;
          v12[4] = v7;
          [v11 selectRoute:v7 operation:0 completion:v12];

          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACIDS] Couldn't find audio route to pick", buf, 2u);
  }
LABEL_14:
}

void __38__NACIDSServer__handlePickAudioRoute___block_invoke_185(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = NMLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__NACIDSServer__handlePickAudioRoute___block_invoke_185_cold_1(a1);
    }
  }
}

void __38__NACIDSServer__handlePickAudioRoute___block_invoke_187(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__NACIDSServer__handlePickAudioRoute___block_invoke_2;
  v6[3] = &unk_264CFC6B8;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v9);
}

void __38__NACIDSServer__handlePickAudioRoute___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 80))
  {
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    v2 = WeakRetained;
  }
}

- (void)_handleBeginObservingSystemVolume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle begin observing volume", (uint8_t *)buf, 2u);
  }

  if (!self->_systemVolumeRunAssertion)
  {
    uint64_t v4 = (NACRunAssertion *)objc_opt_new();
    systemVolumeRunAssertion = self->_systemVolumeRunAssertion;
    self->_systemVolumeRunAssertion = v4;
  }
  if ([(NACIDSServer *)self _hasRequestedVolumeAtLeastOnce])
  {
    [(NACIDSServer *)self _sendCurrentObservingSystemVolumeValues];
  }
  else
  {
    [(NACIDSServer *)self _setRequestedVolumeAtLeastOnce];
    [(NACIDSServer *)self _beginObservingSystemVolume];
    if (self->_shouldObserveHapticState) {
      [(NACIDSServer *)self _beginObservingHapticState];
    }
    if (self->_shouldObserveSystemMutedState) {
      [(NACIDSServer *)self _beginObservingSystemMutedState];
    }
  }
  objc_initWeak(buf, self);
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NACIDSServer__handleBeginObservingSystemVolume__block_invoke;
  block[3] = &unk_264CFC518;
  objc_copyWeak(&v9, buf);
  dispatch_after(v6, serialQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __49__NACIDSServer__handleBeginObservingSystemVolume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 1))
  {
    id v3 = NMLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume observation has been holding a run assertion for 30 seconds, cancelling and informing client", v4, 2u);
    }

    [v2 _cancelSystemVolumeObservation];
  }
}

- (void)_beginObservingSystemVolume
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(NACIDSServer *)self _hasRequestedVolumeAtLeastOnce])
  {
    id v3 = [MEMORY[0x263F57730] sharedInstance];
    uint64_t v4 = [v3 getActivePairedDevice];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AD00FAC5-9C37-4D0C-8F16-9B00B4C821C6"];
    char v6 = [v4 supportsCapability:v5];

    if ((v6 & 1) == 0)
    {
      objc_initWeak(&location, self);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      obj = self->_volumeAudioCategories;
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v7)
      {
        uint64_t v19 = *(void *)v25;
        do
        {
          uint64_t v20 = v7;
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            BOOL v10 = NMLogForCategory(4);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v9;
              _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACIDS] Observing volume for category: %@", buf, 0xCu);
            }

            float v11 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:v9];
            id v12 = objc_alloc_init(MEMORY[0x263F12338]);
            [v12 setVolumeAudioCategory:v9];
            BOOL v13 = (void *)[objc_alloc(MEMORY[0x263F12328]) initWithDataSource:v12];
            long long v14 = objc_opt_new();
            [v14 setCategory:v9];
            [v14 setDiscoveryMode:0];
            long long v15 = objc_opt_new();
            [v15 setVolumeController:v13];
            [v15 setRoutingController:v14];
            long long v16 = [[NACEventThrottler alloc] initWithQueue:self->_serialQueue];
            [(NACEventThrottler *)v16 setMinimumDelay:0.5];
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __43__NACIDSServer__beginObservingSystemVolume__block_invoke;
            v21[3] = &unk_264CFC708;
            objc_copyWeak(&v23, &location);
            id v17 = v11;
            id v22 = v17;
            [(NACEventThrottler *)v16 setEventBlock:v21];
            [v15 setThrottler:v16];
            [(NSMutableDictionary *)self->_systemVolumeObservers setObject:v15 forKeyedSubscript:v17];
            [v13 setDelegate:self];
            [v14 setDelegate:self];
            [v13 volumeValue];
            -[NACIDSServer _sendVolumeValue:forTarget:](self, "_sendVolumeValue:forTarget:", v17);
            -[NACIDSServer _sendVolumeControlAvailability:forTarget:](self, "_sendVolumeControlAvailability:forTarget:", [v14 volumeControlIsAvailable], v17);
            -[NACIDSServer _sendVolumeWarningEnabled:volumeWarningState:forTarget:](self, "_sendVolumeWarningEnabled:volumeWarningState:forTarget:", [v13 volumeWarningEnabled], objc_msgSend(v13, "volumeWarningState"), v17);
            [v13 EUVolumeLimit];
            -[NACIDSServer _sendEUVolumeLimit:forTarget:](self, "_sendEUVolumeLimit:forTarget:", v17);

            objc_destroyWeak(&v23);
          }
          uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v7);
      }

      objc_destroyWeak(&location);
    }
  }
}

void __43__NACIDSServer__beginObservingSystemVolume__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 floatValue];
  int v6 = v5;

  LODWORD(v7) = v6;
  [WeakRetained _sendVolumeValue:*(void *)(a1 + 32) forTarget:v7];
}

- (void)_beginObservingHapticState
{
}

void __42__NACIDSServer__beginObservingHapticState__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v5 floatValue];
    WeakRetained[25] = v4;
    [WeakRetained _updateHapticState];
  }
}

- (void)_beginObservingSystemMutedState
{
  v27[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  self->_shouldObserveSystemMutedState = 1;
  if ([(NACIDSServer *)self _hasRequestedVolumeAtLeastOnce])
  {
    id v3 = NMLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Observing system mute", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    int v4 = [MEMORY[0x263F544E0] sharedInstance];
    id v5 = (uint64_t *)MEMORY[0x263F54478];
    v27[0] = *MEMORY[0x263F54478];
    int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    uint64_t v7 = *MEMORY[0x263F544A0];
    id v25 = 0;
    char v8 = [v4 setAttribute:v6 forKey:v7 error:&v25];
    id v9 = v25;

    if ((v8 & 1) == 0)
    {
      BOOL v10 = NMLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(NACIDSServer *)(uint64_t)v9 _beginObservingHapticState];
      }
    }
    id v17 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v18 = *v5;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__NACIDSServer__beginObservingSystemMutedState__block_invoke;
    v23[3] = &unk_264CFC758;
    objc_copyWeak(&v24, buf);
    uint64_t v19 = [v17 addObserverForName:v18 object:v4 queue:0 usingBlock:v23];
    systemSilentModeNotificationToken = self->_systemSilentModeNotificationToken;
    self->_systemSilentModeNotificationToken = v19;

    id v21 = NMLogForCategory(4);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_237CD4000, v21, OS_LOG_TYPE_DEFAULT, "[NACIDS] Updating system mute value because we started observing", v22, 2u);
    }

    [(NACIDSServer *)self _updateSystemMutedState];
    objc_destroyWeak(&v24);

    objc_destroyWeak(buf);
  }
}

void __47__NACIDSServer__beginObservingSystemMutedState__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[9];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__NACIDSServer__beginObservingSystemMutedState__block_invoke_2;
    block[3] = &unk_264CFC388;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __47__NACIDSServer__beginObservingSystemMutedState__block_invoke_2(uint64_t a1)
{
  v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACIDS] Updating system mute value because we got a state change notification", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateSystemMutedState];
}

- (void)_updateSystemMutedState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [MEMORY[0x263F544E0] sharedInstance];
  self->_BOOL isSystemMuted = [v3 getSilentMode];

  int v4 = NMLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isSystemMuted = self->_isSystemMuted;
    v6[0] = 67109120;
    v6[1] = isSystemMuted;
    _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACIDS] System mute state: %d", (uint8_t *)v6, 8u);
  }

  [(NACIDSServer *)self _sendSystemMutedState:self->_isSystemMuted];
}

- (void)updateProminentHapticState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NACIDSServer_updateProminentHapticState__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __42__NACIDSServer_updateProminentHapticState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateProminentHapticState];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateHapticState];
}

- (void)_updateProminentHapticState
{
  self->_prominentHapticEnabled = [MEMORY[0x263F7FC68] _watchPrefersSalientToneAndVibration];
}

- (void)_updateHapticState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  int64_t v3 = NACStateFromIntensityAndProminentEnabled(self->_prominentHapticEnabled, self->_hapticIntensity);
  if (v3 != self->_hapticState)
  {
    self->_hapticState = v3;
    [(NACIDSServer *)self _sendHapticState:v3];
  }
}

- (void)_handleBeginObservingProxyVolumeForTarget:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACIDS] Handle begin observing volume for target: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v6 = +[NACEndpointObserver sharedObserver];
  uint64_t v7 = [v4 originIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__NACIDSServer__handleBeginObservingProxyVolumeForTarget___block_invoke;
  v9[3] = &unk_264CFC780;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [v6 fetchRouteForOriginIdentifier:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __58__NACIDSServer__handleBeginObservingProxyVolumeForTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = WeakRetained[9];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__NACIDSServer__handleBeginObservingProxyVolumeForTarget___block_invoke_2;
    block[3] = &unk_264CFC4F0;
    void block[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, block);
  }
}

uint64_t __58__NACIDSServer__handleBeginObservingProxyVolumeForTarget___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingProxyVolumeForTarget:*(void *)(a1 + 40) withEndpointRoute:*(void *)(a1 + 48)];
}

- (void)_beginObservingProxyVolumeForTarget:(id)a3 withEndpointRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v7)
  {
    if (!self->_proxyVolumeRunAssertion)
    {
      id v8 = (NACRunAssertion *)objc_opt_new();
      proxyVolumeRunAssertion = self->_proxyVolumeRunAssertion;
      self->_proxyVolumeRunAssertion = v8;
    }
    objc_initWeak(&location, self);
    id v10 = (void *)[objc_alloc(MEMORY[0x263F12330]) initWithGroupRoute:v7 outputDeviceRoute:0];
    id v11 = (void *)[objc_alloc(MEMORY[0x263F12328]) initWithDataSource:v10];
    uint64_t v12 = objc_opt_new();
    [v12 setVolumeController:v11];
    id v13 = [[NACEventThrottler alloc] initWithQueue:self->_serialQueue];
    [(NACEventThrottler *)v13 setMinimumDelay:0.5];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    void v27[2] = __70__NACIDSServer__beginObservingProxyVolumeForTarget_withEndpointRoute___block_invoke;
    v27[3] = &unk_264CFC708;
    objc_copyWeak(&v29, &location);
    id v14 = v6;
    id v28 = v14;
    [(NACEventThrottler *)v13 setEventBlock:v27];
    [v12 setThrottler:v13];
    [(NSMutableDictionary *)self->_proxyVolumeObservers setObject:v12 forKeyedSubscript:v14];
    [v11 setDelegate:self];
    [v11 volumeValue];
    -[NACIDSServer _sendVolumeValue:forTarget:](self, "_sendVolumeValue:forTarget:", v14);
    -[NACIDSServer _sendVolumeControlAvailability:forTarget:](self, "_sendVolumeControlAvailability:forTarget:", [v11 isVolumeControlAvailable], v14);
    -[NACIDSServer _sendVolumeWarningEnabled:volumeWarningState:forTarget:](self, "_sendVolumeWarningEnabled:volumeWarningState:forTarget:", [v11 volumeWarningEnabled], objc_msgSend(v11, "volumeWarningState"), v14);
    [v11 EUVolumeLimit];
    -[NACIDSServer _sendEUVolumeLimit:forTarget:](self, "_sendEUVolumeLimit:forTarget:", v14);
    dispatch_time_t v15 = dispatch_time(0, 30000000000);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__NACIDSServer__beginObservingProxyVolumeForTarget_withEndpointRoute___block_invoke_2;
    block[3] = &unk_264CFC7A8;
    objc_copyWeak(&v26, &location);
    id v25 = v14;
    dispatch_after(v15, serialQueue, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = NMLogForCategory(4);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[NACIDSServer _beginObservingProxyVolumeForTarget:withEndpointRoute:]((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

void __70__NACIDSServer__beginObservingProxyVolumeForTarget_withEndpointRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 floatValue];
  int v6 = v5;

  LODWORD(v7) = v6;
  [WeakRetained _sendVolumeValue:*(void *)(a1 + 32) forTarget:v7];
}

void __70__NACIDSServer__beginObservingProxyVolumeForTarget_withEndpointRoute___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 2))
  {
    id v4 = NMLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume observation has been holding a run assertion for 30 seconds, cancelling and informing client", v5, 2u);
    }

    [v3 _cancelProxyVolumeObservationForTarget:*(void *)(a1 + 32)];
  }
}

- (void)_sendCurrentObservingSystemVolumeValues
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obj = self->_volumeAudioCategories;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        id v8 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v7];
        id v9 = [v8 volumeController];
        id v10 = [v8 routingController];
        [v9 volumeValue];
        -[NACIDSServer _sendVolumeValue:forTarget:](self, "_sendVolumeValue:forTarget:", v7);
        -[NACIDSServer _sendVolumeControlAvailability:forTarget:](self, "_sendVolumeControlAvailability:forTarget:", [v10 volumeControlIsAvailable], v7);
        -[NACIDSServer _sendVolumeWarningEnabled:volumeWarningState:forTarget:](self, "_sendVolumeWarningEnabled:volumeWarningState:forTarget:", [v9 volumeWarningEnabled], objc_msgSend(v9, "volumeWarningState"), v7);
        [v9 EUVolumeLimit];
        -[NACIDSServer _sendEUVolumeLimit:forTarget:](self, "_sendEUVolumeLimit:forTarget:", v7);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  if (self->_shouldObserveHapticState) {
    [(NACIDSServer *)self _updateHapticState];
  }
  if (self->_shouldObserveSystemMutedState)
  {
    id v11 = NMLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237CD4000, v11, OS_LOG_TYPE_DEFAULT, "[NACIDS] Updating system mute value because we were asked to send the current observing system volume values", buf, 2u);
    }

    [(NACIDSServer *)self _updateSystemMutedState];
  }
}

- (void)_updateHapticIntensityValue
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237CD4000, log, OS_LOG_TYPE_ERROR, "[NACIDS] Failed to get hapticIntensity from AVSystemController!", v1, 2u);
}

- (void)_cancelSystemVolumeObservation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  systemVolumeRunAssertion = self->_systemVolumeRunAssertion;
  self->_systemVolumeRunAssertion = 0;

  double v4 = *MEMORY[0x263F49E68];
  NACQueueOneIdentifierVolumeObservationCancelled(0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NACIDSServer *)self _sendMessage:0 type:16 timeout:v5 queueOne:1 retry:v4];
}

- (void)_cancelProxyVolumeObservationForTarget:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  int v6 = objc_opt_new();
  double v7 = [v5 originIdentifier];
  objc_msgSend(v6, "setOriginIdentifier:", objc_msgSend(v7, "intValue"));

  id v8 = NACQueueOneIdentifierVolumeObservationCancelled((uint64_t)v5);
  [(NACIDSServer *)self _sendMessage:v6 type:16 timeout:v8 queueOne:1 retry:*MEMORY[0x263F49E68]];
  [(NSMutableDictionary *)self->_proxyVolumeObservers removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_proxyVolumeObservers count])
  {
    id v9 = NMLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_237CD4000, v9, OS_LOG_TYPE_DEFAULT, "[NACIDS] Last proxy volume observer cancelled. Cancelling proxy volume run assertion.", v11, 2u);
    }

    proxyVolumeRunAssertion = self->_proxyVolumeRunAssertion;
    self->_proxyVolumeRunAssertion = 0;
  }
}

- (void)_cancelRouteObservationForCategory:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v9 = (id)objc_opt_new();
  [v9 setCategory:v5];
  int v6 = NACQueueOneIdentifierRouteObservationCancelled((uint64_t)v5);
  [(NACIDSServer *)self _sendMessage:v9 type:17 timeout:v6 queueOne:0 retry:*MEMORY[0x263F49E68]];
  double v7 = [(NSMutableDictionary *)self->_routesObservers objectForKeyedSubscript:v5];
  id v8 = [v7 routingController];
  [v8 setDiscoveryMode:0];

  [(NSMutableDictionary *)self->_routesObservers removeObjectForKey:v5];
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__NACIDSServer_volumeController_volumeValueDidChange___block_invoke;
  v8[3] = &unk_264CFC3B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serialQueue, v8);
}

void __54__NACIDSServer_volumeController_volumeValueDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _targetForVolumeController:*(void *)(a1 + 40)];
  uint64_t v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) volumeValue];
    int v11 = 138412546;
    uint64_t v12 = v2;
    __int16 v13 = 2048;
    double v14 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume value for target %@ did change: %f", (uint8_t *)&v11, 0x16u);
  }

  int v5 = [v2 isPairedDevice];
  uint64_t v6 = 32;
  if (v5) {
    uint64_t v6 = 24;
  }
  id v7 = [*(id *)(*(void *)(a1 + 32) + v6) objectForKeyedSubscript:v2];
  id v8 = [v7 throttler];
  id v9 = NSNumber;
  [*(id *)(a1 + 40) volumeValue];
  id v10 = objc_msgSend(v9, "numberWithFloat:");
  [v8 setValue:v10];
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  id v5 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__NACIDSServer_volumeController_volumeControlAvailableDidChange___block_invoke;
  v8[3] = &unk_264CFC3B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serialQueue, v8);
}

void __65__NACIDSServer_volumeController_volumeControlAvailableDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _targetForVolumeController:*(void *)(a1 + 40)];
  uint64_t v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 40) isVolumeControlAvailable];
    int v5 = 138412546;
    uint64_t v6 = v2;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume control availability for target %@ did change: %d", (uint8_t *)&v5, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_sendVolumeControlAvailability:forTarget:", objc_msgSend(*(id *)(a1 + 40), "isVolumeControlAvailable"), v2);
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  id v5 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__NACIDSServer_volumeController_mutedStateDidChange___block_invoke;
  v8[3] = &unk_264CFC3B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serialQueue, v8);
}

void __53__NACIDSServer_volumeController_mutedStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _targetForVolumeController:*(void *)(a1 + 40)];
  uint64_t v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [*(id *)(a1 + 40) isMuted];
    int v5 = 138412546;
    uint64_t v6 = v2;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume muted state for target %@ did change: %d", (uint8_t *)&v5, 0x12u);
  }

  if ([v2 isPairedDevice]) {
    objc_msgSend(*(id *)(a1 + 32), "_sendMutedState:forTarget:", objc_msgSend(*(id *)(a1 + 40), "isMuted"), v2);
  }
}

- (void)volumeController:(id)a3 EUVolumeLimitDidChange:(float)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NACIDSServer_volumeController_EUVolumeLimitDidChange___block_invoke;
  block[3] = &unk_264CFC428;
  void block[4] = self;
  id v10 = v6;
  float v11 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __56__NACIDSServer_volumeController_EUVolumeLimitDidChange___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _targetForVolumeController:*(void *)(a1 + 40)];
  uint64_t v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) EUVolumeLimit];
    int v6 = 138412546;
    __int16 v7 = v2;
    __int16 v8 = 2048;
    double v9 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] EU limit for target %@ did change: %f", (uint8_t *)&v6, 0x16u);
  }

  if ([v2 isPairedDevice])
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 48);
    [*(id *)(a1 + 32) _sendEUVolumeLimit:v2 forTarget:v5];
  }
}

- (void)volumeController:(id)a3 volumeWarningStateDidChange:(int64_t)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NACIDSServer_volumeController_volumeWarningStateDidChange___block_invoke;
  block[3] = &unk_264CFC7D0;
  id v10 = v6;
  float v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

void __61__NACIDSServer_volumeController_volumeWarningStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) volumeWarningEnabled];
  uint64_t v3 = [*(id *)(a1 + 40) _targetForVolumeController:*(void *)(a1 + 32)];
  float v4 = NMLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 138412802;
    __int16 v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACIDS] Volume warning for target %@ did change (enabled: %d, state: %ld)", (uint8_t *)&v6, 0x1Cu);
  }

  [*(id *)(a1 + 40) _sendVolumeWarningEnabled:v2 volumeWarningState:*(void *)(a1 + 48) forTarget:v3];
}

- (id)_targetForVolumeController:(id)a3
{
  id v3 = a3;
  float v4 = [v3 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  int v6 = [v3 dataSource];
  __int16 v7 = v6;
  if (isKindOfClass)
  {
    __int16 v8 = [v6 volumeAudioCategory];

    int v9 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:v8];
  }
  else
  {
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0)
    {
      int v9 = 0;
      goto LABEL_10;
    }
    uint64_t v11 = [v3 dataSource];
    __int16 v8 = [v11 groupRoute];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 endpointWrapper],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 unwrappedValue],
          MRAVEndpointGetExternalDevice(),
          v12,
          (uint64_t v13 = MRExternalDeviceCopyCustomOrigin()) != 0))
    {
      double v14 = (const void *)v13;
      uint64_t v15 = [NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
      int v9 = +[NACProxyVolumeControlTarget volumeControlTargetWithOriginIdentifier:v15];

      CFRelease(v14);
    }
    else
    {
      int v9 = 0;
    }
  }

LABEL_10:

  return v9;
}

- (id)_targetForNACVolumeController:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  long long v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  systemVolumeObservers = self->_systemVolumeObservers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__NACIDSServer__targetForNACVolumeController___block_invoke;
  v9[3] = &unk_264CFC7F8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)systemVolumeObservers enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__NACIDSServer__targetForNACVolumeController___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  __int16 v8 = [a3 nacVolumeController];
  int v9 = *(void **)(a1 + 32);

  if (v8 == v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NACIDSServer_routingControllerAvailableRoutesDidChange___block_invoke;
  v7[3] = &unk_264CFC3B0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __58__NACIDSServer_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) category];
  id v3 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:v2];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:v3];
  uint64_t v5 = [*(id *)(a1 + 32) volumeControlIsAvailable];
  if (v4 && v5 != [v4 isVolumeControlAvailable])
  {
    [v4 setVolumeControlAvailable:v5];
    [*(id *)(a1 + 40) _sendVolumeControlAvailability:v5 forTarget:v3];
  }
  id v6 = NACCategoryStringWithRouteCategory(v2);

  id v7 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    int v9 = *(void **)(a1 + 32);
    id v10 = [v7 routingController];

    if (v9 == v10)
    {
      uint64_t v11 = NMLogForCategory(4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237CD4000, v11, OS_LOG_TYPE_DEFAULT, "[NACIDS] Available routes updated", buf, 2u);
      }

      uint64_t v12 = objc_opt_new();
      uint64_t v13 = [*(id *)(a1 + 32) availableRoutes];
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __58__NACIDSServer_routingControllerAvailableRoutesDidChange___block_invoke_211;
      uint64_t v22 = &unk_264CFC820;
      char v24 = v5;
      id v23 = v12;
      id v14 = v12;
      [v13 enumerateObjectsUsingBlock:&v19];
      uint64_t v15 = objc_opt_new();
      objc_msgSend(v15, "setCategory:", v6, v19, v20, v21, v22);
      long long v16 = +[NACAudioRoute buffersFromAudioRoutes:v14];
      id v17 = (void *)[v16 mutableCopy];

      [v15 setAudioRoutes:v17];
      uint64_t v18 = NACQueueOneIdentifierAudioRoutes((uint64_t)v6);
      [*(id *)(a1 + 40) _sendMessage:v15 type:11 timeout:v18 queueOne:0 retry:*MEMORY[0x263F49E68]];
    }
  }
}

void __58__NACIDSServer_routingControllerAvailableRoutesDidChange___block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NMLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 routeName];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACIDS] -> %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = +[NACAudioRoute audioRouteWithMPAVRoute:v3];
  if ([v3 isPicked]) {
    [v6 setSupportsVolumeControl:*(unsigned __int8 *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)_hapticIntensityDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__NACIDSServer__hapticIntensityDidChangeNotification___block_invoke;
  v7[3] = &unk_264CFC3B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __54__NACIDSServer__hapticIntensityDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACIDS] Haptic intensity changed", v10, 2u);
  }

  id v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F544C0]];
  [v4 floatValue];
  float v6 = NACUIValueForSystemHapticValue(v5);

  int v7 = *(void **)(*(void *)(a1 + 40) + 112);
  *(float *)&double v8 = v6;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  [v7 setValue:v9];
}

- (void)volumeControllerDidUpdateAvailableListeningModes:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__NACIDSServer_volumeControllerDidUpdateAvailableListeningModes___block_invoke;
  v7[3] = &unk_264CFC3B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __65__NACIDSServer_volumeControllerDidUpdateAvailableListeningModes___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _targetForNACVolumeController:*(void *)(a1 + 40)];
  id v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 40) availableListeningModes];
    int v8 = 138412546;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Available listening modes for target %@ did change: %@", (uint8_t *)&v8, 0x16u);
  }
  float v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) availableListeningModes];
  int v7 = [*(id *)(a1 + 40) currentListeningMode];
  [v5 _sendAvailableListeningModes:v6 currentListeningMode:v7 error:0 forTarget:v2];
}

- (void)volumeControllerDidUpdateCurrentListeningMode:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__NACIDSServer_volumeControllerDidUpdateCurrentListeningMode___block_invoke;
  v7[3] = &unk_264CFC3B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __62__NACIDSServer_volumeControllerDidUpdateCurrentListeningMode___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _targetForNACVolumeController:*(void *)(a1 + 40)];
  id v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 40) currentListeningMode];
    int v8 = 138412546;
    uint64_t v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Current listening mode for target %@ did change: %@", (uint8_t *)&v8, 0x16u);
  }
  float v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) availableListeningModes];
  int v7 = [*(id *)(a1 + 40) currentListeningMode];
  [v5 _sendAvailableListeningModes:v6 currentListeningMode:v7 error:0 forTarget:v2];
}

- (void)volumeController:(id)a3 didFailToSetCurrentListeningModeWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__NACIDSServer_volumeController_didFailToSetCurrentListeningModeWithError___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __75__NACIDSServer_volumeController_didFailToSetCurrentListeningModeWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _targetForNACVolumeController:*(void *)(a1 + 40)];
  id v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    int v8 = 138412546;
    id v9 = v2;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Failed to set current listening mode for target %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  float v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) availableListeningModes];
  id v7 = [*(id *)(a1 + 40) currentListeningMode];
  [v5 _sendAvailableListeningModes:v6 currentListeningMode:v7 error:*(void *)(a1 + 48) forTarget:v2];
}

- (void)_sendVolumeValue:(float)a3 forTarget:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v7 = NACQueueOneIdentifierVolumeValue((uint64_t)v6);
  int v8 = objc_opt_new();
  *(float *)&double v9 = a3;
  [v8 setVolumeValue:v9];
  __int16 v10 = [v6 originIdentifier];
  objc_msgSend(v8, "setOriginIdentifier:", objc_msgSend(v10, "intValue"));

  uint64_t v11 = [v6 category];
  [v8 setCategory:v11];

  uint64_t v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    double v14 = a3;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Sending system volume value: %f for target: %@", (uint8_t *)&v13, 0x16u);
  }

  [(NACIDSServer *)self _sendMessage:v8 type:2 timeout:v7 queueOne:1 retry:*MEMORY[0x263F49E68]];
}

- (void)_sendVolumeControlAvailability:(BOOL)a3 forTarget:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v7 = objc_opt_new();
  [v7 setVolumeControlAvailable:v4];
  int v8 = [v6 originIdentifier];
  objc_msgSend(v7, "setOriginIdentifier:", objc_msgSend(v8, "intValue"));

  double v9 = [v6 category];
  [v7 setCategory:v9];

  __int16 v10 = NACQueueOneIdentifierVolumeControlAvailability((uint64_t)v6);
  uint64_t v11 = NMLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = @"NO";
    if (v4) {
      uint64_t v12 = @"YES";
    }
    int v13 = 138412546;
    double v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_237CD4000, v11, OS_LOG_TYPE_DEFAULT, "[NACIDS] Sending system volume availability: %@ for target: %@", (uint8_t *)&v13, 0x16u);
  }

  [(NACIDSServer *)self _sendMessage:v7 type:5 timeout:v10 queueOne:1 retry:*MEMORY[0x263F49E68]];
}

- (void)_sendEUVolumeLimit:(float)a3 forTarget:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(NACIDSServer *)self _shouldForceVolumeWarning]) {
    a3 = *(float *)"333?";
  }
  id v7 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v6];
  [v7 EUVolumeLimit];
  if (a3 != *(float *)&v8)
  {
    *(float *)&double v8 = a3;
    [v7 setEUVolumeLimit:v8];
    double v9 = objc_opt_new();
    *(float *)&double v10 = a3;
    [v9 setEUVolumeLimit:v10];
    uint64_t v11 = [v6 originIdentifier];
    objc_msgSend(v9, "setOriginIdentifier:", objc_msgSend(v11, "intValue"));

    uint64_t v12 = [v6 category];
    [v9 setCategory:v12];

    int v13 = NACQueueOneIdentifierEUVolumeLimit((uint64_t)v6);
    double v14 = NMLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218242;
      double v16 = a3;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACIDS] Sending system EU volume limit: %f for target: %@", (uint8_t *)&v15, 0x16u);
    }

    [(NACIDSServer *)self _sendMessage:v9 type:14 timeout:v13 queueOne:1 retry:*MEMORY[0x263F49E68]];
  }
}

- (void)_sendVolumeWarningEnabled:(BOOL)a3 volumeWarningState:(int64_t)a4 forTarget:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v9 = [(NACIDSServer *)self _shouldForceVolumeWarning];
  if (v9) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = a4;
  }
  uint64_t v11 = v9 | v6;
  uint64_t v12 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v8];
  if (v11 != [v12 isVolumeWarningEnabled]
    || v10 != [v12 volumeWarningState])
  {
    [v12 setVolumeWarningEnabled:v11];
    [v12 setVolumeWarningState:v10];
    int v13 = objc_opt_new();
    [v13 setVolumeWarningEnabled:v11];
    [v13 setVolumeWarningState:v10];
    double v14 = [v8 originIdentifier];
    objc_msgSend(v13, "setOriginIdentifier:", objc_msgSend(v14, "intValue"));

    int v15 = [v8 category];
    [v13 setCategory:v15];

    double v16 = NACQueueOneIdentifierVolumeWarning((uint64_t)v8);
    __int16 v17 = NMLogForCategory(4);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109634;
      v18[1] = v11;
      __int16 v19 = 2048;
      int64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_237CD4000, v17, OS_LOG_TYPE_DEFAULT, "[NACIDS] Sending system volume warning enabled: %d state: %ld for category: %@", (uint8_t *)v18, 0x1Cu);
    }

    [(NACIDSServer *)self _sendMessage:v13 type:15 timeout:v16 queueOne:1 retry:*MEMORY[0x263F49E68]];
  }
}

- (void)_sendMutedState:(BOOL)a3 forTarget:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v7 = [(NSMutableDictionary *)self->_systemVolumeObservers objectForKeyedSubscript:v6];
  if ([v7 isMuted] != v4)
  {
    [v7 setMuted:v4];
    id v8 = objc_opt_new();
    [v8 setMuted:v4];
    BOOL v9 = [v6 originIdentifier];
    objc_msgSend(v8, "setOriginIdentifier:", objc_msgSend(v9, "intValue"));

    int64_t v10 = [v6 category];
    [v8 setCategory:v10];

    uint64_t v11 = NACQueueOneIdentifierMutedState((uint64_t)v6);
    uint64_t v12 = NMLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109378;
      v13[1] = v4;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACIDS] Sending system muted state: %d for target: %@", (uint8_t *)v13, 0x12u);
    }

    [(NACIDSServer *)self _sendMessage:v8 type:6 timeout:v11 queueOne:1 retry:*MEMORY[0x263F49E68]];
  }
}

- (void)_sendAvailableListeningModes:(id)a3 currentListeningMode:(id)a4 error:(id)a5 forTarget:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  __int16 v14 = objc_alloc_init(NACListeningModesMessage);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NACListeningModesMessage *)v14 addAvailableListeningMode:*(void *)(*((void *)&v28 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v17);
  }

  [(NACListeningModesMessage *)v14 setCurrentListeningMode:v11];
  if (v12)
  {
    id v27 = 0;
    int64_t v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v27];
    id v21 = v27;
    if (v21)
    {
      id v22 = NMLogForCategory(2);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NACIDSServer _sendAvailableListeningModes:currentListeningMode:error:forTarget:]((uint64_t)v12);
      }
    }
    [(NACListeningModesMessage *)v14 setError:v20];
  }
  uint64_t v23 = [v13 originIdentifier];
  -[NACListeningModesMessage setOriginIdentifier:](v14, "setOriginIdentifier:", [v23 intValue]);

  char v24 = [v13 category];
  [(NACListeningModesMessage *)v14 setCategory:v24];

  id v25 = NACQueueOneIdentifierVolumeControlAvailability((uint64_t)v13);
  id v26 = NMLogForCategory(4);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v33 = v15;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_237CD4000, v26, OS_LOG_TYPE_DEFAULT, "[NACIDS] [NoiseControl] Sending available listening modes: %@ current listening mode: %@ error: %@ for target: %@", buf, 0x2Au);
  }

  [(NACIDSServer *)self _sendMessage:v14 type:24 timeout:v25 queueOne:1 retry:*MEMORY[0x263F49E68]];
}

- (void)_sendSystemMutedState:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v6 = (id)objc_opt_new();
  [v6 setMuted:v3];
  float v5 = NACQueueOneIdentifierSystemMutedState();
  [(NACIDSServer *)self _sendMessage:v6 type:18 timeout:v5 queueOne:1 retry:*MEMORY[0x263F49E68]];
}

- (void)_sendHapticState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v6 = (id)objc_opt_new();
  [v6 setState:a3];
  float v5 = NACQueueOneIdentifierHapticState();
  [(NACIDSServer *)self _sendMessage:v6 type:22 timeout:v5 queueOne:1 retry:*MEMORY[0x263F49E68]];
}

- (void)_sendMessage:(id)a3 type:(int64_t)a4 timeout:(double)a5 queueOne:(id)a6 retry:(BOOL)a7
{
  BOOL v33 = a7;
  v48[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v13 = objc_alloc(MEMORY[0x263F4A098]);
  __int16 v34 = v11;
  __int16 v14 = [v11 data];
  uint64_t v15 = [v13 initWithProtobufData:v14 type:(unsigned __int16)a4 isResponse:0];

  id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
  v47[0] = *MEMORY[0x263F49F80];
  uint64_t v17 = [NSNumber numberWithDouble:a5];
  v47[1] = *MEMORY[0x263F49F08];
  v48[0] = v17;
  v48[1] = MEMORY[0x263EFFA88];
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  uint64_t v19 = (void *)[v16 initWithDictionary:v18];

  if (NACMessageTypeIsNonWaking()) {
    [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F30]];
  }
  if (v12) {
    [v19 setObject:v12 forKeyedSubscript:*MEMORY[0x263F49F60]];
  }
  idsService = self->_idsService;
  id v21 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v35 = 0;
  id v36 = 0;
  id v22 = (void *)v15;
  char v23 = [(IDSService *)idsService sendProtobuf:v15 toDestinations:v21 priority:200 options:v19 identifier:&v36 error:&v35];
  id v24 = v36;
  id v25 = v35;

  id v26 = NSStringFromNACMessageType(a4);
  id v27 = NMLogForCategory(4);
  long long v28 = v27;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v31 = [v34 data];
      uint64_t v32 = [v31 length];
      *(_DWORD *)buf = 138413314;
      __int16 v38 = v26;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v24;
      __int16 v43 = 2048;
      uint64_t v44 = v32;
      __int16 v45 = 2112;
      id v46 = v25;
      _os_log_error_impl(&dword_237CD4000, v28, OS_LOG_TYPE_ERROR, "[NACIDS] Failed to request delivery of IDS message, type: %@, queueOne: %@, identifier: %@, payload size: %tu, error: %@", buf, 0x34u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = [v34 data];
    uint64_t v30 = [v29 length];
    *(_DWORD *)buf = 138413058;
    __int16 v38 = v26;
    __int16 v39 = 2112;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v24;
    __int16 v43 = 2048;
    uint64_t v44 = v30;
    _os_log_impl(&dword_237CD4000, v28, OS_LOG_TYPE_DEFAULT, "[NACIDS] Successfully requested delivery of IDS message, type: %@, queueOne: %@, identifier: %@, payload size: %tu", buf, 0x2Au);
  }
  if (v33 && v24)
  {
    long long v28 = objc_opt_new();
    [v28 setMessage:v34];
    [v28 setType:a4];
    [v28 setTimeout:a5];
    [v28 setQueueOne:v12];
    [(NSMutableDictionary *)self->_messageRecords setObject:v28 forKeyedSubscript:v24];
LABEL_13:
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = NMLogForCategory(4);
  uint64_t v17 = v16;
  if (v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v14;
      _os_log_impl(&dword_237CD4000, v17, OS_LOG_TYPE_DEFAULT, "[NACIDS] Successfully sent message (ID: %@).", (uint8_t *)&v24, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[NACIDSServer service:account:identifier:didSendWithSuccess:error:]((uint64_t)v14);
  }

  if ([v15 code] == 23)
  {
    uint64_t v18 = [(NSMutableDictionary *)self->_messageRecords objectForKeyedSubscript:v14];
    uint64_t v17 = v18;
    if (v18)
    {
      uint64_t v19 = [v18 message];
      uint64_t v20 = [v17 type];
      [v17 timeout];
      double v22 = v21;
      char v23 = [v17 queueOne];
      [(NACIDSServer *)self _sendMessage:v19 type:v20 timeout:v23 queueOne:1 retry:v22];
    }
    goto LABEL_9;
  }
LABEL_10:
  [(NSMutableDictionary *)self->_messageRecords removeObjectForKey:v14];
}

- (void)_setRequestedVolumeAtLeastOnce
{
  CFPreferencesSetAppValue(@"RequestedVolume", MEMORY[0x263EFFA88], @"com.apple.NanoAudioControl");

  CFPreferencesAppSynchronize(@"com.apple.NanoAudioControl");
}

- (BOOL)_hasRequestedVolumeAtLeastOnce
{
  return CFPreferencesGetAppBooleanValue(@"RequestedVolume", @"com.apple.NanoAudioControl", 0) != 0;
}

- (BOOL)_shouldForceVolumeWarning
{
  if (_shouldForceVolumeWarning_onceToken != -1) {
    dispatch_once(&_shouldForceVolumeWarning_onceToken, &__block_literal_global_3);
  }
  return _shouldForceVolumeWarning_shouldForceVolumeWarning;
}

uint64_t __41__NACIDSServer__shouldForceVolumeWarning__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.NanoAudioControl");
  uint64_t result = CFPreferencesGetAppBooleanValue(@"ForceVolumeWarning", @"com.apple.NanoAudioControl", 0);
  _shouldForceVolumeWarning_shouldForceVolumeWarning = result != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingAlerts, 0);
  objc_storeStrong((id *)&self->_hapticThrottler, 0);
  objc_storeStrong((id *)&self->_systemSilentModeNotificationToken, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_volumeAudioCategories, 0);
  objc_storeStrong((id *)&self->_messageRecords, 0);
  objc_storeStrong((id *)&self->_routesObservers, 0);
  objc_storeStrong((id *)&self->_proxyVolumeObservers, 0);
  objc_storeStrong((id *)&self->_systemVolumeObservers, 0);
  objc_storeStrong((id *)&self->_proxyVolumeRunAssertion, 0);

  objc_storeStrong((id *)&self->_systemVolumeRunAssertion, 0);
}

void __32__NACIDSServer__handlePlayTone___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = [*(id *)(a1 + 32) alertType];
  float v5 = [*(id *)(a1 + 32) topic];
  id v6 = [*(id *)(a1 + 32) toneIdentifier];
  int v7 = 138412802;
  BOOL v8 = v4;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "[NACIDS] Failed to to play alertType: %@, topic: %@, toneIdentifier: %@", (uint8_t *)&v7, 0x20u);
}

void __38__NACIDSServer__handlePickAudioRoute___block_invoke_185_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_237CD4000, v1, v2, "[NACIDS] Failed to pick route: %@ due to %@", (void)v3, DWORD2(v3));
}

- (void)_beginObservingProxyVolumeForTarget:(uint64_t)a3 withEndpointRoute:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sendAvailableListeningModes:(uint64_t)a1 currentListeningMode:error:forTarget:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_237CD4000, v1, v2, "Failed to archive error: %@ with error: %@", (void)v3, DWORD2(v3));
}

- (void)service:(uint64_t)a1 account:identifier:didSendWithSuccess:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_237CD4000, v1, v2, "[NACIDS] Failed to send message (ID: %@) with error \"%@\".", (void)v3, DWORD2(v3));
}

@end