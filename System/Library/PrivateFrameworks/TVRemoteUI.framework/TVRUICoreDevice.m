@interface TVRUICoreDevice
+ (int64_t)_coreButtonEventTypeForEventType:(int64_t)a3;
+ (int64_t)_coreButtonTypeForButton:(int64_t)a3;
+ (int64_t)_uiButtonTypeFromCore:(int64_t)a3;
- (BOOL)_isCaptionsToggleButton:(id)a3;
- (BOOL)_isLaunchApplicationButton:(id)a3;
- (BOOL)_isMediaButton:(id)a3;
- (BOOL)_isVolumeButton:(id)a3;
- (BOOL)_isVolumeControlButton:(id)a3;
- (BOOL)captionsEnabled;
- (BOOL)hasIdentifier:(id)a3;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isLegacyAppleTV;
- (BOOL)isModernAppleTV;
- (BOOL)isPaired;
- (BOOL)supportsCaptionsToggle;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsDonatingIntents;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsGuide;
- (BOOL)supportsLaunchingApplications;
- (BOOL)supportsModernConnections;
- (BOOL)supportsMute;
- (BOOL)supportsPaging;
- (BOOL)supportsPower;
- (BOOL)supportsSiri;
- (BOOL)supportsTouchEvents;
- (BOOL)supportsVolumeControl;
- (NSMutableDictionary)coreButtons;
- (NSString)description;
- (TVRCDevice)device;
- (TVRCDeviceAuthenticationChallenge)currentChallenge;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (TVRUIDeviceDelegate)delegate;
- (id)_initWithCoreDevice:(id)a3;
- (id)_initWithDeviceIdentifier:(id)a3;
- (id)currentText;
- (id)debugName;
- (id)deviceContextInformation;
- (id)identifier;
- (id)keyboardAttributes;
- (id)model;
- (id)name;
- (int64_t)_disconnectReasonFromCoreReason:(int64_t)a3;
- (int64_t)_tvrcTouchPhaseFromUITouchPhase:(int64_t)a3;
- (int64_t)classification;
- (unint64_t)hash;
- (void)_disconnectWithType:(unint64_t)a3;
- (void)_processButtonsForFeatureAdditions:(id)a3;
- (void)_processButtonsForFeatureRemovals:(id)a3;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAuthenitcationChallenge;
- (void)connect;
- (void)connectWithConnectionContext:(int64_t)a3;
- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5;
- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4;
- (void)device:(id)a3 removedSupportedButtons:(id)a4 added:(id)a5;
- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4;
- (void)device:(id)a3 updatedAttentionState:(int64_t)a4;
- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4;
- (void)device:(id)a3 updatedSiriRemoteFindingSessionState:(int64_t)a4;
- (void)deviceBeganConnecting:(id)a3;
- (void)deviceConnected:(id)a3;
- (void)disconnectSystemInitiated;
- (void)disconnectUserInitiated;
- (void)disconnectWithTimeOut;
- (void)enableFindingSession:(BOOL)a3;
- (void)enableTVRemoteOnLockscreen:(BOOL)a3;
- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4;
- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4;
- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4;
- (void)keyboardController:(id)a3 didUpdateText:(id)a4;
- (void)keyboardControllerEndedTextEditing:(id)a3;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)sendAuthenticationCode:(id)a3;
- (void)sendButtonEvent:(id)a3;
- (void)sendReturnKey;
- (void)sendText:(id)a3;
- (void)sendTextInputPayload:(id)a3;
- (void)sendTouchEvent:(id)a3;
- (void)setConnecting:(BOOL)a3;
- (void)setCoreButtons:(id)a3;
- (void)setCurrentChallenge:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation TVRUICoreDevice

