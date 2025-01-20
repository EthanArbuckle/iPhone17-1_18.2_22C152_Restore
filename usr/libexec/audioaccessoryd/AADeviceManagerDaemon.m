@interface AADeviceManagerDaemon
+ (id)sharedAADeviceManagerDaemon;
- (AADeviceManagerDaemon)init;
- (BOOL)_accessoryDevicePerformActionsOnChange:(id)a3;
- (BOOL)_getBoolPreferencesForKey:(id)a3;
- (BOOL)_onlyMuteAudioFeedbackFlagChanged:(unsigned int)a3;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getCurrentAudioOwner;
- (id)availableDevices;
- (id)descriptionWithLevel:(int)a3;
- (void)_aaControllerEnsureStarted;
- (void)_aaControllerEnsureStopped;
- (void)_aaDeviceRecordsRemovedWithRecords:(id)a3;
- (void)_aaDeviceRecordsUpdatedWithRecords:(id)a3;
- (void)_accessoryDeviceFound:(id)a3 withChange:(BOOL)a4;
- (void)_accessoryDeviceInfoChanged:(id)a3;
- (void)_accessoryDeviceRemoveOffListeningModeIfNeeded:(id)a3;
- (void)_accessoryDeviceUpdateCloudRecord:(id)a3 config:(id)a4;
- (void)_activate;
- (void)_cbControllerEnsureStarted;
- (void)_cbControllerEnsureStopped;
- (void)_cbDiscoveryEnsureStarted;
- (void)_cbDiscoveryEnsureStopped;
- (void)_cloudSyncEnsureStarted;
- (void)_cloudSyncEnsureStopped;
- (void)_coreBluetoothDeviceFound:(id)a3;
- (void)_coreBluetoothDeviceLost:(id)a3;
- (void)_handleAssistantLanguageChanged:(id)a3;
- (void)_invalidate;
- (void)_languageChangeMonitoringEnsureStarted;
- (void)_languageChangeMonitoringEnsureStopped;
- (void)_loadDeviceRecordForDevice:(id)a3;
- (void)_runHeadGestureDetection:(unsigned int)a3;
- (void)_saveDeviceRecordForDevice:(id)a3;
- (void)_sendCloudConfigsToDevice:(id)a3;
- (void)_sendConfigOverAAController:(id)a3 device:(id)a4 completion:(id)a5;
- (void)_sendConfigOverCBController:(id)a3 device:(id)a4 completion:(id)a5;
- (void)_sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)_sendSiriMultitoneConfigToDevice:(id)a3;
- (void)_setHRTFAssetDownloadOTA;
- (void)_setPreferencesForKey:(id)a3 withBoolValue:(BOOL)a4;
- (void)aaDeviceRecordsRemovedWithRecords:(id)a3;
- (void)aaDeviceRecordsUpdatedWithRecords:(id)a3;
- (void)activate;
- (void)didDetectedWithHeadGesture:(id)a3;
- (void)didStartStreamingWithIsStreaming:(BOOL)a3;
- (void)downloadHRTFAsset;
- (void)invalidate;
- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)smartRoutingStateUpdated:(unsigned int)a3 ForDeviceIdentifier:(id)a4;
- (void)startHeadGestureManagerWithFlags:(unsigned int)a3;
- (void)stopHeadGestureManager;
@end

@implementation AADeviceManagerDaemon

+ (id)sharedAADeviceManagerDaemon
{
  if (qword_100263E68 != -1) {
    dispatch_once(&qword_100263E68, &stru_100232D48);
  }
  v2 = (void *)qword_100263E60;

  return v2;
}

- (AADeviceManagerDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)AADeviceManagerDaemon;
  v2 = [(AADeviceManagerDaemon *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AADeviceManagerDaemon", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_hRTFDownloadOTATriggered = [(AADeviceManagerDaemon *)v2 _getBoolPreferencesForKey:@"HRTFDownloadOTATriggered"];
    v2->_prefsChangedNotifyToken = -1;
    v6 = v2;
  }

  return v2;
}

