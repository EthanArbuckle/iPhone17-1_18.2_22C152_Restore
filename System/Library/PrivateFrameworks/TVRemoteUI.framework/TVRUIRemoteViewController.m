@interface TVRUIRemoteViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAllowKeyboardToBePresented;
- (BOOL)deviceQueryThresholdReached;
- (BOOL)hasPresentedContent;
- (BOOL)isConfigured;
- (BOOL)isEditingSessionActive;
- (BOOL)isFindingSessionActive;
- (BOOL)isInReducedBacklightMode;
- (BOOL)isInSecureWindow;
- (BOOL)isNetworkReachable;
- (BOOL)isSiriSessionActive;
- (BOOL)shouldDisconnectAndStopConnections;
- (BOOL)shouldStartFindingSession;
- (BOOL)supportsSiri;
- (BOOL)supportsVolumeControl;
- (BSInvalidatable)volumeDecreaseSBSInvalidator;
- (BSInvalidatable)volumeIncreaseSBSInvalidator;
- (CGSize)preferredContentSize;
- (CUSystemMonitor)systemMonitor;
- (NSArray)deviceObservers;
- (NSString)activeDeviceIdentifier;
- (NSString)launchContextDesc;
- (NSString)preferredDeviceIdentifier;
- (SFClient)sharingClient;
- (TVRAlertController)authenticationAlertController;
- (TVRAlertController)keyboardController;
- (TVRCSessionData)sessionData;
- (TVRKeyboardHaptic)keyboardHaptic;
- (TVRMessageView)messageView;
- (TVRUIControlPanelViewController)controlPanelViewController;
- (TVRUIDevice)activeDevice;
- (TVRUIDevice)authenticatingDevice;
- (TVRUIDeviceConnectionStatusDelegate)deviceConnectionStatusDelegate;
- (TVRUIDevicePickerViewController)devicePickerViewController;
- (TVRUIDeviceQuery)deviceQuery;
- (TVRUIFindingSession)findingSession;
- (TVRUIMediaControlsViewController)mediaControlsViewController;
- (TVRUINetworkObserver)networkObserver;
- (TVRUINowPlayingController)nowPlayingController;
- (TVRUIRemoteViewController)init;
- (TVRUIRemoteViewControllerDelegate)delegate;
- (TVRUISiriManager)siriManager;
- (TVRUIStyleProvider)styleProvider;
- (TVRUITipSourceViewProvider)tipSourceViewProvider;
- (TVRUITopButtonPanelViewController)topButtonPanelViewController;
- (TVRUITouchpadViewController)touchpadViewController;
- (TVRUIVolumeController)volumeController;
- (UIButton)tapToRadarButton;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)backgroundView;
- (UIView)blackGradientView;
- (double)backgroundCornerRadius;
- (id)_stringForConnectionContext:(int64_t)a3;
- (id)_stringForDeviceDeviceIdentifierType:(int64_t)a3;
- (id)_stringForLaunchContextType:(int64_t)a3;
- (id)animatorForDismissalAsAlert;
- (id)animatorForPresentationAsAlert;
- (id)deviceQueryThresholdBlock;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 forTouchpadView:(id)a5;
- (int64_t)_connectionContextFromLaunchContext:(int64_t)a3;
- (int64_t)deviceIdentifierType;
- (int64_t)deviceType;
- (int64_t)launchContext;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activate;
- (void)_cancelHideConnectingAndShowDevicePicker;
- (void)_cancelPairing;
- (void)_cancelShowConnectingSpinner;
- (void)_connectToDevice:(id)a3 connectionContext:(int64_t)a4;
- (void)_connectToMostRelevantDevice;
- (void)_connectToPreferredDeviceFromDeviceList:(id)a3;
- (void)_createBlackGradientView;
- (void)_createFindingSessionIfNeeded;
- (void)_deactivate;
- (void)_disableSearch;
- (void)_disconnect;
- (void)_disconnectSystemInitiated;
- (void)_disconnectUserInitiated;
- (void)_disconnectUserInitiatedAndModifyLockscreenAssertion:(BOOL)a3;
- (void)_enableLiveTVButtons:(BOOL)a3 animated:(BOOL)a4;
- (void)_enableMediaControls:(BOOL)a3 animated:(BOOL)a4;
- (void)_enableSearch;
- (void)_enableTVRemoteOnLockscreen:(BOOL)a3;
- (void)_expandDeviceList;
- (void)_forceShowMediaControls;
- (void)_hideConnectingAndShowDevicePicker;
- (void)_hideMessageContent;
- (void)_initSessionStatistics;
- (void)_installTapToRadarButton;
- (void)_layoutTouchpadExpanded:(BOOL)a3;
- (void)_logSessionStatistics;
- (void)_performSiriEffectsWithButtonEvent:(id)a3;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)_presentKeyboardWithAttributes:(id)a3 initialText:(id)a4;
- (void)_presentPairingAlert;
- (void)_presentTextPasswordAlert;
- (void)_resetActiveDevice;
- (void)_selectDevice:(id)a3 withConnectionContext:(int64_t)a4;
- (void)_setupChildViewControllers;
- (void)_setupDevicePickerController;
- (void)_setupNetworkObserverIfNeeded;
- (void)_setupNowPlayingController;
- (void)_showBluetoothDisabledAlertWithCompletion:(id)a3;
- (void)_showConnectingSpinner;
- (void)_showFindingAlert;
- (void)_showSearchingSpinnerIfNeeded;
- (void)_startDeviceQueryThresholdTimer;
- (void)_startFindingSessionForDevice:(id)a3;
- (void)_stopDeviceQueryThresholdTimer;
- (void)_stopFindingSessionForDevice:(id)a3;
- (void)_tapToRadar;
- (void)_toggleControlAvailability;
- (void)_turnOnBluetoothIfNeededWithCompletionBlock:(id)a3;
- (void)_updateControlsAppearance;
- (void)_updateInfoButtonState;
- (void)_updateSecureWindowState;
- (void)alertController:(id)a3 enteredText:(id)a4;
- (void)alertController:(id)a3 generatedTextInputPayload:(id)a4;
- (void)alertControllerCancelled:(id)a3;
- (void)alertControllerHitKeyboardReturnKey:(id)a3;
- (void)alertControllerPressedDictationButton:(id)a3;
- (void)alertControllerReleasedDictationButton:(id)a3;
- (void)backlightLuminanceDidChange;
- (void)bluetoothAvailabilityDidUpdate:(BOOL)a3;
- (void)clearMessageContent;
- (void)configureWithContext:(id)a3;
- (void)configureWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6;
- (void)configureWithDeviceIdentifier:(id)a3 type:(int64_t)a4 showPicker:(BOOL)a5;
- (void)connectionServiceDidInvalidate:(id)a3;
- (void)consumeSinglePressDownForButtonKind:(int64_t)a3;
- (void)dealloc;
- (void)device:(id)a3 beganTextEditingWithAttributes:(id)a4 initialText:(id)a5;
- (void)device:(id)a3 didEncounterAuthenticationThrottle:(int64_t)a4;
- (void)device:(id)a3 didUpdateAttributes:(id)a4;
- (void)device:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)device:(id)a3 didUpdateSiriRemoteFindingSessionState:(int64_t)a4;
- (void)device:(id)a3 didUpdateText:(id)a4;
- (void)device:(id)a3 endedTextEditingWithAttributes:(id)a4 endingText:(id)a5;
- (void)device:(id)a3 hasCaptionsEnabled:(BOOL)a4;
- (void)device:(id)a3 hasGuideButtonEnabled:(BOOL)a4;
- (void)device:(id)a3 hidesMediaControls:(id)a4;
- (void)device:(id)a3 needsMediaControls:(id)a4;
- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4;
- (void)device:(id)a3 supportsSiri:(BOOL)a4 volumeControl:(BOOL)a5;
- (void)device:(id)a3 supportsVolumeControl:(BOOL)a4;
- (void)deviceBeganConnecting:(id)a3;
- (void)deviceDidConnect:(id)a3;
- (void)deviceDidDisconnect:(id)a3 reason:(int64_t)a4 error:(id)a5;
- (void)deviceDidEncounterAuthenticationChallenge:(id)a3 passwordType:(unint64_t)a4 passcode:(id)a5;
- (void)deviceListUpdated:(id)a3;
- (void)devicePicked:(id)a3;
- (void)devicePickerTitleWasLongPressedForDevice:(id)a3;
- (void)devicePickerWillChangeState:(BOOL)a3 animated:(BOOL)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)fetchPreferredDeviceIdentifier;
- (void)findButtonTappedForDevice:(id)a3;
- (void)findingSessionDidEnd;
- (void)findingSessionDidStart;
- (void)generatedButtonEvent:(id)a3;
- (void)generatedTouchEvent:(id)a3;
- (void)keyboardRequested;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)setActiveDevice:(id)a3;
- (void)setActiveDeviceIdentifier:(id)a3;
- (void)setAuthenticatingDevice:(id)a3;
- (void)setAuthenticationAlertController:(id)a3;
- (void)setBackgroundCornerRadius:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlackGradientView:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setControlPanelViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceConnectionStatusDelegate:(id)a3;
- (void)setDeviceIdentifierType:(int64_t)a3;
- (void)setDeviceObservers:(id)a3;
- (void)setDevicePickerViewController:(id)a3;
- (void)setDeviceQuery:(id)a3;
- (void)setDeviceQueryThresholdBlock:(id)a3;
- (void)setDeviceQueryThresholdReached:(BOOL)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setEditingSessionActive:(BOOL)a3;
- (void)setFindingSession:(id)a3;
- (void)setIsFindingSessionActive:(BOOL)a3;
- (void)setIsInReducedBacklightMode:(BOOL)a3;
- (void)setIsInSecureWindow:(BOOL)a3;
- (void)setKeyboardController:(id)a3;
- (void)setKeyboardHaptic:(id)a3;
- (void)setLaunchContext:(int64_t)a3;
- (void)setLaunchContextDesc:(id)a3;
- (void)setMediaControlsViewController:(id)a3;
- (void)setMessageView:(id)a3;
- (void)setNetworkObserver:(id)a3;
- (void)setNetworkReachable:(BOOL)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setPreferredDeviceIdentifier:(id)a3;
- (void)setSessionData:(id)a3;
- (void)setSharingClient:(id)a3;
- (void)setShouldStartFindingSession:(BOOL)a3;
- (void)setSiriManager:(id)a3;
- (void)setSiriSessionActive:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setSupportsSiri:(BOOL)a3;
- (void)setSupportsVolumeControl:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTapToRadarButton:(id)a3;
- (void)setTopButtonPanelViewController:(id)a3;
- (void)setTouchpadViewController:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeDecreaseSBSInvalidator:(id)a3;
- (void)setVolumeIncreaseSBSInvalidator:(id)a3;
- (void)showGenericUnableToConnectMessage;
- (void)showLoadingSpinner;
- (void)showMessageWithError:(id)a3 andDevice:(id)a4;
- (void)showMessageWithTitle:(id)a3 message:(id)a4;
- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5;
- (void)showNoAssociatedNetworkMessage;
- (void)showNoWIFIConnectionMessage;
- (void)showPairingMessageWithCode:(id)a3;
- (void)showSearchingSpinner;
- (void)showThrottleConnectMessage;
- (void)startConnections;
- (void)stopConnections;
- (void)suggestedDevices:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)volumeDownEventGenerated;
- (void)volumeUpEventGenerated;
- (void)wifiStateDidUpdate:(int64_t)a3;
@end

@implementation TVRUIRemoteViewController

- (TVRUIRemoteViewController)init
{
  v21.receiver = self;
  v21.super_class = (Class)TVRUIRemoteViewController;
  v2 = [(TVRUIRemoteViewController *)&v21 init];
  if (v2)
  {
    v3 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v2->_styleProvider;
    v2->_styleProvider = (TVRUIStyleProvider *)v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [[TVRUITouchpadViewController alloc] initWithNibName:0 bundle:0];
    touchpadViewController = v2->_touchpadViewController;
    v2->_touchpadViewController = v6;

    [(TVRUITouchpadViewController *)v2->_touchpadViewController setTouchDelegate:v2];
    [(TVRUITouchpadViewController *)v2->_touchpadViewController setStyleProvider:v2->_styleProvider];
    [(TVRUITouchpadViewController *)v2->_touchpadViewController setEventDelegate:v2];
    [v5 addObject:v2->_touchpadViewController];
    v8 = [[TVRUIControlPanelViewController alloc] initWithNibName:0 bundle:0];
    controlPanelViewController = v2->_controlPanelViewController;
    v2->_controlPanelViewController = v8;

    [(TVRUIControlPanelViewController *)v2->_controlPanelViewController setStyleProvider:v2->_styleProvider];
    [(TVRUIControlPanelViewController *)v2->_controlPanelViewController setButtonActionsDelegate:v2];
    [v5 addObject:v2->_controlPanelViewController];
    v10 = [[TVRUIMediaControlsViewController alloc] initWithNibName:0 bundle:0];
    mediaControlsViewController = v2->_mediaControlsViewController;
    v2->_mediaControlsViewController = v10;

    [(TVRUIMediaControlsViewController *)v2->_mediaControlsViewController setStyleProvider:v2->_styleProvider];
    [(TVRUIMediaControlsViewController *)v2->_mediaControlsViewController setButtonActionsDelegate:v2];
    [v5 addObject:v2->_mediaControlsViewController];
    if ([MEMORY[0x263F7C9A8] capellaEnabled])
    {
      [(TVRUIRemoteViewController *)v2 _setupNowPlayingController];
      [v5 addObject:v2->_nowPlayingController];
    }
    [(TVRUIRemoteViewController *)v2 _setupDevicePickerController];
    [v5 addObject:v2->_devicePickerViewController];
    v12 = objc_alloc_init(TVRMessageView);
    messageView = v2->_messageView;
    v2->_messageView = v12;

    [(TVRMessageView *)v2->_messageView setStyleProvider:v2->_styleProvider];
    [(TVRMessageView *)v2->_messageView setUserInteractionEnabled:0];
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    deviceObservers = v2->_deviceObservers;
    v2->_deviceObservers = (NSArray *)v14;

    v16 = objc_alloc_init(TVRKeyboardHaptic);
    keyboardHaptic = v2->_keyboardHaptic;
    v2->_keyboardHaptic = v16;

    uint64_t v18 = +[TVRUISiriManager sharedManager];
    siriManager = v2->_siriManager;
    v2->_siriManager = (TVRUISiriManager *)v18;

    [(TVRUISiriManager *)v2->_siriManager setButtonActionsDelegate:v2];
  }
  return v2;
}

- (void)configureWithContext:(id)a3
{
  id v4 = a3;
  id v8 = [v4 deviceIdentifier];
  uint64_t v5 = [v4 deviceIdentifierType];
  uint64_t v6 = [v4 deviceType];
  uint64_t v7 = [v4 launchContext];

  [(TVRUIRemoteViewController *)self configureWithDeviceIdentifier:v8 identifierType:v5 deviceType:v6 launchContext:v7];
}

- (void)configureWithDeviceIdentifier:(id)a3 type:(int64_t)a4 showPicker:(BOOL)a5
{
}

- (void)configureWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v10 = (__CFString *)a3;
  if ([(TVRUIRemoteViewController *)self isConfigured])
  {
    v11 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(TVRUIRemoteViewController *)self activeDevice];
      v13 = [v12 name];
      int v37 = 138543362;
      v38 = v13;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "RemoteViewController is already configured with device: %{public}@", (uint8_t *)&v37, 0xCu);
    }
    uint64_t v14 = [(TVRUIRemoteViewController *)self activeDevice];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(TVRUIRemoteViewController *)self activeDevice];
      char v17 = [v16 hasIdentifier:v10];

      if ((v17 & 1) == 0) {
        [(TVRUIRemoteViewController *)self stopConnections];
      }
    }
  }
  if ([(__CFString *)v10 length])
  {
    uint64_t v18 = +[TVRUIDeviceFactory deviceWithIdentifier:v10];
    [(TVRUIRemoteViewController *)self setActiveDevice:v18];

    v19 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(TVRUIRemoteViewController *)self activeDevice];
      int v37 = 138543362;
      v38 = v20;
      _os_log_impl(&dword_227326000, v19, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v37, 0xCu);
    }
    objc_super v21 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(TVRUIRemoteViewController *)self _stringForDeviceDeviceIdentifierType:a4];
      int v37 = 138543618;
      v38 = v10;
      __int16 v39 = 2114;
      v40 = v22;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, "Configured RemoteViewController with device-id %{public}@ of type %{public}@", (uint8_t *)&v37, 0x16u);
    }
  }
  else
  {
    if (a6 != 11) {
      goto LABEL_18;
    }
    v23 = +[TVRUIDeviceFactory deviceWithIdentifier:@"Apple TV"];
    [(TVRUIRemoteViewController *)self setActiveDevice:v23];

    v24 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(TVRUIRemoteViewController *)self activeDevice];
      int v37 = 138543362;
      v38 = v25;
      _os_log_impl(&dword_227326000, v24, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v37, 0xCu);
    }
    [(TVRUIRemoteViewController *)self setActiveDeviceIdentifier:@"Apple TV"];
    objc_super v21 = _TVRUIViewControllerLog();
    a4 = 4;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [(TVRUIRemoteViewController *)self _stringForDeviceDeviceIdentifierType:4];
      int v37 = 138543618;
      v38 = @"Apple TV";
      __int16 v39 = 2114;
      v40 = v26;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, "deviceIdentifier was nil and this was from TTSU, configuring RemoteViewController with device-id %{public}@ of type %{public}@", (uint8_t *)&v37, 0x16u);
    }
  }

LABEL_18:
  [(TVRUIRemoteViewController *)self setDeviceIdentifierType:a4];
  [(TVRUIRemoteViewController *)self setDeviceType:a5];
  [(TVRUIRemoteViewController *)self setLaunchContext:a6];
  v27 = [(TVRUIRemoteViewController *)self touchpadViewController];
  objc_msgSend(v27, "transitonToViewForDeviceType:", -[TVRUIRemoteViewController deviceType](self, "deviceType"));

  v28 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  objc_msgSend(v28, "transitonToViewForDeviceType:", -[TVRUIRemoteViewController deviceType](self, "deviceType"));

  v29 = +[TVRUIDeviceQuery deviceQuery];
  [(TVRUIRemoteViewController *)self setDeviceQuery:v29];

  v30 = [(TVRUIRemoteViewController *)self _stringForLaunchContextType:a6];
  [(TVRUIRemoteViewController *)self setLaunchContextDesc:v30];

  v31 = [MEMORY[0x263F7C980] sharedInstance];
  v32 = [(TVRUIRemoteViewController *)self launchContextDesc];
  [v31 logPresentationFrom:v32];

  v33 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(TVRUIRemoteViewController *)self _stringForDeviceDeviceIdentifierType:a4];
    v35 = [(TVRUIRemoteViewController *)self launchContextDesc];
    int v37 = 138544130;
    v38 = v10;
    __int16 v39 = 2114;
    v40 = v34;
    __int16 v41 = 2048;
    int64_t v42 = a5;
    __int16 v43 = 2114;
    v44 = v35;
    _os_log_impl(&dword_227326000, v33, OS_LOG_TYPE_DEFAULT, "Configured RemoteViewController with device-id %{public}@  identifier type %{public}@ device-type %ld launch-context %{public}@", (uint8_t *)&v37, 0x2Au);
  }
  [(TVRUIRemoteViewController *)self setConfigured:1];
  if ([MEMORY[0x263F7C9A8] capellaEnabled])
  {
    v36 = [(TVRUIRemoteViewController *)self nowPlayingController];
    [v36 setViewServiceLaunchContext:a6];
  }
}