- (id)_initWithDeviceIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRUICoreDevice;
  v5 = [(TVRUICoreDevice *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F7C998]) initWithDeviceIdentifier:v4];
    device = v5->_device;
    v5->_device = (TVRCDevice *)v6;

    v8 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[TVRUICoreDevice _initWithDeviceIdentifier:]";
      __int16 v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (id)_initWithCoreDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRUICoreDevice;
  uint64_t v6 = [(TVRUICoreDevice *)&v11 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[TVRUICoreDevice _initWithCoreDevice:]";
      __int16 v14 = 2114;
      uint64_t v15 = p_isa;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }

    if ([p_isa[3] connectionState] == 2)
    {
      v9 = [p_isa[3] keyboardController];
      [v9 setDelegate:p_isa];
    }
  }

  return p_isa;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(TVRUICoreDevice *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [(TVRUICoreDevice *)self model];
  [v3 appendString:v5 withName:@"model"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice supportsDirectCaptionQueries](self, "supportsDirectCaptionQueries"), @"supportsDirectCaptionQueries");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice supportsFindMyRemote](self, "supportsFindMyRemote"), @"supportsFindMyRemote");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICoreDevice isConnected](self, "isConnected"), @"isConnected");
  v9 = [(TVRUICoreDevice *)self device];
  [v9 classification];
  objc_super v10 = TVRCDeviceClassificationDescription();
  [v3 appendString:v10 withName:@"classification"];

  objc_super v11 = [(TVRUICoreDevice *)self device];
  id v12 = (id)[v3 appendObject:v11 withName:@"device"];

  __int16 v13 = [v3 build];

  return (NSString *)v13;
}

- (id)model
{
  return (id)[(TVRCDevice *)self->_device model];
}

- (id)name
{
  return (id)[(TVRCDevice *)self->_device name];
}

- (id)debugName
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = [(TVRUICoreDevice *)self name];
  id v5 = (void *)[v3 initWithString:v4];

  if (+[TVRUIFeatures isAWDLEnabled])
  {
    [(TVRCDevice *)self->_device linkType];
    id v6 = TVRCDeviceLinkTypeDescription();
    [v5 appendFormat:@"-[%@]", v6];
  }
  if (+[TVRUIFeatures isCorianderDebugUIEnabled]
    && [(TVRCDevice *)self->_device classification])
  {
    [(TVRCDevice *)self->_device classification];
    id v7 = TVRCDeviceClassificationDescription();
    [v5 appendFormat:@" (%@)", v7];
  }
  return v5;
}

- (id)identifier
{
  return (id)[(TVRCDevice *)self->_device identifier];
}

- (BOOL)supportsTouchEvents
{
  return [(TVRCDevice *)self->_device supportsTouchEvents];
}

- (BOOL)isModernAppleTV
{
  return [(TVRCDevice *)self->_device connectionType] == 1;
}

- (BOOL)isLegacyAppleTV
{
  return [(TVRCDevice *)self->_device connectionType] == 3;
}

- (BOOL)supportsDonatingIntents
{
  return [(TVRCDevice *)self->_device connectionType] == 1;
}

- (BOOL)supportsDirectCaptionQueries
{
  return [(TVRCDevice *)self->_device supportsDirectCaptionQueries];
}

- (BOOL)supportsFindMyRemote
{
  return [(TVRCDevice *)self->_device supportsFindMyRemote];
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return (TVRCSiriRemoteInfo *)[(TVRCDevice *)self->_device pairedRemoteInfo];
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return (TVRCNowPlayingInfo *)[(TVRCDevice *)self->_device nowPlayingInfo];
}

- (int64_t)classification
{
  return [(TVRCDevice *)self->_device classification];
}

- (BOOL)hasIdentifier:(id)a3
{
  return [(TVRCDevice *)self->_device containsIdentifier:a3];
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(TVRUICoreDevice *)self device];
    id v7 = [v5 device];

    char v8 = [v6 isEqualToDevice:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVRUICoreDevice *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TVRUICoreDevice *)self isEqualToDevice:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(TVRUICoreDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (int64_t)_coreButtonTypeForButton:(int64_t)a3
{
  return a3;
}

+ (int64_t)_coreButtonEventTypeForEventType:(int64_t)a3
{
  return a3;
}

+ (int64_t)_uiButtonTypeFromCore:(int64_t)a3
{
  return a3;
}

- (void)sendButtonEvent:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TVRUICoreDevice *)self device];

  if (v5)
  {
    if ([v4 buttonType] == 9998)
    {
      id v6 = objc_alloc(MEMORY[0x263F7C988]);
      uint64_t v20 = *MEMORY[0x263F7CA28];
      v21[0] = @"com.apple.TVSearch";
      id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      char v8 = (void *)[v6 _initWithButtonType:20 hasTapAction:1 properties:v7];

      v9 = [(TVRUICoreDevice *)self device];
      objc_super v10 = [MEMORY[0x263F7C990] buttonEventForButton:v8 eventType:0];
      [v9 sendButtonEvent:v10];

      objc_super v11 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "#search - sent search tap action", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      int64_t v12 = +[TVRUICoreDevice _coreButtonEventTypeForEventType:](TVRUICoreDevice, "_coreButtonEventTypeForEventType:", [v4 eventType]);
      __int16 v13 = [(TVRUICoreDevice *)self coreButtons];
      __int16 v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "buttonType"));
      char v8 = [v13 objectForKeyedSubscript:v14];

      if (!v8)
      {
        int64_t v15 = +[TVRUICoreDevice _coreButtonTypeForButton:](TVRUICoreDevice, "_coreButtonTypeForButton:", [v4 buttonType]);
        char v8 = (void *)[objc_alloc(MEMORY[0x263F7C988]) _initWithButtonType:v15];
        uint64_t v16 = _TVRUIViewControllerLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v4;
          _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "UI did not find a core button instance. creating one for UI event %@", (uint8_t *)&v18, 0xCu);
        }
      }
      objc_super v11 = [MEMORY[0x263F7C990] buttonEventForButton:v8 eventType:v12];
      v17 = [(TVRUICoreDevice *)self device];
      [v17 sendButtonEvent:v11];
    }
  }
}