- (NSString)description
{
  return (NSString *)[(AADeviceManagerDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10000F2C8;
  v26 = sub_10000F2D8;
  id v27 = 0;
  uint64_t v21 = 0;
  NSAppendPrintF_safe();
  objc_storeStrong(&v27, 0);
  dispatch_queue_t v4 = self->_cloudSyncDeviceManager;
  if (v4)
  {
    v5 = v23;
    id obj = v23[5];
    NSAppendPrintF();
    objc_storeStrong(v5 + 5, obj);
  }

  v6 = v23;
  id v19 = v23[5];
  id v13 = [(NSMutableDictionary *)self->_devicesMap count];
  bluetoothDeviceDiscovery = self->_bluetoothDeviceDiscovery;
  NSAppendPrintF();
  objc_storeStrong(v6 + 5, v19);
  devicesMap = self->_devicesMap;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F2E0;
  v18[3] = &unk_100232D70;
  v18[4] = &v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devicesMap, "enumerateKeysAndObjectsUsingBlock:", v18, v13, bluetoothDeviceDiscovery);
  objc_super v8 = v23;
  id v17 = v23[5];
  NSAppendPrintF();
  objc_storeStrong(v8 + 5, v17);
  if (self->_hRTFDownloadOTATriggered)
  {
    v9 = v23;
    id v16 = v23[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v9 + 5, v16);
  }
  v10 = v23;
  id v15 = v23[5];
  NSAppendPrintF();
  objc_storeStrong(v10 + 5, v15);
  id v11 = v23[5];
  _Block_object_dispose(&v22, 8);

  return v11;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F3A4;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F420;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(AADeviceManagerDaemon *)self _aaControllerEnsureStopped];
  [(AADeviceManagerDaemon *)self _cbDiscoveryEnsureStopped];
  [(AADeviceManagerDaemon *)self _cbControllerEnsureStopped];
  [(AADeviceManagerDaemon *)self _cloudSyncEnsureStopped];
  [(AADeviceManagerDaemon *)self _languageChangeMonitoringEnsureStopped];
  [(AADeviceManagerDaemon *)self stopHeadGestureManager];
  self->_activateCalled = 0;
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_prefsChangedNotifyToken == -1)
    {
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000F5F0;
      handler[3] = &unk_1002329C0;
      handler[4] = self;
      notify_register_dispatch("com.apple.AudioAccessory.prefsChanged", &self->_prefsChangedNotifyToken, (dispatch_queue_t)dispatchQueue, handler);
    }
    [(AADeviceManagerDaemon *)self _prefsChanged];
    [(AADeviceManagerDaemon *)self _aaControllerEnsureStarted];
    [(AADeviceManagerDaemon *)self _cbDiscoveryEnsureStarted];
    [(AADeviceManagerDaemon *)self _cbControllerEnsureStarted];
    [(AADeviceManagerDaemon *)self _cloudSyncEnsureStarted];
    [(AADeviceManagerDaemon *)self _languageChangeMonitoringEnsureStarted];
  }
}

