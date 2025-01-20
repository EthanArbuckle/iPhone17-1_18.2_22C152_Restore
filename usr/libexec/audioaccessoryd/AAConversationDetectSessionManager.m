@interface AAConversationDetectSessionManager
+ ($D59FE58F0A2FC780966BA190996C80C3)defaultAudioTunings;
+ (id)sharedCDSessionManager;
- ($06D0163FE0D7AFE752A9F21F38483579)_getResetMessage:(unsigned __int8)a3;
- ($F52B7ECEF61F33743E51AFD28469D665)_getPauseMessage;
- (AAConversationDetectSessionManager)init;
- (BOOL)_getCDTunings:(id *)a3 FromData:(id)a4;
- (BOOL)cdSignalAudioInterrupted;
- (BOOL)getCdSignalAudioInterrupted;
- (NSString)currentCDDeviceIdentifier;
- (float)_duckingLevelForCoefficients:(id)a3 volume:(float)a4;
- (id)descriptionWithLevel:(int)a3;
- (id)getCurrentCDDeviceIdentifier;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_activateCDSession;
- (void)_asyncAudioSessionDuckWithLevel:(id)a3 completion:(id)a4;
- (void)_audioSessionEnsureStarted;
- (void)_audioSessionEnsureStopped;
- (void)_audioSessionReset;
- (void)_calibrateDuckingLevelForVolumeLevel:(float)a3;
- (void)_cdMsgNotificationReceivedHandler:(id)a3;
- (void)_cdSessionEnsureActivated:(BOOL)a3;
- (void)_cdSessionEnsureDeactivated:(unsigned __int8)a3;
- (void)_cdSessionSignalUpdate;
- (void)_conversationDetectMessageReceived:(id)a3 fromDeviceIdentifier:(id)a4;
- (void)_deregisterFromAVAudioSessionSpeechDetectionStyleChanges;
- (void)_deregisterFromAudioSessionResetNotifications;
- (void)_deregisterFromWirelessSplitterStateChanges;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_getSignalTypeFromData:(id)a3 signal:(int *)a4;
- (void)_invalidate;
- (void)_invalidateCDSession;
- (void)_prefsChanged;
- (void)_registerForAVAudioSessionSpeechDetectionStyleChanges;
- (void)_registerForAudioSessionResetNotifications;
- (void)_registerForWirelessSplitterStateChanges;
- (void)_requestSiriAnnounce;
- (void)_sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completion:(id)a5;
- (void)_setCDSignalAudioTunings:(id *)a3;
- (void)_setPedestrianFenceWithHandler:(id)a3;
- (void)_speechDetectionStyleChanged:(unint64_t)a3;
- (void)_speechDetectionUserVolumeChanged:(unint64_t)a3;
- (void)_startHeadGestureManager;
- (void)_startPedestrianFenceSession;
- (void)_startQueuedRampForDuration:(id)a3 startLevel:(id)a4 endLevel:(id)a5;
- (void)_stopHeadGestureManager;
- (void)_stopPedestrianFenceSession;
- (void)_updateAccessoriesWithMotionState:(unsigned int)a3;
- (void)_updateAccessoriesWithPauseState;
- (void)_updateAccessoriesWithResetState:(unsigned __int8)a3;
- (void)_updateConversationDetectSignal:(int)a3;
- (void)_updatePauseState;
- (void)activate;
- (void)activateCDSession;
- (void)didDetectedWithHeadGesture:(id)a3;
- (void)didStartStreamingWithIsStreaming:(BOOL)a3;
- (void)invalidate;
- (void)invalidateCDSession;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCDTunings:(id *)a3;
- (void)setCdSignalAudioInterrupted:(BOOL)a3;
- (void)setConversationDetectSignal:(int)a3;
- (void)setCurrentCDDeviceIdentifier:(id)a3;
@end

@implementation AAConversationDetectSessionManager

+ ($D59FE58F0A2FC780966BA190996C80C3)defaultAudioTunings
{
  *(_OWORD *)&retstr->var0.var0 = xmmword_1001CFB10;
  *(_OWORD *)&retstr->var2.var0 = xmmword_1001CFB20;
  *(_OWORD *)&retstr->var4.var0 = xmmword_1001CFB30;
  *(int64x2_t *)&retstr->var6.var0 = vdupq_n_s64(0x3E99999A3F800000uLL);
  return result;
}

+ (id)sharedCDSessionManager
{
  if (qword_100263E58 != -1) {
    dispatch_once(&qword_100263E58, &stru_100232998);
  }
  v2 = (void *)qword_100263E50;

  return v2;
}

- (AAConversationDetectSessionManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)AAConversationDetectSessionManager;
  v2 = [(AAConversationDetectSessionManager *)&v20 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AACDSessionManager", v3);
    v5 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("AACDChunkedRampQueue", v6);
    v8 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v7;

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    v10 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v9;

    *((_DWORD *)v2 + 57) = -1;
    +[AAConversationDetectSessionManager defaultAudioTunings];
    long long v12 = v18;
    long long v11 = v19;
    long long v13 = v17;
    *(_OWORD *)(v2 + 24) = v16;
    *(_OWORD *)(v2 + 40) = v13;
    *(_OWORD *)(v2 + 56) = v12;
    *(_OWORD *)(v2 + 72) = v11;
    *((_DWORD *)v2 + 48) = -1;
    v14 = v2;
  }

  return (AAConversationDetectSessionManager *)v2;
}

- (void)activate
{
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007B78;
    handler[3] = &unk_1002329C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
  }
  [(AAConversationDetectSessionManager *)self _prefsChanged];
  dispatch_queue_t v4 = self->_connectedDeviceDiscovery;
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)CBDiscovery);
    [v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_connectedDeviceDiscovery, v5);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100007BFC;
    v25[3] = &unk_1002329E8;
    id v6 = v5;
    id v26 = v6;
    v27 = self;
    [v6 setDeviceFoundHandler:v25];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100007C18;
    v22[3] = &unk_1002329E8;
    id v7 = v6;
    id v23 = v7;
    v24 = self;
    [v7 setDeviceLostHandler:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100007C34;
    v19[3] = &unk_100232A10;
    id v8 = v7;
    id v20 = v8;
    v21 = self;
    [v8 setInterruptionHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100007CC8;
    v17[3] = &unk_100232710;
    id v9 = v8;
    id v18 = v9;
    [v9 setInvalidationHandler:v17];
    [v9 setDiscoveryFlags:((unint64_t)[v9 discoveryFlags] | 0x80000200000)];
    long long v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = sub_100007D48;
    v14 = &unk_100232A38;
    dispatch_queue_t v4 = (CBDiscovery *)v9;
    v15 = v4;
    long long v16 = self;
    [(CBDiscovery *)v4 activateWithCompletion:&v11];
  }
  [(AAConversationDetectSessionManager *)self _aaControllerEnsureStarted];
  if (!self->_cdMsgReceivedObserving && IsAppleInternalBuild())
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v10 = +[NSDistributedNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_cdMsgNotificationReceivedHandler:" name:@"com.apple.AudioAccessory.cdMsgNotification" object:0];
    self->_cdMsgReceivedObserving = 1;
  }
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  dispatch_queue_t v4 = self->_aaController;
  if (!v4)
  {
    id v5 = objc_alloc_init(AAController);
    [(AAController *)v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_aaController, v5);
    [(AAController *)v5 setInvalidationHandler:&stru_100232A58];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000808C;
    v10[3] = &unk_100232A80;
    id v6 = v5;
    long long v11 = v6;
    uint64_t v12 = self;
    [(AAController *)v6 setConversationDetectMessageHandler:v10];
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000080A8;
    v7[3] = &unk_100232A38;
    dispatch_queue_t v4 = v6;
    id v8 = v4;
    id v9 = self;
    [(AAController *)v4 activateWithCompletion:v7];
  }
}