- (void)viewDidLoad
{
  v23[1] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)TVRUIRemoteViewController;
  [(TVRUIRemoteViewController *)&v22 viewDidLoad];
  [(TVRUIRemoteViewController *)self setOverrideUserInterfaceStyle:2];
  v3 = [(TVRUIRemoteViewController *)self styleProvider];
  id v4 = [v3 rootBackgroundColor];

  uint64_t v5 = [(TVRUIRemoteViewController *)self styleProvider];
  uint64_t v6 = [v5 rootBackgroundView];
  [(TVRUIRemoteViewController *)self setBackgroundView:v6];

  uint64_t v7 = [(TVRUIRemoteViewController *)self backgroundView];

  if (v7)
  {
    id v8 = [(TVRUIRemoteViewController *)self backgroundView];
    [v8 setBackgroundColor:v4];

    v9 = [(TVRUIRemoteViewController *)self view];
    v10 = [(TVRUIRemoteViewController *)self backgroundView];
    [v9 addSubview:v10];

    v11 = [(TVRUIRemoteViewController *)self backgroundView];
    [v11 setUserInteractionEnabled:0];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    v11 = [(TVRUIRemoteViewController *)self view];
    [v11 setBackgroundColor:v4];
  }

LABEL_6:
  [(TVRUIRemoteViewController *)self _setupChildViewControllers];
  [(TVRUIRemoteViewController *)self _createBlackGradientView];
  v12 = [(TVRUIRemoteViewController *)self nowPlayingController];
  v13 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v13 setMenuProvider:v12];

  uint64_t v14 = [(TVRUIRemoteViewController *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 != 1)
  {
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:self selector:sel_sceneDidActivate_ name:*MEMORY[0x263F83928] object:0];

    char v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:self selector:sel_sceneWillDeactivate_ name:*MEMORY[0x263F83950] object:0];

    uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:self selector:sel_sceneDidEnterBackground_ name:*MEMORY[0x263F83930] object:0];

    v19 = self;
    v23[0] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    objc_super v21 = [(TVRUIRemoteViewController *)self registerForTraitChanges:v20 withAction:sel_backlightLuminanceDidChange];
    [(TVRUIRemoteViewController *)self setTraitChangeRegistration:v21];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[TVRUIRemoteViewController viewDidAppear:]";
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)TVRUIRemoteViewController;
  [(TVRUIRemoteViewController *)&v7 viewDidAppear:v3];
  [(TVRUIRemoteViewController *)self startConnections];
  [(TVRUIRemoteViewController *)self _installTapToRadarButton];
  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_connectionServiceDidInvalidate_ name:*MEMORY[0x263F7CA30] object:0];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)TVRUIRemoteViewController;
  [(TVRUIRemoteViewController *)&v73 viewWillLayoutSubviews];
  BOOL v3 = [(TVRUIRemoteViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(TVRUIRemoteViewController *)self backgroundView];

  if (v12)
  {
    v13 = [(TVRUIRemoteViewController *)self styleProvider];
    [v13 rootBackgroundInsets];
    double v15 = v5 + v14;
    double v17 = v7 + v16;
    double v19 = v9 - (v14 + v18);
    double v21 = v11 - (v16 + v20);
    objc_super v22 = [(TVRUIRemoteViewController *)self backgroundView];
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);
  }
  v23 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (v23)
  {
    v24 = [(TVRUIRemoteViewController *)self styleProvider];
    [v24 deviceSafeAreaInsetTop];
    double v26 = v25;

    v27 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    v28 = [v27 view];
    objc_msgSend(v28, "setFrame:", 0.0, v26, v9, v11 - v26);

    v29 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v77.origin.x = 0.0;
      v77.origin.y = v26;
      v77.size.width = v9;
      v77.size.height = v11 - v26;
      v30 = NSStringFromCGRect(v77);
      *(_DWORD *)buf = 138412290;
      v75 = v30;
      _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_DEFAULT, "Setup device picker frame %@", buf, 0xCu);
    }
  }
  v31 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  if (v31)
  {
    v32 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    -[TVRUIRemoteViewController _layoutTouchpadExpanded:](self, "_layoutTouchpadExpanded:", [v32 isDevicePickerShowing]);
  }
  else
  {
    [(TVRUIRemoteViewController *)self _layoutTouchpadExpanded:0];
  }

  v33 = [(TVRUIRemoteViewController *)self touchpadViewController];
  v34 = [v33 view];
  [v34 frame];
  CGFloat v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  __int16 v43 = [(TVRUIRemoteViewController *)self styleProvider];
  [v43 primaryButtonSize];
  double v45 = v44;

  v46 = [(TVRUIRemoteViewController *)self styleProvider];
  LODWORD(v34) = [v46 isPad];

  if (v34)
  {
    v78.origin.x = v36;
    v78.origin.y = v38;
    v78.size.width = v40;
    v78.size.height = v42;
    double v47 = v11 - CGRectGetMaxY(v78) - v45;
    v79.origin.x = v36;
    v79.origin.y = v38;
    v79.size.width = v40;
    v79.size.height = v42;
    double v48 = CGRectGetMaxY(v79) + v47 * 0.5 + -6.0;
  }
  else
  {
    double v48 = v11 * 0.77;
  }
  v49 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v49 bottomSpacingRequired];
  double v51 = v48 - v50;

  v52 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  v53 = [v52 view];
  objc_msgSend(v53, "setFrame:", 0.0, v51, v9, v45);

  v54 = [(TVRUIRemoteViewController *)self styleProvider];
  [v54 mediaControlsViewHeight];
  double v56 = v55;

  v80.origin.x = v36;
  v80.origin.y = v38;
  v80.size.width = v40;
  v80.size.height = v42;
  CGFloat v57 = CGRectGetMaxY(v80) - v56 + -6.0;
  v58 = [(TVRUIRemoteViewController *)self styleProvider];
  [v58 touchpadInsets];
  double v60 = v59;

  v61 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  v62 = [v61 view];
  objc_msgSend(v62, "setFrame:", v60, v57, v40, v56);

  v63 = [(TVRUIRemoteViewController *)self view];
  [v63 bounds];
  double v65 = v64;
  v66 = [(TVRUIRemoteViewController *)self styleProvider];
  [v66 widthForMessagesView];
  double v68 = (v65 - v67) * 0.5;

  v69 = [(TVRUIRemoteViewController *)self styleProvider];
  [v69 widthForMessagesView];
  double v71 = v70;

  v72 = [(TVRUIRemoteViewController *)self messageView];
  objc_msgSend(v72, "setFrame:", v68, v38, v71, v42);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(TVRUIRemoteViewController *)self styleProvider];
  int v9 = [v8 isPad];

  if (v9)
  {
    double v10 = [(TVRUIRemoteViewController *)self view];
    double v11 = [v10 superview];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    if (width > height != v13 > v15)
    {
      double v16 = [(TVRUIRemoteViewController *)self nowPlayingController];
      uint64_t v17 = [v16 currentModalContext];

      if (v17)
      {
        double v18 = [(TVRUIRemoteViewController *)self nowPlayingController];
        [v18 dismissModalUI];

        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __80__TVRUIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v19[3] = &unk_264800F48;
        char v20 = 1;
        v19[4] = self;
        v19[5] = v17;
        [v7 animateAlongsideTransition:&__block_literal_global_14 completion:v19];
      }
    }
  }
}

void __80__TVRUIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) nowPlayingController];
    [v2 presentModalContext:*(void *)(a1 + 40) animated:0];
  }
}

- (void)_layoutTouchpadExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TVRUIRemoteViewController *)self styleProvider];
  [v5 touchpadInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(TVRUIRemoteViewController *)self styleProvider];
  [v12 deviceTitleHeight];
  double v14 = v13;

  double v15 = [(TVRUIRemoteViewController *)self styleProvider];
  int v16 = [v15 isPad];

  uint64_t v17 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  if (v16)
  {
    if (v17)
    {
      double v18 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      double v19 = [v18 view];
      [v19 frame];
      double v21 = v14 + v20;
    }
    else
    {
      double v18 = [(TVRUIRemoteViewController *)self view];
      [v18 safeAreaInsets];
      double v21 = v26;
    }

    double v25 = v7 + v21;
  }
  else
  {
    objc_super v22 = [(TVRUIRemoteViewController *)self view];
    v23 = v22;
    if (v17)
    {
      [v22 bounds];
      double v25 = v24 * 0.135;
    }
    else
    {
      [v22 safeAreaInsets];
      double v25 = v7 + v27;
    }
  }
  uint64_t v28 = MGGetProductType();
  uint64_t v29 = v28;
  if (v28 > 2159747552)
  {
    if (v28 == 2159747553) {
      goto LABEL_17;
    }
    if (v28 != 3885279870) {
      goto LABEL_19;
    }
LABEL_16:
    double v30 = 8.0;
LABEL_18:
    double v25 = v25 + v30;
    goto LABEL_19;
  }
  if (v28 == 1060988941) {
    goto LABEL_16;
  }
  if (v28 == 2078329141)
  {
LABEL_17:
    double v30 = 30.0;
    goto LABEL_18;
  }
LABEL_19:
  if (v3)
  {
    v31 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v31 _expandedContentHeight];
    double v33 = v32;

    v34 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v34 _calculatedContentHeight];
    double v36 = v35;
    double v37 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v37 _expandedContentHeight];
    double v39 = v38;

    if (v36 > v39)
    {
      double v40 = [(TVRUIRemoteViewController *)self blackGradientView];
      [v40 setAlpha:1.0];
    }
    double v25 = v25 + v33;
    double v41 = [(TVRUIRemoteViewController *)self styleProvider];
    [v41 touchpadHeight];
    double v43 = v42;
    double v44 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v44 _expandedContentHeight];
    double v46 = v43 - v45;
  }
  else
  {
    double v47 = [(TVRUIRemoteViewController *)self styleProvider];
    [v47 touchpadCornerRadius];
    double v49 = v48;
    double v50 = [(TVRUIRemoteViewController *)self touchpadViewController];
    double v51 = [v50 view];
    [v51 _setContinuousCornerRadius:v49];

    v52 = [(TVRUIRemoteViewController *)self blackGradientView];
    [v52 setAlpha:0.0];

    double v41 = [(TVRUIRemoteViewController *)self styleProvider];
    [v41 touchpadHeight];
    double v46 = v53;
  }

  if (v29 == 2159747553 || v29 == 2078329141) {
    double v46 = v46 + -30.0;
  }
  v54 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v54 bottomSpacingRequired];
  double v56 = v46 - v55;

  CGFloat v57 = [(TVRUIRemoteViewController *)self view];
  [v57 bounds];
  double v59 = v58;

  double v60 = [(TVRUIRemoteViewController *)self touchpadViewController];
  v61 = [v60 view];
  objc_msgSend(v61, "setFrame:", v9, v25, v59 - v9 - v11, v56);

  v62 = [(TVRUIRemoteViewController *)self styleProvider];
  [v62 deviceListRowHeight];
  double v64 = v63;

  double v65 = [(TVRUIRemoteViewController *)self blackGradientView];
  objc_msgSend(v65, "setFrame:", 0.0, v25 - v64, v59, v64);

  v66 = [(TVRUIRemoteViewController *)self blackGradientView];
  double v67 = [v66 layer];
  double v68 = [v67 sublayers];
  v69 = [v68 objectAtIndexedSubscript:0];
  objc_msgSend(v69, "setFrame:", 0.0, 0.0, v59, v64);

  id v71 = [(TVRUIRemoteViewController *)self view];
  double v70 = [(TVRUIRemoteViewController *)self blackGradientView];
  [v71 bringSubviewToFront:v70];
}

- (void)_createBlackGradientView
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  double v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setUserInteractionEnabled:0];
  double v5 = [MEMORY[0x263F157D0] layer];
  double v6 = [MEMORY[0x263F825C8] clearColor];
  double v7 = [MEMORY[0x263F825C8] blackColor];
  id v8 = v6;
  v13[0] = [v8 CGColor];
  id v9 = v7;
  v13[1] = [v9 CGColor];
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v5 setColors:v10];
  double v11 = [v3 layer];
  [v11 insertSublayer:v5 atIndex:0];

  double v12 = [(TVRUIRemoteViewController *)self view];
  [v12 addSubview:v3];

  [(TVRUIRemoteViewController *)self setBlackGradientView:v3];
}

- (void)setIsInSecureWindow:(BOOL)a3
{
  if (self->_isInSecureWindow != a3)
  {
    self->_isInSecureWindow = a3;
    [(TVRUIRemoteViewController *)self _updateSecureWindowState];
  }
}

- (void)_enableTVRemoteOnLockscreen:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v5 = [(TVRUIRemoteViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1)
  {
    double v7 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        id v8 = @"enable";
      }
      else {
        id v8 = @"disable";
      }
      id v9 = [(TVRUIRemoteViewController *)self activeDeviceIdentifier];
      int v13 = 138412546;
      double v14 = v8;
      __int16 v15 = 2114;
      int v16 = v9;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Requesting tvremoted to %@ lock screen assertion for device: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    double v10 = [MEMORY[0x263F7CA20] sharedInstance];
    double v11 = [(TVRUIRemoteViewController *)self activeDevice];
    double v12 = [v11 identifier];
    [v10 enableTVRemoteOnLockscreen:v3 forDeviceIdentifier:v12];
  }
}

- (void)_updateSecureWindowState
{
  if ([(TVRUIRemoteViewController *)self isInSecureWindow]
    && ([(TVRUIRemoteViewController *)self activeDevice],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    double v4 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewController is in a secure window", buf, 2u);
    }
    uint64_t v5 = 1;
  }
  else
  {
    double v4 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewController is NOT in a secure window", v6, 2u);
    }
    uint64_t v5 = 0;
  }

  [(TVRUIRemoteViewController *)self _enableTVRemoteOnLockscreen:v5];
}

- (BOOL)shouldDisconnectAndStopConnections
{
  BOOL v3 = [(TVRUIRemoteViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1)
  {
    uint64_t v5 = [(TVRUIRemoteViewController *)self systemMonitor];
    if ([v5 screenLocked])
    {
      BOOL v6 = [(TVRUIRemoteViewController *)self isInSecureWindow];

      if (v6) {
        return 0;
      }
    }
    else
    {
    }
  }
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v10 = "-[TVRUIRemoteViewController viewWillDisappear:]";
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([(TVRUIRemoteViewController *)self shouldDisconnectAndStopConnections])
  {
    BOOL v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v3;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "tvruiremoteviewcontroller will disappear animated=%d", buf, 8u);
    }

    if (v3) {
      [(TVRUIRemoteViewController *)self _disconnectUserInitiated];
    }
    else {
      [(TVRUIRemoteViewController *)self _disconnectSystemInitiated];
    }
    [(TVRUIRemoteViewController *)self dismissPresentedContentAnimated:v3 completion:0];
    [(TVRUIRemoteViewController *)self stopConnections];
  }
  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263F7CA30] object:0];

  v8.receiver = self;
  v8.super_class = (Class)TVRUIRemoteViewController;
  [(TVRUIRemoteViewController *)&v8 viewWillDisappear:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = [(TVRUIRemoteViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (CGSize)preferredContentSize
{
  id v2 = [(TVRUIRemoteViewController *)self styleProvider];
  [v2 remoteSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)backlightLuminanceDidChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v3 = [(TVRUIRemoteViewController *)self traitCollection];
  self->_isInReducedBacklightMode = [v3 _backlightLuminance] == 1;

  [(TVRUIRemoteViewController *)self _updateControlsAppearance];
  double v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(TVRUIRemoteViewController *)self traitCollection];
    int v6 = 134218240;
    uint64_t v7 = [v5 _backlightLuminance];
    __int16 v8 = 1024;
    BOOL v9 = [(TVRUIRemoteViewController *)self isInReducedBacklightMode];
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Backlight Luminance: %ld in AOD: %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)dealloc
{
  [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  double v3 = [(TVRUIRemoteViewController *)self traitChangeRegistration];
  [(TVRUIRemoteViewController *)self unregisterForTraitChanges:v3];

  double v4 = [(TVRUIRemoteViewController *)self authenticatingDevice];

  if (v4)
  {
    double v5 = [(TVRUIRemoteViewController *)self authenticatingDevice];
    [v5 disconnectUserInitiated];
  }
  [(TVRUIRemoteViewController *)self setFindingSession:0];
  v6.receiver = self;
  v6.super_class = (Class)TVRUIRemoteViewController;
  [(TVRUIRemoteViewController *)&v6 dealloc];
}

- (void)_setupNowPlayingController
{
  double v3 = +[TVRUINowPlayingController controllerWithHostingViewController:self];
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v3;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke;
  v7[3] = &unk_264800F90;
  objc_copyWeak(&v8, &location);
  [(TVRUINowPlayingController *)self->_nowPlayingController setCommandHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_5;
  v5[3] = &unk_264800FB8;
  objc_copyWeak(&v6, &location);
  [(TVRUINowPlayingController *)self->_nowPlayingController setCapellaInfoDidChangeHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 6;
    switch(a2)
    {
      case 0:
        uint64_t v8 = 0;
        uint64_t v9 = 7;
        goto LABEL_18;
      case 1:
        uint64_t v8 = 0;
        goto LABEL_9;
      case 2:
        uint64_t v8 = 0;
        uint64_t v9 = 5;
        goto LABEL_18;
      case 3:
        goto LABEL_18;
      case 4:
        uint64_t v8 = 0;
        goto LABEL_12;
      case 5:
        uint64_t v8 = 1;
        goto LABEL_9;
      case 6:
        uint64_t v8 = 2;
LABEL_9:
        uint64_t v9 = 14;
        goto LABEL_18;
      case 7:
        uint64_t v8 = 1;
        goto LABEL_12;
      case 8:
        uint64_t v8 = 2;
LABEL_12:
        uint64_t v9 = 15;
        goto LABEL_18;
      case 9:
        uint64_t v8 = 0;
        uint64_t v9 = 31;
        goto LABEL_18;
      case 10:
        uint64_t v8 = 0;
        uint64_t v9 = 29;
        goto LABEL_18;
      case 11:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_2;
        block[3] = &unk_2647FFF70;
        block[4] = WeakRetained;
        dispatch_async(MEMORY[0x263EF83A0], block);
        break;
      case 12:
        uint64_t v8 = 0;
        uint64_t v9 = 3;
        goto LABEL_18;
      case 14:
        uint64_t v8 = 0;
        uint64_t v9 = 9998;
LABEL_18:
        uint64_t v10 = +[TVRUIButtonEvent createButtonEvent:v8 buttonType:v9];
        [v7 generatedButtonEvent:v10];
        goto LABEL_19;
      case 15:
        uint64_t v10 = objc_msgSend(v5, "objectForKeyedSubscript:", @"TVRUINowPlayingControllerParamPlayItemInfoKey", 6);
        if (v10)
        {
          uint64_t v11 = [v7 activeDevice];
          [v11 playItem:v10 completion:&__block_literal_global_66];
        }
LABEL_19:

        break;
      default:
        break;
    }
  }
}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_2(uint64_t a1)
{
  id v2 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:3];
  [*(id *)(a1 + 32) generatedButtonEvent:v2];
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_3;
  block[3] = &unk_2647FFF70;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_3(uint64_t a1)
{
  id v2 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:3];
  [*(id *)(a1 + 32) generatedButtonEvent:v2];
}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateInfoButtonState];
    id WeakRetained = v2;
  }
}