- (void)_aaControllerEnsureStarted
{
  p_aaController = &self->_aaController;
  dispatch_queue_t v4 = self->_aaController;
  if (!v4)
  {
    v5 = objc_alloc_init(AAController);
    [(AAController *)v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_aaController, v5);
    [(AAController *)v5 setInvalidationHandler:&stru_100232D90];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F870;
    v9[3] = &unk_100232838;
    v9[4] = self;
    [(AAController *)v5 setDeviceInfoChangeHandler:v9];
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000F87C;
    v6[3] = &unk_100232A38;
    dispatch_queue_t v4 = v5;
    v7 = v4;
    objc_super v8 = self;
    [(AAController *)v4 activateWithCompletion:v6];
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

- (void)_sendConfigOverAAController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 needsUpdateToAAController])
  {
    id v11 = objc_alloc_init(AudioAccessoryDeviceConfig);
    -[AudioAccessoryDeviceConfig setAutoANCStrength:](v11, "setAutoANCStrength:", [v8 autoANCStrength]);
    -[AudioAccessoryDeviceConfig setEnableSiriMultitone:](v11, "setEnableSiriMultitone:", [v8 enableSiriMultitone]);
    if (_os_feature_enabled_impl())
    {
      -[AudioAccessoryDeviceConfig setEnableHearingAidGainSwipe:](v11, "setEnableHearingAidGainSwipe:", [v8 enableHearingAidGainSwipe]);
      -[AudioAccessoryDeviceConfig setHearingAidToggle:](v11, "setHearingAidToggle:", [v8 hearingAidToggle]);
      -[AudioAccessoryDeviceConfig setHearingAidEnrolled:](v11, "setHearingAidEnrolled:", [v8 hearingAidEnrolled]);
      -[AudioAccessoryDeviceConfig setEnableHearingAssist:](v11, "setEnableHearingAssist:", [v8 enableHearingAssist]);
      -[AudioAccessoryDeviceConfig setAllowOffListeningMode:](v11, "setAllowOffListeningMode:", [v8 listeningModeOffAllowed]);
    }
    -[AudioAccessoryDeviceConfig setEnableHeartRateMonitor:](v11, "setEnableHeartRateMonitor:", [v8 enableHeartRateMonitor]);
    [(AADeviceManagerDaemon *)self _aaControllerEnsureStarted];
    aaController = self->_aaController;
    id v13 = [(AudioAccessoryDeviceConfig *)v11 xpcObjectRepresentation];
    v14 = [v9 identifier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000FC58;
    v16[3] = &unk_100232AA8;
    id v17 = v9;
    v18 = v11;
    id v19 = v10;
    id v15 = v11;
    [(AAController *)aaController sendDeviceConfig:v13 destinationIdentifier:v14 completionHandler:v16];
  }
  else
  {
    if (dword_100260EA0 <= 10 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)_accessoryDeviceFound:(id)a3 withChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v6 = [v10 bluetoothAddress];
  if (v6)
  {
    v7 = [v10 identifier];
    if (v7)
    {
      if (v4)
      {
        if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
        {
          id v9 = v10;
          LogPrintF();
        }
        -[AADeviceManagerDaemon _loadDeviceRecordForDevice:](self, "_loadDeviceRecordForDevice:", v10, v9);
        if ([(AADeviceManagerDaemon *)self _accessoryDevicePerformActionsOnChange:v10])
        {
          [(AADeviceManagerDaemon *)self _saveDeviceRecordForDevice:v10];
          [(AADeviceManagerDaemon *)self _sendCloudConfigsToDevice:v10];
        }
      }
      id v8 = +[AAServicesDaemon sharedAAServicesDaemon];
      [v8 reportDeviceFound:v10];
    }
    else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_accessoryDeviceInfoChanged:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  v5 = [[AudioAccessoryDeviceInfo alloc] initWithXPCObject:v4 error:&v13];

  id v6 = v13;
  if (!v6)
  {
    v7 = [(AudioAccessoryDeviceInfo *)v5 identifier];
    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_devicesMap objectForKeyedSubscript:v7];
      if (!v8)
      {
        if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
        {
          v12 = v7;
          LogPrintF();
        }
        id v8 = [objc_alloc((Class)AudioAccessoryDevice) initWithIdentifier:v7];
        devicesMap = self->_devicesMap;
        if (!devicesMap)
        {
          id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v11 = self->_devicesMap;
          self->_devicesMap = v10;

          devicesMap = self->_devicesMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](devicesMap, "setObject:forKeyedSubscript:", v8, v7, v12);
      }
      -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:](self, "_accessoryDeviceFound:withChange:", v8, [v8 updateWithAADeviceInfo:v5]);

      goto LABEL_12;
    }
    if (dword_100260EA0 > 90 || dword_100260EA0 == -1 && !_LogCategory_Initialize())
    {
LABEL_12:

      goto LABEL_13;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_12;
  }
  if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    v7 = CUPrintNSError();
    goto LABEL_19;
  }
LABEL_13:
}