- (void)_aaControllerEnsureStopped
{
  aaController = self->_aaController;
  if (aaController)
  {
    [(AAController *)aaController invalidate];
    dispatch_queue_t v4 = self->_aaController;
    self->_aaController = 0;
  }
}

- (void)activateCDSession
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000828C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activateCDSession
{
  if (!self->_activateCDSessionCalled)
  {
    self->_activateCDSessionCalled = 1;
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(AAConversationDetectSessionManager *)self _registerForAudioSessionResetNotifications];
    [(AAConversationDetectSessionManager *)self _registerForAVAudioSessionSpeechDetectionStyleChanges];
    [(AAConversationDetectSessionManager *)self _registerForWirelessSplitterStateChanges];
  }
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_cdSupportedAccessories objectForKeyedSubscript:v7];

    if (v8)
    {
      unsigned int v29 = 0;
      long long v27 = 0u;
      memset(v28, 0, sizeof(v28));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      id v9 = [(NSMutableDictionary *)self->_cdSupportedAccessories objectForKeyedSubscript:v7];
      v10 = [v9 btAddressData];
      long long v11 = CUPrintNSDataAddress();
      [(AAConversationDetectSessionManager *)self setCurrentCDDeviceIdentifier:v11];

      if (v6)
      {
        id v12 = v6;
        long long v13 = (unsigned __int8 *)[v12 bytes];
        uint64_t v14 = (char)*v13;
        unsigned int v15 = *v13;
        if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
        {
          if (v15 > 5) {
            long long v16 = "?";
          }
          else {
            long long v16 = (&off_100232C28)[v14];
          }
          long long v17 = v16;
          LogPrintF();
        }
        if (v15 == 2)
        {
          if ([(AAConversationDetectSessionManager *)self _getCDTunings:&v20 FromData:v12])
          {
            if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v18[6] = v26;
            v18[7] = v27;
            v19[0] = *(_OWORD *)v28;
            *(_DWORD *)((char *)v19 + 15) = *(_DWORD *)&v28[15];
            v18[2] = v22;
            v18[3] = v23;
            v18[4] = v24;
            v18[5] = v25;
            v18[0] = v20;
            v18[1] = v21;
            -[AAConversationDetectSessionManager setCDTunings:](self, "setCDTunings:", v18, v17);
          }
          goto LABEL_34;
        }
        if (v15 == 1)
        {
          [(AAConversationDetectSessionManager *)self _getSignalTypeFromData:v12 signal:&v29];
          [(AAConversationDetectSessionManager *)self _updateConversationDetectSignal:v29];
          goto LABEL_34;
        }
      }
      if (dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
LABEL_33:
      }
        LogPrintF();
    }
    else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_33;
    }
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_33;
  }
LABEL_34:
}

- (void)_cdMsgNotificationReceivedHandler:(id)a3
{
  id v4 = a3;
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000087A8;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF_safe();
  id v5 = 0;
  NSAppendPrintF();
  id v3 = v5;

  return v3;
}

- (void)invalidateCDSession
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000089F0;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateCDSession
{
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_cdSignal = 0;
  [(AAConversationDetectSessionManager *)self _cdSessionEnsureDeactivated:0];
  id v3 = self;
  objc_sync_enter(v3);
  v3->_audioSessionActivated = 0;
  objc_sync_exit(v3);

  [(AAConversationDetectSessionManager *)v3 setCdSignalAudioInterrupted:0];
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CdSignalAudioInterruptedChanged" object:v3];

  if ([(NSMutableDictionary *)v3->_cdSupportedAccessories count])
  {
    if (dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableDictionary *)v3->_cdSupportedAccessories count];
      LogPrintF();
    }
  }
  else
  {
    [(AAConversationDetectSessionManager *)v3 _deregisterFromAudioSessionResetNotifications];
    [(AAConversationDetectSessionManager *)v3 _deregisterFromWirelessSplitterStateChanges];
    [(AAConversationDetectSessionManager *)v3 _deregisterFromAVAudioSessionSpeechDetectionStyleChanges];
    v3->_activateCDSessionCalled = 0;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C1C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(AAConversationDetectSessionManager *)self _invalidateCDSession];
  [(AAConversationDetectSessionManager *)self _aaControllerEnsureStopped];
  [(CBDiscovery *)self->_connectedDeviceDiscovery invalidate];
  connectedDeviceDiscovery = self->_connectedDeviceDiscovery;
  self->_connectedDeviceDiscovery = 0;

  [(NSMutableDictionary *)self->_cdSupportedAccessories removeAllObjects];
  cdSupportedAccessories = self->_cdSupportedAccessories;
  self->_cdSupportedAccessories = 0;

  if (self->_cdMsgReceivedObserving)
  {
    id v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"com.apple.AudioAccessory.cdMsgNotification" object:0];
    self->_cdMsgReceivedObserving = 0;
  }
  int prefsChangedNotifyToken = self->_prefsChangedNotifyToken;
  if (prefsChangedNotifyToken != -1)
  {
    notify_cancel(prefsChangedNotifyToken);
    self->_int prefsChangedNotifyToken = -1;
  }
  int conversationAwarenessNotificationDispatchToken = self->_conversationAwarenessNotificationDispatchToken;

  notify_cancel(conversationAwarenessNotificationDispatchToken);
}

- ($F52B7ECEF61F33743E51AFD28469D665)_getPauseMessage
{
  return ($F52B7ECEF61F33743E51AFD28469D665)((self->_currentPauseReason << 16) | (self->_pauseConversationDetect << 8) | 3);
}

- ($06D0163FE0D7AFE752A9F21F38483579)_getResetMessage:(unsigned __int8)a3
{
  return ($06D0163FE0D7AFE752A9F21F38483579)((a3 << 8) | 5);
}