- (void)_setupChildViewControllers
{
  [(TVRUIRemoteViewController *)self bs_addChildViewController:self->_touchpadViewController];
  [(TVRUIRemoteViewController *)self bs_addChildViewController:self->_controlPanelViewController];
  [(TVRUIRemoteViewController *)self bs_addChildViewController:self->_mediaControlsViewController];
  dispatch_time_t v3 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [(TVRUIRemoteViewController *)self bs_addChildViewController:v3];

  double v4 = [(TVRUIRemoteViewController *)self view];
  id v5 = [(TVRUIRemoteViewController *)self messageView];
  [v4 addSubview:v5];

  id v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Setup remote child controllers and message view", v9, 2u);
  }

  uint64_t v7 = [(TVRUIRemoteViewController *)self view];
  [v7 setNeedsLayout];

  uint64_t v8 = [(TVRUIRemoteViewController *)self view];
  [v8 layoutIfNeeded];
}

- (void)_setupDevicePickerController
{
  dispatch_time_t v3 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (!v3)
  {
    double v4 = objc_alloc_init(TVRUIDevicePickerViewController);
    [(TVRUIRemoteViewController *)self setDevicePickerViewController:v4];

    id v5 = [(TVRUIRemoteViewController *)self styleProvider];
    id v6 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v6 setStyleProvider:v5];

    uint64_t v7 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v7 setDelegate:self];

    uint64_t v8 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v8 setButtonEventDelegate:self];

    uint64_t v9 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v9 setEnabled:1];

    uint64_t v10 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    tipSourceViewProvider = self->_tipSourceViewProvider;
    self->_tipSourceViewProvider = v10;
    MEMORY[0x270F9A758](v10, tipSourceViewProvider);
  }
}

- (id)_stringForLaunchContextType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id result = @"controlCenter";
      break;
    case 2:
      id result = @"lockscreen";
      break;
    case 3:
      id result = @"mediaPlatterHome";
      break;
    case 4:
      id result = @"siriShortcut";
      break;
    case 5:
      id result = @"mediaPlatterControlCenter";
      break;
    case 6:
      id result = @"mediaPlatterLockscreen";
      break;
    case 7:
      id result = @"mediaPlatterSiri";
      break;
    case 8:
      id result = @"mediaPlatter";
      break;
    case 9:
      id result = @"siri";
      break;
    case 10:
      id result = @"continuityKeyboard";
      break;
    case 11:
      id result = @"tapToSetup";
      break;
    case 12:
      id result = @"expanse";
      break;
    case 13:
      id result = @"jindo";
      break;
    case 14:
      id result = @"controlCenterLockscreen";
      break;
    default:
      if (a3 == 100) {
        id result = @"internalDevelopment";
      }
      else {
        id result = @"unspecified";
      }
      break;
  }
  return result;
}

- (id)animatorForPresentationAsAlert
{
  id v2 = [(TVRUIRemoteViewController *)self traitCollection];
  dispatch_time_t v3 = +[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", [v2 userInterfaceIdiom]);

  double v4 = [[TVRUIAlertAnimationController alloc] initWithAnimationType:0 visualStyle:v3];
  return v4;
}

- (id)animatorForDismissalAsAlert
{
  id v2 = [(TVRUIRemoteViewController *)self traitCollection];
  dispatch_time_t v3 = +[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", [v2 userInterfaceIdiom]);

  double v4 = [[TVRUIAlertAnimationController alloc] initWithAnimationType:1 visualStyle:v3];
  return v4;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  id v5 = [(TVRUIRemoteViewController *)self backgroundView];
  id v7 = v5;
  if (v5)
  {
    [v5 _setContinuousCornerRadius:a3];
  }
  else
  {
    id v6 = [(TVRUIRemoteViewController *)self view];
    [v6 _setContinuousCornerRadius:a3];
  }
}

- (double)backgroundCornerRadius
{
  dispatch_time_t v3 = [(TVRUIRemoteViewController *)self backgroundView];
  double v4 = v3;
  if (v3)
  {
    [v3 _continuousCornerRadius];
    double v6 = v5;
  }
  else
  {
    id v7 = [(TVRUIRemoteViewController *)self view];
    [v7 _continuousCornerRadius];
    double v6 = v8;
  }
  return v6;
}

- (void)startConnections
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v38 = "-[TVRUIRemoteViewController startConnections]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  double v4 = [(TVRUIRemoteViewController *)self deviceQuery];
  if (v4)
  {
    double v5 = [(TVRUIRemoteViewController *)self deviceQuery];
    char v6 = [v5 hasStarted];

    if ((v6 & 1) == 0)
    {
      id v7 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Starting device query", buf, 2u);
      }

      [(TVRUIRemoteViewController *)self fetchPreferredDeviceIdentifier];
      double v8 = [(TVRUIRemoteViewController *)self deviceQuery];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __45__TVRUIRemoteViewController_startConnections__block_invoke;
      v36[3] = &unk_264800FE0;
      v36[4] = self;
      [v8 startQuery:self completionHandler:v36];

      [(TVRUIRemoteViewController *)self performSelector:sel__showSearchingSpinnerIfNeeded withObject:0 afterDelay:2.0];
    }
  }
  uint64_t v9 = [(TVRUIRemoteViewController *)self sharingClient];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F6C1F0]);
    [(TVRUIRemoteViewController *)self setSharingClient:v11];

    double v12 = [(TVRUIRemoteViewController *)self sharingClient];
    [v12 activateAssertionWithIdentifier:@"com.apple.sharing.PreventContinuityKeyboard"];

    int v13 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Activated assertion to prevent Continuity Keyboard", buf, 2u);
    }
  }
  double v14 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(TVRUIRemoteViewController *)self activeDevice];
    *(_DWORD *)buf = 138543362;
    double v38 = v15;
    _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_DEFAULT, "Active device: %{public}@", buf, 0xCu);
  }
  int v16 = [(TVRUIRemoteViewController *)self activeDevice];
  int v17 = [v16 isConnected];

  if (v17)
  {
    double v18 = [(TVRUIRemoteViewController *)self deviceConnectionStatusDelegate];
    [v18 deviceDidConnect];
  }
  double v19 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v19)
  {
    double v20 = [(TVRUIRemoteViewController *)self activeDevice];
    if ([v20 isConnecting])
    {
    }
    else
    {
      double v21 = [(TVRUIRemoteViewController *)self activeDevice];
      char v22 = [v21 isConnected];

      if (v22) {
        goto LABEL_22;
      }
      int64_t v23 = [(TVRUIRemoteViewController *)self _connectionContextFromLaunchContext:[(TVRUIRemoteViewController *)self launchContext]];
      double v19 = [(TVRUIRemoteViewController *)self activeDevice];
      [(TVRUIRemoteViewController *)self _connectToDevice:v19 connectionContext:v23];
    }
  }
LABEL_22:
  [(TVRUIRemoteViewController *)self _setupNetworkObserverIfNeeded];
  double v24 = [(TVRUIRemoteViewController *)self systemMonitor];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    id v26 = objc_alloc_init(MEMORY[0x263F385E0]);
    [(TVRUIRemoteViewController *)self setSystemMonitor:v26];

    objc_initWeak((id *)buf, self);
    double v27 = [(TVRUIRemoteViewController *)self systemMonitor];
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    double v33 = __45__TVRUIRemoteViewController_startConnections__block_invoke_127;
    v34 = &unk_264800468;
    objc_copyWeak(&v35, (id *)buf);
    [v27 setScreenLockedChangedHandler:&v31];

    uint64_t v28 = [(TVRUIRemoteViewController *)self systemMonitor];
    [v28 activateWithCompletion:&__block_literal_global_136];

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  if ([(TVRUIRemoteViewController *)self supportsSiri])
  {
    uint64_t v29 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_DEFAULT, "Registering for Siri Events", buf, 2u);
    }

    double v30 = [(TVRUIRemoteViewController *)self siriManager];
    [v30 registerForSiriEvents];
  }
  [(TVRUIRemoteViewController *)self _initSessionStatistics];
}

uint64_t __45__TVRUIRemoteViewController_startConnections__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _startDeviceQueryThresholdTimer];
  }
  return result;
}

void __45__TVRUIRemoteViewController_startConnections__block_invoke_127(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_time_t v3 = [WeakRetained systemMonitor];
    int v4 = [v3 screenLocked];

    double v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = @"unlocked";
      if (v4) {
        char v6 = @"locked";
      }
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v8, 0xCu);
    }

    if (v4)
    {
      id v7 = [v2 nowPlayingController];
      [v7 dismissModalUI];
    }
  }
}

void __45__TVRUIRemoteViewController_startConnections__block_invoke_134()
{
  v0 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_227326000, v0, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v1, 2u);
  }
}

- (void)stopConnections
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315138;
    double v30 = "-[TVRUIRemoteViewController stopConnections]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v29, 0xCu);
  }

  int v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    double v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "UI has active device. Calling disconnect on device", (uint8_t *)&v29, 2u);
    }

    char v6 = [(TVRUIRemoteViewController *)self systemMonitor];
    int v7 = [v6 screenLocked];

    if (v7) {
      [(TVRUIRemoteViewController *)self _disconnectSystemInitiated];
    }
    else {
      [(TVRUIRemoteViewController *)self _disconnectUserInitiated];
    }
    [(TVRUIRemoteViewController *)self _updateSecureWindowState];
  }
  int v8 = [(TVRUIRemoteViewController *)self authenticatingDevice];

  if (v8)
  {
    uint64_t v9 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Found an authenticating device. Requesting disconnect", (uint8_t *)&v29, 2u);
    }

    uint64_t v10 = [(TVRUIRemoteViewController *)self authenticatingDevice];
    [v10 disconnectUserInitiated];
  }
  id v11 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (v11)
  {
    double v12 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v12 resetSelectedDevice];
  }
  int v13 = [(TVRUIRemoteViewController *)self deviceQuery];

  if (v13)
  {
    double v14 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_DEFAULT, "Stopping device query", (uint8_t *)&v29, 2u);
    }

    __int16 v15 = [(TVRUIRemoteViewController *)self deviceQuery];
    [v15 stop];

    [(TVRUIRemoteViewController *)self setDeviceQuery:0];
    [(TVRUIRemoteViewController *)self _stopDeviceQueryThresholdTimer];
  }
  int v16 = [(TVRUIRemoteViewController *)self sharingClient];

  if (v16)
  {
    int v17 = [(TVRUIRemoteViewController *)self sharingClient];
    [v17 invalidate];

    [(TVRUIRemoteViewController *)self setSharingClient:0];
    double v18 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_227326000, v18, OS_LOG_TYPE_DEFAULT, "Invalidated sharing client", (uint8_t *)&v29, 2u);
    }
  }
  double v19 = [(TVRUIRemoteViewController *)self systemMonitor];

  if (v19)
  {
    double v20 = [(TVRUIRemoteViewController *)self systemMonitor];
    [v20 invalidate];

    [(TVRUIRemoteViewController *)self setSystemMonitor:0];
    double v21 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, "system monitor for screen locked state invalidated", (uint8_t *)&v29, 2u);
    }
  }
  char v22 = [(TVRUIRemoteViewController *)self networkObserver];

  if (v22) {
    [(TVRUIRemoteViewController *)self setNetworkObserver:0];
  }
  [(TVRUIRemoteViewController *)self setSupportsVolumeControl:0];
  int64_t v23 = [(TVRUIRemoteViewController *)self siriManager];
  [v23 unregisterForSiriEvents];

  double v24 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v24 setDevices:MEMORY[0x263EFFA68]];

  if (+[TVRUIFeatures corianderEnabled])
  {
    BOOL v25 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v25 setSuggestedDevices:MEMORY[0x263EFFA68]];
  }
  id v26 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v26 collapseDeviceList];

  [(TVRUIRemoteViewController *)self setConfigured:0];
  double v27 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  [v27 setEnabled:0];

  uint64_t v28 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v28 dismissModalUI];

  [(TVRUIRemoteViewController *)self _logSessionStatistics];
}

- (void)_disconnectUserInitiated
{
}

- (void)_disconnectUserInitiatedAndModifyLockscreenAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v5)
  {
    char v6 = [(TVRUIRemoteViewController *)self activeDevice];
    [(TVRUIRemoteViewController *)self _stopFindingSessionForDevice:v6];

    if (v3) {
      [(TVRUIRemoteViewController *)self _enableTVRemoteOnLockscreen:0];
    }
    int v7 = [(TVRUIRemoteViewController *)self activeDevice];
    [v7 disconnectUserInitiated];

    [(TVRUIRemoteViewController *)self _resetActiveDevice];
    [(TVRUIRemoteViewController *)self _enableMediaControls:0 animated:0];
    [(TVRUIRemoteViewController *)self _enableLiveTVButtons:0 animated:0];
    int v8 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      uint64_t v9 = "#tvrlock - user initiated disconnect called on active device";
      uint64_t v10 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    int v8 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      uint64_t v9 = "#tvrlock - user initiated disconnect, but device is NOT ACTIVE";
      uint64_t v10 = (uint8_t *)&v11;
      goto LABEL_8;
    }
  }
}

- (void)_disconnectSystemInitiated
{
  BOOL v3 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v3)
  {
    int v4 = [(TVRUIRemoteViewController *)self activeDevice];
    [(TVRUIRemoteViewController *)self _stopFindingSessionForDevice:v4];

    [(TVRUIRemoteViewController *)self _enableTVRemoteOnLockscreen:0];
    double v5 = [(TVRUIRemoteViewController *)self activeDevice];
    [v5 disconnectSystemInitiated];

    [(TVRUIRemoteViewController *)self _resetActiveDevice];
    [(TVRUIRemoteViewController *)self _enableMediaControls:0 animated:0];
    [(TVRUIRemoteViewController *)self _enableLiveTVButtons:0 animated:0];
    char v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      int v7 = "#tvrlock - system initiated disconnect called on active device";
      int v8 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    char v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      int v7 = "#tvrlock - system initiated disconnect, but device is NOT ACTIVE";
      int v8 = (uint8_t *)&v9;
      goto LABEL_6;
    }
  }
}

- (void)_resetActiveDevice
{
  BOOL v3 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v3)
  {
    int v4 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Resetting active device", v7, 2u);
    }

    double v5 = [(TVRUIRemoteViewController *)self activeDevice];
    [v5 setDelegate:0];

    [(TVRUIRemoteViewController *)self setActiveDevice:0];
  }
  [(TVRUIRemoteViewController *)self setActiveDeviceIdentifier:0];
  char v6 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v6 setNowPlayingInfo:0];
}

- (void)_initSessionStatistics
{
  id v3 = objc_alloc_init(MEMORY[0x263F7C9E8]);
  [(TVRUIRemoteViewController *)self setSessionData:v3];

  int v4 = [MEMORY[0x263EFF910] date];
  double v5 = [(TVRUIRemoteViewController *)self sessionData];
  [v5 setSessionStartTime:v4];

  char v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Initialized session stats", v7, 2u);
  }
}

- (void)_logSessionStatistics
{
  id v3 = [(TVRUIRemoteViewController *)self sessionData];

  if (v3)
  {
    int v4 = [(TVRUIRemoteViewController *)self launchContextDesc];
    double v5 = [(TVRUIRemoteViewController *)self sessionData];
    [v5 setLaunchContextDesc:v4];

    char v6 = [MEMORY[0x263F7C980] sharedInstance];
    int v7 = [(TVRUIRemoteViewController *)self sessionData];
    [v6 logSessionStatistics:v7];

    [(TVRUIRemoteViewController *)self setSessionData:0];
    int v8 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v9 = 0;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Logged session stats", v9, 2u);
    }
  }
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = [a3 object];
  double v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[TVRUIRemoteViewController sceneDidActivate:]";
    __int16 v8 = 2114;
    __int16 v9 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(TVRUIRemoteViewController *)self _activate];
}

- (void)sceneWillDeactivate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = [a3 object];
  double v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[TVRUIRemoteViewController sceneWillDeactivate:]";
    __int16 v8 = 2114;
    __int16 v9 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(TVRUIRemoteViewController *)self _deactivate];
}

- (void)_activate
{
  [(TVRUIRemoteViewController *)self startConnections];
  if ([(TVRUIRemoteViewController *)self isInSecureWindow])
  {
    uint64_t v3 = [(TVRUIRemoteViewController *)self presentedViewController];
    if (v3)
    {
      int v4 = (void *)v3;
      double v5 = [(TVRUIRemoteViewController *)self presentedViewController];
      int v6 = [(TVRUIRemoteViewController *)self keyboardController];

      if (v5 == v6)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __38__TVRUIRemoteViewController__activate__block_invoke;
        v7[3] = &unk_2647FFF70;
        void v7[4] = self;
        [(TVRUIRemoteViewController *)self dismissPresentedContentAnimated:0 completion:v7];
      }
    }
  }
}

uint64_t __38__TVRUIRemoteViewController__activate__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) presentedViewController];
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Relaunching keyboard. presentedViewController:%@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) keyboardRequested];
}

- (void)_deactivate
{
  id v2 = [(TVRUIRemoteViewController *)self siriManager];
  [v2 unregisterForSiriEvents];
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = [a3 object];
  int v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[TVRUIRemoteViewController sceneDidEnterBackground:]";
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v7, 0x16u);
  }

  if ([(TVRUIRemoteViewController *)self isInSecureWindow])
  {
    int v6 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Not disconnecting the connection the TV as we are transitioning to a secure window", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    [(TVRUIRemoteViewController *)self _disconnect];
  }
}