- (BOOL)_accessoryDevicePerformActionsOnChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 setDefaultConfigurationsIfNeeded];
  if (v5 && dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v4;
    LogPrintF();
  }
  -[AADeviceManagerDaemon _sendSiriMultitoneConfigToDevice:](self, "_sendSiriMultitoneConfigToDevice:", v4, v11);
  if (_os_feature_enabled_impl())
  {
    id v6 = [v4 coreBluetoothDevice];
    if (([v6 deviceFlags] & 0x800000) != 0)
    {
      BOOL hRTFDownloadOTATriggered = self->_hRTFDownloadOTATriggered;

      if (!hRTFDownloadOTATriggered) {
        [(AADeviceManagerDaemon *)self downloadHRTFAsset];
      }
    }
    else
    {
    }
  }
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl()) {
    [(AADeviceManagerDaemon *)self _accessoryDeviceRemoveOffListeningModeIfNeeded:v4];
  }
  id v8 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  id v9 = [v4 bluetoothAddress];
  [v8 getSmartRoutingStateForDeviceAddress:v9];

  return v5;
}

- (void)_accessoryDeviceUpdateCloudRecord:(id)a3 config:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 headGestureToggle]) {
    [v11 setHeadGestureToggle:[v6 headGestureToggle]];
  }
  if ([v6 acceptReplyPlayPauseConfig]) {
    [v11 setAcceptReplyPlayPauseConfig:[v6 acceptReplyPlayPauseConfig]];
  }
  if ([v6 declineDismissSkipConfig]) {
    [v11 setDeclineDismissSkipConfig:[v6 declineDismissSkipConfig]];
  }
  if (_os_feature_enabled_impl())
  {
    v7 = [v6 audiogramEnrolledTimestamp];

    if (v7)
    {
      id v8 = [v6 audiogramEnrolledTimestamp];
      [v11 setAudiogramEnrolledTimestamp:v8];
    }
  }
  if (_os_feature_enabled_impl()
    && _os_feature_enabled_impl()
    && [v6 listeningModeOffAllowed])
  {
    [v11 setListeningModeOffAllowed:[v6 listeningModeOffAllowed]];
    [(AADeviceManagerDaemon *)self _accessoryDeviceRemoveOffListeningModeIfNeeded:v11];
  }
  [(AADeviceManagerDaemon *)self _saveDeviceRecordForDevice:v11];
  if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v11;
    LogPrintF();
  }
  id v9 = +[AAServicesDaemon sharedAAServicesDaemon];
  [v9 reportDeviceFound:v11];
}

- (id)availableDevices
{
  id v2 = [(NSMutableDictionary *)self->_devicesMap copy];

  return v2;
}

- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000105FC;
  v15[3] = &unk_1002328B0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);
}

- (void)_sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_devicesMap objectForKeyedSubscript:v11];
    if (v12)
    {
      if ([v8 needsUpdateToDeviceCloudRecord]) {
        [(AADeviceManagerDaemon *)self _accessoryDeviceUpdateCloudRecord:v12 config:v8];
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001088C;
      v16[3] = &unk_100232DB8;
      id v19 = v10;
      void v16[4] = self;
      id v17 = v8;
      id v18 = v12;
      [(AADeviceManagerDaemon *)self _sendConfigOverCBController:v17 device:v12 completion:v16];

      id v13 = 0;
    }
    else
    {
      id v13 = NSErrorF();
      if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
      {
        id v15 = CUPrintNSError();
        LogPrintF();
      }
      if (v10) {
        (*((void (**)(id, void *))v10 + 2))(v10, v13);
      }
    }
  }
  else
  {
    id v13 = NSErrorF();
    if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      id v14 = CUPrintNSError();
      LogPrintF();
    }
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)_cbControllerEnsureStarted
{
  p_bluetoothController = &self->_bluetoothController;
  id v4 = self->_bluetoothController;
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)CBController);
    [v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_bluetoothController, v5);
    [v5 setInvalidationHandler:&stru_100232DD8];
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010AA4;
    v6[3] = &unk_100232A38;
    id v4 = (CBController *)v5;
    v7 = v4;
    id v8 = self;
    [(CBController *)v4 activateWithCompletion:v6];
  }
}

- (void)_cbControllerEnsureStopped
{
  bluetoothController = self->_bluetoothController;
  if (bluetoothController)
  {
    [(CBController *)bluetoothController invalidate];
    id v4 = self->_bluetoothController;
    self->_bluetoothController = 0;
  }
}