- (void)_getSignalTypeFromData:(id)a3 signal:(int *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v9 = v5;
    id v7 = v5;
    id v8 = (unsigned __int8 *)[v7 bytes];
    id v5 = [v7 length];
    if ((unint64_t)v5 <= 1)
    {
      id v6 = v9;
      if (dword_100260DD0 <= 30)
      {
        if (dword_100260DD0 != -1) {
          goto LABEL_12;
        }
        id v5 = (id)_LogCategory_Initialize();
        id v6 = v9;
        if (v5) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      *a4 = v8[1];
      id v6 = v9;
      if (dword_100260DD0 <= 30)
      {
        if (dword_100260DD0 != -1 || (id v5 = (id)_LogCategory_Initialize(), v6 = v9, v5))
        {
LABEL_12:
          id v5 = (id)LogPrintF();
          id v6 = v9;
        }
      }
    }
  }

  _objc_release_x1(v5, v6);
}

- (BOOL)_getCDTunings:(id *)a3 FromData:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  id v7 = v5;
  id v8 = (char *)[v7 bytes];
  if ((unint64_t)[v7 length] <= 0x93)
  {
    if (dword_100260DD0 > 30 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (!a3)
  {
    if (dword_100260DD0 > 30 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_14;
    }
LABEL_10:
    LogPrintF();
LABEL_14:
    BOOL v16 = 0;
    goto LABEL_15;
  }
  long long v9 = *(_OWORD *)(v8 + 17);
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)(v8 + 1);
  *(_OWORD *)&a3->var0.var4 = v9;
  long long v10 = *(_OWORD *)(v8 + 33);
  long long v11 = *(_OWORD *)(v8 + 49);
  long long v12 = *(_OWORD *)(v8 + 81);
  *(_OWORD *)&a3->var0.var16 = *(_OWORD *)(v8 + 65);
  *(_OWORD *)&a3->var0.var21 = v12;
  *(_OWORD *)&a3->var0.var8 = v10;
  *(_OWORD *)&a3->var0.var12 = v11;
  long long v13 = *(_OWORD *)(v8 + 97);
  long long v14 = *(_OWORD *)(v8 + 113);
  long long v15 = *(_OWORD *)(v8 + 129);
  *(float *)((char *)&a3->var2.var6.var0 + 3) = *((float *)v8 + 36);
  *(_OWORD *)&a3->var2.var2.var1 = v14;
  *(_OWORD *)&a3->var2.var4.var1 = v15;
  *(_OWORD *)&a3->var2.var0.var1 = v13;
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)getCdSignalAudioInterrupted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cdSignalAudioInterrupted = v2->_cdSignalAudioInterrupted;
  objc_sync_exit(v2);

  return cdSignalAudioInterrupted;
}

- (id)getCurrentCDDeviceIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentCDDeviceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (void)_prefsChanged
{
  CFPrefs_GetDouble();
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 3.0;
  }
  if (v4 != self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    float v5 = v4;
    self->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs = v5;
  }
  CFPrefs_GetDouble();
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.1;
  }
  if (v7 != self->_prefCDRampChunkDuration)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefCDRampChunkDuration = v7;
  }
  BOOL v8 = CFPrefs_GetInt64() != 0;
  if (self->_prefCDShouldDisableCustomDuckingCurve != v8)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefCDShouldDisableCustomDuckingCurve = v8;
  }
  BOOL v9 = CFPrefs_GetInt64() != 0;
  if (self->_prefCDSiriDidAnnounce != v9)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefCDSiriDidAnnounce = v9;
  }
}

- (void)_sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(AAConversationDetectSessionManager *)self _aaControllerEnsureStarted];
  aaController = self->_aaController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009458;
  v15[3] = &unk_100232AA8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(AAController *)aaController sendConversationDetectMessage:v14 destinationIdentifier:v13 completionHandler:v15];
}

- (void)setConversationDetectSignal:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000095E8;
  v4[3] = &unk_1002325D0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, v4);
}

- (void)setCDTunings:(id *)a3
{
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  long long v4 = *(_OWORD *)&a3->var2.var2.var1;
  long long v15 = *(_OWORD *)&a3->var2.var0.var1;
  long long v16 = v4;
  *(_OWORD *)id v17 = *(_OWORD *)&a3->var2.var4.var1;
  long long v5 = *(_OWORD *)&a3->var0.var12;
  long long v11 = *(_OWORD *)&a3->var0.var8;
  long long v12 = v5;
  long long v6 = *(_OWORD *)&a3->var0.var21;
  long long v13 = *(_OWORD *)&a3->var0.var16;
  long long v14 = v6;
  long long v7 = *(_OWORD *)&a3->var0.var4;
  long long v9 = *(_OWORD *)&a3->var0.var0;
  v8[2] = sub_1000096AC;
  v8[3] = &unk_100232AD0;
  *(float *)&v17[15] = *(float *)((char *)&a3->var2.var6.var0 + 3);
  long long v10 = v7;
  v8[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, v8);
}

- (void)setCdSignalAudioInterrupted:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL cdSignalAudioInterrupted = a3;
  objc_sync_exit(obj);
}

- (void)_setCDSignalAudioTunings:(id *)a3
{
  uint64_t v3 = 0;
  long long v4 = *(_OWORD *)&a3->var2.var0;
  v27[0] = *(_OWORD *)&a3->var0.var0;
  v27[1] = v4;
  p_cdSignalAudioTunings = &self->_cdSignalAudioTunings;
  long long v6 = *(_OWORD *)&a3->var6.var0;
  v27[2] = *(_OWORD *)&a3->var4.var0;
  v27[3] = v6;
  do
  {
    float v7 = *((float *)v27 + v3);
    if (v7 >= 0.0)
    {
      float v8 = flt_1001CFB74[v3];
      if (v7 <= v8)
      {
        float v8 = *((float *)v27 + v3);
      }
      else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
      {
LABEL_10:
        LogPrintF();
      }
    }
    else
    {
      float v8 = 0.0;
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_10;
      }
    }
    *(&p_cdSignalAudioTunings->startSignalTunables.signalDuckingLevel + v3++) = v8;
  }
  while (v3 != 16);
  if (dword_100260DD0 < 31 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    id v45 = 0;
    NSAppendPrintF();
    id v9 = v45;
    id v44 = v9;
    NSAppendPrintF();
    id v10 = v44;

    id v43 = v10;
    NSAppendPrintF();
    id v11 = v43;

    id v42 = v11;
    NSAppendPrintF();
    id v12 = v42;

    id v41 = v12;
    NSAppendPrintF();
    id v13 = v41;

    id v40 = v13;
    NSAppendPrintF();
    id v14 = v40;

    id v39 = v14;
    NSAppendPrintF();
    id v15 = v39;

    id v38 = v15;
    NSAppendPrintF();
    id v16 = v38;

    id v37 = v16;
    NSAppendPrintF();
    id v17 = v37;

    id v36 = v17;
    NSAppendPrintF();
    id v18 = v36;

    id v35 = v18;
    NSAppendPrintF();
    id v19 = v35;

    id v34 = v19;
    NSAppendPrintF();
    id v20 = v34;

    id v33 = v20;
    NSAppendPrintF();
    id v21 = v33;

    id v32 = v21;
    NSAppendPrintF();
    id v22 = v32;

    id v31 = v22;
    NSAppendPrintF();
    id v23 = v31;

    id v30 = v23;
    NSAppendPrintF();
    id v24 = v30;

    id v29 = v24;
    NSAppendPrintF();
    id v25 = v29;

    id v28 = v25;
    NSAppendPrintF();
    id v26 = v28;

    LogPrintF();
  }
}