- (void)_disconnect
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    double v24 = "-[TVRUIRemoteViewController _disconnect]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v23, 0xCu);
  }

  int v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    int v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "UI has active device. Calling disconnect on device", (uint8_t *)&v23, 2u);
    }

    [(TVRUIRemoteViewController *)self _disconnectUserInitiated];
  }
  int v6 = [(TVRUIRemoteViewController *)self authenticatingDevice];

  if (v6)
  {
    int v7 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Found an authenticating device. Requesting disconnect", (uint8_t *)&v23, 2u);
    }

    __int16 v8 = [(TVRUIRemoteViewController *)self authenticatingDevice];
    [v8 disconnectUserInitiated];
  }
  __int16 v9 = [(TVRUIRemoteViewController *)self deviceQuery];
  int v10 = [v9 hasStarted];

  if (v10)
  {
    uint64_t v11 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Stopping device query", (uint8_t *)&v23, 2u);
    }

    __int16 v12 = [(TVRUIRemoteViewController *)self deviceQuery];
    [v12 stop];

    [(TVRUIRemoteViewController *)self _stopDeviceQueryThresholdTimer];
  }
  int v13 = [(TVRUIRemoteViewController *)self sharingClient];

  if (v13)
  {
    double v14 = [(TVRUIRemoteViewController *)self sharingClient];
    [v14 invalidate];

    [(TVRUIRemoteViewController *)self setSharingClient:0];
    __int16 v15 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_227326000, v15, OS_LOG_TYPE_DEFAULT, "Invalidated sharing client", (uint8_t *)&v23, 2u);
    }
  }
  int v16 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (v16)
  {
    int v17 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v17 resetSelectedDevice];

    if (+[TVRUIFeatures corianderEnabled])
    {
      double v18 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      [v18 setSuggestedDevices:MEMORY[0x263EFFA68]];
    }
    double v19 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v19 setDevices:MEMORY[0x263EFFA68]];

    double v20 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v20 collapseDeviceList];
  }
  double v21 = [(TVRUIRemoteViewController *)self networkObserver];

  if (v21) {
    [(TVRUIRemoteViewController *)self setNetworkObserver:0];
  }
  [(TVRUIRemoteViewController *)self setSupportsVolumeControl:0];
  [(TVRUIRemoteViewController *)self _toggleControlAvailability];
  char v22 = [(TVRUIRemoteViewController *)self siriManager];
  [v22 unregisterForSiriEvents];

  [(TVRUIRemoteViewController *)self setConfigured:0];
  [(TVRUIRemoteViewController *)self _logSessionStatistics];
}

- (void)fetchPreferredDeviceIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F7C9E0] sharedInstance];
  int v4 = [v3 preferredDeviceIdentifier];
  [(TVRUIRemoteViewController *)self setPreferredDeviceIdentifier:v4];

  int v5 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];

  int v6 = _TVRUIViewControllerLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      __int16 v8 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Found preferredDeviceIdentifier %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "No preferredDeviceIdentifier found", (uint8_t *)&v9, 2u);
  }
}

- (void)_connectToDevice:(id)a3 connectionContext:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [(TVRUIRemoteViewController *)self _stringForConnectionContext:a4];
    int v16 = 138543618;
    id v17 = v6;
    __int16 v18 = 2112;
    double v19 = v8;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Requesting connect to device=%{public}@ with connectionContext:%@", (uint8_t *)&v16, 0x16u);
  }
  [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
  [(TVRUIRemoteViewController *)self _cancelShowConnectingSpinner];
  [(TVRUIRemoteViewController *)self performSelector:sel__showConnectingSpinner withObject:0 afterDelay:0.7];
  [v6 setDelegate:self];
  [v6 connectWithConnectionContext:a4];
  uint64_t v9 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  if (v9)
  {
    int v10 = (void *)v9;
    uint64_t v11 = [v6 name];

    if (v11)
    {
      __int16 v12 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      [v12 setDevice:v6];

      int v13 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      int v14 = [v13 isDevicePickerShowing];

      if (v14)
      {
        __int16 v15 = [(TVRUIRemoteViewController *)self devicePickerViewController];
        [v15 collapseDeviceList];
      }
    }
  }
}

- (void)_updateControlsAppearance
{
  uint64_t v3 = [(TVRUIRemoteViewController *)self isInReducedBacklightMode] ^ 1;
  if ([(TVRUIRemoteViewController *)self isInReducedBacklightMode])
  {
    int v4 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v4 collapseDeviceList];
  }
  int v5 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  char v6 = [v5 isDevicePickerShowing];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v7 setEnabled:v3];
  }
  __int16 v8 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v8 setEnabled:v3];

  uint64_t v9 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  [v9 setEnabled:v3];

  [(TVRUIRemoteViewController *)self _toggleControlAvailability];
  if ([(TVRUIRemoteViewController *)self isInReducedBacklightMode])
  {
    if ([(TVRUIRemoteViewController *)self hasPresentedContent])
    {
      int v10 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "Dismissing presented content", buf, 2u);
      }

      [(TVRUIRemoteViewController *)self dismissPresentedContentAnimated:0 completion:0];
    }
  }
  else if ([(TVRUIRemoteViewController *)self isEditingSessionActive])
  {
    uint64_t v11 = [(TVRUIRemoteViewController *)self keyboardController];

    if (!v11)
    {
      __int16 v12 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_227326000, v12, OS_LOG_TYPE_DEFAULT, "Launching keyboard view controller", v14, 2u);
      }

      [(TVRUIRemoteViewController *)self keyboardRequested];
    }
  }
  if ([(TVRUIRemoteViewController *)self isInReducedBacklightMode])
  {
    int v13 = [(TVRUIRemoteViewController *)self nowPlayingController];
    [v13 dismissModalUI];
  }
}

- (void)_toggleControlAvailability
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(TVRUIRemoteViewController *)self activeDevice];
    int v5 = [v4 identifier];
    char v6 = [(TVRUIRemoteViewController *)self activeDevice];
    int v11 = 138543618;
    __int16 v12 = v5;
    __int16 v13 = 1024;
    int v14 = [v6 isConnected];
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Toggling control panel controls. active device %{public}@. isConnected %d", (uint8_t *)&v11, 0x12u);
  }
  uint64_t v7 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v7)
  {
    __int16 v8 = [(TVRUIRemoteViewController *)self activeDevice];
    int v9 = [v8 isConnected];

    if (v9) {
      uint64_t v7 = [(TVRUIRemoteViewController *)self isInReducedBacklightMode] ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  int v10 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  [v10 setEnabled:v7];
}

- (void)_startDeviceQueryThresholdTimer
{
  objc_initWeak(&location, self);
  if (self->_deviceQueryThresholdBlock)
  {
    if ([(TVRUIRemoteViewController *)self deviceQueryThresholdReached])
    {
      uint64_t v3 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Unable to cancel deviceQueryThresholdTimer as the query threshold was reached", buf, 2u);
      }
    }
    else
    {
      [(TVRUIRemoteViewController *)self _stopDeviceQueryThresholdTimer];
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController__startDeviceQueryThresholdTimer__block_invoke;
  block[3] = &unk_264800468;
  objc_copyWeak(&v15, &location);
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id deviceQueryThresholdBlock = self->_deviceQueryThresholdBlock;
  self->_id deviceQueryThresholdBlock = v4;

  char v6 = [MEMORY[0x263F7C9E0] sharedInstance];
  [v6 preferredDeviceSearchTimeout];
  double v8 = v7;

  int v9 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Started deviceQueryThresholdTimer", buf, 2u);
  }

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  id v11 = MEMORY[0x263EF83A0];
  __int16 v12 = [(TVRUIRemoteViewController *)self deviceQueryThresholdBlock];
  __int16 v13 = (void *)MEMORY[0x263EF83A0];
  dispatch_after(v10, MEMORY[0x263EF83A0], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__TVRUIRemoteViewController__startDeviceQueryThresholdTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setDeviceQueryThresholdReached:1];
    uint64_t v3 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Query threshold reached", v7, 2u);
    }

    [v2 _connectToMostRelevantDevice];
    dispatch_block_t v4 = [MEMORY[0x263F7C980] sharedInstance];
    int v5 = [v2 devicePickerViewController];
    char v6 = [v5 devices];
    objc_msgSend(v4, "logDeviceQueryCount:", objc_msgSend(v6, "count"));
  }
}

- (void)_stopDeviceQueryThresholdTimer
{
  uint64_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Stopping deviceQueryThresholdTimer", v7, 2u);
  }

  dispatch_block_t v4 = [(TVRUIRemoteViewController *)self deviceQueryThresholdBlock];

  if (v4)
  {
    int v5 = [(TVRUIRemoteViewController *)self deviceQueryThresholdBlock];
    dispatch_block_cancel(v5);

    id deviceQueryThresholdBlock = self->_deviceQueryThresholdBlock;
    self->_id deviceQueryThresholdBlock = 0;
  }
  [(TVRUIRemoteViewController *)self setDeviceQueryThresholdReached:0];
}

- (void)_connectToMostRelevantDevice
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to connect to the most relevant device", buf, 2u);
  }

  if (![(TVRUIRemoteViewController *)self deviceQueryThresholdReached])
  {
    int v9 = _TVRUIViewControllerLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    id v15 = "Query threshold not reached. Ignoring call";
    int v16 = v9;
    uint32_t v17 = 2;
LABEL_15:
    _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_28;
  }
  uint64_t v4 = [(TVRUIRemoteViewController *)self deviceQuery];
  if (!v4
    || (int v5 = (void *)v4,
        [(TVRUIRemoteViewController *)self deviceQuery],
        char v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 hasStarted],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    int v9 = _TVRUIViewControllerLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    double v46 = "-[TVRUIRemoteViewController _connectToMostRelevantDevice]";
    id v15 = "%s - deviceQuery was invalidated";
    int v16 = v9;
    uint32_t v17 = 12;
    goto LABEL_15;
  }
  double v8 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  int v9 = [v8 devices];

  dispatch_time_t v10 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    double v46 = (const char *)v11;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Queried devices count: %ld", buf, 0xCu);
  }

  __int16 v12 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v12 || [v9 count] != 1)
  {
    int v14 = 0;
  }
  else
  {
    __int16 v13 = [v9 objectAtIndexedSubscript:0];
    int v14 = [v13 isPaired];
  }
  __int16 v18 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v14;
    _os_log_impl(&dword_227326000, v18, OS_LOG_TYPE_DEFAULT, "Query threshold reached. canAutoconnect to single device = %d", buf, 8u);
  }

  if (v14)
  {
    double v19 = [v9 objectAtIndexedSubscript:0];
    [(TVRUIRemoteViewController *)self setActiveDevice:v19];

    uint64_t v20 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      double v21 = [(TVRUIRemoteViewController *)self activeDevice];
      *(_DWORD *)buf = 138543362;
      double v46 = v21;
      _os_log_impl(&dword_227326000, v20, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", buf, 0xCu);
    }
    char v22 = [(TVRUIRemoteViewController *)self activeDevice];
    [(TVRUIRemoteViewController *)self _connectToDevice:v22 connectionContext:3];
LABEL_27:

    goto LABEL_28;
  }
  int v23 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v23 || ![v9 count])
  {

    goto LABEL_25;
  }
  double v27 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  char v28 = [v27 isDevicePickerShowing];

  if (v28)
  {
LABEL_25:
    char v22 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v24 = [(TVRUIRemoteViewController *)self activeDevice];
      uint64_t v25 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      int v26 = [v25 isDevicePickerShowing];
      *(_DWORD *)buf = 138412546;
      double v46 = v24;
      __int16 v47 = 1024;
      int v48 = v26;
      _os_log_impl(&dword_227326000, v22, OS_LOG_TYPE_DEFAULT, "Failed to find a relevant TV. Active device :%@ isShowingDevicePicker: %d", buf, 0x12u);
    }
    goto LABEL_27;
  }
  if (!+[TVRUIFeatures corianderEnabled])
  {
    v34 = _TVRUIViewControllerLog();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
LABEL_44:

      [(TVRUIRemoteViewController *)self _expandDeviceList];
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    id v35 = "Showing device picker after query threshold reached";
LABEL_43:
    _os_log_impl(&dword_227326000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    goto LABEL_44;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v9 = v9;
  uint64_t v29 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v42;
LABEL_34:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v42 != v31) {
        objc_enumerationMutation(v9);
      }
      double v33 = *(void **)(*((void *)&v41 + 1) + 8 * v32);
      if (objc_msgSend(v33, "classification", (void)v41) == 1) {
        break;
      }
      if (v30 == ++v32)
      {
        uint64_t v30 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v30) {
          goto LABEL_34;
        }
        goto LABEL_40;
      }
    }
    char v22 = v33;
    double v36 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v46 = (const char *)v22;
      _os_log_impl(&dword_227326000, v36, OS_LOG_TYPE_DEFAULT, "Found suggested device to auto select: %@", buf, 0xCu);
    }

    if (v22)
    {
      double v37 = _TVRUIIRLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v46 = (const char *)v22;
        _os_log_impl(&dword_227326000, v37, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to connect to suggested device: %@", buf, 0xCu);
      }

      [(TVRUIRemoteViewController *)self _selectDevice:v22 withConnectionContext:3];
      goto LABEL_27;
    }
  }
  else
  {
LABEL_40:
  }
  double v38 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];

  if (!v38)
  {
    v34 = _TVRUIViewControllerLog();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v35 = "Query threshold reached. Showing device picker";
    goto LABEL_43;
  }
  uint64_t v39 = _TVRUIIRLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    double v40 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
    *(_DWORD *)buf = 138412290;
    double v46 = v40;
    _os_log_impl(&dword_227326000, v39, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to connect to last selected device with id: %@", buf, 0xCu);
  }
  [(TVRUIRemoteViewController *)self _connectToPreferredDeviceFromDeviceList:v9];
LABEL_28:
}

- (void)deviceBeganConnecting:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 identifier];
    int v6 = 138412290;
    char v7 = v5;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "UI device callback - began connecting %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)deviceDidConnect:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "UI Device callback - did connect %@. Now messaging child view controllers", buf, 0xCu);
  }
  char v7 = [(TVRUIRemoteViewController *)self activeDevice];
  int v8 = [v7 isEqualToDevice:v4];

  if (v8)
  {
    int v9 = [(TVRUIRemoteViewController *)self deviceObservers];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __46__TVRUIRemoteViewController_deviceDidConnect___block_invoke;
    v30[3] = &unk_264801008;
    v30[4] = self;
    [v9 enumerateObjectsUsingBlock:v30];

    dispatch_time_t v10 = [v4 identifier];
    [(TVRUIRemoteViewController *)self setActiveDeviceIdentifier:v10];

    uint64_t v11 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(TVRUIRemoteViewController *)self activeDevice];
      __int16 v13 = [v12 name];
      int v14 = [(TVRUIRemoteViewController *)self activeDevice];
      id v15 = [v14 identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v13;
      __int16 v33 = 2114;
      v34 = v15;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Active device did connect name: %{public}@ identifier: %{public}@", buf, 0x16u);
    }
  }
  int v16 = [(TVRUIRemoteViewController *)self authenticatingDevice];
  int v17 = [v4 isEqualToDevice:v16];

  if (v17) {
    [(TVRUIRemoteViewController *)self setAuthenticatingDevice:0];
  }
  __int16 v18 = [(TVRUIRemoteViewController *)self deviceConnectionStatusDelegate];
  [v18 deviceDidConnect];

  if ([(TVRUIRemoteViewController *)self shouldStartFindingSession])
  {
    [(TVRUIRemoteViewController *)self _startFindingSessionForDevice:v4];
    [(TVRUIRemoteViewController *)self setShouldStartFindingSession:0];
  }
  [(TVRUIRemoteViewController *)self _toggleControlAvailability];
  [(TVRUIRemoteViewController *)self _hideMessageContent];
  [(TVRUIRemoteViewController *)self _cancelShowConnectingSpinner];
  [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
  [(TVRUIRemoteViewController *)self _stopDeviceQueryThresholdTimer];
  double v19 = [(TVRUIRemoteViewController *)self activeDevice];
  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", [v19 supportsVolumeControl]);

  uint64_t v20 = [(TVRUIRemoteViewController *)self activeDevice];
  char v21 = [v20 supportsLaunchingApplications];

  if ((v21 & 1) == 0) {
    [(TVRUIRemoteViewController *)self _disableSearch];
  }
  char v22 = [(TVRUIRemoteViewController *)self activeDevice];
  int v23 = [v22 supportsDonatingIntents];

  if (v23)
  {
    double v24 = [(TVRUIRemoteViewController *)self activeDevice];
    uint64_t v25 = [v24 identifier];
    int v26 = [(TVRUIRemoteViewController *)self activeDevice];
    double v27 = [v26 name];
    +[TVRUIIntentManager donateIntentsForDeviceWithID:v25 name:v27];
  }
  char v28 = [(TVRUIRemoteViewController *)self activeDevice];
  if (![v28 supportsTouchEvents]) {
    goto LABEL_18;
  }
  int v29 = _AXSAppleTVRemoteUsesSimpleGestures();

  if (v29)
  {
    char v28 = [(TVRUIRemoteViewController *)self sessionData];
    [v28 setDirectionalControlsEnabled:1];
LABEL_18:
  }
  [(TVRUIRemoteViewController *)self _enableTVRemoteOnLockscreen:1];
  [(TVRUIRemoteViewController *)self _layoutTouchpadExpanded:0];
}

uint64_t __46__TVRUIRemoteViewController_deviceDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDevice:*(void *)(*(void *)(a1 + 32) + 992)];
}