- (void)_cbDiscoveryEnsureStarted
{
  p_bluetoothDeviceDiscovery = &self->_bluetoothDeviceDiscovery;
  id v4 = self->_bluetoothDeviceDiscovery;
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)CBDiscovery);
    [v5 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)p_bluetoothDeviceDiscovery, v5);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100010E50;
    v19[3] = &unk_1002329E8;
    id v6 = v5;
    id v20 = v6;
    uint64_t v21 = self;
    [v6 setDeviceFoundHandler:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100010E6C;
    v16[3] = &unk_1002329E8;
    id v7 = v6;
    id v17 = v7;
    id v18 = self;
    [v7 setDeviceLostHandler:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010E88;
    v13[3] = &unk_100232A10;
    id v8 = v7;
    id v14 = v8;
    id v15 = self;
    [v8 setInterruptionHandler:v13];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100010F20;
    v12[3] = &unk_100232710;
    v12[4] = self;
    [v8 setInvalidationHandler:v12];
    [v8 setDiscoveryFlags:[v8 discoveryFlags] | 0x80000200000];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010FA4;
    v9[3] = &unk_100232A38;
    id v4 = (CBDiscovery *)v8;
    id v10 = v4;
    id v11 = self;
    [(CBDiscovery *)v4 activateWithCompletion:v9];
  }
}

- (void)_cbDiscoveryEnsureStopped
{
  bluetoothDeviceDiscovery = self->_bluetoothDeviceDiscovery;
  if (bluetoothDeviceDiscovery)
  {
    [(CBDiscovery *)bluetoothDeviceDiscovery invalidate];
    id v4 = self->_bluetoothDeviceDiscovery;
    self->_bluetoothDeviceDiscovery = 0;
  }
}