- (void)sendTouchEvent:(id)a3
{
  id v14 = a3;
  id v4 = [(TVRUICoreDevice *)self device];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F7C9F8]);
    [v14 timestamp];
    double v7 = v6;
    uint64_t v8 = [v14 fingerIndex];
    int64_t v9 = -[TVRUICoreDevice _tvrcTouchPhaseFromUITouchPhase:](self, "_tvrcTouchPhaseFromUITouchPhase:", [v14 touchPhase]);
    [v14 digitizerLocation];
    int64_t v12 = objc_msgSend(v5, "_initWithTimestamp:finger:phase:digitizerLocation:", v8, v9, v7, v10, v11);
    __int16 v13 = [(TVRUICoreDevice *)self device];
    [v13 sendTouchEvent:v12];
  }
}

- (void)sendText:(id)a3
{
  id v7 = a3;
  id v4 = [(TVRUICoreDevice *)self device];

  if (v7 && v4)
  {
    id v5 = [(TVRUICoreDevice *)self device];
    double v6 = [v5 keyboardController];
    [v6 setText:v7];
  }
}

- (void)sendReturnKey
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (v3)
  {
    id v5 = [(TVRUICoreDevice *)self device];
    id v4 = [v5 keyboardController];
    [v4 sendReturnKey];
  }
}

- (void)sendTextInputPayload:(id)a3
{
  id v6 = a3;
  id v4 = [(TVRUICoreDevice *)self device];

  if (v4)
  {
    id v5 = [(TVRUICoreDevice *)self device];
    [v5 _sendRTIDataPayload:v6];
  }
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(TVRUICoreDevice *)self device];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int64_t v9 = [(TVRUICoreDevice *)self device];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(TVRUICoreDevice *)self device];
      [v11 fetchUpNextInfoWithPaginationToken:v12 completion:v6];
    }
  }
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(TVRUICoreDevice *)self device];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int64_t v9 = [(TVRUICoreDevice *)self device];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(TVRUICoreDevice *)self device];
      [v11 markAsWatchedWithMediaIdentifier:v12 completion:v6];
    }
  }
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(TVRUICoreDevice *)self device];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int64_t v9 = [(TVRUICoreDevice *)self device];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(TVRUICoreDevice *)self device];
      [v11 addItemWithMediaIdentifier:v12 completion:v6];
    }
  }
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(TVRUICoreDevice *)self device];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int64_t v9 = [(TVRUICoreDevice *)self device];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(TVRUICoreDevice *)self device];
      [v11 removeItemWithMediaIdentifier:v12 completion:v6];
    }
  }
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(TVRUICoreDevice *)self device];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int64_t v9 = [(TVRUICoreDevice *)self device];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      double v11 = [(TVRUICoreDevice *)self device];
      [v11 playItem:v12 completion:v6];
    }
  }
}

- (id)keyboardAttributes
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (v3)
  {
    id v4 = [(TVRUICoreDevice *)self device];
    id v5 = [v4 keyboardController];
    id v6 = [v5 attributes];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)currentText
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (v3)
  {
    id v4 = [(TVRUICoreDevice *)self device];
    id v5 = [v4 keyboardController];
    id v6 = [v5 text];
  }
  else
  {
    id v6 = &stru_26DB4CAE0;
  }
  return v6;
}

