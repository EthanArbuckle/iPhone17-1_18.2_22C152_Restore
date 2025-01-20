@interface _TVRCRMSDeviceWrapper
+ (_TVRCRMSDeviceWrapper)wrapperWithDevice:(id)a3;
- (BOOL)authenticationAllowed;
- (BOOL)connected;
- (BOOL)isPaired;
- (BOOL)supportsTouchEvents;
- (NSDictionary)alternateIdentifiers;
- (NSMutableSet)mediaButtons;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (TVRMSDAAPControlSession)controlSession;
- (TVRMSPairingSession)pairingSession;
- (TVRMSService)device;
- (TVRXKeyboardController)keyboardController;
- (_TVRCRMSDeviceKeyboardImpl)keyboardImpl;
- (_TVRCRMSDeviceWrapper)initWithDevice:(id)a3;
- (_TVRCRMSDeviceWrapperDelegate)delegate;
- (_TVRCRMSNowPlayingState)nowPlayingState;
- (id)supportedButtons;
- (int64_t)_navigationCommandForButtonEvent:(id)a3;
- (int64_t)_touchDirectionForButtonEvent:(id)a3;
- (int64_t)connectionType;
- (void)_cancelPairing;
- (void)_connectWithPairingGUID:(id)a3;
- (void)_disconnectWithError:(id)a3;
- (void)_initiatePairing;
- (void)_seekToTime:(double)a3;
- (void)_setupKeyboardController;
- (void)_skipSeconds:(double)a3;
- (void)connect;
- (void)controlSession:(id)a3 didUpdateKeyboardEditingInfo:(id)a4;
- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)controlSession:(id)a3 keyboardEditingDidBegin:(id)a4;
- (void)controlSession:(id)a3 keyboardEditingDidEnd:(id)a4;
- (void)controlSessionDidEnd:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)keyboardImpl:(id)a3 updatedText:(id)a4;
- (void)keyboardImplRequestsSendingReturnKey:(id)a3;
- (void)pairingSession:(id)a3 didBeginPairingWithPasscode:(id)a4;
- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5;
- (void)pairingSessionDidFail:(id)a3;
- (void)sendButtonEvent:(id)a3;
- (void)setAuthenticationAllowed:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setControlSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setKeyboardController:(id)a3;
- (void)setKeyboardImpl:(id)a3;
- (void)setMediaButtons:(id)a3;
- (void)setNowPlayingState:(id)a3;
- (void)setPairingSession:(id)a3;
@end

@implementation _TVRCRMSDeviceWrapper

+ (_TVRCRMSDeviceWrapper)wrapperWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[_TVRCRMSDeviceWrapper alloc] initWithDevice:v3];

  return v4;
}

- (_TVRCRMSDeviceWrapper)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TVRCRMSDeviceWrapper;
  v6 = [(_TVRCRMSDeviceWrapper *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_connected = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mediaButtons = v7->_mediaButtons;
    v7->_mediaButtons = v8;

    v10 = [[TVRXKeyboardController alloc] _init];
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v10;
  }
  return v7;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelPairing object:0];
  v3.receiver = self;
  v3.super_class = (Class)_TVRCRMSDeviceWrapper;
  [(_TVRCRMSDeviceWrapper *)&v3 dealloc];
}

- (NSString)name
{
  v2 = [(_TVRCRMSDeviceWrapper *)self device];
  objc_super v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSString)identifier
{
  v2 = [(_TVRCRMSDeviceWrapper *)self device];
  objc_super v3 = [v2 networkName];

  return (NSString *)v3;
}