- (void)_coreBluetoothDeviceFound:(id)a3
{
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v14 identifier];
  if (v4)
  {
    if ([v14 vendorID] == 76)
    {
      unsigned int v5 = [v14 productID] - 8194;
      if (v5 <= 0x24 && ((1 << v5) & 0x1C7BB7FF9BLL) != 0)
      {
        id v6 = [(NSMutableDictionary *)self->_devicesMap objectForKeyedSubscript:v4];
        if (v6)
        {
          id v7 = v6;
          id v8 = [v6 coreBluetoothDevice];

          id v9 = [v7 updateWithCBDevice:v14];
          if (v8 || dword_100260EA0 > 30 || dword_100260EA0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_19;
          }
          id v13 = v7;
        }
        else
        {
          id v7 = [objc_alloc((Class)AudioAccessoryDevice) initWithIdentifier:v4];
          devicesMap = self->_devicesMap;
          if (!devicesMap)
          {
            id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            id v12 = self->_devicesMap;
            self->_devicesMap = v11;

            devicesMap = self->_devicesMap;
          }
          [(NSMutableDictionary *)devicesMap setObject:v7 forKeyedSubscript:v4];
          id v9 = [v7 updateWithCBDevice:v14];
          if (dword_100260EA0 > 30 || dword_100260EA0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_19;
          }
          id v13 = v7;
        }
        LogPrintF();
LABEL_19:
        -[AADeviceManagerDaemon _accessoryDeviceFound:withChange:](self, "_accessoryDeviceFound:withChange:", v7, v9, v13);
      }
    }
  }
  else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_coreBluetoothDeviceLost:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = [v8 identifier];
  if (v4)
  {
    unsigned int v5 = [(NSMutableDictionary *)self->_devicesMap objectForKeyedSubscript:v4];
    if (v5)
    {
      if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
      {
        id v7 = v5;
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devicesMap, "setObject:forKeyedSubscript:", 0, v4, v7);
      id v6 = +[AAServicesDaemon sharedAAServicesDaemon];
      [v6 reportDeviceLost:v5];
    }
  }
  else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)_getCurrentAudioOwner
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10000F2C8;
  id v10 = sub_10000F2D8;
  id v11 = 0;
  devicesMap = self->_devicesMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011600;
  v5[3] = &unk_100232D70;
  v5[4] = &v6;
  [(NSMutableDictionary *)devicesMap enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_sendConfigOverCBController:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 coreBluetoothDevice];
  if (!v11)
  {
    id v11 = objc_alloc_init((Class)CBDevice);
    id v12 = [v8 identifier];
    [v11 setIdentifier:v12];
  }
  id v13 = objc_alloc_init((Class)CBDeviceSettings);
  [v13 setAclPriority:[v10 aclPriority]];
  [v13 setAdaptiveVolumeConfig:[v10 adaptiveVolumeConfig]];
  [v13 setAllowsAutoRoute:[v10 allowsAutoRoute]];
  [v13 setAudioRouteHidden:[v10 audioRouteHidden]];
  [v13 setClickHoldModeLeft:[v10 clickHoldModeLeft]];
  [v13 setClickHoldModeRight:[v10 clickHoldModeRight]];
  [v13 setConversationDetectConfig:[v10 conversationDetectConfig]];
  [v13 setCrownRotationDirection:[v10 crownRotationDirection]];
  [v13 setDoubleTapActionLeft:[v10 doubleTapActionLeft]];
  [v13 setDoubleTapActionRight:[v10 doubleTapActionRight]];
  [v13 setEndCallConfig:[v10 endCallConfig]];
  [v13 setListeningMode:[v10 listeningMode]];
  [v13 setListeningModeConfigs:[v10 listeningModeConfigs]];
  [v13 setMicrophoneMode:[v10 microphoneMode]];
  [v13 setMuteControlConfig:[v10 muteControlConfig]];
  id v14 = [v10 name];
  [v13 setName:v14];

  [v13 setPlacementMode:[v10 placementMode]];
  [v13 setRelinquishAudioRoute:[v10 relinquishAudioRoute]];
  [v13 setSelectiveSpeechListeningConfig:[v10 selectiveSpeechListeningConfig]];
  [v13 setSmartRoutingMode:[v10 smartRoutingMode]];
  [v13 setSpatialAudioAllowed:[v10 spatialAudioAllowed]];
  id v15 = [v10 spatialAudioMode];

  [v13 setSpatialAudioMode:v15];
  bluetoothController = self->_bluetoothController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100011994;
  v18[3] = &unk_100232698;
  v18[4] = v13;
  id v19 = v9;
  id v17 = v9;
  [(CBController *)bluetoothController modifyDevice:v11 settings:v13 completion:v18];
}

- (void)aaDeviceRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011AF0;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_aaDeviceRecordsRemovedWithRecords:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011C34;
    v6[3] = &unk_100232E00;
    id v7 = v4;
    [(NSMutableDictionary *)devicesMap enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (void)aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011EF8;
  v7[3] = &unk_100232A10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_aaDeviceRecordsUpdatedWithRecords:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    devicesMap = self->_devicesMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011FB4;
    v6[3] = &unk_100232E00;
    id v7 = v4;
    [(NSMutableDictionary *)devicesMap enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (void)_cloudSyncEnsureStarted
{
  if (_os_feature_enabled_impl() && !self->_cloudSyncDeviceManager)
  {
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = +[DeviceManager singleton];
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = v3;

    unsigned int v5 = self->_cloudSyncDeviceManager;
    [(DeviceManager *)v5 setAaDeviceDelegate:self];
  }
}

- (void)_cloudSyncEnsureStopped
{
  if (self->_cloudSyncDeviceManager)
  {
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [self->_cloudSyncDeviceManager setAaDeviceDelegate:0];
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    self->_cloudSyncDeviceManager = 0;
  }
}

- (void)_loadDeviceRecordForDevice:(id)a3
{
  id v10 = a3;
  uint64_t v4 = _os_feature_enabled_impl();
  id v5 = v10;
  if (v4)
  {
    cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
    id v7 = [v10 bluetoothAddress];
    id v8 = [cloudSyncDeviceManager fetchAADeviceRecordSyncWithAddress:v7];

    if (v8)
    {
      if ([v10 updateWithAADeviceRecord:v8]) {
        [(AADeviceManagerDaemon *)self _sendCloudConfigsToDevice:v10];
      }
    }
    else if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      id v9 = [v10 bluetoothAddress];
      LogPrintF();
    }
    id v5 = v10;
  }

  _objc_release_x1(v4, v5);
}

- (void)_saveDeviceRecordForDevice:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v10 = 0;
    id v5 = [[_TtC15audioaccessoryd14AADeviceRecord alloc] initWithDevice:v4 error:&v10];
    id v6 = v10;
    if (v5)
    {
      cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100012600;
      v8[3] = &unk_100232A38;
      v8[4] = self;
      id v9 = v5;
      [cloudSyncDeviceManager updateAADeviceRecordWithRecord:v9 completion:v8];
    }
    else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sendCloudConfigsToDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AADeviceConfig);
  [v5 setListeningModeOffAllowed:[v4 listeningModeOffAllowed]];
  [(AADeviceManagerDaemon *)self _sendConfigOverAAController:v5 device:v4 completion:0];
}

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012864;
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
  block[2] = sub_100012A70;
  block[3] = &unk_100232C08;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)_onlyMuteAudioFeedbackFlagChanged:(unsigned int)a3
{
  unsigned int headGestureUpdateFlags = self->_headGestureUpdateFlags;
  if (((headGestureUpdateFlags ^ a3) & 3) != 0
    || ((a3 >> 2) & 1) == ((headGestureUpdateFlags >> 2) & 1))
  {
    return 0;
  }
  if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 1;
}