- (void)sendAuthenticationCode:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(TVRUICoreDevice *)self device];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(TVRUICoreDevice *)self currentChallenge];

    if (v6)
    {
      uint64_t v7 = [(TVRUICoreDevice *)self currentChallenge];
      [v7 userEnteredCodeLocally:v8];
    }
  }
}

- (void)cancelAuthenitcationChallenge
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(TVRUICoreDevice *)self currentChallenge];
    id v5 = [(TVRUICoreDevice *)self device];
    int v10 = 138412546;
    double v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "ui device cancelling auth challenge %@ for device %{public}@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v6 = [(TVRUICoreDevice *)self device];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = [(TVRUICoreDevice *)self currentChallenge];

    if (v8)
    {
      int64_t v9 = [(TVRUICoreDevice *)self currentChallenge];
      [v9 cancel];

      [(TVRUICoreDevice *)self setCurrentChallenge:0];
      [(TVRUICoreDevice *)self setConnecting:0];
    }
  }
}

- (int64_t)_tvrcTouchPhaseFromUITouchPhase:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_2273F4260[a3];
  }
}

- (BOOL)isPaired
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(TVRUICoreDevice *)self device];
  char v5 = [v4 isPaired];

  return v5;
}

- (void)connect
{
}

- (void)connectWithConnectionContext:(int64_t)a3
{
  char v5 = [(TVRUICoreDevice *)self device];

  if (v5)
  {
    uint64_t v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting deviceConnect on core device", v9, 2u);
    }

    uint64_t v7 = [(TVRUICoreDevice *)self device];
    [v7 setDelegate:self];

    id v8 = [(TVRUICoreDevice *)self device];
    [v8 connectWithConnectionContext:a3];

    [(TVRUICoreDevice *)self setConnecting:1];
  }
}

- (void)disconnectSystemInitiated
{
}

- (void)disconnectUserInitiated
{
}

- (void)disconnectWithTimeOut
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F7C980] sharedInstance];
    char v5 = [(TVRUICoreDevice *)self device];
    objc_msgSend(v4, "logConnectionStatus:type:reason:", 3, objc_msgSend(v5, "connectionType"), -1);

    [(TVRUICoreDevice *)self disconnectUserInitiated];
  }
}

- (void)_disconnectWithType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v5 = [(TVRUICoreDevice *)self device];

  if (v5)
  {
    [(TVRUICoreDevice *)self cancelAuthenitcationChallenge];
    uint64_t v6 = [(TVRUICoreDevice *)self device];
    [v6 disconnectWithType:a3];

    [(TVRUICoreDevice *)self setConnecting:0];
    uint64_t v7 = [(TVRUICoreDevice *)self device];
    [v7 setDelegate:0];

    id v8 = [(TVRUICoreDevice *)self device];
    int64_t v9 = [v8 keyboardController];
    [v9 setDelegate:0];

    self->_supportsLaunchingApplications = 0;
    *(_DWORD *)&self->_supportsSiri = 0;
    self->_supportsPaging = 0;
    int v10 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "UI requesting disconnect with type %ld", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)isConnected
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(TVRUICoreDevice *)self device];
  BOOL v5 = [v4 connectionState] == 2;

  return v5;
}

- (BOOL)isConnecting
{
  unint64_t v3 = [(TVRUICoreDevice *)self device];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(TVRUICoreDevice *)self device];
  BOOL v5 = [v4 connectionState] == 1 || self->_connecting;

  return v5;
}

- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 67109376;
    *(_DWORD *)v26 = [v5 challengeAttributes] == 1;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = [v5 challengeAttributes] == 2;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "tvrui deviceEncounteredAuthChallenge pin=%d text=%d", (uint8_t *)&v25, 0xEu);
  }

  if ([v5 throttleSeconds] < 0)
  {
    [(TVRUICoreDevice *)self setCurrentChallenge:v5];
    uint64_t v15 = [(TVRUICoreDevice *)self delegate];
    if (!v15) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)v15;
    v17 = [(TVRUICoreDevice *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_17;
    }
    if ([v5 challengeAttributes] == 1)
    {
      id v19 = [(TVRUICoreDevice *)self delegate];
      uint64_t v14 = v19;
      uint64_t v20 = self;
      uint64_t v21 = 0;
    }
    else
    {
      if ([v5 challengeAttributes] != 2)
      {
        if ([v5 challengeType] == 1)
        {
          v22 = [v5 codeToEnterOnDevice];
          uint64_t v23 = [v22 length];

          if (v23 == 4)
          {
            uint64_t v14 = [(TVRUICoreDevice *)self delegate];
            v24 = [v5 codeToEnterOnDevice];
            [v14 deviceDidEncounterAuthenticationChallenge:self passwordType:2 passcode:v24];

            goto LABEL_16;
          }
        }
        goto LABEL_17;
      }
      id v19 = [(TVRUICoreDevice *)self delegate];
      uint64_t v14 = v19;
      uint64_t v20 = self;
      uint64_t v21 = 1;
    }
    [v19 deviceDidEncounterAuthenticationChallenge:v20 passwordType:v21 passcode:0];
    goto LABEL_16;
  }
  uint64_t v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 throttleSeconds];
    int64_t v9 = [(TVRUICoreDevice *)self delegate];
    int v25 = 134218242;
    *(void *)v26 = v8;
    *(_WORD *)&v26[8] = 2112;
    v27 = v9;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "tvrui encountered a throttle challenge for %ld seconds. sending to delegate %@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v10 = [(TVRUICoreDevice *)self delegate];
  if (v10)
  {
    int v11 = (void *)v10;
    unint64_t v12 = [(TVRUICoreDevice *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(TVRUICoreDevice *)self delegate];
      objc_msgSend(v14, "device:didEncounterAuthenticationThrottle:", self, objc_msgSend(v5, "throttleSeconds"));
LABEL_16:
    }
  }
LABEL_17:
}

- (void)deviceBeganConnecting:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "deviceBeganConnecting %@", (uint8_t *)&v11, 0xCu);
  }

  [(TVRUICoreDevice *)self setConnecting:1];
  uint64_t v6 = [(TVRUICoreDevice *)self delegate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [(TVRUICoreDevice *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(TVRUICoreDevice *)self delegate];
      [v10 deviceBeganConnecting:self];
    }
  }
}

- (void)deviceConnected:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "deviceConnected %@", (uint8_t *)&v19, 0xCu);
  }

  [(TVRUICoreDevice *)self setDevice:v4];
  uint64_t v6 = [(TVRUICoreDevice *)self device];
  uint64_t v7 = [v6 keyboardController];
  [v7 setDelegate:self];

  uint64_t v8 = [(TVRUICoreDevice *)self currentChallenge];

  if (v8) {
    [(TVRUICoreDevice *)self setCurrentChallenge:0];
  }
  char v9 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v10 = [v4 supportedButtons];
  int v11 = objc_msgSend(v9, "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  [(TVRUICoreDevice *)self setCoreButtons:v11];

  id v12 = [v4 supportedButtons];
  [(TVRUICoreDevice *)self _processButtonsForFeatureAdditions:v12];

  uint64_t v13 = [(TVRUICoreDevice *)self delegate];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(TVRUICoreDevice *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(TVRUICoreDevice *)self delegate];
      [v17 deviceDidConnect:self];
    }
  }
  [(TVRUICoreDevice *)self setConnecting:0];
  char v18 = [MEMORY[0x263F7C980] sharedInstance];
  objc_msgSend(v18, "logConnectionStatus:type:reason:", 2, objc_msgSend(v4, "connectionType"), -1);
}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(TVRUICoreDevice *)self delegate];
    int v21 = 138413058;
    id v22 = v8;
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "UIDevice: deviceDisconnected device=%@, reason=%ld, error=%@. Sending to delegate %@", (uint8_t *)&v21, 0x2Au);
  }
  uint64_t v12 = [(TVRUICoreDevice *)self delegate];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(TVRUICoreDevice *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      char v16 = [(TVRUICoreDevice *)self delegate];
      objc_msgSend(v16, "deviceDidDisconnect:reason:error:", self, -[TVRUICoreDevice _disconnectReasonFromCoreReason:](self, "_disconnectReasonFromCoreReason:", a4), v9);
    }
  }
  [(TVRUICoreDevice *)self setConnecting:0];
  if (a4 && v9)
  {
    v17 = [MEMORY[0x263F7C980] sharedInstance];
    objc_msgSend(v17, "logConnectionStatus:type:reason:", 1, objc_msgSend(v8, "connectionType"), a4);
  }
  char v18 = [(TVRUICoreDevice *)self device];
  [v18 setDelegate:0];

  int v19 = [(TVRUICoreDevice *)self device];
  id v20 = [v19 keyboardController];
  [v20 setDelegate:0];
}

- (int64_t)_disconnectReasonFromCoreReason:(int64_t)a3
{
  return a3;
}