- (void)deviceDidDisconnect:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(TVRUIRemoteViewController *)self isNetworkReachable];
  uint64_t v11 = _TVRUIViewControllerLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      __int16 v13 = [(TVRUIRemoteViewController *)self activeDevice];
      int v14 = [(TVRUIRemoteViewController *)self authenticatingDevice];
      *(_DWORD *)buf = 138413314;
      id v34 = v8;
      __int16 v35 = 2048;
      int64_t v36 = a4;
      __int16 v37 = 2114;
      id v38 = v9;
      __int16 v39 = 2112;
      double v40 = v13;
      __int16 v41 = 2112;
      long long v42 = v14;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Device disconnected - %@. Reason %ld. Error %{public}@. ActiveDevice %@, Auth Device %@", buf, 0x34u);
    }
    id v15 = [(TVRUIRemoteViewController *)self activeDevice];
    int v16 = [v8 isEqualToDevice:v15];

    if (v16)
    {
      int v17 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "Current device disconnected", buf, 2u);
      }

      [(TVRUIRemoteViewController *)self _resetActiveDevice];
      __int16 v18 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      [v18 resetSelectedDevice];

      double v19 = [(TVRUIRemoteViewController *)self siriManager];
      [v19 unregisterForSiriEvents];

      uint64_t v20 = [(TVRUIRemoteViewController *)self authenticatingDevice];
      if ([v8 isEqualToDevice:v20])
      {
        BOOL v21 = [(TVRUIRemoteViewController *)self isNetworkReachable];

        if (v21)
        {
          char v22 = _TVRUIViewControllerLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_227326000, v22, OS_LOG_TYPE_DEFAULT, "Authenticating device disconnected", buf, 2u);
          }

          int v23 = [(TVRUIRemoteViewController *)self authenticatingDevice];
          [v23 cancelAuthenitcationChallenge];

          [(TVRUIRemoteViewController *)self setAuthenticatingDevice:0];
          [(TVRUIRemoteViewController *)self _resetActiveDevice];
        }
      }
      else
      {
      }
      objc_initWeak((id *)buf, self);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __62__TVRUIRemoteViewController_deviceDidDisconnect_reason_error___block_invoke;
      v31[3] = &unk_264800468;
      objc_copyWeak(&v32, (id *)buf);
      [(TVRUIRemoteViewController *)self dismissPresentedContentAnimated:1 completion:v31];
      if (a4) {
        BOOL v25 = v9 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      int v24 = !v25;
      if (!v25)
      {
        [(TVRUIRemoteViewController *)self _hideMessageContent];
        [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__showConnectingSpinner object:0];
        int v26 = _TVRUIViewControllerLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v30 = 0;
          _os_log_impl(&dword_227326000, v26, OS_LOG_TYPE_DEFAULT, "Hiding existing message content and canceling connecting spinner selector", v30, 2u);
        }

        [(TVRUIRemoteViewController *)self showMessageWithError:v9 andDevice:v8];
      }
      [(TVRUIRemoteViewController *)self _toggleControlAvailability];
      [(TVRUIRemoteViewController *)self setSupportsVolumeControl:0];
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v24 = 0;
    }
    double v27 = [(TVRUIRemoteViewController *)self deviceConnectionStatusDelegate];
    [v27 deviceDidDisconnect];

    [(TVRUIRemoteViewController *)self _cancelShowConnectingSpinner];
    [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
    if (v16)
    {
      char v28 = [(TVRUIRemoteViewController *)self activeDevice];
      if (v28)
      {
      }
      else if (((v24 | ![(TVRUIRemoteViewController *)self isNetworkReachable]) & 1) == 0)
      {
        int v29 = _TVRUIViewControllerLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_DEFAULT, "Expanding picker since we got a disconnect message and no device is currently connected", buf, 2u);
        }

        [(TVRUIRemoteViewController *)self _expandDeviceList];
      }
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Device disconnected but we are not connected to WiFi. Ignoring disconnection", buf, 2u);
    }
  }
}

void __62__TVRUIRemoteViewController_deviceDidDisconnect_reason_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[140];
    WeakRetained[140] = 0;
    id v4 = WeakRetained;

    id v3 = (void *)v4[141];
    v4[141] = 0;

    id WeakRetained = v4;
  }
}

- (void)device:(id)a3 beganTextEditingWithAttributes:(id)a4 initialText:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(TVRUIRemoteViewController *)self activeDevice];
    __int16 v13 = [(TVRUIRemoteViewController *)self sharingClient];
    int v18 = 138412802;
    double v19 = self;
    __int16 v20 = 2112;
    BOOL v21 = v12;
    __int16 v22 = 2112;
    int v23 = v13;
    _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "%@ RemoteViewCtrl received callback to present keyboard. Active Device %@. Sharing client %@", (uint8_t *)&v18, 0x20u);
  }
  int v14 = [(TVRUIRemoteViewController *)self activeDevice];
  int v15 = [v10 isEqualToDevice:v14];

  if (v15 && [(TVRUIRemoteViewController *)self _shouldAllowKeyboardToBePresented])
  {
    if ([(TVRUIRemoteViewController *)self isInReducedBacklightMode])
    {
      int v16 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "undimming the screen", (uint8_t *)&v18, 2u);
      }

      SBSUndimScreen();
    }
    [(TVRUIRemoteViewController *)self setEditingSessionActive:1];
    int v17 = [(TVRUIRemoteViewController *)self controlPanelViewController];
    [v17 showKeyboardButton];

    [(TVRUIRemoteViewController *)self _presentKeyboardWithAttributes:v8 initialText:v9];
  }
}

- (void)device:(id)a3 endedTextEditingWithAttributes:(id)a4 endingText:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to end text editing for device %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [(TVRUIRemoteViewController *)self activeDevice];
  int v9 = [v6 isEqualToDevice:v8];

  if (v9)
  {
    [(TVRUIRemoteViewController *)self setEditingSessionActive:0];
    id v10 = [(TVRUIRemoteViewController *)self controlPanelViewController];
    [v10 hideKeyboardButton];

    [(TVRUIRemoteViewController *)self dismissPresentedContentAnimated:1 completion:0];
  }
}

- (void)device:(id)a3 didUpdateText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to update text of local device text field", v13, 2u);
  }

  int v9 = [(TVRUIRemoteViewController *)self activeDevice];
  int v10 = [v7 isEqualToDevice:v9];

  if (v10)
  {
    int v11 = [(TVRUIRemoteViewController *)self keyboardController];

    if (v11)
    {
      id v12 = [(TVRUIRemoteViewController *)self keyboardController];
      [v12 setText:v6];
    }
  }
}

- (void)device:(id)a3 didUpdateAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to update keyboard attributes", v13, 2u);
  }

  int v9 = [(TVRUIRemoteViewController *)self activeDevice];
  int v10 = [v7 isEqualToDevice:v9];

  if (v10)
  {
    int v11 = [(TVRUIRemoteViewController *)self keyboardController];

    if (v11)
    {
      id v12 = [(TVRUIRemoteViewController *)self keyboardController];
      [v12 setKeyboardAttributes:v6];
    }
  }
}

- (void)deviceDidEncounterAuthenticationChallenge:(id)a3 passwordType:(unint64_t)a4 passcode:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received authentication challenge for device %@", (uint8_t *)&v16, 0xCu);
  }

  [(TVRUIRemoteViewController *)self setAuthenticatingDevice:v8];
  int v11 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (v11)
  {
    id v12 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v12 setDevice:v8];
  }
  [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
  switch(a4)
  {
    case 2uLL:
      int v14 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_DEFAULT, "Challenge is legacy password type", (uint8_t *)&v16, 2u);
      }

      [(TVRUIRemoteViewController *)self _presentLegacyPairingAlertWithCode:v9];
      break;
    case 1uLL:
      int v15 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_227326000, v15, OS_LOG_TYPE_DEFAULT, "Challenge is text password type", (uint8_t *)&v16, 2u);
      }

      [(TVRUIRemoteViewController *)self _presentTextPasswordAlert];
      break;
    case 0uLL:
      uint64_t v13 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Challenge is pin password type", (uint8_t *)&v16, 2u);
      }

      [(TVRUIRemoteViewController *)self _presentPairingAlert];
      break;
  }
}

- (void)device:(id)a3 didEncounterAuthenticationThrottle:(int64_t)a4
{
  [(TVRUIRemoteViewController *)self _cancelShowConnectingSpinner];
  [(TVRUIRemoteViewController *)self _cancelHideConnectingAndShowDevicePicker];
  [(TVRUIRemoteViewController *)self showThrottleConnectMessage];
}

- (void)device:(id)a3 needsMediaControls:(id)a4
{
  int v5 = _TVRUIButtonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Device needs media controls", v7, 2u);
  }

  [(TVRUIRemoteViewController *)self _enableMediaControls:1 animated:1];
  id v6 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v6 setMediaControlsAreVisible:1];
}

- (void)device:(id)a3 hidesMediaControls:(id)a4
{
  int v5 = _TVRUIButtonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Device hides media controls", v7, 2u);
  }

  [(TVRUIRemoteViewController *)self _enableMediaControls:0 animated:1];
  id v6 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v6 setMediaControlsAreVisible:0];
}

- (void)device:(id)a3 hasCaptionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  if (([a3 supportsDirectCaptionQueries] & 1) == 0)
  {
    id v6 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
    [v6 updateCaptionState:v4 buttonDisabled:0];
  }
}

- (void)_enableMediaControls:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  [v6 setEnabled:v4];

  id v7 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  uint64_t v8 = [v7 availableButtons] & 4;

  unint64_t v9 = v8;
  if (v4)
  {
    int v10 = [MEMORY[0x263F7C9A8] capellaEnabled];
    uint64_t v11 = 9;
    if (!v10) {
      uint64_t v11 = 1;
    }
    uint64_t v12 = v11 | v8;
    uint64_t v13 = [(TVRUIRemoteViewController *)self activeDevice];
    int v14 = [v13 supportsCaptionsToggle];

    if (v14) {
      uint64_t v8 = v12 | 2;
    }
    else {
      uint64_t v8 = v12;
    }
    int v15 = [(TVRUIRemoteViewController *)self activeDevice];
    if ([v15 supportsDirectCaptionQueries])
    {
      int v16 = [(TVRUIRemoteViewController *)self nowPlayingController];
      id v17 = [v16 nowPlayingInfo];
      uint64_t v18 = [v17 hasValidCaptionOptions];
      if (v18)
      {
        double v19 = [(TVRUIRemoteViewController *)self nowPlayingController];
        __int16 v20 = [v19 nowPlayingInfo];
        BOOL v21 = [v20 hasValidCaptionOptions];
        int v22 = [v21 BOOLValue] ^ 1;
      }
      else
      {
        int v22 = 1;
      }

      if (v22) {
        unint64_t v23 = v8 & 0xFFFFFFFFFFFFFFFDLL;
      }
      else {
        unint64_t v23 = v8;
      }
    }
    else
    {

      unint64_t v23 = v8;
    }
    uint64_t v24 = [(TVRUIRemoteViewController *)self nowPlayingController];
    int v25 = [v24 capellaInfoAvailable];

    if (v25) {
      unint64_t v9 = v23;
    }
    else {
      unint64_t v9 = v23 & 0xFFFFFFFFFFFFFFF7;
    }
  }
  id v26 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  [v26 setAvailableButtons:v8 enabledButtons:v9];
}

- (void)_updateInfoButtonState
{
  id v3 = [(TVRUIRemoteViewController *)self nowPlayingController];
  BOOL v4 = [v3 nowPlayingInfo];

  if (v4)
  {
    id v6 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
    int v5 = [(TVRUIRemoteViewController *)self nowPlayingController];
    objc_msgSend(v6, "updateButton:enabled:", 8, objc_msgSend(v5, "capellaInfoAvailable"));
  }
}

- (void)device:(id)a3 hasGuideButtonEnabled:(BOOL)a4
{
}

- (void)_enableLiveTVButtons:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  unint64_t v7 = [v6 availableButtons];

  BOOL v8 = a3 || _AXSAppleTVRemoteForceLiveTVButtons() != 0;
  unint64_t v9 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  unint64_t v10 = [v9 availableButtons] & 0xFFFFFFFFFFFFFFFBLL;

  uint64_t v11 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  unint64_t v12 = [v11 enabledButtons] & 0xFFFFFFFFFFFFFFFBLL;

  uint64_t v13 = 4;
  if (!v8) {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v10 | v13;
  unint64_t v15 = v12 | v13;
  uint64_t v16 = (v7 >> 3) & 1;
  id v17 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  [v17 setAvailableButtons:v14 enabledButtons:v15];

  id v18 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v18 setMediaControlsAreVisible:v16 | v8];
}

- (void)connectionServiceDidInvalidate:(id)a3
{
  BOOL v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Connection service invalidate notification received. Dispatching cleanup", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke;
  v5[3] = &unk_264800AF0;
  objc_copyWeak(&v6, buf);
  void v5[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained[124]) {
    [WeakRetained _resetActiveDevice];
  }
  if (v3[125])
  {
    uint64_t v4 = +[TVRUIDeviceFactory deviceWithIdentifier:](TVRUIDeviceFactory, "deviceWithIdentifier:");
    int v5 = (void *)v3[124];
    v3[124] = v4;
  }
  id v6 = (void *)v3[127];
  if (v6)
  {
    [v6 stop];
    unint64_t v7 = (void *)v3[127];
    v3[127] = 0;

    BOOL v8 = [v3 devicePickerViewController];
    [v8 setDevices:MEMORY[0x263EFFA68]];

    if (+[TVRUIFeatures corianderEnabled])
    {
      unint64_t v9 = [v3 devicePickerViewController];
      [v9 setSuggestedDevices:MEMORY[0x263EFFA68]];
    }
    uint64_t v10 = +[TVRUIDeviceQuery deviceQuery];
    uint64_t v11 = (void *)v3[127];
    v3[127] = v10;

    unint64_t v12 = (void *)v3[127];
    uint64_t v13 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke_2;
    v15[3] = &unk_264800FE0;
    v15[4] = v3;
    [v12 startQuery:v13 completionHandler:v15];
  }
  uint64_t v14 = v3[124];
  if (v14) {
    [v3 _connectToDevice:v14 connectionContext:0];
  }
}

uint64_t __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _startDeviceQueryThresholdTimer];
  }
  return result;
}

- (void)deviceListUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Device list updated: %{public}@", buf, 0xCu);
  }

  id v6 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v6 setDevices:v4];

  unint64_t v7 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  int v8 = [v7 isDevicePickerShowing];

  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__TVRUIRemoteViewController_deviceListUpdated___block_invoke;
    v10[3] = &unk_2647FFF70;
    v10[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v10 animations:0.15];
  }
  if (+[TVRUIFeatures corianderEnabled])
  {
    if ([(TVRUIRemoteViewController *)self deviceQueryThresholdReached])
    {
      unint64_t v9 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to the most relevant device from the updated device list", buf, 2u);
      }

      [(TVRUIRemoteViewController *)self _connectToMostRelevantDevice];
    }
  }
  else
  {
    [(TVRUIRemoteViewController *)self _connectToPreferredDeviceFromDeviceList:v4];
  }
}

void __47__TVRUIRemoteViewController_deviceListUpdated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutTouchpadExpanded:1];
  id v2 = [*(id *)(a1 + 32) devicePickerViewController];
  [v2 _updateTableFrame:1];
}

- (void)_connectToPreferredDeviceFromDeviceList:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = [(TVRUIRemoteViewController *)self activeDevice];
    if (v7
      || ([(TVRUIRemoteViewController *)self activeDeviceIdentifier],
          (unint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      goto LABEL_6;
    }
    uint64_t v8 = [v4 count];

    if (!v8) {
      goto LABEL_6;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          unint64_t v15 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
          int v16 = [v14 hasIdentifier:v15];

          if (v16)
          {
            id v17 = _TVRUIViewControllerLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v14;
              _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "Connecting to last selected device: %@", buf, 0xCu);
            }

            [(TVRUIRemoteViewController *)self setActiveDevice:v14];
            id v18 = _TVRUIViewControllerLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              double v19 = [(TVRUIRemoteViewController *)self activeDevice];
              *(_DWORD *)buf = 138543362;
              uint64_t v30 = v19;
              _os_log_impl(&dword_227326000, v18, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", buf, 0xCu);
            }
            __int16 v20 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
            [(TVRUIRemoteViewController *)self setActiveDeviceIdentifier:v20];

            [(TVRUIRemoteViewController *)self _connectToDevice:v14 connectionContext:3];
            goto LABEL_22;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    BOOL v21 = [(TVRUIRemoteViewController *)self activeDevice];

    int v22 = _TVRUIViewControllerLog();
    id v6 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v23 = [(TVRUIRemoteViewController *)self preferredDeviceIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v23;
        _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Found preferred device to connect for id %{public}@", buf, 0xCu);
      }
      goto LABEL_5;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[TVRUIRemoteViewController _connectToPreferredDeviceFromDeviceList:](self);
    }

    uint64_t v24 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v24, OS_LOG_TYPE_DEFAULT, "Showing device picker as no preferred device was found", buf, 2u);
    }

    [(TVRUIRemoteViewController *)self _expandDeviceList];
  }
LABEL_6:
}

- (void)suggestedDevices:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRUIIRLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Suggested devices %{public}@", buf, 0xCu);
  }

  if (+[TVRUIFeatures corianderEnabled])
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__TVRUIRemoteViewController_suggestedDevices___block_invoke;
    v6[3] = &unk_264800AF0;
    objc_copyWeak(&v8, (id *)buf);
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __46__TVRUIRemoteViewController_suggestedDevices___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained activeDevice];

    if (v4)
    {
      uint64_t v5 = _TVRUIIRLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v3 activeDevice];
        *(_DWORD *)buf = 138543362;
        long long v26 = v6;
        _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Skipping auto select because a device is already active %{public}@", buf, 0xCu);
LABEL_19:
      }
    }
    else
    {
      if (![*(id *)(a1 + 32) count])
      {
        int v16 = _TVRUIIRLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "No suggested devices, attempting to connect to last selected TV", buf, 2u);
        }

        uint64_t v5 = [v3 devicePickerViewController];
        id v6 = [v5 devices];
        [v3 _connectToPreferredDeviceFromDeviceList:v6];
        goto LABEL_19;
      }
      id v7 = [v3 devicePickerViewController];
      id v8 = [v7 suggestedDevices];
      uint64_t v9 = [v8 count];

      if (v9)
      {
LABEL_21:
        uint64_t v17 = *(void *)(a1 + 32);
        id v18 = objc_msgSend(v3, "devicePickerViewController", (void)v20);
        [v18 setSuggestedDevices:v17];

        goto LABEL_22;
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
LABEL_9:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          unint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
          if (objc_msgSend(v15, "classification", (void)v20) == 1) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v12) {
              goto LABEL_9;
            }
            goto LABEL_15;
          }
        }
        uint64_t v5 = v15;

        if (!v5) {
          goto LABEL_27;
        }
        double v19 = _TVRUIIRLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v26 = v5;
          _os_log_impl(&dword_227326000, v19, OS_LOG_TYPE_DEFAULT, "Auto selecting %{public}@", buf, 0xCu);
        }

        [v3 _selectDevice:v5 withConnectionContext:3];
      }
      else
      {
LABEL_15:

LABEL_27:
        uint64_t v5 = _TVRUIIRLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "No devices were classified as AutoPick", buf, 2u);
        }
      }
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_selectDevice:(id)a3 withConnectionContext:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(TVRUIRemoteViewController *)self _stringForConnectionContext:a4];
    int v16 = 138543618;
    id v17 = v6;
    __int16 v18 = 2114;
    double v19 = v8;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Selecting device: %{public}@ with connectionContext: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v9 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v9) {
    [(TVRUIRemoteViewController *)self _disconnectUserInitiatedAndModifyLockscreenAssertion:a4 != 1];
  }
  [(TVRUIRemoteViewController *)self setActiveDevice:v6];
  id v10 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(TVRUIRemoteViewController *)self activeDevice];
    int v16 = 138543362;
    id v17 = v11;
    _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v12 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v12 transitonToViewForDeviceType:0];

  uint64_t v13 = [v6 identifier];
  [(TVRUIRemoteViewController *)self setActiveDeviceIdentifier:v13];

  uint64_t v14 = [(TVRUIRemoteViewController *)self activeDevice];
  [v14 setDelegate:self];

  [(TVRUIRemoteViewController *)self _connectToDevice:v6 connectionContext:a4];
  unint64_t v15 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v15 collapseDeviceList];
}