- (void)setCurrentCDDeviceIdentifier:(id)a3
{
  long long v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentCDDeviceIdentifier = obj->_currentCDDeviceIdentifier;
  obj->_currentCDDeviceIdentifier = v4;

  objc_sync_exit(obj);
}

- (void)_updateAccessoriesWithMotionState:(unsigned int)a3
{
  if ([(NSMutableDictionary *)self->_cdSupportedAccessories count])
  {
    char v10 = 4;
    unsigned int v11 = a3;
    long long v5 = +[NSData dataWithBytes:&v10 length:5];
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000A35C;
    v8[3] = &unk_100232AF8;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)cdSupportedAccessories enumerateKeysAndObjectsUsingBlock:v8];
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccessoriesWithPauseState
{
  if ([(NSMutableDictionary *)self->_cdSupportedAccessories count])
  {
    uint64_t v3 = (uint64_t)[(AAConversationDetectSessionManager *)self _getPauseMessage];
    __int16 v9 = v3;
    char v10 = BYTE2(v3);
    long long v4 = +[NSData dataWithBytes:&v9 length:3];
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A4F4;
    v7[3] = &unk_100232AF8;
    void v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [(NSMutableDictionary *)cdSupportedAccessories enumerateKeysAndObjectsUsingBlock:v7];
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccessoriesWithResetState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if ([(NSMutableDictionary *)self->_cdSupportedAccessories count])
  {
    unsigned __int16 v10 = (unsigned __int16)[(AAConversationDetectSessionManager *)self _getResetMessage:v3];
    long long v5 = +[NSData dataWithBytes:&v10 length:2];
    cdSupportedAccessories = self->_cdSupportedAccessories;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000A68C;
    v8[3] = &unk_100232AF8;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)cdSupportedAccessories enumerateKeysAndObjectsUsingBlock:v8];
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateConversationDetectSignal:(int)a3
{
  if (self->_cdSignal != a3)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_cdSignal = a3;
    [(AAConversationDetectSessionManager *)self _cdSessionSignalUpdate];
  }
}

- (void)_updatePauseState
{
  unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  BOOL isWirelessSplitterOn = self->_isWirelessSplitterOn;
  BOOL pauseConversationDetect = self->_isWirelessSplitterOn || currentSpeechDetectionStyle == 4;
  self->_BOOL pauseConversationDetect = pauseConversationDetect;
  if (dword_100260DD0 <= 30)
  {
    if (dword_100260DD0 == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_19:
        BOOL pauseConversationDetect = self->_pauseConversationDetect;
        goto LABEL_20;
      }
      BOOL pauseConversationDetect = self->_pauseConversationDetect;
      BOOL isWirelessSplitterOn = self->_isWirelessSplitterOn;
    }
    id v7 = "yes";
    if (pauseConversationDetect) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    if (isWirelessSplitterOn) {
      id v9 = "yes";
    }
    else {
      id v9 = "no";
    }
    if (currentSpeechDetectionStyle != 4) {
      id v7 = "no";
    }
    unsigned int v11 = v9;
    id v12 = v7;
    unsigned __int16 v10 = v8;
    LogPrintF();
    goto LABEL_19;
  }
LABEL_20:
  if (!pauseConversationDetect) {
    self->_currentPauseReason = 0;
  }
  [(AAConversationDetectSessionManager *)self _updateAccessoriesWithPauseState];
  if (self->_pauseConversationDetect)
  {
    [(AAConversationDetectSessionManager *)self _cdSessionEnsureDeactivated:0];
  }
}

- (void)_audioSessionEnsureStarted
{
  if (!self->_audioSessionActivated)
  {
    uint64_t v3 = +[AVAudioSession sharedInstance];
    uint64_t v4 = kMXSessionProperty_InterruptionStyle;
    long long v5 = +[NSNumber numberWithInt:32];
    id v11 = 0;
    [v3 setMXSessionProperty:v4 value:v5 error:&v11];
    id v6 = v11;

    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v7 = +[AVAudioSession sharedInstance];
    id v10 = v6;
    [v7 setActive:1 error:&v10];
    id v8 = v10;

    if (v8)
    {
      if (dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      id v9 = self;
      objc_sync_enter(v9);
      self->_audioSessionActivated = 1;
      objc_sync_exit(v9);
    }
  }
}

- (void)_audioSessionEnsureStopped
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_audioSessionActivated)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v2 = +[AVAudioSession sharedInstance];
    id v9 = 0;
    [v2 setDuckingFadeOutDuration:0 fadeInDuration:0 error:&v9];
    id v3 = v9;

    if (v3 && dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v4 = +[AVAudioSession sharedInstance];
    id v8 = v3;
    [v4 setActive:0 withOptions:1 error:&v8];
    id v5 = v8;

    if (v5 && dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    obj->_audioSessionActivated = 0;

    objc_sync_exit(obj);
    [(AAConversationDetectSessionManager *)obj setCdSignalAudioInterrupted:0];
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"CdSignalAudioInterruptedChanged" object:obj];
  }
  else
  {
    objc_sync_exit(obj);
  }
}

- (void)_calibrateDuckingLevelForVolumeLevel:(float)a3
{
  LODWORD(v8) = 1051663008;
  LODWORD(v3) = -1088088021;
  LODWORD(v4) = 1052974986;
  *(float *)&double v5 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v8, v3, v4, v5);
  float v10 = v9;
  LODWORD(v11) = 1052069016;
  LODWORD(v12) = -1088373234;
  LODWORD(v13) = 1049629609;
  *(float *)&double v14 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v11, v12, v13, v14);
  float v16 = v15;
  LODWORD(v17) = 1054847323;
  LODWORD(v18) = -1085663714;
  LODWORD(v19) = 1058727893;
  *(float *)&double v20 = a3;
  -[AAConversationDetectSessionManager _duckingLevelForCoefficients:volume:](self, "_duckingLevelForCoefficients:volume:", v17, v18, v19, v20);
  float v22 = v21;
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_cdSignalAudioTunings.startSignalTunables.signalDuckingLevel = v10;
  self->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.latch2SignalTunables.signalDuckingLevel = v16;
  self->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel = v22;
}

