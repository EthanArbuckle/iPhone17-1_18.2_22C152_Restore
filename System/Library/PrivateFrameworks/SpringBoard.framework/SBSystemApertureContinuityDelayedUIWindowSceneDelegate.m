@interface SBSystemApertureContinuityDelayedUIWindowSceneDelegate
- (SBContinuitySession)connectedSession;
- (void)_initializeUIIfNecessaryForReason:(id)a3;
- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3;
- (void)continuitySessionDidUpdateState:(id)a3;
- (void)didConnectToSession:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation SBSystemApertureContinuityDelayedUIWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = SBFEffectiveArtworkSubtype();
  if (v10 <= 2795)
  {
    if (v10 != 2556 && v10 != 2622) {
      goto LABEL_31;
    }
LABEL_7:
    v11 = [v9 role];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4FA7F78]];
    int v13 = [v11 isEqualToString:*MEMORY[0x1E4FA7F80]];
    int v14 = v13;
    if (v12)
    {
      debugName = self->_debugName;
      v16 = @"systemAperture";
    }
    else
    {
      if (!v13) {
        goto LABEL_12;
      }
      debugName = self->_debugName;
      v16 = @"systemApertureCurtain";
    }
    self->_debugName = &v16->isa;

LABEL_12:
    v17 = SBLogContinuityDisplay();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_debugName;
      *(_DWORD *)buf = 134218242;
      id v34 = v8;
      __int16 v35 = 2114;
      v36 = v18;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "System Aperture Scene <%p>:%{public}@ willConnectToSession", buf, 0x16u);
    }

    if (v12)
    {
      v19 = objc_opt_class();
      id v20 = v8;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          v19 = v20;
        }
        else {
          v19 = 0;
        }
      }
      v21 = v19;

      if (!v21)
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 64, @"systemApertureRole's scene is the wrong type %@", objc_opt_class() object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, v19);
      windowScene = self->_windowScene;
      self->_windowScene = v21;
      v23 = v21;

      v24 = +[SBContinuitySessionManager sharedInstance];
      v25 = [v24 registerSystemApertureWindowScene:v23];
    }
    else
    {
      if (!v14)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 75, @"unexpected role for SBSystemApertureContinuityWindowSceneDelegate: %@", v11 object file lineNumber description];
        goto LABEL_34;
      }
      v26 = objc_opt_class();
      id v27 = v8;
      if (v26)
      {
        if (objc_opt_isKindOfClass()) {
          v26 = v27;
        }
        else {
          v26 = 0;
        }
      }
      v28 = v26;

      if (!v28)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 70, @"systemApertureCurtainRole's scene is the wrong type %@", objc_opt_class() object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, v26);
      v29 = self->_windowScene;
      self->_windowScene = v28;
      v23 = v28;

      v24 = +[SBContinuitySessionManager sharedInstance];
      v25 = [v24 registerSystemApertureCurtainWindowScene:v23];
    }
    continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
    self->_continuitySessionManagerRegistration = v25;

LABEL_34:
    goto LABEL_35;
  }
  if (v10 == 2796 || v10 == 2868) {
    goto LABEL_7;
  }
LABEL_31:
  v11 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring Jindo continuity scene on non-jindo phone, plz stop sending them to me 125755442", buf, 2u);
  }
LABEL_35:
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    int v11 = 134218242;
    id v12 = v4;
    __int16 v13 = 2114;
    int v14 = debugName;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "System Aperture Scene <%p>:%{public}@ didDisconnect", (uint8_t *)&v11, 0x16u);
  }

  [(BSInvalidatable *)self->_continuitySessionManagerRegistration invalidate];
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = 0;

  [(SBSystemApertureContinuityDelayedUIWindowSceneDelegate *)self _tearDownUIAndInvalidateIfNecessaryForReason:@"scene disconnected"];
  windowScene = self->_windowScene;
  self->_windowScene = 0;

  systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
  self->_systemApertureContinuityWindowScene = 0;

  systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
  self->_systemApertureContinuityCurtainWindowScene = 0;
}