- (void)_runHeadGestureDetection:(unsigned int)a3
{
  unsigned int v5 = -[AADeviceManagerDaemon _onlyMuteAudioFeedbackFlagChanged:](self, "_onlyMuteAudioFeedbackFlagChanged:");
  self->_unsigned int headGestureUpdateFlags = a3;
  if (v5 && (id v6 = self->_headGestureManager) != 0)
  {
    [(HGManager *)v6 setMuteAudioFeedback:(a3 >> 2) & 1];
  }
  else
  {
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v7 = @"YES";
      if ((a3 & 3) == 0) {
        CFStringRef v7 = @"NO";
      }
      CFStringRef v12 = v7;
      LogPrintF();
    }
    if ((a3 & 3) != 0)
    {
      if (self->_headGestureManager) {
        [(AADeviceManagerDaemon *)self stopHeadGestureManager];
      }
      id v13 = objc_alloc_init((Class)HGConfiguration);
      if (a3)
      {
        id v8 = objc_alloc_init((Class)HGAudioFeedbackConfiguration);
        [v13 setAudioFeedbackConfig:v8];

        [v13 setRequestPartGestures:1];
      }
      if ((a3 & 2) != 0)
      {
        id v9 = [v13 audioFeedbackConfig];
        [v9 setEnableAudioFeedback:1];
      }
      id v10 = (HGManager *)[objc_alloc((Class)HGManager) initWithDelegate:self config:v13];
      headGestureManager = self->_headGestureManager;
      self->_headGestureManager = v10;

      if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(HGManager *)self->_headGestureManager start];
      [(HGManager *)self->_headGestureManager setMuteAudioFeedback:(a3 >> 2) & 1];
    }
    else
    {
      [(AADeviceManagerDaemon *)self stopHeadGestureManager];
    }
  }
}

- (void)startHeadGestureManagerWithFlags:(unsigned int)a3
{
  if (self->_headGestureUpdateFlags == a3)
  {
    if (dword_100260EA0 <= 10 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    -[AADeviceManagerDaemon _runHeadGestureDetection:](self, "_runHeadGestureDetection:");
  }
}

- (void)stopHeadGestureManager
{
  if (self->_headGestureManager)
  {
    if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(HGManager *)self->_headGestureManager stop];
    headGestureManager = self->_headGestureManager;
    self->_headGestureManager = 0;

    self->_unsigned int headGestureUpdateFlags = 0;
  }
}