- (NSDictionary)alternateIdentifiers
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (NSString)model
{
  return (NSString *)@"LegacyAppleTV";
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)isPaired
{
  objc_super v3 = +[_TVRCRMSDeviceManager sharedInstance];
  v4 = [(_TVRCRMSDeviceWrapper *)self device];
  id v5 = [v4 networkName];
  v6 = [v3 pairingGUIDForNetworkName:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)supportedButtons
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = [[TVRCButton alloc] _initWithButtonType:12];
  [v3 addObject:v4];

  id v5 = [[TVRCButton alloc] _initWithButtonType:13];
  [v3 addObject:v5];

  id v6 = [[TVRCButton alloc] _initWithButtonType:14];
  [v3 addObject:v6];

  id v7 = [[TVRCButton alloc] _initWithButtonType:15];
  [v3 addObject:v7];

  id v8 = [[TVRCButton alloc] _initWithButtonType:5];
  [v3 addObject:v8];

  id v9 = [[TVRCButton alloc] _initWithButtonType:3];
  [v3 addObject:v9];

  id v10 = [[TVRCButton alloc] _initWithButtonType:2];
  [v3 addObject:v10];

  id v11 = [[TVRCButton alloc] _initWithButtonType:1];
  [v3 addObject:v11];

  if (self->_mediaButtons) {
    objc_msgSend(v3, "unionSet:");
  }
  v12 = [MEMORY[0x263EFFA08] setWithSet:v3];

  return v12;
}

- (BOOL)supportsTouchEvents
{
  return 0;
}

- (int64_t)connectionType
{
  return 3;
}

- (TVRXKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (void)connect
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(_TVRCRMSDeviceWrapper *)self name];
    id v5 = [(_TVRCRMSDeviceWrapper *)self identifier];
    int v15 = 138543618;
    v16 = v4;
    __int16 v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Attempting connection with service <%{public}@, %{public}@> ", (uint8_t *)&v15, 0x16u);
  }
  id v6 = +[_TVRCRMSDeviceManager sharedInstance];
  id v7 = [(_TVRCRMSDeviceWrapper *)self device];
  id v8 = [v7 networkName];
  id v9 = [v6 pairingGUIDForNetworkName:v8];

  id v10 = _TVRCRMSLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = [(_TVRCRMSDeviceWrapper *)self name];
      int v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice found existing pairing record for service, %{public}@", (uint8_t *)&v15, 0xCu);
    }
    [(_TVRCRMSDeviceWrapper *)self _connectWithPairingGUID:v9];
  }
  else
  {
    if (v11)
    {
      objc_super v13 = [(_TVRCRMSDeviceWrapper *)self name];
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice NO existing pairing record for service '%{public}@ found. Attempting to pair...", (uint8_t *)&v15, 0xCu);
    }
    if (self->_authenticationAllowed)
    {
      [(_TVRCRMSDeviceWrapper *)self _initiatePairing];
    }
    else
    {
      v14 = TVRCMakeError(102, 0);
      [(_TVRCRMSDeviceWrapper *)self _disconnectWithError:v14];
    }
  }
}

- (void)disconnect
{
}

- (void)_disconnectWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(_TVRCRMSDeviceWrapper *)self name];
    int v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "#LegacyDevice attempting disconnect for %@", (uint8_t *)&v13, 0xCu);
  }
  self->_connected = 0;
  id v7 = [(_TVRCRMSDeviceWrapper *)self pairingSession];
  [v7 endPairing];

  id v8 = [(_TVRCRMSDeviceWrapper *)self pairingSession];
  [v8 setDelegate:0];

  [(_TVRCRMSDeviceWrapper *)self setPairingSession:0];
  [(TVRMSDAAPControlSession *)self->_controlSession endObservingNowPlaying];
  [(TVRMSDAAPControlSession *)self->_controlSession logout];
  [(TVRMSDAAPControlSession *)self->_controlSession setDelegate:0];
  controlSession = self->_controlSession;
  self->_controlSession = 0;

  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = 0;

  [(TVRXKeyboardController *)self->_keyboardController _setKeyboardImpl:0];
  nowPlayingState = self->_nowPlayingState;
  self->_nowPlayingState = 0;

  v12 = [(_TVRCRMSDeviceWrapper *)self delegate];
  [v12 disconnectedFromDevice:self error:v4];
}