- (SBContinuitySession)connectedSession
{
  return self->_continuitySession;
}

- (void)didConnectToSession:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_continuitySession)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:100 description:@"Already have a session!!"];
  }
  v7 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    int v14 = 134218754;
    uint64_t v15 = windowScene;
    __int16 v16 = 2114;
    v17 = debugName;
    __int16 v18 = 2048;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ connected to session: <%p>:%@", (uint8_t *)&v14, 0x2Au);
  }

  objc_storeStrong((id *)&self->_continuitySession, a3);
  [v6 addStateObserver:self];
  uint64_t v10 = [(UIWindowScene *)self->_windowScene _FBSScene];
  int v11 = [v10 continuitySessionParticipantClientComponent];

  if (!v11)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:108 description:@"No SBUIContinuitySessionPartipantClientComponent"];
  }
  [v11 setContinuitySession:v6];
  [(SBSystemApertureContinuityDelayedUIWindowSceneDelegate *)self continuitySessionDidUpdateState:v6];
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  v5 = (SBContinuitySession *)a3;
  if (self->_continuitySession != v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 120, @"System aperture scene <%p>:%@ state update for session <%p> is not the one i'm tracking <%p>", self->_windowScene, self->_debugName, v5, self->_continuitySession object file lineNumber description];
  }
  switch([(SBContinuitySession *)v5 state])
  {
    case 1uLL:
      if (self->_initializedUI)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = v6;
        id v8 = @"State is blocked but we already created UI";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 127;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 2uLL:
      if (self->_initializedUI)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = v6;
        id v8 = @"State is preparingForRemoteUnlock but we already created UI";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 130;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 3uLL:
      if (self->_initializedUI)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = v6;
        id v8 = @"State is waitingForRemoteUnlock but we already created UI";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 133;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 4uLL:
      if (self->_initializedUI)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = v6;
        id v8 = @"State is waitingForScenes but we already created UI";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 136;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 5uLL:
      if (self->_initializedUI)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = v6;
        id v8 = @"State is waitingForHIDServices but we already created UI";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 139;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 6uLL:
      id v12 = [(SBContinuitySession *)v5 reasons];
      v7 = v12;
      if (self->_systemApertureContinuityWindowScene)
      {
        if ([v12 containsObject:@"checkpoint.waiting-for-ui-ready"])
        {
          __int16 v13 = SBLogContinuitySession();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:]();
          }
LABEL_32:

          goto LABEL_35;
        }
LABEL_33:
        [(SBSystemApertureContinuityDelayedUIWindowSceneDelegate *)self _initializeUIIfNecessaryForReason:@"session state .activating"];
        goto LABEL_35;
      }
      if (self->_systemApertureContinuityCurtainWindowScene)
      {
        if ([v12 containsObject:@"checkpoint.waiting-for-system-aperture-ui-ready"])
        {
          __int16 v13 = SBLogContinuitySession();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:]();
          }
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      int v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:163 description:@"What kind of system aperture scene is this??"];