- (void)devicePicked:(id)a3
{
}

- (void)devicePickerWillChangeState:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    double v6 = 1.0;
    if (a3)
    {
      id v7 = [(TVRUIRemoteViewController *)self delegate];
      [v7 devicePickerWillExpand];

      double v6 = 0.0;
    }
    id v8 = [(TVRUIRemoteViewController *)self messageView];
    [v8 setAlpha:v6];

    uint64_t v9 = [(TVRUIRemoteViewController *)self touchpadViewController];
    [v9 setShowControls:v4 ^ 1];

    [(TVRUIRemoteViewController *)self _layoutTouchpadExpanded:v4];
  }
}

- (void)devicePickerTitleWasLongPressedForDevice:(id)a3
{
  id v3 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v3 displayUpNext];
}

- (void)_showBluetoothDisabledAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82418];
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"TVRemoteUIBluetoothAlertTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  supportsSiruint64_t i = self->_supportsSiri;
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = v9;
  if (supportsSiri) {
    uint64_t v11 = @"TVRemoteUIBluetoothAlertSiriRemoteSubtitle";
  }
  else {
    uint64_t v11 = @"TVRemoteUIBluetoothAlertAppleTVRemoteSubtitle";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_26DB4CAE0 table:@"Localizable"];
  uint64_t v13 = [v5 alertControllerWithTitle:v7 message:v12 preferredStyle:1];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  unint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v16 = [v15 localizedStringForKey:@"TVRemoteUIBluetoothAlertDefaultButtonTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke;
  v29[3] = &unk_264801030;
  id v17 = v4;
  id v30 = v17;
  __int16 v18 = [v14 actionWithTitle:v16 style:0 handler:v29];
  [v13 addAction:v18];

  double v19 = (void *)MEMORY[0x263F82400];
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v21 = [v20 localizedStringForKey:@"TVRemoteUIBluetoothAlertAlternateButtonTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  long long v26 = __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke_2;
  uint64_t v27 = &unk_264801030;
  id v28 = v17;
  id v22 = v17;
  long long v23 = [v19 actionWithTitle:v21 style:0 handler:&v24];
  objc_msgSend(v13, "addAction:", v23, v24, v25, v26, v27);

  [(TVRUIRemoteViewController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_turnOnBluetoothIfNeededWithCompletionBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = [(TVRUIRemoteViewController *)self networkObserver];
  double v6 = [v5 cbController];

  id v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v6 bluetoothState];
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth State: %ld", buf, 0xCu);
  }

  id v8 = [(TVRUIRemoteViewController *)self networkObserver];
  char v9 = [v8 isBluetoothAvailable];

  if (v9)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke;
    v10[3] = &unk_264800DC8;
    id v11 = v6;
    uint64_t v12 = v4;
    [(TVRUIRemoteViewController *)self _showBluetoothDisabledAlertWithCompletion:v10];
  }
}

void __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_2;
    v4[3] = &unk_264801080;
    id v2 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v2 setPowerState:5 completion:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_3;
  block[3] = &unk_264801058;
  id v4 = *(id *)(a1 + 32);
  BOOL v9 = v3 == 0;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_presentKeyboardWithAttributes:(id)a3 initialText:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(TVRUIRemoteViewController *)self _shouldAllowKeyboardToBePresented];
  _TVRUIKeyboardLog();
  BOOL v9 = (TVRAlertController *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(&v9->super.super.super, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = [(TVRUIRemoteViewController *)self activeDevice];
      if (v11) {
        uint64_t v12 = @"true";
      }
      else {
        uint64_t v12 = @"false";
      }
      BOOL v13 = [(TVRUIRemoteViewController *)self isSiriSessionActive];
      uint64_t v14 = [(TVRUIRemoteViewController *)self presentedViewController];
      uint64_t v15 = [(TVRUIRemoteViewController *)self keyboardController];
      int v20 = 138544386;
      long long v21 = v12;
      __int16 v22 = 1024;
      *(_DWORD *)long long v23 = v13;
      *(_WORD *)&v23[4] = 2114;
      *(void *)&v23[6] = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      _os_log_impl(&dword_227326000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Keyboard presentation allowed activeDevice: %{public}@, siriSessionActive: %{BOOL}d, text: %{public}@, presentedViewController: %@, keyboardController: %@", (uint8_t *)&v20, 0x30u);
    }
    BOOL v9 = [[TVRAlertController alloc] initWithKeyboardAttributes:v6];
    [(TVRAlertController *)v9 setDelegate:self];
    [(TVRAlertController *)v9 setText:v7];
    [(TVRAlertController *)v9 enableDictationButton:[(TVRUIDevice *)self->_activeDevice supportsSiri]];
    [(TVRKeyboardHaptic *)self->_keyboardHaptic play];
    [(TVRUIRemoteViewController *)self setKeyboardController:v9];
    [(TVRUIRemoteViewController *)self setDefinesPresentationContext:1];
    [(TVRUIRemoteViewController *)self presentViewController:v9 animated:1 completion:0];
    if (([(TVRUIDevice *)self->_activeDevice isLegacyAppleTV] & 1) == 0)
    {
      int v16 = [(TVRUIRemoteViewController *)self sessionData];
      [v16 setUsedRTI:1];
    }
    id v17 = _TVRUIKeyboardLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(TVRUIRemoteViewController *)self presentedViewController];
      int v20 = 138412546;
      long long v21 = v9;
      __int16 v22 = 2112;
      *(void *)long long v23 = v18;
      _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "presented keyboard controller %@ %@", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_16;
  }
  if (v10)
  {
    id v17 = [(TVRUIRemoteViewController *)self activeDevice];
    if (v17) {
      double v19 = @"true";
    }
    else {
      double v19 = @"false";
    }
    int v20 = 138543618;
    long long v21 = v19;
    __int16 v22 = 1024;
    *(_DWORD *)long long v23 = [(TVRUIRemoteViewController *)self isSiriSessionActive];
    _os_log_impl(&dword_227326000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Keyboard presentation suppressed activeDevice: %{public}@, siriSessionActive: %{BOOL}d", (uint8_t *)&v20, 0x12u);
LABEL_16:
  }
}

- (void)_presentTextPasswordAlert
{
  id v3 = [TVRAlertController alloc];
  id v4 = [(TVRUIRemoteViewController *)self styleProvider];
  id v5 = [v4 textForPairingPasswordAlert];
  id v6 = [(TVRAlertController *)v3 initForTextPasswordType:v5];

  [v6 setDelegate:self];
  [v6 setText:&stru_26DB4CAE0];
  [(TVRKeyboardHaptic *)self->_keyboardHaptic play];
  [(TVRUIRemoteViewController *)self setAuthenticationAlertController:v6];
  [(TVRUIRemoteViewController *)self setDefinesPresentationContext:1];
  [(TVRUIRemoteViewController *)self presentViewController:v6 animated:1 completion:0];
  id v7 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Presented keyboard controller for alphanumeric pin", v8, 2u);
  }
}

- (void)_presentPairingAlert
{
  id v3 = [TVRAlertController alloc];
  id v4 = [(TVRUIRemoteViewController *)self styleProvider];
  id v5 = [v4 textForPairingAlert];
  id v6 = [(TVRAlertController *)v3 initWithTitle:v5 passcodeSize:4];

  [(TVRAlertController *)v6 setDelegate:self];
  [(TVRUIRemoteViewController *)self setAuthenticationAlertController:v6];
  [(TVRUIRemoteViewController *)self setDefinesPresentationContext:1];
  [(TVRUIRemoteViewController *)self presentViewController:v6 animated:1 completion:0];
  id v7 = [(TVRUIRemoteViewController *)self sessionData];
  [v7 setRequiredPairing:1];

  BOOL v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Presented controller for pin", v9, 2u);
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v9 = [MEMORY[0x263F82418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v5 = (void *)MEMORY[0x263F82400];
  id v6 = [(TVRUIRemoteViewController *)self styleProvider];
  id v7 = [v6 textForDeviceLockoutAlert];
  BOOL v8 = [v5 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(TVRUIRemoteViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_cancelPairing
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TVRUIRemoteViewController *)self authenticatingDevice];
    int v11 = 138412290;
    uint64_t v12 = v4;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "User requested to cancel pairing for authentication device %@", (uint8_t *)&v11, 0xCu);
  }
  id v5 = [(TVRUIRemoteViewController *)self authenticatingDevice];

  if (v5)
  {
    id v6 = [(TVRUIRemoteViewController *)self authenticatingDevice];
    [v6 cancelAuthenitcationChallenge];

    [(TVRUIRemoteViewController *)self setAuthenticatingDevice:0];
    id v7 = [(TVRUIRemoteViewController *)self activeDevice];

    if (v7)
    {
      BOOL v8 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      id v9 = [(TVRUIRemoteViewController *)self activeDevice];
      BOOL v10 = [v9 name];
      [v8 setTitle:v10];
    }
    else
    {
      [(TVRUIRemoteViewController *)self _expandDeviceList];
    }
  }
}

- (BOOL)hasPresentedContent
{
  id v3 = [(TVRUIRemoteViewController *)self keyboardController];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(TVRUIRemoteViewController *)self authenticationAlertController];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(void))a4;
  id v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to dismiss any presented content", (uint8_t *)&v15, 2u);
  }

  BOOL v8 = [(TVRUIRemoteViewController *)self keyboardController];

  if (v8)
  {
    id v9 = _TVRUIKeyboardLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(TVRUIRemoteViewController *)self keyboardController];
      int v11 = [(TVRUIRemoteViewController *)self presentedViewController];
      int v15 = 138412546;
      int v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Dismissed presented keyboard controller:%@, presented:%@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v12 = [(TVRUIRemoteViewController *)self keyboardController];
    [v12 dismissViewControllerAnimated:v4 completion:v6];
    [(TVRUIRemoteViewController *)self setKeyboardController:0];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v13 = [(TVRUIRemoteViewController *)self authenticationAlertController];

  if (v13)
  {
    uint64_t v12 = [(TVRUIRemoteViewController *)self authenticationAlertController];
    [v12 dismissViewControllerAnimated:v4 completion:v6];
    [(TVRUIRemoteViewController *)self setAuthenticationAlertController:0];
    [(TVRUIRemoteViewController *)self _cancelPairing];
    uint64_t v14 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_DEFAULT, "Dismissed presented authentication controller", (uint8_t *)&v15, 2u);
    }

    goto LABEL_11;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_12:
}

- (void)alertController:(id)a3 enteredText:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(TVRUIRemoteViewController *)self authenticatingDevice];
  if (v7 && ![v12 type])
  {
    uint64_t v10 = [v6 length];

    if (v10 == 4)
    {
      int v11 = [(TVRUIRemoteViewController *)self authenticatingDevice];
      [v11 sendAuthenticationCode:v6];

      [v12 dismissViewControllerAnimated:1 completion:0];
      goto LABEL_9;
    }
  }
  else
  {
  }
  BOOL v8 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v6 && v8)
  {
    id v9 = [(TVRUIRemoteViewController *)self activeDevice];
    [v9 sendText:v6];
  }
LABEL_9:
}

- (void)alertController:(id)a3 generatedTextInputPayload:(id)a4
{
  id v5 = a4;
  id v6 = [(TVRUIRemoteViewController *)self activeDevice];
  id v8 = [v6 keyboardAttributes];

  [v8 setRtiDataPayload:v5];
  id v7 = [(TVRUIRemoteViewController *)self activeDevice];
  [v7 sendTextInputPayload:v5];
}

- (void)alertControllerPressedDictationButton:(id)a3
{
  BOOL v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    id v7 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:4];
    id v5 = [(TVRUIRemoteViewController *)self activeDevice];
    [v5 sendButtonEvent:v7];

    [(TVRUIRemoteViewController *)self _performSiriEffectsWithButtonEvent:v7];
  }
  else
  {
    id v6 = _TVRUIKeyboardLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TVRUIRemoteViewController alertControllerPressedDictationButton:](v6);
    }
  }
}

- (void)alertControllerReleasedDictationButton:(id)a3
{
  BOOL v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    id v6 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:4];
    id v5 = [(TVRUIRemoteViewController *)self activeDevice];
    [v5 sendButtonEvent:v6];

    [(TVRUIRemoteViewController *)self _performSiriEffectsWithButtonEvent:v6];
  }
}

- (void)alertControllerHitKeyboardReturnKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVRUIRemoteViewController *)self authenticatingDevice];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 type];

    if (v7 == 2)
    {
      id v8 = _TVRUIKeyboardLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "User entered text password", buf, 2u);
      }

      id v9 = [v4 text];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        int v11 = [(TVRUIRemoteViewController *)self authenticatingDevice];
        id v12 = [v4 text];
        [v11 sendAuthenticationCode:v12];

        [v4 dismissViewControllerAnimated:1 completion:0];
        goto LABEL_13;
      }
      int v16 = _TVRUIKeyboardLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v17 = 0;
        _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "User entered password of zero length", v17, 2u);
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v13 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [v4 type];

    if (v15 == 1)
    {
      int v16 = [(TVRUIRemoteViewController *)self activeDevice];
      [v16 sendReturnKey];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)alertControllerCancelled:(id)a3
{
  id v8 = a3;
  if (![v8 type] || objc_msgSend(v8, "type") == 2)
  {
    id v4 = [(TVRUIRemoteViewController *)self authenticatingDevice];

    if (v4) {
      [(TVRUIRemoteViewController *)self _cancelPairing];
    }
  }
  id v5 = [(TVRUIRemoteViewController *)self keyboardController];

  if (v5 == v8)
  {
    [(TVRUIRemoteViewController *)self setKeyboardController:0];
  }
  else
  {
    id v6 = [(TVRUIRemoteViewController *)self authenticationAlertController];

    uint64_t v7 = v8;
    if (v6 != v8) {
      goto LABEL_10;
    }
    [(TVRUIRemoteViewController *)self setAuthenticationAlertController:0];
  }
  uint64_t v7 = v8;
LABEL_10:
}

- (void)wifiStateDidUpdate:(int64_t)a3
{
  id v5 = [(TVRUIRemoteViewController *)self networkObserver];
  int v6 = [v5 isNetworkReachable];

  uint64_t v7 = _TVRUIViewControllerLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Network observer reported network is reachable", buf, 2u);
    }

    uint64_t v9 = [(TVRUIRemoteViewController *)self deviceQuery];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      int v11 = [(TVRUIRemoteViewController *)self deviceQuery];
      char v12 = [v11 hasStarted];

      if ((v12 & 1) == 0)
      {
        uint64_t v13 = _TVRUIViewControllerLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_227326000, v13, OS_LOG_TYPE_DEFAULT, "Network is reachable. Requesting restarting query.", buf, 2u);
        }

        uint64_t v14 = [(TVRUIRemoteViewController *)self deviceQuery];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __48__TVRUIRemoteViewController_wifiStateDidUpdate___block_invoke;
        v39[3] = &unk_264800FE0;
        v39[4] = self;
        [v14 startQuery:self completionHandler:v39];

        [(TVRUIRemoteViewController *)self performSelector:sel__showSearchingSpinnerIfNeeded withObject:0 afterDelay:2.0];
      }
    }
    [(TVRUIRemoteViewController *)self clearMessageContent];
    uint64_t v15 = [(TVRUIRemoteViewController *)self activeDevice];
    if (!v15) {
      goto LABEL_33;
    }
    int v16 = (void *)v15;
    __int16 v17 = [(TVRUIRemoteViewController *)self activeDevice];
    if ([v17 isConnected])
    {
    }
    else
    {
      uint64_t v31 = [(TVRUIRemoteViewController *)self activeDevice];
      char v32 = [v31 isConnecting];

      if (v32) {
        goto LABEL_33;
      }
      __int16 v33 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v33, OS_LOG_TYPE_DEFAULT, "Network is reachable. We have an active disconnected device. Requesting connect", buf, 2u);
      }

      int v16 = [(TVRUIRemoteViewController *)self activeDevice];
      [(TVRUIRemoteViewController *)self _connectToDevice:v16 connectionContext:0];
    }

LABEL_33:
    id v34 = [(TVRUIRemoteViewController *)self devicePickerViewController];

    if (v34)
    {
      __int16 v35 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      int64_t v36 = [v35 view];
      [v36 setHidden:0];

      __int16 v37 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v37, OS_LOG_TYPE_DEFAULT, "Network available. Making device picker button visible.", buf, 2u);
      }
    }
    goto LABEL_37;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Network observer reported network unreachable", buf, 2u);
  }

  [(TVRUIRemoteViewController *)self _resetActiveDevice];
  __int16 v18 = [(TVRUIRemoteViewController *)self deviceQuery];

  if (v18)
  {
    uint64_t v19 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v19, OS_LOG_TYPE_DEFAULT, "No network. Stopping device query.", buf, 2u);
    }

    int v20 = [(TVRUIRemoteViewController *)self deviceQuery];
    [v20 stop];

    [(TVRUIRemoteViewController *)self _stopDeviceQueryThresholdTimer];
  }
  long long v21 = [(TVRUIRemoteViewController *)self devicePickerViewController];

  if (v21)
  {
    __int16 v22 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v22 collapseDeviceList];

    long long v23 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v23 resetSelectedDevice];

    __int16 v24 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v24 setDevices:MEMORY[0x263EFFA68]];

    if (+[TVRUIFeatures corianderEnabled])
    {
      uint64_t v25 = [(TVRUIRemoteViewController *)self devicePickerViewController];
      [v25 setSuggestedDevices:MEMORY[0x263EFFA68]];
    }
    __int16 v26 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    uint64_t v27 = [v26 view];
    [v27 setHidden:1];

    uint64_t v28 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v28, OS_LOG_TYPE_DEFAULT, "No network. Collapsed device picker and hid it.", buf, 2u);
    }
  }
  int v29 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  [v29 setEnabled:0];

  id v30 = [(TVRUIRemoteViewController *)self topButtonPanelViewController];
  [v30 setEnabled:0];

  if (a3)
  {
    if (a3 == 1) {
      [(TVRUIRemoteViewController *)self showNoAssociatedNetworkMessage];
    }
  }
  else
  {
    [(TVRUIRemoteViewController *)self showNoWIFIConnectionMessage];
  }