- (void)device:(id)a3 removedSupportedButtons:(id)a4 added:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _TVRUIButtonLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v51 = v8;
    __int16 v52 = 2114;
    id v53 = v9;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ added %{public}@", buf, 0x16u);
  }
  v32 = v9;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v34 = v7;
  int v11 = [v7 supportedButtons];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = _TVRUIButtonLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v16;
          _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "Supported %{public}@", buf, 0xCu);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        int64_t v24 = _TVRUIButtonLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v23;
          _os_log_impl(&dword_227326000, v24, OS_LOG_TYPE_DEFAULT, "Removed %{public}@", buf, 0xCu);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v20);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v25 = v32;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        v31 = _TVRUIButtonLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v30;
          _os_log_impl(&dword_227326000, v31, OS_LOG_TYPE_DEFAULT, "Added %{public}@", buf, 0xCu);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v27);
  }

  [(TVRUICoreDevice *)self _processButtonsForFeatureRemovals:v18];
  [(TVRUICoreDevice *)self _processButtonsForFeatureAdditions:v25];
}

- (void)_processButtonsForFeatureAdditions:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v41 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
  obuint64_t j = v5;
  if (!v6) {
    goto LABEL_48;
  }
  uint64_t v7 = v6;
  uint64_t v40 = 0;
  char v39 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v44 != v9) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      int64_t v12 = +[TVRUICoreDevice _uiButtonTypeFromCore:](TVRUICoreDevice, "_uiButtonTypeFromCore:", [v11 buttonType]);
      if ([(TVRUICoreDevice *)self _isMediaButton:v11])
      {
        uint64_t v13 = [NSNumber numberWithInteger:v12];
        [v41 addObject:v13];

        BYTE4(v40) = 1;
      }
      else if ([(TVRUICoreDevice *)self _isVolumeButton:v11])
      {
        char v8 = 1;
        self->_supportsVolumeControl = 1;
      }
      else if ([(TVRUICoreDevice *)self _isLaunchApplicationButton:v11])
      {
        self->_supportsLaunchingApplications = 1;
      }
      else if ([(TVRUICoreDevice *)self _isCaptionsToggleButton:v11])
      {
        self->_supportsCaptionsToggle = 1;
      }
      else if ([v11 buttonType] == 17)
      {
        self->_captionsEnabled = 0;
        LOBYTE(v40) = 1;
      }
      else if ([v11 buttonType] == 18)
      {
        LOBYTE(v40) = 1;
        self->_captionsEnabled = 1;
      }
      else if ([v11 buttonType] == 4)
      {
        char v39 = 1;
        self->_supportsSiruint64_t i = 1;
      }
      else if ([v11 buttonType] == 30)
      {
        self->_supportsPower = 1;
      }
      else if ([v11 buttonType] == 28)
      {
        self->_supportsGuide = 1;
      }
      else if ([v11 buttonType] == 29)
      {
        self->_supportsMute = 1;
      }
      else if ([v11 buttonType] == 26 || objc_msgSend(v11, "buttonType") == 27)
      {
        self->_supportsPaging = 1;
      }
      uint64_t v14 = [(TVRUICoreDevice *)self coreButtons];
      char v15 = [NSNumber numberWithInteger:v12];
      [v14 setObject:v11 forKeyedSubscript:v15];
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v7);

  if (v39)
  {
    uint64_t v16 = [(TVRUICoreDevice *)self delegate];
    if (v16)
    {
      v17 = (void *)v16;
      id v18 = [(TVRUICoreDevice *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        uint64_t v20 = [(TVRUICoreDevice *)self delegate];
        [v20 device:self supportsSiri:self->_supportsSiri volumeControl:self->_supportsVolumeControl];
LABEL_39:
      }
    }
  }
  else if (v8)
  {
    uint64_t v21 = [(TVRUICoreDevice *)self delegate];
    if (v21)
    {
      id v22 = (void *)v21;
      __int16 v23 = [(TVRUICoreDevice *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        uint64_t v20 = [(TVRUICoreDevice *)self delegate];
        [v20 device:self supportsVolumeControl:1];
        goto LABEL_39;
      }
    }
  }
  if ((v40 & 0x100000000) != 0)
  {
    uint64_t v25 = [(TVRUICoreDevice *)self delegate];
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      uint64_t v27 = [(TVRUICoreDevice *)self delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        uint64_t v29 = [(TVRUICoreDevice *)self delegate];
        [v29 device:self needsMediaControls:v41];
      }
    }
  }
  if (v40)
  {
    uint64_t v30 = [(TVRUICoreDevice *)self delegate];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [(TVRUICoreDevice *)self delegate];
      char v33 = objc_opt_respondsToSelector();

      if (v33)
      {
        id v5 = [(TVRUICoreDevice *)self delegate];
        [v5 device:self hasCaptionsEnabled:self->_captionsEnabled];
LABEL_48:
      }
    }
  }
  uint64_t v34 = [(TVRUICoreDevice *)self delegate];
  if (v34)
  {
    long long v35 = (void *)v34;
    long long v36 = [(TVRUICoreDevice *)self delegate];
    char v37 = objc_opt_respondsToSelector();

    if (v37)
    {
      long long v38 = [(TVRUICoreDevice *)self delegate];
      [v38 device:self hasGuideButtonEnabled:self->_supportsGuide];
    }
  }
}