- (void)_accessoryDeviceRemoveOffListeningModeIfNeeded:(id)a3
{
  id v10 = a3;
  if ([v10 listeningModeOffAllowed] == 2)
  {
    id v4 = objc_alloc_init((Class)AADeviceConfig);
    if ([v10 listeningMode] == 1)
    {
      [v4 setListeningMode:3];
      unsigned int v5 = [v10 listeningModeConfigs];
      if ((v5 & 1) == 0)
      {
LABEL_10:
        if (dword_100260EA0 <= 30 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
        {
          id v8 = [v10 identifier];
          id v9 = v4;
          LogPrintF();
        }
        CFStringRef v7 = [v10 identifier:v8, v9];
        [(AADeviceManagerDaemon *)self _sendDeviceConfig:v4 identifier:v7 completion:0];

        goto LABEL_15;
      }
    }
    else
    {
      unsigned int v5 = [v10 listeningModeConfigs];
      if ((v5 & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    if ((v5 & 0xA) != 0) {
      int v6 = 4;
    }
    else {
      int v6 = 6;
    }
    [v4 setListeningModeConfigs:v6 | v5 & 0xFFFFFFFA];
    goto LABEL_10;
  }
LABEL_16:
}

- (void)smartRoutingStateUpdated:(unsigned int)a3 ForDeviceIdentifier:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000130F0;
  block[3] = &unk_100232E28;
  void block[4] = self;
  id v10 = v6;
  unsigned int v11 = a3;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_handleAssistantLanguageChanged:(id)a3
{
  devicesMap = self->_devicesMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000132FC;
  v4[3] = &unk_100232E00;
  v4[4] = self;
  [(NSMutableDictionary *)devicesMap enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_languageChangeMonitoringEnsureStarted
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleAssistantLanguageChanged:" name:AFLanguageCodeDidChangeNotification object:0];
}

- (void)_languageChangeMonitoringEnsureStopped
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AFLanguageCodeDidChangeNotification object:0];
}

- (void)_sendSiriMultitoneConfigToDevice:(id)a3
{
  id v4 = a3;
  if ([v4 siriMultitoneCapability] == 2 && MGGetBoolAnswer())
  {
    if (AFDeviceSupportsSystemAssistantExperience()) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
    if ([v4 siriMultitoneEnabled] != v5)
    {
      uint64_t v6 = (char)v5;
      [v4 setSiriMultitoneEnabled:v6];
      id v7 = objc_alloc_init((Class)AADeviceConfig);
      [v7 setEnableSiriMultitone:v6];
      id v8 = [v4 identifier];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000134FC;
      v9[3] = &unk_100232A38;
      id v10 = v4;
      id v11 = v7;
      [(AADeviceManagerDaemon *)self _sendDeviceConfig:v7 identifier:v8 completion:v9];
    }
  }
}

- (void)downloadHRTFAsset
{
  cloudSyncDeviceManager = self->_cloudSyncDeviceManager;
  if (cloudSyncDeviceManager)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000136F0;
    v4[3] = &unk_100232E90;
    v4[4] = self;
    [cloudSyncDeviceManager fetchSoundProfileRecordWithCompletion:v4];
  }
  else if (dword_100260EA0 <= 90 && (dword_100260EA0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_getBoolPreferencesForKey:(id)a3
{
  id v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(@"com.apple.AudioAccessory");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.AudioAccessory", 0);

  return AppBooleanValue != 0;
}

- (void)_setHRTFAssetDownloadOTA
{
  self->_BOOL hRTFDownloadOTATriggered = 1;
  [(AADeviceManagerDaemon *)self _setPreferencesForKey:@"HRTFDownloadOTATriggered" withBoolValue:1];
}

- (void)_setPreferencesForKey:(id)a3 withBoolValue:(BOOL)a4
{
  id v4 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a4) {
    id v4 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue((CFStringRef)a3, *v4, @"com.apple.AudioAccessory");

  CFPreferencesAppSynchronize(@"com.apple.AudioAccessory");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devicesMap, 0);
  objc_storeStrong((id *)&self->_cloudSyncDeviceManager, 0);
  objc_storeStrong((id *)&self->_bluetoothController, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceDiscovery, 0);

  objc_storeStrong((id *)&self->_aaController, 0);
}

@end