- (void)_cdSessionSignalUpdate
{
  double v3 = self->_duckLevel;
  duckLevel = self->_duckLevel;
  self->_duckLevel = 0;

  rampDuration = self->_rampDuration;
  self->_rampDuration = 0;

  id v6 = self;
  objc_sync_enter(v6);
  v6->_shouldQueueRamp = 0;
  objc_sync_exit(v6);

  unduckLevel = v6->_unduckLevel;
  v6->_unduckLevel = 0;

  int v9 = 0;
  uint64_t v10 = 28;
  uint64_t v11 = 24;
  switch(v6->_cdSignal)
  {
    case 1:
      goto LABEL_4;
    case 2:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalRampDurationSecs;
      double v12 = +[NSNumber numberWithFloat:v8];
      double v13 = self->_rampDuration;
      self->_rampDuration = v12;

      *(float *)&double v14 = v6->_cdSignalAudioTunings.latch1SignalTunables.signalDuckingLevel;
      float v15 = +[NSNumber numberWithFloat:v14];
      float v16 = self->_duckLevel;
      self->_duckLevel = v15;

      int v17 = 0;
      int v18 = 0;
      int v9 = 1;
      goto LABEL_22;
    case 3:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalRampDurationSecs;
      id v24 = +[NSNumber numberWithFloat:v8];
      id v25 = self->_rampDuration;
      self->_rampDuration = v24;

      *(float *)&double v26 = v6->_cdSignalAudioTunings.unlatchSignalTunables.signalDuckingLevel;
      uint64_t v27 = +[NSNumber numberWithFloat:v26];
      id v28 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v27;

      id v29 = v6;
      objc_sync_enter(v29);
      v6->_shouldQueueRamp = _os_feature_enabled_impl() ^ 1;
      objc_sync_exit(v29);

      goto LABEL_21;
    case 4:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.end1SignalTunables.signalRampDurationSecs;
      id v30 = +[NSNumber numberWithFloat:v8];
      id v31 = self->_rampDuration;
      self->_rampDuration = v30;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.end1SignalTunables.signalDuckingLevel;
      goto LABEL_17;
    case 5:
      int v9 = 1;
      uint64_t v10 = 44;
      uint64_t v11 = 40;
LABEL_4:
      LODWORD(v8) = *(_DWORD *)((char *)&v6->super.isa + v10);
      double v19 = +[NSNumber numberWithFloat:v8];
      double v20 = self->_rampDuration;
      self->_rampDuration = v19;

      LODWORD(v21) = *(_DWORD *)((char *)&v6->super.isa + v11);
      float v22 = +[NSNumber numberWithFloat:v21];
      id v23 = self->_duckLevel;
      self->_duckLevel = v22;

      if (!v6->_audioSessionActivated)
      {
        if (v6->_prefCDShouldDisableCustomDuckingCurve)
        {
          if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
        else
        {
          v52 = +[AVSystemController sharedInstance];
          [v52 getActiveCategoryVolume:&v6->_currentVolume andName:0];

          if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
          {
            double currentVolume = v6->_currentVolume;
            LogPrintF();
          }
          *(float *)&double v53 = v6->_currentVolume;
          -[AAConversationDetectSessionManager _calibrateDuckingLevelForVolumeLevel:](v6, "_calibrateDuckingLevelForVolumeLevel:", v53, *(void *)&currentVolume);
        }
      }
      int v17 = 0;
      int v18 = 1;
      goto LABEL_22;
    case 6:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.end2SignalTunables.signalRampDurationSecs;
      id v33 = +[NSNumber numberWithFloat:v8];
      id v34 = self->_rampDuration;
      self->_rampDuration = v33;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.end2SignalTunables.signalDuckingLevel;
      goto LABEL_17;
    case 7:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.resetSignalTunables.signalRampDurationSecs;
      id v35 = +[NSNumber numberWithFloat:v8];
      id v36 = self->_rampDuration;
      self->_rampDuration = v35;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.resetSignalTunables.signalDuckingLevel;
      goto LABEL_17;
    case 8:
      *(float *)&double v8 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalRampDurationSecs;
      id v37 = +[NSNumber numberWithFloat:v8];
      id v38 = self->_rampDuration;
      self->_rampDuration = v37;

      *(float *)&double v32 = v6->_cdSignalAudioTunings.pauseSignalTunables.signalDuckingLevel;
LABEL_17:
      uint64_t v39 = +[NSNumber numberWithFloat:v32];
      id v40 = v6->_unduckLevel;
      v6->_unduckLevel = (NSNumber *)v39;
      goto LABEL_18;
    case 9:
      id v40 = self->_rampDuration;
      self->_rampDuration = (NSNumber *)&off_100244048;
LABEL_18:

      int v9 = 0;
      int v18 = 0;
      int v17 = 1;
      goto LABEL_22;
    case 0xA:
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        goto LABEL_11;
      }
      goto LABEL_66;
    case 0xB:
      [(AAConversationDetectSessionManager *)v6 _audioSessionEnsureStopped];
LABEL_21:
      int v17 = 0;
      int v9 = 0;
      int v18 = 0;
LABEL_22:
      int v41 = 0;
      unint64_t currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
      if (currentSpeechDetectionStyle < 2)
      {
        BOOL v43 = 0;
        goto LABEL_35;
      }
      if (currentSpeechDetectionStyle == 3) {
        goto LABEL_33;
      }
      if (currentSpeechDetectionStyle != 2)
      {
        if (dword_100260DD0 <= 30)
        {
          if (dword_100260DD0 == -1)
          {
            if (!_LogCategory_Initialize()) {
              goto LABEL_36;
            }
            unint64_t currentSpeechDetectionStyle = v6->_currentSpeechDetectionStyle;
          }
          if (currentSpeechDetectionStyle > 6) {
            *(double *)&id v44 = COERCE_DOUBLE("?");
          }
          else {
            id v44 = (&off_100232D10)[currentSpeechDetectionStyle];
          }
          double currentVolume = *(double *)&v44;
          LogPrintF();
        }
LABEL_36:
        double v45 = 0.0;
LABEL_37:
        -[AAConversationDetectSessionManager _cdSessionEnsureDeactivated:](v6, "_cdSessionEnsureDeactivated:", 0, *(void *)&currentVolume);
        goto LABEL_67;
      }
      if (v9)
      {
        BOOL v43 = v6->_cdSignal == 5;
        int v41 = 1;
      }
      else
      {
        int v41 = 0;
LABEL_33:
        BOOL v43 = 1;
      }
      if (!(v17 | !v43))
      {
        if (v6->_shouldQueueRamp)
        {
          [(AAConversationDetectSessionManager *)v6 _startQueuedRampForDuration:self->_rampDuration startLevel:v3 endLevel:v6->_unduckLevel];
        }
        else
        {
          if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t cdSignal = v6->_cdSignal;
            if (cdSignal > 0xB) {
              *(double *)&v50 = COERCE_DOUBLE("?");
            }
            else {
              v50 = (&off_100232C88)[cdSignal];
            }
            v61 = v6->_unduckLevel;
            v62 = self->_rampDuration;
            double currentVolume = *(double *)&v50;
            v60 = self->_duckLevel;
            LogPrintF();
          }
          v54 = +[AVAudioSession sharedInstance];
          v55 = self->_rampDuration;
          id v65 = 0;
          [v54 setDuckingFadeOutDuration:v55 fadeInDuration:v55 error:&v65];
          double v45 = COERCE_DOUBLE(v65);

          if (v45 != 0.0) {
            goto LABEL_85;
          }
          v56 = +[AVAudioSession sharedInstance];
          v57 = self->_duckLevel;
          v58 = v6->_unduckLevel;
          id v64 = 0;
          [v56 setDuckToLevelScalar:v57 unduckToLevelScalar:v58 error:&v64];
          double v45 = COERCE_DOUBLE(v64);

          if (v45 != 0.0)
          {
LABEL_85:
            if (dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
            {
              double currentVolume = v45;
              LogPrintF();
            }
            goto LABEL_37;
          }
        }
        goto LABEL_40;
      }
LABEL_35:
      if (v17) {
        goto LABEL_36;
      }
LABEL_40:
      if (v18) {
        [(AAConversationDetectSessionManager *)v6 _cdSessionEnsureActivated:v43];
      }
      if (v41)
      {
        v46 = +[AVAudioSession sharedInstance];
        uint64_t v47 = kMXSessionProperty_InterruptionStyle;
        v48 = +[NSNumber numberWithInt:4];
        id v63 = 0;
        [v46 setMXSessionProperty:v47 value:v48 error:&v63];
        double v45 = COERCE_DOUBLE(v63);

        [(AAConversationDetectSessionManager *)v6 setCdSignalAudioInterrupted:1];
        if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v51 = +[NSNotificationCenter defaultCenter];
        [v51 postNotificationName:@"CdSignalAudioInterruptedChanged" object:v6];
      }
      else
      {
LABEL_66:
        double v45 = 0.0;
      }
LABEL_67:

      return;
    default:
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
LABEL_11:
      }
        LogPrintF();
      goto LABEL_66;
  }
}

