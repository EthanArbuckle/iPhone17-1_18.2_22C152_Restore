@interface COSResumePairingStateController
- (BOOL)_checkCurrentStateValidity;
- (BOOL)didRestoreValueForPaneClass:(Class)a3;
- (BOOL)handledIPEFinished;
- (BOOL)handledWatchConnection;
- (BOOL)isInResumeFlow;
- (BOOL)isResumingPairing;
- (BOOL)shouldPromptToResumePairing;
- (COSResumePairingState)currentState;
- (COSSetupController)setupController;
- (NRDevice)observedDevice;
- (void)_saveCurrentState;
- (void)_startNewPairingState;
- (void)clearPairingState;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)didConnectToWatch:(id)a3;
- (void)didFinishIPE;
- (void)loadPairingState;
- (void)resumePairing;
- (void)saveBoolValue:(BOOL)a3 forPaneClass:(Class)a4;
- (void)setCurrentState:(id)a3;
- (void)setHandledIPEFinished:(BOOL)a3;
- (void)setHandledWatchConnection:(BOOL)a3;
- (void)setIsInResumeFlow:(BOOL)a3;
- (void)setObservedDevice:(id)a3;
- (void)setSetupController:(id)a3;
- (void)startPairingOver;
@end

@implementation COSResumePairingStateController

- (void)dealloc
{
  observedDevice = self->_observedDevice;
  uint64_t v6 = NRDevicePropertyLocalPairingDataStorePath;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [(NRDevice *)observedDevice removePropertyObserver:self forPropertyChanges:v4];

  v5.receiver = self;
  v5.super_class = (Class)COSResumePairingStateController;
  [(COSResumePairingStateController *)&v5 dealloc];
}

- (void)loadPairingState
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[COSResumePairingStateController loadPairingState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[NSUserDefaults standardUserDefaults];
  objc_super v5 = [v4 objectForKey:@"LastResumePairingState"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = 0;
      uint64_t v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v14];
      v7 = (COSResumePairingState *)v14;
      currentState = v7;
      if (!v6 || v7)
      {
        v10 = pbb_bridge_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(COSResumePairingState *)currentState localizedDescription];
          *(_DWORD *)buf = 138543362;
          v16 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error decoding resume pairing state: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_currentState, v6);
        unsigned __int8 v9 = [(COSResumePairingStateController *)self _checkCurrentStateValidity];
        v10 = pbb_bridge_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully loaded resume pairing state.", buf, 2u);
          }

          goto LABEL_20;
        }
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resume pairing state no longer valid, clearing.", buf, 2u);
        }
      }

      [(COSResumePairingStateController *)self clearPairingState];
LABEL_20:

      goto LABEL_21;
    }
  }
  v12 = pbb_bridge_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No resume pairing state data found.", buf, 2u);
  }

  currentState = self->_currentState;
  self->_currentState = 0;
LABEL_21:

  *(_WORD *)&self->_isInResumeFlow = 0;
  self->_handledIPEFinished = 0;
}

- (BOOL)shouldPromptToResumePairing
{
  int v3 = _os_feature_enabled_impl();
  if (v3) {
    LOBYTE(v3) = self->_currentState != 0;
  }
  return v3;
}

- (void)clearPairingState
{
  int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[COSResumePairingStateController clearPairingState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  currentState = self->_currentState;
  self->_currentState = 0;

  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"LastResumePairingState"];

  self->_isInResumeFlow = 0;
}