LABEL_35:
LABEL_36:

      return;
    case 7uLL:
      if (self->_initializedUI) {
        goto LABEL_36;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = v6;
      id v8 = @"State moved to launching but we haven't initialized the UI yet";
      SEL v9 = a2;
      uint64_t v10 = self;
      uint64_t v11 = 169;
      goto LABEL_26;
    case 8uLL:
      if (self->_initializedUI) {
        goto LABEL_36;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = v6;
      id v8 = @"State moved to launching but we haven't initialized the UI yet";
      SEL v9 = a2;
      uint64_t v10 = self;
      uint64_t v11 = 172;
      goto LABEL_26;
    case 9uLL:
      if (self->_initializedUI) {
        goto LABEL_36;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = v6;
      id v8 = @"State moved to flushing but we haven't initialized the UI yet";
      SEL v9 = a2;
      uint64_t v10 = self;
      uint64_t v11 = 175;
      goto LABEL_26;
    case 10uLL:
      if (self->_initializedUI) {
        goto LABEL_36;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = v6;
      id v8 = @"State moved to active but we haven't initialized the UI yet";
      SEL v9 = a2;
      uint64_t v10 = self;
      uint64_t v11 = 178;
LABEL_26:
      [v6 handleFailureInMethod:v9 object:v10 file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:v11 description:v8];
      goto LABEL_35;
    case 11uLL:
      [(SBSystemApertureContinuityDelayedUIWindowSceneDelegate *)self _tearDownUIAndInvalidateIfNecessaryForReason:@"session state is .invalid"];
      goto LABEL_36;
    default:
      goto LABEL_36;
  }
}

- (void)_initializeUIIfNecessaryForReason:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  id v6 = SBLogContinuitySession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    *(_DWORD *)buf = 134218498;
    v26 = windowScene;
    __int16 v27 = 2114;
    v28 = debugName;
    __int16 v29 = 2114;
    v30 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ initializing UI if necessary - %{public}@", buf, 0x20u);
  }

  if (self->_initializedUI)
  {
    SEL v9 = SBLogContinuitySession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "--> already initialized UI", buf, 2u);
    }
  }
  else
  {
    uint64_t v10 = [(SBContinuitySession *)self->_continuitySession state];
    uint64_t v11 = SBLogContinuitySession();
    SEL v9 = v11;
    if (v10 == 6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](v9);
      }

      id v12 = SBLogContinuitySession();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](v12);
      }

      SEL v9 = [(SBContinuitySession *)self->_continuitySession mainWindowScene];
      if (!v9)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 203, @"We don't have an main window scene for the session: %@", self->_continuitySession object file lineNumber description];
      }
      __int16 v13 = SBLogContinuitySession();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v9 _sceneIdentifier];
        *(_DWORD *)buf = 134218242;
        v26 = (UIWindowScene *)v9;
        __int16 v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "--> associated main window scene is <%p>:%{public}@", buf, 0x16u);
      }
      uint64_t v15 = [v9 systemApertureController];
      if (!v15)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 207, @"Couldn't find the system aperture controller for the continuity display's main scene <%p>", v9);
      }
      systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
      if (systemApertureContinuityWindowScene)
      {
        [(SBAccessoryWindowScene *)systemApertureContinuityWindowScene setAssociatedWindowScene:v9];
        [v15 highLevelContinuitySystemApertureWindowSceneDidConnect:self->_systemApertureContinuityWindowScene];
        [(SBContinuitySession *)self->_continuitySession noteSystemApertureUIIsReady:self->_systemApertureContinuityWindowScene];
      }
      else
      {
        systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
        if (systemApertureContinuityCurtainWindowScene)
        {
          [(SBAccessoryWindowScene *)systemApertureContinuityCurtainWindowScene setAssociatedWindowScene:v9];
          [v15 superHighLevelContinuityCurtainWindowSceneDidConnect:self->_systemApertureContinuityCurtainWindowScene];
          [(SBContinuitySession *)self->_continuitySession noteSystemApertureCurtainUIIsReady:self->_systemApertureContinuityCurtainWindowScene];
        }
        else
        {
          uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:219 description:@"What kind of system aperture scene is this??"];
        }
      }
      self->_initializedUI = 1;
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_windowScene;
      __int16 v18 = self->_debugName;
      continuitySession = self->_continuitySession;
      if (continuitySession)
      {
        NSStringFromSBContinuitySessionState(v10);
        __int16 v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v20 = @".unknown because we don't have a session yet!";
      }
      *(_DWORD *)buf = 134218498;
      v26 = v17;
      __int16 v27 = 2114;
      v28 = v18;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ refuses to initialize UI because the session state is %{public}@", buf, 0x20u);
      if (continuitySession) {
    }
      }
  }
}

- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SBLogContinuitySession();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    *(_DWORD *)buf = 134218498;
    v25 = windowScene;
    __int16 v26 = 2114;
    __int16 v27 = debugName;
    __int16 v28 = 2114;
    id v29 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ tear down UI and invalidate if necessary - %{public}@", buf, 0x20u);
  }

  if (!self->_invalidated)
  {
    [(SBContinuitySession *)self->_continuitySession removeStateObserver:self];
    continuitySession = self->_continuitySession;
    self->_continuitySession = 0;

    BOOL initializedUI = self->_initializedUI;
    id v12 = SBLogContinuitySession();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!initializedUI)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "--> never initialized UI", buf, 2u);
      }
      goto LABEL_21;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "--> tearing down UI now...", buf, 2u);
    }

    systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
    if (systemApertureContinuityWindowScene)
    {
      id v12 = [(SBAccessoryWindowScene *)systemApertureContinuityWindowScene associatedWindowScene];
      uint64_t v15 = [v12 systemApertureController];
      __int16 v16 = (void *)v15;
      if (v12)
      {
        if (v15)
        {
LABEL_13:
          [v16 highLevelContinuitySystemApertureWindowSceneDidDisconnect:self->_systemApertureContinuityWindowScene];
          v17 = self->_systemApertureContinuityWindowScene;
          self->_systemApertureContinuityWindowScene = 0;
LABEL_20:

LABEL_21:
          self->_invalidated = 1;
          goto LABEL_22;
        }
      }
      else
      {
        __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 256, @"Could not find associated scene for systemApertureScene <%p>:%@", self->_windowScene, self->_debugName object file lineNumber description];

        if (v16) {
          goto LABEL_13;
        }
      }
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 257, @"Could not find systemApertureController for associatedScene <%p>:%@", self->_windowScene, self->_debugName object file lineNumber description];

      goto LABEL_13;
    }
    systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
    if (!systemApertureContinuityCurtainWindowScene)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m" lineNumber:270 description:@"What kind of system aperture scene is this??"];
      goto LABEL_21;
    }
    id v12 = [(SBAccessoryWindowScene *)systemApertureContinuityCurtainWindowScene associatedWindowScene];
    uint64_t v19 = [v12 systemApertureController];
    __int16 v16 = (void *)v19;
    if (v12)
    {
      if (v19)
      {
LABEL_19:
        [v16 superHighLevelContinuityCurtainWindowSceneDidDisconnect:self->_systemApertureContinuityCurtainWindowScene];
        v17 = self->_systemApertureContinuityCurtainWindowScene;
        self->_systemApertureContinuityCurtainWindowScene = 0;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 264, @"Could not find associated scene for systemApertureScene <%p>:%@", self->_windowScene, self->_debugName object file lineNumber description];

      if (v16) {
        goto LABEL_19;
      }
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m", 265, @"Could not find systemApertureController for associatedScene <%p>:%@", self->_windowScene, self->_debugName object file lineNumber description];

    goto LABEL_19;
  }
  SEL v9 = SBLogContinuitySession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "--> already invalidated", buf, 2u);
  }

LABEL_22:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_continuitySessionManagerRegistration, 0);
  objc_storeStrong((id *)&self->_continuitySession, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, 0);
}

- (void)continuitySessionDidUpdateState:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "<%p>:%{public}@ waiting on system aperture scene UI to be ready before initializing", v1, 0x16u);
}

- (void)continuitySessionDidUpdateState:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "<%p>:%{public}@ waiting on main scene UI to be ready before initializing", v1, 0x16u);
}

- (void)_initializeUIIfNecessaryForReason:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "--> initializing UI !!!", v1, 2u);
}

- (void)_initializeUIIfNecessaryForReason:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "--> state is .activating", v1, 2u);
}

@end