LABEL_37:
  [(TVRUIRemoteViewController *)self setNetworkReachable:a3 == 2];
  if (+[TVRUIFeatures isAWDLEnabled])
  {
    id v38 = [(TVRUIRemoteViewController *)self networkObserver];
    -[TVRUIRemoteViewController setNetworkReachable:](self, "setNetworkReachable:", [v38 isBluetoothAvailable] | -[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable"));
  }
}

uint64_t __48__TVRUIRemoteViewController_wifiStateDidUpdate___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _startDeviceQueryThresholdTimer];
  }
  return result;
}

- (void)bluetoothAvailabilityDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _TVRUIViewControllerLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is enabled", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is disabled", buf, 2u);
    }

    uint64_t v7 = [(TVRUIRemoteViewController *)self findingSession];
    int v8 = [v7 isFindingSessionActive];

    if (v8)
    {
      uint64_t v9 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Bluetooth was disabled in the middle of a finding session. Attemping to restart the finding session", buf, 2u);
      }

      uint64_t v10 = [(TVRUIRemoteViewController *)self activeDevice];
      [(TVRUIRemoteViewController *)self _stopFindingSessionForDevice:v10];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__TVRUIRemoteViewController_bluetoothAvailabilityDidUpdate___block_invoke;
      block[3] = &unk_2647FFF70;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __60__TVRUIRemoteViewController_bluetoothAvailabilityDidUpdate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 activeDevice];
  [v1 _startFindingSessionForDevice:v2];
}

- (void)_setupNetworkObserverIfNeeded
{
  BOOL v3 = [(TVRUIRemoteViewController *)self networkObserver];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc_init(TVRUINetworkObserver);
    [(TVRUIRemoteViewController *)self setNetworkObserver:v4];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke;
    v10[3] = &unk_264800BB0;
    objc_copyWeak(&v11, &location);
    id v5 = [(TVRUIRemoteViewController *)self networkObserver];
    [v5 setWifiStateUpdatedHandler:v10];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke_179;
    v8[3] = &unk_264800FB8;
    objc_copyWeak(&v9, &location);
    BOOL v6 = [(TVRUIRemoteViewController *)self networkObserver];
    [v6 setBluetoothAvailabilityDidUpdate:v8];

    uint64_t v7 = [(TVRUIRemoteViewController *)self networkObserver];
    [v7 startObserving];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [WeakRetained networkObserver];
      int v6 = 134218240;
      uint64_t v7 = a2;
      __int16 v8 = 1024;
      int v9 = [v5 isNetworkReachable];
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Network observer reported reachability update, state=%ld, reachable=%d", (uint8_t *)&v6, 0x12u);
    }
    [WeakRetained wifiStateDidUpdate:a2];
  }
}

void __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke_179(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Network observer reported bluetooth availability update, available=%d", (uint8_t *)v5, 8u);
    }

    [WeakRetained bluetoothAvailabilityDidUpdate:a2];
  }
}

- (void)showMessageWithError:(id)a3 andDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke;
  block[3] = &unk_2648007C0;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  BOOL v3 = [*(id *)(a1 + 32) messageView];
  [v3 showMessageWithError:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];

  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke_2;
  block[3] = &unk_2647FFF70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideMessageContent];
  id v2 = [*(id *)(a1 + 32) devicePickerViewController];
  [v2 expandDeviceList];
}

- (void)showMessageWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVRUIRemoteViewController_showMessageWithTitle_message___block_invoke;
  block[3] = &unk_2648007C0;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__TVRUIRemoteViewController_showMessageWithTitle_message___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 showMessageWithTitle:*(void *)(a1 + 40) message:*(void *)(a1 + 48)];
}

- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__TVRUIRemoteViewController_showMessageWithTitle_message_titleFont___block_invoke;
  v14[3] = &unk_2648010A8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __68__TVRUIRemoteViewController_showMessageWithTitle_message_titleFont___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 showMessageWithTitle:*(void *)(a1 + 40) message:*(void *)(a1 + 48) titleFont:*(void *)(a1 + 56)];
}

- (void)showPairingMessageWithCode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__TVRUIRemoteViewController_showPairingMessageWithCode___block_invoke;
  v6[3] = &unk_264800638;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __56__TVRUIRemoteViewController_showPairingMessageWithCode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 showPairingMessageWithCode:*(void *)(a1 + 40)];
}

- (void)showNoAssociatedNetworkMessage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__TVRUIRemoteViewController_showNoAssociatedNetworkMessage__block_invoke;
  block[3] = &unk_2647FFF70;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__TVRUIRemoteViewController_showNoAssociatedNetworkMessage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 showNoAssociatedNetworkMessage];
}

- (void)showNoWIFIConnectionMessage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TVRUIRemoteViewController_showNoWIFIConnectionMessage__block_invoke;
  block[3] = &unk_2647FFF70;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__TVRUIRemoteViewController_showNoWIFIConnectionMessage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchpadViewController];
  [v2 setShowControls:0];

  id v3 = [*(id *)(a1 + 32) messageView];
  [v3 showNoWIFIConnectionMessage];
}

- (void)showThrottleConnectMessage
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v3 localizedStringForKey:@"TVRemoteUIPairingLockoutTitle" value:&stru_26DB4CAE0 table:@"Localizable"];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"TVRemoteUIPairingLockoutMessage" value:&stru_26DB4CAE0 table:@"Localizable"];

  [(TVRUIRemoteViewController *)self showMessageWithTitle:v6 message:v5];
}

- (void)showGenericUnableToConnectMessage
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v4 localizedStringForKey:@"TVRemoteUIConnectionErrorTitleTV" value:&stru_26DB4CAE0 table:@"Localizable"];
  [(TVRUIRemoteViewController *)self showMessageWithTitle:v3 message:&stru_26DB4CAE0];
}

- (void)showLoadingSpinner
{
  id v3 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v3 setShowControls:0];

  messageView = self->_messageView;
  [(TVRMessageView *)messageView showLoadingSpinner];
}

- (void)showSearchingSpinner
{
  id v3 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v3 setShowControls:0];

  [(TVRMessageView *)self->_messageView showSearchingSpinner];
  id v4 = [MEMORY[0x263F7C980] sharedInstance];
  [v4 logSearchingSpinnerShown];
}

- (void)clearMessageContent
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVRUIRemoteViewController clearMessageContent]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(TVRMessageView *)self->_messageView clearContent];
  id v4 = [(TVRUIRemoteViewController *)self touchpadViewController];
  [v4 setShowControls:1];
}

- (void)_showConnectingSpinner
{
  if ([(TVRUIRemoteViewController *)self isNetworkReachable])
  {
    id v3 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Showing connecting spinner", v8, 2u);
    }

    [(TVRUIRemoteViewController *)self showLoadingSpinner];
    id v4 = [(TVRUIRemoteViewController *)self activeDevice];
    [v4 isLegacyAppleTV];

    [(TVRUIRemoteViewController *)self performSelector:sel__hideConnectingAndShowDevicePicker withObject:0 afterDelay:10.0];
    int v5 = [MEMORY[0x263F7C980] sharedInstance];
    id v6 = [(TVRUIRemoteViewController *)self activeDevice];
    uint64_t v7 = [v6 deviceContextInformation];
    [v5 logConnectingSpinnerShown:v7];
  }
}

- (void)_cancelShowConnectingSpinner
{
}

- (void)_hideConnectingAndShowDevicePicker
{
  v1 = [a1 activeDevice];
  OUTLINED_FUNCTION_0_2(&dword_227326000, v2, v3, "Disconnecting device %@ due to connection timeout", v4, v5, v6, v7, 2u);
}

- (void)_cancelHideConnectingAndShowDevicePicker
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideConnectingAndShowDevicePicker object:0];
  uint64_t v2 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled showdevicepicker selector", v3, 2u);
  }
}

- (void)_showSearchingSpinnerIfNeeded
{
  if ([(TVRUIRemoteViewController *)self isNetworkReachable])
  {
    uint64_t v3 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    uint64_t v4 = [v3 devices];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = [(TVRUIRemoteViewController *)self controlPanelViewController];
      [v6 setEnabled:0];

      [(TVRUIRemoteViewController *)self showSearchingSpinner];
    }
  }
}

- (void)_hideMessageContent
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__showConnectingSpinner object:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__showSearchingSpinnerIfNeeded object:0];
  [(TVRUIRemoteViewController *)self clearMessageContent];
}

- (void)generatedButtonEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v5)
  {
    if ([v4 buttonType] != 9999)
    {
      uint64_t v7 = [v4 buttonType];
      id v8 = [(TVRUIRemoteViewController *)self activeDevice];
      id v9 = v8;
      if (v7 == 9992)
      {
        int v10 = [v8 isModernAppleTV];

        if (!v10) {
          goto LABEL_21;
        }
        id v11 = [(TVRUIRemoteViewController *)self nowPlayingController];
        [v11 infoButtonWasTapped];
      }
      else
      {
        [v8 sendButtonEvent:v4];

        id v12 = _TVRUIButtonLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315394;
          id v16 = "-[TVRUIRemoteViewController generatedButtonEvent:]";
          __int16 v17 = 2114;
          id v18 = v4;
          _os_log_impl(&dword_227326000, v12, OS_LOG_TYPE_DEFAULT, "%s, event=%{public}@", (uint8_t *)&v15, 0x16u);
        }

        switch([v4 buttonType])
        {
          case 2:
          case 3:
            id v11 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
            [v11 collapseChannelButton];
            goto LABEL_20;
          case 4:
            [(TVRUIRemoteViewController *)self _performSiriEffectsWithButtonEvent:v4];
            goto LABEL_21;
          case 10:
            if ([v4 eventType] != 1) {
              goto LABEL_21;
            }
            id v13 = [MEMORY[0x263F08A00] defaultCenter];
            id v11 = v13;
            uint64_t v14 = @"TVRUIVolumeUpEventGenerated";
            break;
          case 11:
            if ([v4 eventType] != 1) {
              goto LABEL_21;
            }
            id v13 = [MEMORY[0x263F08A00] defaultCenter];
            id v11 = v13;
            uint64_t v14 = @"TVRUIVolumeDownEventGenerated";
            break;
          default:
            goto LABEL_21;
        }
        [v13 postNotificationName:v14 object:0];
      }
LABEL_20:

      goto LABEL_21;
    }
    if ([v4 eventType] == 2)
    {
      uint64_t v6 = _TVRUIButtonLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "generatedButtonEvent [TVRUIButtonTypeKeyboard, TVRUIButtonEventTypeReleased]", (uint8_t *)&v15, 2u);
      }

      [(TVRUIRemoteViewController *)self keyboardRequested];
    }
  }
LABEL_21:
}

- (void)generatedTouchEvent:(id)a3
{
  id v6 = a3;
  id v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    uint64_t v5 = [(TVRUIRemoteViewController *)self activeDevice];
    [v5 sendTouchEvent:v6];
  }
}

- (void)keyboardRequested
{
  uint64_t v3 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Keyboard was requested", v9, 2u);
  }

  id v4 = [(TVRUIRemoteViewController *)self activeDevice];

  if (v4)
  {
    uint64_t v5 = [(TVRUIRemoteViewController *)self activeDevice];
    id v6 = [v5 keyboardAttributes];
    uint64_t v7 = [(TVRUIRemoteViewController *)self activeDevice];
    id v8 = [v7 currentText];
    [(TVRUIRemoteViewController *)self _presentKeyboardWithAttributes:v6 initialText:v8];
  }
}

- (void)_performSiriEffectsWithButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVRUIRemoteViewController *)self activeDevice];

  if (!v5)
  {
    int v10 = _TVRUIButtonLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRUIRemoteViewController _performSiriEffectsWithButtonEvent:](v10);
    }
    goto LABEL_11;
  }
  if ([v4 buttonType] != 4) {
    goto LABEL_18;
  }
  uint64_t v6 = [v4 eventType];
  switch(v6)
  {
    case 3:
      int v10 = _TVRUIButtonLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypeButtonDown", v14, 2u);
      }
LABEL_11:

      break;
    case 2:
      id v11 = _TVRUIButtonLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypeReleased", v13, 2u);
      }

      id v12 = [(TVRUIRemoteViewController *)self sessionData];
      [v12 setUsedSiri:1];

      id v8 = self;
      uint64_t v9 = 0;
      goto LABEL_17;
    case 1:
      uint64_t v7 = _TVRUIButtonLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypePressed", buf, 2u);
      }

      id v8 = self;
      uint64_t v9 = 1;
LABEL_17:
      [(TVRUIRemoteViewController *)v8 setSiriSessionActive:v9];
      break;
  }
LABEL_18:
}

- (void)_enableSearch
{
  id v2 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  [v2 enableSearchButton];
}

- (void)_disableSearch
{
  id v2 = [(TVRUIRemoteViewController *)self controlPanelViewController];
  [v2 disableSearchButton];
}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _TVRUIButtonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[TVRUIRemoteViewController consumeSinglePressDownForButtonKind:]";
    __int16 v8 = 2048;
    int64_t v9 = a3;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s, buttonKind=%ld", (uint8_t *)&v6, 0x16u);
  }

  if (a3 == 4)
  {
    [(TVRUIRemoteViewController *)self volumeDownEventGenerated];
  }
  else if (a3 == 3)
  {
    [(TVRUIRemoteViewController *)self volumeUpEventGenerated];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 forTouchpadView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  int64_t v9 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
  int v10 = [v9 isChannelButtonExpanded];

  if (v10)
  {
    id v11 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
    id v12 = [v11 _channelUpButtonView];

    id v13 = [(TVRUIRemoteViewController *)self view];
    [v12 frame];
    objc_msgSend(v13, "convertRect:fromView:", v12);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    __int16 v22 = [(TVRUIRemoteViewController *)self view];
    objc_msgSend(v22, "convertPoint:fromView:", v8, x, y);
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v32.origin.double x = v15;
    v32.origin.double y = v17;
    v32.size.double width = v19;
    v32.size.double height = v21;
    v31.double x = v24;
    v31.double y = v26;
    if (CGRectContainsPoint(v32, v31)) {
      uint64_t v27 = v12;
    }
    else {
      uint64_t v27 = 0;
    }
    id v28 = v27;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 name];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' supportsFindMy: %d", (uint8_t *)&v10, 0x12u);
  }
  int64_t v9 = [(TVRUIRemoteViewController *)self devicePickerViewController];
  [v9 _device:v6 updatedFindMySupported:v4];
}

- (void)_showFindingAlert
{
  id v25 = [(TVRUIRemoteViewController *)self findingSession];
  if ([v25 isFindingSessionActive])
  {
    uint64_t v3 = [(TVRUIRemoteViewController *)self view];
    BOOL v4 = [v3 window];

    if (v4)
    {
      uint64_t v5 = [(TVRUIRemoteViewController *)self view];
      id v6 = [v5 window];
      uint64_t v7 = [v6 rootViewController];
      id v26 = [v7 presentedViewController];

      id v8 = (void *)MEMORY[0x263F82418];
      int64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v10 = [v9 localizedStringForKey:@"TVRemoteUIFindingAlertTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
      supportsSiruint64_t i = self->_supportsSiri;
      __int16 v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v13 = v12;
      if (supportsSiri) {
        uint64_t v14 = @"TVRemoteUIFindingAlertSiriRemoteSubtitle";
      }
      else {
        uint64_t v14 = @"TVRemoteUIFindingAlertAppleTVSubtitle";
      }
      CGFloat v15 = [v12 localizedStringForKey:v14 value:&stru_26DB4CAE0 table:@"Localizable"];
      double v16 = [v8 alertControllerWithTitle:v10 message:v15 preferredStyle:1];

      CGFloat v17 = (void *)MEMORY[0x263F82400];
      double v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      CGFloat v19 = [v18 localizedStringForKey:@"TVRemoteUIFindingAlertDefaultButtonTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __46__TVRUIRemoteViewController__showFindingAlert__block_invoke;
      v28[3] = &unk_2648010D0;
      v28[4] = self;
      double v20 = [v17 actionWithTitle:v19 style:0 handler:v28];
      [v16 addAction:v20];

      CGFloat v21 = (void *)MEMORY[0x263F82400];
      __int16 v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v23 = [v22 localizedStringForKey:@"TVRemoteUIFindingAlertAlternateButtonTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __46__TVRUIRemoteViewController__showFindingAlert__block_invoke_206;
      v27[3] = &unk_2648010D0;
      v27[4] = self;
      CGFloat v24 = [v21 actionWithTitle:v23 style:0 handler:v27];
      [v16 addAction:v24];

      [v26 presentViewController:v16 animated:1 completion:0];
    }
  }
  else
  {
  }
}

void __46__TVRUIRemoteViewController__showFindingAlert__block_invoke(uint64_t a1)
{
  id v2 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "User requested to continue looking for the remote. Restarting finding session", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = [v3 activeDevice];
  [v3 _startFindingSessionForDevice:v4];
}

void __46__TVRUIRemoteViewController__showFindingAlert__block_invoke_206(uint64_t a1)
{
  id v2 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "User requested to stop finding remote", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) findingSession];
  [v3 stopFindingSession];
}

- (void)device:(id)a3 didUpdateSiriRemoteFindingSessionState:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 name];
    if (unint64_t)a4 < 7 && ((0x77u >> a4))
    {
      id v11 = off_264801160[a4];
    }
    else
    {
      int64_t v9 = NSString;
      int v10 = [NSNumber numberWithInteger:a4];
      id v11 = [v9 stringWithFormat:@"Unknown %@", v10];
    }
    *(_DWORD *)buf = 138543618;
    BOOL v13 = v8;
    __int16 v14 = 2114;
    CGFloat v15 = v11;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' did update finding state: %{public}@", buf, 0x16u);
  }
  if (a4 == 6) {
    [(TVRUIRemoteViewController *)self _showFindingAlert];
  }
}

- (void)device:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 playbackRate];

  if (v8)
  {
    int64_t v9 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
    int v10 = [v7 playbackRate];
    [v9 updatePlaybackRate:v10];
  }
  uint64_t v11 = [v7 captionsEnabled];
  if (v11)
  {
    __int16 v12 = (void *)v11;
    BOOL v13 = [v7 hasValidCaptionOptions];

    if (v13)
    {
      __int16 v14 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v15 = [v6 name];
        uint64_t v16 = [v7 captionsEnabled];
        CGFloat v17 = [v7 hasValidCaptionOptions];
        int v23 = 138543874;
        CGFloat v24 = v15;
        __int16 v25 = 2114;
        id v26 = v16;
        __int16 v27 = 2114;
        id v28 = v17;
        _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' updateCaptionState: %{public}@, hasValidCaptionOptions: %{public}@", (uint8_t *)&v23, 0x20u);
      }
      double v18 = [(TVRUIRemoteViewController *)self mediaControlsViewController];
      CGFloat v19 = [v7 captionsEnabled];
      uint64_t v20 = [v19 BOOLValue];
      CGFloat v21 = [v7 hasValidCaptionOptions];
      objc_msgSend(v18, "updateCaptionState:buttonDisabled:", v20, objc_msgSend(v21, "BOOLValue") ^ 1);
    }
  }
  __int16 v22 = [(TVRUIRemoteViewController *)self nowPlayingController];
  [v22 setNowPlayingInfo:v7];
}