- (void)sendButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_TVRCRMSDeviceWrapper *)self _touchDirectionForButtonEvent:v4];
  int64_t v6 = [(_TVRCRMSDeviceWrapper *)self _navigationCommandForButtonEvent:v4];
  if (v5 == -999)
  {
    uint64_t v7 = v6;
    if (v6 == -999)
    {
      id v8 = [v4 button];
      uint64_t v9 = [v8 buttonType];

      id v10 = [v4 button];
      BOOL v11 = v10;
      if (v9 == 6)
      {
        v12 = [v10 properties];
        int v13 = [v12 objectForKey:@"TVRCButtonSkipInterval"];

        v14 = _TVRCRMSLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[_TVRCRMSDeviceWrapper sendButtonEvent:](v14, v15, v16, v17, v18, v19, v20, v21);
        }

        [v13 floatValue];
LABEL_21:
        [(_TVRCRMSDeviceWrapper *)self _skipSeconds:v22];

        goto LABEL_22;
      }
      uint64_t v25 = [v10 buttonType];

      v26 = [v4 button];
      v27 = v26;
      if (v25 == 7)
      {
        v28 = [v26 properties];
        int v13 = [v28 objectForKey:@"TVRCButtonSkipInterval"];

        v29 = _TVRCRMSLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[_TVRCRMSDeviceWrapper sendButtonEvent:](v29, v30, v31, v32, v33, v34, v35, v36);
        }

        [v13 floatValue];
        float v22 = -v37;
        goto LABEL_21;
      }
      uint64_t v38 = [v26 buttonType];

      if (v38 == 31)
      {
        v39 = _TVRCRMSLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[_TVRCRMSDeviceWrapper sendButtonEvent:](v39, v40, v41, v42, v43, v44, v45, v46);
        }

        [(_TVRCRMSDeviceWrapper *)self _skipSeconds:-99999999.0];
      }
    }
    else if ([v4 eventType] == 2)
    {
      v24 = _TVRCRMSLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.4(v7, v24);
      }

      [(TVRMSDAAPControlSession *)self->_controlSession sendNavigationCommand:v7];
    }
  }
  else
  {
    v23 = _TVRCRMSLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[_TVRCRMSDeviceWrapper sendButtonEvent:].cold.5(v5, v23);
    }

    if ([v4 eventType] == 1)
    {
      [(TVRMSDAAPControlSession *)self->_controlSession sendTouchMoveWithDirection:v5 repeatCount:0];
    }
    else if ([v4 eventType] == 2)
    {
      [(TVRMSDAAPControlSession *)self->_controlSession sendTouchEndWithDirection:v5 repeatCount:0];
    }
  }
LABEL_22:
}

- (void)_initiatePairing
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelPairing object:0];
  id v3 = +[TVRMSPairingSession localPairingSession];
  pairingSession = self->_pairingSession;
  self->_pairingSession = v3;

  [(TVRMSPairingSession *)self->_pairingSession setAdvertisedAppName:@"Apple TV Remote"];
  [(TVRMSPairingSession *)self->_pairingSession setDelegate:self];
  [(TVRMSPairingSession *)self->_pairingSession beginPairing];

  [(_TVRCRMSDeviceWrapper *)self performSelector:sel__cancelPairing withObject:0 afterDelay:10.0];
}

- (void)_cancelPairing
{
  TVRCMakeError(100, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(_TVRCRMSDeviceWrapper *)self disconnectWithError:v3];
}