- (void)_cdSessionEnsureActivated:(BOOL)a3
{
  if (self->_pauseConversationDetect)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (a3) {
      [(AAConversationDetectSessionManager *)self _audioSessionEnsureStarted];
    }
    [(AAConversationDetectSessionManager *)self _startPedestrianFenceSession];
    [(AAConversationDetectSessionManager *)self _startHeadGestureManager];
  }
}

- (void)_cdSessionEnsureDeactivated:(unsigned __int8)a3
{
  int v3 = a3;
  if (GestaltGetDeviceClass() == 1)
  {
    BOOL v5 = self->_audioSessionActivated && (self->_cdSignal | 2) == 6;
    if (v5 && !self->_prefCDSiriDidAnnounce && !self->_isSiriAnnouncePending)
    {
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      self->_isSiriAnnouncePending = 1;
      [(AAConversationDetectSessionManager *)self _requestSiriAnnounce];
      return;
    }
  }
  else if (dword_100260DD0 <= 10 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(AAConversationDetectSessionManager *)self _audioSessionEnsureStopped];
  [(AAConversationDetectSessionManager *)self _stopPedestrianFenceSession];
  [(AAConversationDetectSessionManager *)self _stopHeadGestureManager];
  if (v3)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    -[AAConversationDetectSessionManager _updateAccessoriesWithResetState:](self, "_updateAccessoriesWithResetState:");
  }
}

- (float)_duckingLevelForCoefficients:(id)a3 volume:(float)a4
{
  return a3.var2 + (float)((float)(a3.var1 * a4) + (float)((float)(a3.var0 * a4) * a4));
}

- (void)_requestSiriAnnounce
{
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_10000BEDC;
  id v38 = sub_10000BEEC;
  id v39 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000BEF4;
  v33[3] = &unk_100232B20;
  v33[4] = self;
  v33[5] = &v34;
  int v3 = objc_retainBlock(v33);
  double v4 = +[NSString stringWithFormat:@"/System/Library/UserNotifications/Bundles/%@.bundle", @"com.apple.BTUserNotifications"];
  BOOL v5 = +[NSBundle bundleWithPath:v4];
  id v6 = +[AFPreferences sharedPreferences];
  unsigned __int8 v7 = [v6 assistantIsEnabled];

  if (v7)
  {
    double v8 = +[AFPreferences sharedPreferences];
    int v9 = [v8 outputVoice];
    uint64_t v10 = [v9 languageCode];

    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      id v30 = v10;
      LogPrintF();
    }
    if (v10)
    {
      id v12 = objc_alloc_init((Class)UNMutableNotificationContent);
      [v12 setCategoryIdentifier:@"BTUserNotifications"];
      double v13 = [v5 localizations];
      id v40 = v10;
      double v14 = +[NSArray arrayWithObjects:&v40 count:1];
      float v15 = +[NSBundle preferredLocalizationsFromArray:v13 forPreferences:v14];

      if ([v15 count])
      {
        float v16 = [v15 firstObject];
        int v17 = [v5 localizedStringForKey:@"CA_FIRST_TRIGGER_TITLE" value:0 table:0 localization:v16];
        [v12 setTitle:v17];

        int v18 = [v15 firstObject];
        double v19 = [v5 localizedStringForKey:@"CA_FIRST_TRIGGER_SUBTITLE" value:0 table:0 localization:v18];
        [v12 setSubtitle:v19];
      }
      double v20 = [v12 title:v30];
      if (!v20
        || ([v12 subtitle],
            double v21 = objc_claimAutoreleasedReturnValue(),
            BOOL v22 = v21 == 0,
            v21,
            v20,
            v22))
      {
        uint64_t v28 = NSErrorF();
        id v24 = (void *)v35[5];
        v35[5] = v28;
      }
      else
      {
        id v23 = +[NSUUID UUID];
        id v24 = [v23 UUIDString];

        id v31 = +[UNNotificationRequest requestWithIdentifier:v24 content:v12 trigger:0];
        id v25 = +[NSDate date];
        double v26 = +[UNNotification notificationWithRequest:v31 date:v25 sourceIdentifier:@"com.apple.BTUserNotifications" intentIdentifiers:&__NSArray0__struct];

        id v27 = [objc_alloc((Class)AFSiriUserNotificationRequest) initWithUserNotification:v26 sourceAppId:@"com.apple.BTUserNotifications" platform:1];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000BFC8;
        v32[3] = &unk_100232B48;
        v32[4] = self;
        [v27 performRequestWithCompletion:v32];
      }
    }
    else
    {
      uint64_t v29 = NSErrorF();
      id v12 = (id)v35[5];
      v35[5] = v29;
    }
  }
  else
  {
    uint64_t v11 = NSErrorF();
    uint64_t v10 = (void *)v35[5];
    v35[5] = v11;
  }

  ((void (*)(void *))v3[2])(v3);
  _Block_object_dispose(&v34, 8);
}