- (void)_processButtonsForFeatureRemovals:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  uint64_t v7 = v5;
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v8 = v6;
  char v31 = 0;
  char v9 = 0;
  uint64_t v10 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v5);
      }
      int64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      int64_t v13 = +[TVRUICoreDevice _uiButtonTypeFromCore:](TVRUICoreDevice, "_uiButtonTypeFromCore:", [v12 buttonType]);
      if ([(TVRUICoreDevice *)self _isMediaButton:v12])
      {
        uint64_t v14 = [NSNumber numberWithInteger:v13];
        [v32 addObject:v14];

        char v9 = 1;
      }
      else if ([(TVRUICoreDevice *)self _isVolumeControlButton:v12])
      {
        self->_supportsVolumeControl = 0;
        self->_supportsMute = 0;
        char v31 = 1;
      }
      else if ([v12 buttonType] == 28)
      {
        self->_supportsGuide = 0;
      }
      char v15 = [(TVRUICoreDevice *)self coreButtons];
      uint64_t v16 = [NSNumber numberWithInteger:v13];
      [v15 removeObjectForKey:v16];
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v8);

  if (v9)
  {
    uint64_t v17 = [(TVRUICoreDevice *)self delegate];
    if (v17)
    {
      id v18 = (void *)v17;
      char v19 = [(TVRUICoreDevice *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        uint64_t v21 = [(TVRUICoreDevice *)self delegate];
        [v21 device:self hidesMediaControls:v32];
      }
    }
  }
  if (v31)
  {
    uint64_t v22 = [(TVRUICoreDevice *)self delegate];
    if (v22)
    {
      __int16 v23 = (void *)v22;
      char v24 = [(TVRUICoreDevice *)self delegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        uint64_t v7 = [(TVRUICoreDevice *)self delegate];
        [v7 device:self supportsVolumeControl:0];
LABEL_22:
      }
    }
  }
  uint64_t v26 = [(TVRUICoreDevice *)self delegate];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    char v28 = [(TVRUICoreDevice *)self delegate];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      uint64_t v30 = [(TVRUICoreDevice *)self delegate];
      [v30 device:self hasGuideButtonEnabled:self->_supportsGuide];
    }
  }
}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v4;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Find My Remote state enabled: %d", (uint8_t *)v12, 8u);
  }

  uint64_t v7 = [(TVRUICoreDevice *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    char v9 = [(TVRUICoreDevice *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int v11 = [(TVRUICoreDevice *)self delegate];
      [v11 device:self supportsFindMyRemote:v4];
    }
  }
}

- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Now playing info changed: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v7 = [(TVRUICoreDevice *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    char v9 = [(TVRUICoreDevice *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int v11 = [(TVRUICoreDevice *)self delegate];
      [v11 device:self didUpdateNowPlayingInfo:v5];
    }
  }
}

- (void)device:(id)a3 updatedSiriRemoteFindingSessionState:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (unint64_t)a4 < 7 && ((0x77u >> a4))
    {
      char v9 = off_2648009B8[a4];
    }
    else
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [NSNumber numberWithInteger:a4];
      char v9 = [v7 stringWithFormat:@"Unknown %@", v8];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v9;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Siri Remote finding session state changed to: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(TVRUICoreDevice *)self delegate];
  if (v10)
  {
    int v11 = (void *)v10;
    int v12 = [(TVRUICoreDevice *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(TVRUICoreDevice *)self delegate];
      [v14 device:self didUpdateSiriRemoteFindingSessionState:a4];
    }
  }
}

- (void)device:(id)a3 updatedAttentionState:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a4);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_2648009F0[a4 - 1];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Attention state was updated to: %{public}@", buf, 0xCu);
  }
}