- (void)device:(id)a3 supportsVolumeControl:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 name];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' supportsVolumeControl %d", (uint8_t *)&v10, 0x12u);
  }
  [(TVRUIRemoteViewController *)self setSupportsVolumeControl:v4];
  int64_t v9 = [(TVRUIRemoteViewController *)self delegate];
  [v9 device:v6 supportsVolume:v4];
}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volumeControl:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int64_t v9 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    __int16 v12 = "-[TVRUIRemoteViewController device:supportsSiri:volumeControl:]";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "%s device=%@, supportsSiri=%{BOOL}d, supportsVolumeControl=%{BOOL}d", (uint8_t *)&v11, 0x22u);
  }

  [(TVRUIRemoteViewController *)self setSupportsVolumeControl:v5];
  [(TVRUIRemoteViewController *)self setSupportsSiri:v6];
  int v10 = [(TVRUIRemoteViewController *)self delegate];
  [v10 device:v8 supportsSiri:v6 volume:v5];
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_volumeController)
  {
    BOOL v5 = [TVRUIVolumeController alloc];
    BOOL v6 = [(TVRUIRemoteViewController *)self view];
    id v7 = [v6 window];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke;
    v17[3] = &unk_264800688;
    v17[4] = self;
    id v8 = [(TVRUIVolumeController *)v5 initForWindow:v7 eventHandler:v17];
    volumeController = self->_volumeController;
    self->_volumeController = v8;
  }
  int v10 = [(TVRUIRemoteViewController *)self volumeController];
  [v10 setSupportsVolumeControl:v3];

  if (self->_isFindingSessionActive)
  {
    int v11 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "Finding session is active. Not enabling volume control", buf, 2u);
    }
  }
  else
  {
    __int16 v12 = [(TVRUIRemoteViewController *)self volumeController];
    __int16 v13 = v12;
    if (v3) {
      [v12 enableVolumeControl];
    }
    else {
      [v12 disableVolumeControl];
    }

    int v11 = [(TVRUIRemoteViewController *)self deviceObservers];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke_208;
    v14[3] = &__block_descriptor_33_e45_v32__0___TVRUIRemoteDeviceObserving__8Q16_B24l;
    BOOL v15 = v3;
    [v11 enumerateObjectsUsingBlock:v14];
  }
}

uint64_t __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2) {
    return [*(id *)(result + 32) volumeDownEventGenerated];
  }
  if (a2 == 1) {
    return [*(id *)(result + 32) volumeUpEventGenerated];
  }
  return result;
}

void __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke_208(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setVolumeControlAvailable:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (BOOL)supportsVolumeControl
{
  id v3 = [(TVRUIRemoteViewController *)self volumeController];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(TVRUIRemoteViewController *)self volumeController];
  char v5 = [v4 supportsVolumeControl];

  return v5;
}

- (void)setSupportsSiri:(BOOL)a3
{
  if (self->_supportsSiri == a3) {
    return;
  }
  self->_supportsSiruint64_t i = a3;
  char v5 = [MEMORY[0x263F82670] currentDevice];
  if ([v5 userInterfaceIdiom] == 1)
  {
  }
  else
  {
    BOOL v6 = [(TVRUIRemoteViewController *)self view];
    id v7 = [v6 window];
    id v8 = [v7 windowScene];
    uint64_t v9 = [v8 activationState];

    if (v9)
    {
LABEL_7:
      id v10 = [(TVRUIRemoteViewController *)self siriManager];
      [v10 unregisterForSiriEvents];
      goto LABEL_8;
    }
  }
  if (!a3) {
    goto LABEL_7;
  }
  id v10 = [(TVRUIRemoteViewController *)self siriManager];
  [v10 registerForSiriEvents];
LABEL_8:
}

- (void)volumeUpEventGenerated
{
  uint64_t v3 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(TVRUIRemoteViewController *)self activeDevice],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 supportsVolumeControl],
        v5,
        v4,
        v6))
  {
    id v7 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:10];
    [(TVRUIRemoteViewController *)self generatedButtonEvent:v7];
    id v8 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:10];
    [(TVRUIRemoteViewController *)self generatedButtonEvent:v8];
    uint64_t v9 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Sent volume UP button event", buf, 2u);
    }
  }
  else
  {
    id v7 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Volume up event generated but device does not support. Not sending", v10, 2u);
    }
  }
}

- (void)volumeDownEventGenerated
{
  uint64_t v3 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(TVRUIRemoteViewController *)self activeDevice],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 supportsVolumeControl],
        v5,
        v4,
        v6))
  {
    id v7 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:11];
    [(TVRUIRemoteViewController *)self generatedButtonEvent:v7];
    id v8 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:11];
    [(TVRUIRemoteViewController *)self generatedButtonEvent:v8];
    uint64_t v9 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Sent volume DOWN button event", buf, 2u);
    }
  }
  else
  {
    id v7 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Volume down event generated but device does not support. Not sending", v10, 2u);
    }
  }
}

- (void)_expandDeviceList
{
  if ([(TVRUIRemoteViewController *)self isNetworkReachable])
  {
    [(TVRUIRemoteViewController *)self _hideMessageContent];
    uint64_t v3 = [(TVRUIRemoteViewController *)self delegate];
    [v3 devicePickerWillExpand];

    id v4 = [(TVRUIRemoteViewController *)self devicePickerViewController];
    [v4 expandDeviceList];
  }
}

- (BOOL)_shouldAllowKeyboardToBePresented
{
  uint64_t v3 = [(TVRUIRemoteViewController *)self activeDevice];
  if (v3) {
    BOOL v4 = ![(TVRUIRemoteViewController *)self isSiriSessionActive];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_installTapToRadarButton
{
  if (+[TVRUIFeatures isTapToRadarEnabled])
  {
    uint64_t v3 = [(TVRUIRemoteViewController *)self tapToRadarButton];

    if (!v3)
    {
      dispatch_time_t v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke;
      block[3] = &unk_2647FFF70;
      void block[4] = self;
      dispatch_after(v4, MEMORY[0x263EF83A0], block);
    }
  }
}

void __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [v2 effectiveUserInterfaceLayoutDirection];

  dispatch_time_t v4 = +[TVRTapToRadarManager bugImage];
  char v5 = [MEMORY[0x263F824E8] buttonWithType:1];
  int v6 = [*(id *)(a1 + 32) styleProvider];
  id v7 = [v6 primaryTextAndGlyphColor];
  [v5 setTintColor:v7];

  [v5 setImage:v4 forState:0];
  double v8 = 0.0;
  if (v3 == 1)
  {
    uint64_t v9 = [*(id *)(a1 + 32) view];
    [v9 bounds];
    double v8 = CGRectGetWidth(v15) + -50.0;
  }
  objc_msgSend(v5, "setFrame:", v8, 0.0, 50.0, 50.0);
  [v5 addTarget:*(void *)(a1 + 32) action:sel__tapToRadar forControlEvents:0x2000];
  [v5 setAlpha:0.0];
  id v10 = [*(id *)(a1 + 32) view];
  [v10 addSubview:v5];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1176), v5);
  int v11 = (void *)MEMORY[0x263F82E00];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke_2;
  void v13[3] = &unk_2647FFF70;
  id v14 = v5;
  id v12 = v5;
  [v11 animateWithDuration:v13 animations:0.75];
}

uint64_t __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_tapToRadar
{
  id v3 = [(TVRUIRemoteViewController *)self view];
  id v2 = [v3 window];
  +[TVRTapToRadarManager fileRadarWithTitle:@"[TVRemote] " description:0 window:v2];
}

- (id)_stringForDeviceDeviceIdentifierType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"Unknown";
  }
  else {
    return off_264801198[a3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_forceShowMediaControls
{
  id v3 = [(TVRUIRemoteViewController *)self activeDevice];
  [(TVRUIRemoteViewController *)self device:v3 needsMediaControls:&unk_26DB65CC8];
}

- (int64_t)_connectionContextFromLaunchContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) > 8) {
    return 1;
  }
  else {
    return qword_2273F43A0[a3 - 5];
  }
}

- (id)_stringForConnectionContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unspecified";
  }
  else {
    return off_2648011C0[a3 - 1];
  }
}

- (void)_createFindingSessionIfNeeded
{
  if (!self->_findingSession)
  {
    id v3 = objc_alloc_init(TVRUIFindingSession);
    findingSession = self->_findingSession;
    self->_findingSession = v3;
    MEMORY[0x270F9A758](v3, findingSession);
  }
}

- (void)findButtonTappedForDevice:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Find button tapped for device: %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 isConnected])
  {
    [(TVRUIRemoteViewController *)self _startFindingSessionForDevice:v4];
  }
  else
  {
    [(TVRUIRemoteViewController *)self _selectDevice:v4 withConnectionContext:1];
    [(TVRUIRemoteViewController *)self setShouldStartFindingSession:1];
  }
}

- (void)_startFindingSessionForDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke;
  v6[3] = &unk_264801140;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TVRUIRemoteViewController *)self _turnOnBluetoothIfNeededWithCompletionBlock:v6];
}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = _TVRUIViewControllerLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth is enabled. Starting finding session", buf, 2u);
      }

      if (*(void *)(a1 + 32))
      {
        uint64_t v9 = _TVRUIViewControllerLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [*(id *)(a1 + 32) name];
          *(_DWORD *)buf = 138543362;
          CGFloat v21 = v10;
          _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Start finding session for: '%{public}@'", buf, 0xCu);
        }
        [*(id *)(a1 + 40) _createFindingSessionIfNeeded];
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        int v11 = [*(id *)(a1 + 40) findingSession];
        id v12 = *(void **)(a1 + 32);
        uint64_t v14 = MEMORY[0x263EF8330];
        uint64_t v15 = 3221225472;
        BOOL v16 = __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_251;
        __int16 v17 = &unk_264801118;
        id v18 = v12;
        objc_copyWeak(&v19, (id *)buf);
        __int16 v13 = [v11 startFindingSessionForDevice:v18 dismissedHandler:&v14];

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "enableFindingSession:", 1, v14, v15, v16, v17, v18);
          [*(id *)(a1 + 40) presentViewController:v13 animated:1 completion:0];
          [*(id *)(a1 + 40) findingSessionDidStart];
        }

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth is not enabled. Ignoring user action to start finding session", buf, 2u);
      }
    }
  }
}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_251(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v5 = 138543362;
    int v6 = v3;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Finding session ended for device: '%{public}@'", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) enableFindingSession:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained findingSessionDidEnd];
}

- (void)_stopFindingSessionForDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [v4 name];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Stop finding session for: '%{public}@'", (uint8_t *)&v9, 0xCu);
    }
    [v4 enableFindingSession:0];
    if (self->_findingSession)
    {
      uint64_t v7 = [(TVRUIRemoteViewController *)self findingSession];
      [v7 stopFindingSession];

      findingSession = self->_findingSession;
      self->_findingSession = 0;
    }
  }
}

- (void)findingSessionDidStart
{
  id v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Finding session started. Pausing volume support", v5, 2u);
  }

  id v4 = [(TVRUIRemoteViewController *)self volumeController];
  [v4 disableVolumeControl];

  self->_isFindingSessionActive = 1;
}

- (void)findingSessionDidEnd
{
  id v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Finding session ended. Restoring volume support.", v5, 2u);
  }

  self->_isFindingSessionActive = 0;
  id v4 = [(TVRUIRemoteViewController *)self volumeController];
  [v4 enableVolumeControl];
}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (NSString)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (void)setActiveDeviceIdentifier:(id)a3
{
}

- (TVRUIDevice)authenticatingDevice
{
  return self->_authenticatingDevice;
}

- (void)setAuthenticatingDevice:(id)a3
{
}

- (TVRUIDeviceQuery)deviceQuery
{
  return self->_deviceQuery;
}

- (void)setDeviceQuery:(id)a3
{
}

- (NSString)preferredDeviceIdentifier
{
  return self->_preferredDeviceIdentifier;
}

- (void)setPreferredDeviceIdentifier:(id)a3
{
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (void)setDeviceIdentifierType:(int64_t)a3
{
  self->_deviceIdentifierType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int64_t)a3
{
  self->_launchContext = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (NSArray)deviceObservers
{
  return self->_deviceObservers;
}

- (void)setDeviceObservers:(id)a3
{
}

- (TVRUITopButtonPanelViewController)topButtonPanelViewController
{
  return self->_topButtonPanelViewController;
}

- (void)setTopButtonPanelViewController:(id)a3
{
}

- (TVRUITouchpadViewController)touchpadViewController
{
  return self->_touchpadViewController;
}

- (void)setTouchpadViewController:(id)a3
{
}

- (TVRUIControlPanelViewController)controlPanelViewController
{
  return self->_controlPanelViewController;
}

- (void)setControlPanelViewController:(id)a3
{
}

- (UIView)blackGradientView
{
  return self->_blackGradientView;
}

- (void)setBlackGradientView:(id)a3
{
}

- (TVRUIDevicePickerViewController)devicePickerViewController
{
  return self->_devicePickerViewController;
}

- (void)setDevicePickerViewController:(id)a3
{
}

- (TVRUIMediaControlsViewController)mediaControlsViewController
{
  return self->_mediaControlsViewController;
}

- (void)setMediaControlsViewController:(id)a3
{
}

- (TVRAlertController)keyboardController
{
  return self->_keyboardController;
}

- (void)setKeyboardController:(id)a3
{
}

- (TVRAlertController)authenticationAlertController
{
  return self->_authenticationAlertController;
}

- (void)setAuthenticationAlertController:(id)a3
{
}

- (BOOL)isEditingSessionActive
{
  return self->_editingSessionActive;
}

- (void)setEditingSessionActive:(BOOL)a3
{
  self->_editingSessionActive = a3;
}

- (TVRMessageView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (TVRUINetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (void)setNetworkObserver:(id)a3
{
}

- (BOOL)isNetworkReachable
{
  return self->_networkReachable;
}

- (void)setNetworkReachable:(BOOL)a3
{
  self->_networkReachable = a3;
}

- (TVRKeyboardHaptic)keyboardHaptic
{
  return self->_keyboardHaptic;
}

- (void)setKeyboardHaptic:(id)a3
{
}

- (BOOL)isSiriSessionActive
{
  return self->_siriSessionActive;
}

- (void)setSiriSessionActive:(BOOL)a3
{
  self->_siriSessionActive = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (void)setTapToRadarButton:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (id)deviceQueryThresholdBlock
{
  return self->_deviceQueryThresholdBlock;
}

- (void)setDeviceQueryThresholdBlock:(id)a3
{
}

- (TVRUIVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (NSString)launchContextDesc
{
  return self->_launchContextDesc;
}

- (void)setLaunchContextDesc:(id)a3
{
}

- (TVRCSessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
}

- (TVRUISiriManager)siriManager
{
  return self->_siriManager;
}

- (void)setSiriManager:(id)a3
{
}

- (BSInvalidatable)volumeDecreaseSBSInvalidator
{
  return self->_volumeDecreaseSBSInvalidator;
}

- (void)setVolumeDecreaseSBSInvalidator:(id)a3
{
}

- (BSInvalidatable)volumeIncreaseSBSInvalidator
{
  return self->_volumeIncreaseSBSInvalidator;
}

- (void)setVolumeIncreaseSBSInvalidator:(id)a3
{
}

- (BOOL)isInReducedBacklightMode
{
  return self->_isInReducedBacklightMode;
}

- (void)setIsInReducedBacklightMode:(BOOL)a3
{
  self->_isInReducedBacklightMode = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (BOOL)deviceQueryThresholdReached
{
  return self->_deviceQueryThresholdReached;
}

- (void)setDeviceQueryThresholdReached:(BOOL)a3
{
  self->_deviceQueryThresholdReached = a3;
}

- (BOOL)isFindingSessionActive
{
  return self->_isFindingSessionActive;
}

- (void)setIsFindingSessionActive:(BOOL)a3
{
  self->_isFindingSessionActive = a3;
}

- (BOOL)shouldStartFindingSession
{
  return self->_shouldStartFindingSession;
}

- (void)setShouldStartFindingSession:(BOOL)a3
{
  self->_shouldStartFindingSession = a3;
}

- (TVRUIFindingSession)findingSession
{
  return self->_findingSession;
}

- (void)setFindingSession:(id)a3
{
}

- (TVRUINowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (TVRUIRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRUIRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRUIDeviceConnectionStatusDelegate)deviceConnectionStatusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceConnectionStatusDelegate);
  return (TVRUIDeviceConnectionStatusDelegate *)WeakRetained;
}

- (void)setDeviceConnectionStatusDelegate:(id)a3
{
}

- (BOOL)isInSecureWindow
{
  return self->_isInSecureWindow;
}

- (TVRUITipSourceViewProvider)tipSourceViewProvider
{
  return self->_tipSourceViewProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipSourceViewProvider, 0);
  objc_destroyWeak((id *)&self->_deviceConnectionStatusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_findingSession, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_siriManager, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_launchContextDesc, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong(&self->_deviceQueryThresholdBlock, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_keyboardHaptic, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_authenticationAlertController, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_mediaControlsViewController, 0);
  objc_storeStrong((id *)&self->_devicePickerViewController, 0);
  objc_storeStrong((id *)&self->_blackGradientView, 0);
  objc_storeStrong((id *)&self->_controlPanelViewController, 0);
  objc_storeStrong((id *)&self->_touchpadViewController, 0);
  objc_storeStrong((id *)&self->_topButtonPanelViewController, 0);
  objc_storeStrong((id *)&self->_deviceObservers, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_preferredDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceQuery, 0);
  objc_storeStrong((id *)&self->_authenticatingDevice, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

- (void)_connectToPreferredDeviceFromDeviceList:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 preferredDeviceIdentifier];
  OUTLINED_FUNCTION_0_2(&dword_227326000, v2, v3, "No device found for preferred device id %{public}@", v4, v5, v6, v7, 2u);
}

- (void)alertControllerPressedDictationButton:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TVRUIRemoteViewController alertControllerPressedDictationButton:]";
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "%s - no active device", (uint8_t *)&v1, 0xCu);
}

- (void)_performSiriEffectsWithButtonEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "No active device! Not performing Siri effects", v1, 2u);
}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Failed to turn on Bluetooth: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end