- (void)_asyncAudioSessionDuckWithLevel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  chunkedRampingQueue = self->_chunkedRampingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C18C;
  block[3] = &unk_1002328D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)chunkedRampingQueue, block);
}

- (void)_audioSessionReset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C4B0;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_deregisterFromAudioSessionResetNotifications
{
  if (self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];

    self->_avAudioSessionResetNotificationRegistered = 0;
  }
}

- (void)_deregisterFromAVAudioSessionSpeechDetectionStyleChanges
{
  if (self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v3 = +[AVAudioSession sharedInstance];
    [v3 removeObserver:self forKeyPath:@"speechDetectionStyle"];

    self->_cdStyleChangeNotificationRegistered = 0;
  }
}

- (void)_startQueuedRampForDuration:(id)a3 startLevel:(id)a4 endLevel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10 && ([v9 floatValue], float v13 = v12, objc_msgSend(v11, "floatValue"), v13 < v14))
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v29 = v11;
      id v30 = v8;
      id v28 = v9;
      LogPrintF();
    }
    [v8 floatValue:v28, v29, v30];
    unint64_t v16 = (unint64_t)(v15 / self->_prefCDRampChunkDuration);
    uint64_t v47 = 0;
    v48 = (float *)&v47;
    uint64_t v49 = 0x2020000000;
    float v50 = 0.0;
    [v11 floatValue];
    float v18 = v17;
    [v9 floatValue];
    float v50 = (float)(v18 - v19) / (float)v16;
    uint64_t v43 = 0;
    id v44 = (float *)&v43;
    uint64_t v45 = 0x2020000000;
    float v46 = 0.0;
    [v9 floatValue];
    float v46 = v20 + v48[6];
    float v21 = v44[6];
    [v11 floatValue];
    if (v21 > v22)
    {
      [v11 floatValue];
      *((_DWORD *)v44 + 6) = v23;
    }
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = sub_10000CA30;
    int v41 = sub_10000CA5C;
    id v42 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000CA64;
    v31[3] = &unk_100232B70;
    uint64_t v34 = &v43;
    id v32 = v11;
    id v33 = self;
    id v35 = &v47;
    uint64_t v36 = &v37;
    id v24 = objc_retainBlock(v31);
    id v25 = (void *)v38[5];
    v38[5] = (uint64_t)v24;

    *(float *)&double v26 = v44[6];
    id v27 = +[NSNumber numberWithFloat:v26];
    [(AAConversationDetectSessionManager *)self _asyncAudioSessionDuckWithLevel:v27 completion:v38[5]];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CCA0;
  block[3] = &unk_100232B98;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_registerForAudioSessionResetNotifications
{
  if (!self->_avAudioSessionResetNotificationRegistered)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v3 = +[NSNotificationCenter defaultCenter];
    double v4 = +[AVAudioSession sharedInstance];
    [v3 addObserver:self selector:"_audioSessionReset" name:AVAudioSessionMediaServicesWereResetNotification object:v4];

    self->_avAudioSessionResetNotificationRegistered = 1;
  }
}

- (void)_registerForAVAudioSessionSpeechDetectionStyleChanges
{
  int v3 = +[AVAudioSession sharedInstance];
  id v11 = 0;
  [v3 setCategory:AVAudioSessionCategorySpeechDetection withOptions:2 error:&v11];
  id v4 = v11;

  if (v4 && dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v4;
    LogPrintF();
  }
  if (!self->_cdStyleChangeNotificationRegistered)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v5 = +[AVAudioSession sharedInstance];
    [v5 addObserver:self forKeyPath:@"speechDetectionStyle" options:5 context:0];

    self->_cdStyleChangeNotificationRegistered = 1;
  }
  id v6 = +[AVAudioSession sharedInstance];
  self->_unint64_t currentSpeechDetectionStyle = (unint64_t)[v6 speechDetectionStyle];

  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
    if (currentSpeechDetectionStyle > 6) {
      id v8 = "?";
    }
    else {
      id v8 = (&off_100232D10)[currentSpeechDetectionStyle];
    }
    id v10 = v8;
    LogPrintF();
  }
  if (self->_currentSpeechDetectionStyle == 4) {
    self->_currentPauseReason = 2;
  }
  [(AAConversationDetectSessionManager *)self _updatePauseState];
}

- (void)_speechDetectionStyleChanged:(unint64_t)a3
{
  if (a3 - 5 <= 1)
  {
    -[AAConversationDetectSessionManager _speechDetectionUserVolumeChanged:](self, "_speechDetectionUserVolumeChanged:");
    return;
  }
  unint64_t currentSpeechDetectionStyle = self->_currentSpeechDetectionStyle;
  if (currentSpeechDetectionStyle == a3) {
    return;
  }
  if (dword_100260DD0 <= 30)
  {
    unint64_t v6 = self->_currentSpeechDetectionStyle;
    if (dword_100260DD0 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_17;
      }
      unint64_t v6 = self->_currentSpeechDetectionStyle;
    }
    if (v6 > 6) {
      id v7 = "?";
    }
    else {
      id v7 = (&off_100232D10)[v6];
    }
    if (a3 > 4) {
      id v8 = "?";
    }
    else {
      id v8 = (&off_100232CE8)[a3];
    }
    float v13 = v7;
    id v14 = v8;
    LogPrintF();
  }
LABEL_17:
  self->_unint64_t currentSpeechDetectionStyle = a3;
  unsigned int v9 = [(AAConversationDetectSessionManager *)self cdSignalAudioInterrupted];
  unint64_t v10 = self->_currentSpeechDetectionStyle;
  if (v9 && v10 == 1)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return;
  }
  if (currentSpeechDetectionStyle == 1 && (v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (self->_cdSignal == 11)
    {
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_41;
    }
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = self;
    uint64_t v12 = 1;
  }
  else
  {
    id v11 = self;
    uint64_t v12 = 0;
  }
  [(AAConversationDetectSessionManager *)v11 _cdSessionEnsureDeactivated:v12];
LABEL_41:
  if (self->_currentSpeechDetectionStyle == 4) {
    self->_currentPauseReason = 2;
  }

  [(AAConversationDetectSessionManager *)self _updatePauseState];
}

- (void)_speechDetectionUserVolumeChanged:(unint64_t)a3
{
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a3 == 5 && self->_audioSessionActivated && !self->_cdSignalAudioInterrupted)
  {
    [(AAConversationDetectSessionManager *)self _cdSessionEnsureDeactivated:2];
  }
}