- (BOOL)_isVolumeButton:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 buttonType] == 10 || objc_msgSend(v3, "buttonType") == 11;

  return v4;
}

- (BOOL)_isLaunchApplicationButton:(id)a3
{
  return [a3 buttonType] == 20;
}

- (BOOL)_isCaptionsToggleButton:(id)a3
{
  return [a3 buttonType] == 16;
}

- (BOOL)_isMediaButton:(id)a3
{
  return ([a3 buttonType] & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)_isVolumeControlButton:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 buttonType] == 10
    || [v3 buttonType] == 11
    || [v3 buttonType] == 29;

  return v4;
}

- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(TVRUICoreDevice *)self identifier];
    int v13 = 138412290;
    uint64_t v14 = v9;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Started text editing for %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v10 = [(TVRUICoreDevice *)self delegate];

  if (v10)
  {
    int v11 = [v6 text];
    int v12 = [(TVRUICoreDevice *)self delegate];
    [v12 device:self beganTextEditingWithAttributes:v7 initialText:v11];
  }
}

- (void)keyboardControllerEndedTextEditing:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(TVRUICoreDevice *)self identifier];
    int v11 = 138412290;
    int v12 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Ended text editing for %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [(TVRUICoreDevice *)self delegate];

  if (v7)
  {
    uint64_t v8 = [v4 text];
    uint64_t v9 = [(TVRUICoreDevice *)self delegate];
    uint64_t v10 = [v4 attributes];
    [v9 device:self endedTextEditingWithAttributes:v10 endingText:v8];
  }
}

- (void)keyboardController:(id)a3 didUpdateText:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Text updated with value %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(TVRUICoreDevice *)self delegate];

  if (v7)
  {
    uint64_t v8 = [(TVRUICoreDevice *)self delegate];
    [v8 device:self didUpdateText:v5];
  }
}

- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4
{
  id v5 = a4;
  id v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard attributes attributed ", v9, 2u);
  }

  id v7 = [(TVRUICoreDevice *)self delegate];

  if (v7)
  {
    uint64_t v8 = [(TVRUICoreDevice *)self delegate];
    [v8 device:self didUpdateAttributes:v5];
  }
}

- (id)deviceContextInformation
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(TVRUICoreDevice *)self device];

  if (v3
    && ([(TVRUICoreDevice *)self device],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 connectionType],
        TVRCDeviceConnectionTypeDescription(),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    uint64_t v8 = @"connectionType";
    v9[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA78];
  }
  return v6;
}

- (BOOL)supportsModernConnections
{
  v2 = [(TVRUICoreDevice *)self deviceContextInformation];
  id v3 = [v2 objectForKeyedSubscript:@"connectionType"];
  char v4 = [v3 isEqualToString:@"Rapport"];

  return v4;
}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [(TVRUICoreDevice *)self device];

  if (v5)
  {
    id v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"stop showing";
      if (v3) {
        id v7 = @"show";
      }
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting to %@ TVRemote app on lock screen", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(TVRUICoreDevice *)self device];
    [v8 enableTVRemoteOnLockscreen:v3];
  }
}

- (void)enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [(TVRUICoreDevice *)self device];

  if (v5)
  {
    id v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"disable";
      if (v3) {
        id v7 = @"enable";
      }
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "UI requesting to %@ finding session", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(TVRUICoreDevice *)self device];
    [v8 enableFindingSession:v3];
  }
}

- (TVRCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (TVRUIDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRUIDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCDeviceAuthenticationChallenge)currentChallenge
{
  return self->_currentChallenge;
}

- (void)setCurrentChallenge:(id)a3
{
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)supportsLaunchingApplications
{
  return self->_supportsLaunchingApplications;
}

- (BOOL)supportsCaptionsToggle
{
  return self->_supportsCaptionsToggle;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (BOOL)supportsMute
{
  return self->_supportsMute;
}

- (BOOL)supportsPower
{
  return self->_supportsPower;
}

- (BOOL)supportsGuide
{
  return self->_supportsGuide;
}

- (BOOL)supportsPaging
{
  return self->_supportsPaging;
}

- (BOOL)captionsEnabled
{
  return self->_captionsEnabled;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (NSMutableDictionary)coreButtons
{
  return self->_coreButtons;
}

- (void)setCoreButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreButtons, 0);
  objc_storeStrong((id *)&self->_currentChallenge, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end