- (void)_connectWithPairingGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TVRMSDAAPControlSession localControlSession];
  controlSession = self->_controlSession;
  self->_controlSession = v5;

  [(TVRMSDAAPControlSession *)self->_controlSession setDelegate:self];
  objc_initWeak(&location, self);
  uint64_t v7 = self->_controlSession;
  device = self->_device;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49___TVRCRMSDeviceWrapper__connectWithPairingGUID___block_invoke;
  v9[3] = &unk_2647AFEC0;
  objc_copyWeak(&v10, &location);
  [(TVRMSDAAPControlSession *)v7 connectToService:device pairingGUID:v4 completionHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (int64_t)_touchDirectionForButtonEvent:(id)a3
{
  id v3 = [a3 button];
  uint64_t v4 = [v3 buttonType];

  if ((unint64_t)(v4 - 12) > 3) {
    return -999;
  }
  else {
    return qword_226798B68[v4 - 12];
  }
}

- (int64_t)_navigationCommandForButtonEvent:(id)a3
{
  id v3 = [a3 button];
  uint64_t v4 = [v3 buttonType];

  if ((unint64_t)(v4 - 1) > 4) {
    return -999;
  }
  else {
    return qword_226798B88[v4 - 1];
  }
}

- (void)_setupKeyboardController
{
  id v3 = objc_alloc_init(_TVRCRMSDeviceKeyboardImpl);
  keyboardImpl = self->_keyboardImpl;
  self->_keyboardImpl = v3;

  [(_TVRCRMSDeviceKeyboardImpl *)self->_keyboardImpl setDelegate:self];
  keyboardController = self->_keyboardController;
  int64_t v6 = self->_keyboardImpl;

  [(TVRXKeyboardController *)keyboardController _setKeyboardImpl:v6];
}

- (void)_skipSeconds:(double)a3
{
  id v10 = [(_TVRCRMSNowPlayingState *)self->_nowPlayingState lastReportedTimestamp];
  [(_TVRCRMSNowPlayingState *)self->_nowPlayingState playbackRate];
  double v6 = v5;
  [(_TVRCRMSNowPlayingState *)self->_nowPlayingState lastReportedPlaybackPosition];
  double v8 = v7;
  [v10 timeIntervalSinceNow];
  [(_TVRCRMSDeviceWrapper *)self _seekToTime:v8 - v9 * v6 + a3];
}

- (void)_seekToTime:(double)a3
{
}

- (void)pairingSession:(id)a3 didBeginPairingWithPasscode:(id)a4
{
  double v5 = (void *)MEMORY[0x263F8C6D0];
  id v6 = a4;
  [v5 cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelPairing object:0];
  id v8 = +[TVRXDeviceAuthenticationChallenge _challengeWithCodeToEnterOnDevice:v6 cancellationHandler:0];

  double v7 = [(_TVRCRMSDeviceWrapper *)self delegate];
  [v7 deviceEncounteredAuthenticationChallenge:v8];
}

- (void)pairingSession:(id)a3 didPairWithServiceNetworkName:(id)a4 pairingGUID:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F8C6D0];
  id v9 = a5;
  [v8 cancelPreviousPerformRequestsWithTarget:self selector:sel__cancelPairing object:0];
  id v10 = [(_TVRCRMSDeviceWrapper *)self name];
  BOOL v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "#LegacyDevice successfully paired with service '%{public}@' with network name %{public}@", (uint8_t *)&v13, 0x16u);
  }

  v12 = +[_TVRCRMSDeviceManager sharedInstance];
  [v12 addStoredInfoForNetworkName:v7 displayName:v10 pairingGUID:v9];

  [(_TVRCRMSDeviceWrapper *)self _connectWithPairingGUID:v9];
}

- (void)pairingSessionDidFail:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(_TVRCRMSDeviceWrapper *)self name];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Pairing failed for service '%{public}@'", (uint8_t *)&v6, 0xCu);
  }
  [(_TVRCRMSDeviceWrapper *)self _initiatePairing];
}