- (void)_deviceFound:(id)a3
{
  id v10 = a3;
  id v4 = [v10 identifier];
  if (!v4)
  {
    if (dword_100260DD0 > 90 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
LABEL_27:
    LogPrintF();
    goto LABEL_19;
  }
  if ([v10 conversationDetectCapability] != 1)
  {
    if (dword_100260DD0 > 10 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  BOOL v5 = [(NSMutableDictionary *)self->_cdSupportedAccessories objectForKeyedSubscript:v4];
  cdSupportedAccessories = self->_cdSupportedAccessories;
  if (!cdSupportedAccessories)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v8 = self->_cdSupportedAccessories;
    self->_cdSupportedAccessories = v7;

    cdSupportedAccessories = self->_cdSupportedAccessories;
  }
  if (![(NSMutableDictionary *)cdSupportedAccessories count]) {
    [(AAConversationDetectSessionManager *)self _activateCDSession];
  }
  [(NSMutableDictionary *)self->_cdSupportedAccessories setObject:v10 forKeyedSubscript:v4];
  if (v5)
  {
    if (dword_100260DD0 <= 10 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    [(AAConversationDetectSessionManager *)self _updatePauseState];
  }
  else
  {
    [(AAConversationDetectSessionManager *)self _updatePauseState];
  }

LABEL_19:
}

- (void)_deviceLost:(id)a3
{
  id v7 = a3;
  id v4 = [v7 identifier];
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_cdSupportedAccessories objectForKeyedSubscript:v4];
    if (v5)
    {
      [(NSMutableDictionary *)self->_cdSupportedAccessories setObject:0 forKeyedSubscript:v4];
      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
      {
        id v6 = v7;
        LogPrintF();
      }
      if (![(NSMutableDictionary *)self->_cdSupportedAccessories count]) {
        [(AAConversationDetectSessionManager *)self _invalidateCDSession];
      }
    }
  }
  else if (dword_100260DD0 <= 90 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_setPedestrianFenceWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  pedestrianFenceManager = self->_pedestrianFenceManager;
  if (pedestrianFenceManager)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000D7EC;
    v9[3] = &unk_100232BC0;
    v9[4] = pedestrianFenceManager;
    v9[5] = self;
    id v10 = v4;
    id v7 = pedestrianFenceManager;
    LODWORD(v8) = 4.0;
    [(CMPedestrianFenceManager *)v7 setFence:@"com.apple.audioaccessoryd.cdFence" withRadius:v9 withCompletion:v8];
  }
}

- (void)_startPedestrianFenceSession
{
  if ((+[CMPedestrianFenceManager isAvailable] & 1) == 0
    || GestaltGetDeviceClass() != 1)
  {
    if (dword_100260DD0 > 10 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_9;
  }
  if (self->_pedestrianFenceManager)
  {
    if (dword_100260DD0 > 10 || dword_100260DD0 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_9:
    LogPrintF();
    return;
  }
  int v3 = (CMPedestrianFenceManager *)objc_alloc_init((Class)CMPedestrianFenceManager);
  pedestrianFenceManager = self->_pedestrianFenceManager;
  self->_pedestrianFenceManager = v3;

  [(CMPedestrianFenceManager *)self->_pedestrianFenceManager startSession];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DABC;
  v7[3] = &unk_100232BE8;
  void v7[4] = self;
  BOOL v5 = objc_retainBlock(v7);
  if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = 0x4010000000000000;
    LogPrintF();
  }
  -[AAConversationDetectSessionManager _setPedestrianFenceWithHandler:](self, "_setPedestrianFenceWithHandler:", v5, v6);
}

- (void)_stopPedestrianFenceSession
{
  if (self->_pedestrianFenceManager)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CMPedestrianFenceManager *)self->_pedestrianFenceManager clearFence:@"com.apple.audioaccessoryd.cdFence"];
    [(CMPedestrianFenceManager *)self->_pedestrianFenceManager endSession];
    pedestrianFenceManager = self->_pedestrianFenceManager;
    self->_pedestrianFenceManager = 0;
  }
}

- (void)_startHeadGestureManager
{
  if (_os_feature_enabled_impl())
  {
    if (self->_headGestureManager)
    {
      if (dword_100260DD0 <= 10 && (dword_100260DD0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      id v9 = objc_alloc_init((Class)HGConfiguration);
      id v3 = objc_alloc_init((Class)HGAudioFeedbackConfiguration);
      [v9 setAudioFeedbackConfig:v3];

      id v4 = +[AVAudioSession sharedInstance];
      id v5 = [v4 opaqueSessionID];
      uint64_t v6 = [v9 audioFeedbackConfig];
      [v6 setAudioSessionID:v5];

      id v7 = (HGManager *)[objc_alloc((Class)HGManager) initWithDelegate:self config:v9];
      headGestureManager = self->_headGestureManager;
      self->_headGestureManager = v7;

      if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(HGManager *)self->_headGestureManager start];
    }
  }
}

- (void)_stopHeadGestureManager
{
  if (self->_headGestureManager)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(HGManager *)self->_headGestureManager stop];
    headGestureManager = self->_headGestureManager;
    self->_headGestureManager = 0;
  }
}

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DF98;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E100;
  block[3] = &unk_100232C08;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_registerForWirelessSplitterStateChanges
{
  p_splitterStateOnToken = &self->_splitterStateOnToken;
  if (self->_splitterStateOnToken == -1)
  {
    if (dword_100260DD0 <= 30 && (dword_100260DD0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000E280;
    handler[3] = &unk_1002329C0;
    handler[4] = self;
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", p_splitterStateOnToken, (dispatch_queue_t)dispatchQueue, handler);
  }
}

- (void)_deregisterFromWirelessSplitterStateChanges
{
  int splitterStateOnToken = self->_splitterStateOnToken;
  if (splitterStateOnToken != -1)
  {
    if (dword_100260DD0 > 30) {
      goto LABEL_7;
    }
    if (dword_100260DD0 != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int splitterStateOnToken = self->_splitterStateOnToken;
    if (splitterStateOnToken != -1)
    {
LABEL_7:
      notify_cancel(splitterStateOnToken);
      self->_int splitterStateOnToken = -1;
    }
  }
  self->_BOOL isWirelessSplitterOn = 0;

  [(AAConversationDetectSessionManager *)self _updatePauseState];
}

- (BOOL)cdSignalAudioInterrupted
{
  return self->_cdSignalAudioInterrupted;
}

- (NSString)currentCDDeviceIdentifier
{
  return self->_currentCDDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCDDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_unduckLevel, 0);
  objc_storeStrong((id *)&self->_rampDuration, 0);
  objc_storeStrong((id *)&self->_pedestrianFenceManager, 0);
  objc_storeStrong((id *)&self->_headGestureManager, 0);
  objc_storeStrong((id *)&self->_duckLevel, 0);
  objc_storeStrong((id *)&self->_chunkedRampingQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentCDSupportedAccessory, 0);
  objc_storeStrong((id *)&self->_connectedDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_cdSupportedAccessories, 0);

  objc_storeStrong((id *)&self->_aaController, 0);
}

@end