- (void)saveBoolValue:(BOOL)a3 forPaneClass:(Class)a4
{
  BOOL v5 = a3;
  v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromClass(a4);
    int v13 = 136315650;
    id v14 = "-[COSResumePairingStateController saveBoolValue:forPaneClass:]";
    __int16 v15 = 2112;
    v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: paneClass: %@, value: %{BOOL}d", (uint8_t *)&v13, 0x1Cu);
  }
  currentState = self->_currentState;
  if (currentState)
  {
    v10 = +[NSNumber numberWithBool:v5];
    BOOL v11 = NSStringFromClass(a4);
    [(COSResumePairingState *)currentState saveValue:v10 forPaneClassName:v11];

    [(COSResumePairingStateController *)self _saveCurrentState];
  }
  else
  {
    v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tried to save value but there is no current state!", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)resumePairing
{
  int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[COSResumePairingStateController resumePairing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (self->_currentState)
  {
    self->_isInResumeFlow = 1;
    v4 = [UIApp bridgeController];
    [v4 setTinkerPairing:[(COSResumePairingState *)self->_currentState isTinkerPairing]];
  }
  else
  {
    v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tried to resume pairing but there is no current state to resume!", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)startPairingOver
{
  self->_isInResumeFlow = 0;
}

- (void)didConnectToWatch:(id)a3
{
  id v5 = a3;
  if (!self->_handledWatchConnection)
  {
    if (self->_currentState) {
      BOOL isInResumeFlow = self->_isInResumeFlow;
    }
    else {
      BOOL isInResumeFlow = 0;
    }
    v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[COSResumePairingStateController didConnectToWatch:]";
      __int16 v13 = 1024;
      BOOL v14 = isInResumeFlow;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: shouldRestoreValues: %{BOOL}d", buf, 0x12u);
    }

    if (isInResumeFlow)
    {
      [(COSResumePairingState *)self->_currentState enumerateSavedValuesUsingBlock:&stru_100243E98];
      objc_storeStrong((id *)&self->_observedDevice, a3);
      observedDevice = self->_observedDevice;
      uint64_t v10 = NRDevicePropertyLocalPairingDataStorePath;
      unsigned __int8 v9 = +[NSArray arrayWithObjects:&v10 count:1];
      [(NRDevice *)observedDevice addPropertyObserver:self forPropertyChanges:v9];
    }
    else
    {
      [(COSResumePairingStateController *)self _startNewPairingState];
    }
    self->_handledWatchConnection = 1;
  }
}

- (void)didFinishIPE
{
  if (!self->_handledIPEFinished)
  {
    if (self->_currentState) {
      BOOL isInResumeFlow = self->_isInResumeFlow;
    }
    else {
      BOOL isInResumeFlow = 0;
    }
    v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      int v6 = "-[COSResumePairingStateController didFinishIPE]";
      __int16 v7 = 1024;
      BOOL v8 = isInResumeFlow;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: shouldRestoreValues: %{BOOL}d", (uint8_t *)&v5, 0x12u);
    }

    if (isInResumeFlow) {
      [(COSResumePairingState *)self->_currentState enumerateSavedValuesUsingBlock:&stru_100243EB8];
    }
    self->_handledIPEFinished = 1;
  }
}

- (BOOL)didRestoreValueForPaneClass:(Class)a3
{
  currentState = self->_currentState;
  if (!currentState || !self->_isInResumeFlow) {
    return 0;
  }
  v4 = NSStringFromClass(a3);
  unsigned __int8 v5 = [(COSResumePairingState *)currentState hasSavedValueForClassName:v4];

  return v5;
}

- (BOOL)isResumingPairing
{
  return self->_isInResumeFlow;
}

- (void)_startNewPairingState
{
  int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    unsigned __int8 v9 = "-[COSResumePairingStateController _startNewPairingState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(COSResumePairingStateController *)self clearPairingState];
  v4 = (COSResumePairingState *)objc_opt_new();
  currentState = self->_currentState;
  self->_currentState = v4;

  int v6 = +[NSDate date];
  [(COSResumePairingState *)self->_currentState setPairingStartedDate:v6];

  __int16 v7 = [UIApp bridgeController];
  -[COSResumePairingState setIsTinkerPairing:](self->_currentState, "setIsTinkerPairing:", [v7 isTinkerPairing]);

  [(COSResumePairingStateController *)self _saveCurrentState];
}

- (BOOL)_checkCurrentStateValidity
{
  v2 = [(COSResumePairingState *)self->_currentState pairingStartedDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = fabs(v3) <= 86400.0;

  return v4;
}

- (void)_saveCurrentState
{
  currentState = self->_currentState;
  id v8 = 0;
  double v3 = +[NSKeyedArchiver archivedDataWithRootObject:currentState requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  unsigned __int8 v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v3 forKey:@"LastResumePairingState"];

  int v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v7 = [v4 localizedDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[COSResumePairingStateController _saveCurrentState]";
    __int16 v11 = 2114;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: error: %{public}@", buf, 0x16u);
  }
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = NRDevicePropertyLocalPairingDataStorePath;
  uint64_t v10 = [v7 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (v10 && [v8 isEqualToString:v9])
  {
    __int16 v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NRDevice propertyDidChange %@ %@", buf, 0x16u);
    }

    uint64_t v13 = v9;
    v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [v7 removePropertyObserver:self forPropertyChanges:v12];

    [(COSResumePairingStateController *)self didFinishIPE];
  }
}

- (COSSetupController)setupController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);

  return (COSSetupController *)WeakRetained;
}

- (void)setSetupController:(id)a3
{
}

- (COSResumePairingState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (BOOL)isInResumeFlow
{
  return self->_isInResumeFlow;
}

- (void)setIsInResumeFlow:(BOOL)a3
{
  self->_BOOL isInResumeFlow = a3;
}

- (BOOL)handledWatchConnection
{
  return self->_handledWatchConnection;
}

- (void)setHandledWatchConnection:(BOOL)a3
{
  self->_handledWatchConnection = a3;
}

- (BOOL)handledIPEFinished
{
  return self->_handledIPEFinished;
}

- (void)setHandledIPEFinished:(BOOL)a3
{
  self->_handledIPEFinished = a3;
}

- (NRDevice)observedDevice
{
  return self->_observedDevice;
}

- (void)setObservedDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedDevice, 0);
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_destroyWeak((id *)&self->_setupController);
}

@end