- (void)controlSession:(id)a3 keyboardEditingDidBegin:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(_TVRCRMSDeviceWrapper *)self name];
    int v10 = 138543618;
    BOOL v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing began for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);
  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    [(_TVRCRMSDeviceKeyboardImpl *)keyboardImpl keyboardSessionBegan:v5];
  }
  else
  {
    id v9 = _TVRCRMSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)controlSession:(id)a3 keyboardEditingDidEnd:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(_TVRCRMSDeviceWrapper *)self name];
    int v10 = 138543618;
    BOOL v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing ended for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);
  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    [(_TVRCRMSDeviceKeyboardImpl *)keyboardImpl keyboardSessionEnded:v5];
  }
  else
  {
    id v9 = _TVRCRMSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)controlSession:(id)a3 didUpdateKeyboardEditingInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(_TVRCRMSDeviceWrapper *)self name];
    int v10 = 138543618;
    BOOL v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard editing updated for '%{public}@' with info %{public}@", (uint8_t *)&v10, 0x16u);
  }
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl)
  {
    [(_TVRCRMSDeviceKeyboardImpl *)keyboardImpl keyboardSessionUpdatedEditingInfo:v5];
  }
  else
  {
    id v9 = _TVRCRMSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "#LegacyDevice no keyboard impl found", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)controlSessionDidEnd:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice control session ended %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)controlSession:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _TVRCRMSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(_TVRCRMSDeviceWrapper *)self name];
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice %{public}@ updated now playing info - %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    [(NSMutableSet *)self->_mediaButtons removeAllObjects];
    if ([v5 canSkipNext])
    {
      uint64_t v8 = _TVRCRMSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "#LegacyDevice SkipNext supported", buf, 2u);
      }

      id v9 = [TVRCButton alloc];
      uint64_t v21 = @"TVRCButtonSkipInterval";
      float v22 = &unk_26DA63018;
      int v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v11 = [(TVRCButton *)v9 _initWithButtonType:6 hasTapAction:1 properties:v10];

      [(NSMutableSet *)self->_mediaButtons addObject:v11];
    }
    if ([v5 canSkipPrevious])
    {
      __int16 v12 = _TVRCRMSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "#LegacyDevice SkipPrevious supported", buf, 2u);
      }

      id v13 = [TVRCButton alloc];
      uint64_t v19 = @"TVRCButtonSkipInterval";
      uint64_t v20 = &unk_26DA63018;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v15 = [(TVRCButton *)v13 _initWithButtonType:7 hasTapAction:1 properties:v14];

      [(NSMutableSet *)self->_mediaButtons addObject:v15];
    }
    id v16 = +[_TVRCRMSNowPlayingState nowPlayingStateFromInfo:v5];
    nowPlayingState = self->_nowPlayingState;
    self->_nowPlayingState = v16;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceUpdatedSupportedButtons:self];
  }
}

- (void)keyboardImplRequestsSendingReturnKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_connected && self->_controlSession)
  {
    uint64_t v4 = _TVRCRMSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      controlSession = self->_controlSession;
      int v6 = 138543362;
      uint64_t v7 = controlSession;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice sending keyboard return key to %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [(TVRMSDAAPControlSession *)self->_controlSession sendKeyboardReturnCommand];
  }
}

- (void)keyboardImpl:(id)a3 updatedText:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (self->_connected && self->_controlSession)
  {
    int v6 = _TVRCRMSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      controlSession = self->_controlSession;
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2114;
      id v11 = controlSession;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "#LegacyDevice sending text '%{public}@' to %{public}@", (uint8_t *)&v8, 0x16u);
    }

    [(TVRMSDAAPControlSession *)self->_controlSession setKeyboardText:v5];
  }
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)authenticationAllowed
{
  return self->_authenticationAllowed;
}

- (void)setAuthenticationAllowed:(BOOL)a3
{
  self->_authenticationAllowed = a3;
}

- (_TVRCRMSDeviceWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCRMSDeviceWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRMSService)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (TVRMSPairingSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
}

- (TVRMSDAAPControlSession)controlSession
{
  return self->_controlSession;
}

- (void)setControlSession:(id)a3
{
}

- (void)setKeyboardController:(id)a3
{
}

- (_TVRCRMSDeviceKeyboardImpl)keyboardImpl
{
  return self->_keyboardImpl;
}

- (void)setKeyboardImpl:(id)a3
{
}

- (NSMutableSet)mediaButtons
{
  return self->_mediaButtons;
}

- (void)setMediaButtons:(id)a3
{
}

- (_TVRCRMSNowPlayingState)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void)setNowPlayingState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingState, 0);
  objc_storeStrong((id *)&self->_mediaButtons, 0);
  objc_storeStrong((id *)&self->_keyboardImpl, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_controlSession, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendButtonEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendButtonEvent:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2266D3000, a2, OS_LOG_TYPE_DEBUG, "#LegacyDevice sending command of type %ld", (uint8_t *)&v2, 0xCu);
}

- (void)sendButtonEvent:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2266D3000, a2, OS_LOG_TYPE_DEBUG, "#LegacyDevice sending touch direction of type %ld", (uint8_t *)&v2, 0xCu);
}

@end