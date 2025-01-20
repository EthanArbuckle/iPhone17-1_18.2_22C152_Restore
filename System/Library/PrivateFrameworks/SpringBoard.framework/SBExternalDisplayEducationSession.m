@interface SBExternalDisplayEducationSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FBSDisplayIdentity)displayIdentity;
- (SBExternalDisplayEducationSession)initWithDisplayIdentity:(id)a3 hardwareAvailability:(BOOL)a4 bannerPoster:(id)a5;
- (void)_dismissBanner:(id)a3;
- (void)_dismissEducationAlert:(id)a3;
- (void)_presentBanner;
- (void)_presentEducationAlert:(id)a3;
- (void)dealloc;
- (void)deviceConnectionWindowExpired;
- (void)displayConnected;
- (void)displayDisconnected;
- (void)pillViewControllerDidReceiveUserTap:(id)a3;
- (void)updateHardwareAvailability:(BOOL)a3 withinDisplayConnectionWindow:(BOOL)a4;
@end

@implementation SBExternalDisplayEducationSession

- (SBExternalDisplayEducationSession)initWithDisplayIdentity:(id)a3 hardwareAvailability:(BOOL)a4 bannerPoster:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SBExternalDisplayEducationSession;
  v11 = [(SBExternalDisplayEducationSession *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayIdentity, a3);
    v12->_isHardwareAvailable = a4;
    v12->_isHardwareAvailableDuringDisplayConnectionWindow = a4;
    objc_storeStrong((id *)&v12->_bannerPoster, a5);
    id v13 = objc_alloc(MEMORY[0x1E4F4F660]);
    v14 = [NSString stringWithFormat:@"SBExternalDisplayEducationSession-%@.bannerDismissTimer", v12->_displayIdentity];
    uint64_t v15 = [v13 initWithIdentifier:v14];
    bannerDismissTimer = v12->_bannerDismissTimer;
    v12->_bannerDismissTimer = (BSAbsoluteMachTimer *)v15;

    v17 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
    displayDisconnectSignal = v12->_displayDisconnectSignal;
    v12->_displayDisconnectSignal = v17;

    v19 = +[SBDefaults localDefaults];
    v20 = [v19 externalDisplayDefaults];

    v12->_previousPresentedReasons = [v20 externalDisplayEducationReasons];
    v21 = SBLogDisplayEducation();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = _SBFLoggingMethodProem();
      v23 = SBExternalDisplayEducationReasonMaskDescription();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2114;
      v29 = v23;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ creating session with previous reasons: %{public}@", buf, 0x16u);
    }
  }

  return v12;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  [(BSAbsoluteMachTimer *)self->_bannerDismissTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayEducationSession;
  [(SBExternalDisplayEducationSession *)&v3 dealloc];
}

- (void)displayConnected
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDisplayEducation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    v27 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display connected", buf, 0xCu);
  }
  v6 = +[SBDefaults localDefaults];
  v7 = [v6 externalDisplayDefaults];

  unint64_t previousPresentedReasons = self->_previousPresentedReasons;
  if (!previousPresentedReasons)
  {
    v14 = SBLogDisplayEducation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = _SBFLoggingMethodProem();
      v16 = SBExternalDisplayEducationReasonMaskDescription();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      __int16 v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ we've not presented either alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__SBExternalDisplayEducationSession_displayConnected__block_invoke;
    v23[3] = &unk_1E6B08450;
    v23[4] = self;
    SEL v25 = a2;
    id v24 = v7;
    [(SBExternalDisplayEducationSession *)self _presentEducationAlert:v23];
    id v13 = v24;
    goto LABEL_12;
  }
  if (!self->_isHardwareAvailableDuringDisplayConnectionWindow)
  {
    if (previousPresentedReasons != 3) {
      goto LABEL_20;
    }
    id v9 = SBLogDisplayEducation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = _SBFLoggingMethodProem();
      v18 = SBExternalDisplayEducationReasonMaskDescription();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      v19 = "%{public}@ have presented both alerts before. rolling banner now. previousReasons: %{public}@";
LABEL_18:
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    }
LABEL_19:

    [(SBExternalDisplayEducationSession *)self _presentBanner];
    goto LABEL_20;
  }
  id v9 = SBLogDisplayEducation();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (previousPresentedReasons)
  {
    if (v10)
    {
      v17 = _SBFLoggingMethodProem();
      v18 = SBExternalDisplayEducationReasonMaskDescription();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      v19 = "%{public}@ hardwareReqs are satisfied. have presented satisfied alert before. rolling banner now. previousRe"
            "asons: %{public}@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v10)
  {
    v11 = _SBFLoggingMethodProem();
    v12 = SBExternalDisplayEducationReasonMaskDescription();
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    __int16 v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. haven't presented satisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__SBExternalDisplayEducationSession_displayConnected__block_invoke_50;
  v20[3] = &unk_1E6B08450;
  v20[4] = self;
  SEL v22 = a2;
  id v21 = v7;
  [(SBExternalDisplayEducationSession *)self _presentEducationAlert:v20];
  id v13 = v21;
LABEL_12:

LABEL_20:
}

void __53__SBExternalDisplayEducationSession_displayConnected__block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
    v4 = SBLogDisplayEducation();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = _SBFLoggingMethodProem();
        int v12 = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v12, 0xCu);
      }
      v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40) | 1;
    }
    else
    {
      if (v5)
      {
        v11 = _SBFLoggingMethodProem();
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as not satisfied alert", (uint8_t *)&v12, 0xCu);
      }
      v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40) | 2;
    }
    [v7 setExternalDisplayEducationReasons:v8];
  }
  else
  {
    id v9 = SBLogDisplayEducation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = _SBFLoggingMethodProem();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v12, 0xCu);
    }
  }
}

void __53__SBExternalDisplayEducationSession_displayConnected__block_invoke_50(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDisplayEducation();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = _SBFLoggingMethodProem();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) setExternalDisplayEducationReasons:*(void *)(*(void *)(a1 + 32) + 40) | 1];
  }
  else
  {
    if (v5)
    {
      v7 = _SBFLoggingMethodProem();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)updateHardwareAvailability:(BOOL)a3 withinDisplayConnectionWindow:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_isHardwareAvailable || !a3) {
    return;
  }
  self->_BOOL isHardwareAvailable = a3;
  if (a4 && !self->_isHardwareAvailableDuringDisplayConnectionWindow) {
    self->_BOOL isHardwareAvailableDuringDisplayConnectionWindow = a3;
  }
  v7 = SBLogDisplayEducation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = _SBFLoggingMethodProem();
    BOOL isHardwareAvailableDuringDisplayConnectionWindow = self->_isHardwareAvailableDuringDisplayConnectionWindow;
    *(_DWORD *)buf = 138543618;
    SEL v25 = v8;
    __int16 v26 = 1024;
    LODWORD(v27) = isHardwareAvailableDuringDisplayConnectionWindow;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ _isHardwareAvailableDuringDisplayConnectionWindow: %{BOOL}u", buf, 0x12u);
  }
  if (self->_isHardwareAvailableDuringDisplayConnectionWindow)
  {
    if (!self->_isPresenting)
    {
      unint64_t previousPresentedReasons = self->_previousPresentedReasons;
      v11 = SBLogDisplayEducation();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (previousPresentedReasons)
      {
        if (v12)
        {
          id v21 = _SBFLoggingMethodProem();
          SEL v22 = SBExternalDisplayEducationReasonMaskDescription();
          *(_DWORD *)buf = 138543618;
          SEL v25 = v21;
          __int16 v26 = 2114;
          v27 = v22;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. have presented satisfied alert before. rolling banner now. previousReasons: %{public}@", buf, 0x16u);
        }
        [(SBExternalDisplayEducationSession *)self _presentBanner];
      }
      else
      {
        if (v12)
        {
          id v13 = _SBFLoggingMethodProem();
          uint64_t v14 = SBExternalDisplayEducationReasonMaskDescription();
          *(_DWORD *)buf = 138543618;
          SEL v25 = v13;
          __int16 v26 = 2114;
          v27 = v14;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. haven't presented satisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __94__SBExternalDisplayEducationSession_updateHardwareAvailability_withinDisplayConnectionWindow___block_invoke;
        v23[3] = &unk_1E6B08478;
        v23[4] = self;
        void v23[5] = a2;
        [(SBExternalDisplayEducationSession *)self _presentEducationAlert:v23];
      }
      return;
    }
  }
  else if (!self->_isPresenting)
  {
    return;
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v16 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    v17 = SBLogDisplayEducation();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = _SBFLoggingMethodProem();
      BOOL isHardwareAvailable = self->_isHardwareAvailable;
      BOOL v20 = self->_isHardwareAvailableDuringDisplayConnectionWindow;
      *(_DWORD *)buf = 138544130;
      SEL v25 = v18;
      __int16 v26 = 2114;
      v27 = v16;
      __int16 v28 = 1024;
      BOOL v29 = isHardwareAvailable;
      __int16 v30 = 1024;
      BOOL v31 = v20;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ telling remoteObject %{public}@; hardwareAvailable: %{BOOL}u; during window: %{BOOL}u",
        buf,
        0x22u);
    }
    [v16 externalDisplayHardwareRequirementsSatisfiedChanged:self->_isHardwareAvailable];
  }
}

void __94__SBExternalDisplayEducationSession_updateHardwareAvailability_withinDisplayConnectionWindow___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDisplayEducation();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = _SBFLoggingMethodProem();
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v9, 0xCu);
    }
    v7 = +[SBDefaults localDefaults];
    v4 = [v7 externalDisplayDefaults];

    [v4 setExternalDisplayEducationReasons:*(void *)(*(void *)(a1 + 32) + 40) | 1];
  }
  else if (v5)
  {
    int v8 = _SBFLoggingMethodProem();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v9, 0xCu);
  }
}

- (void)deviceConnectionWindowExpired
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDisplayEducation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ device connection window expired", buf, 0xCu);
  }
  if (!self->_isHardwareAvailableDuringDisplayConnectionWindow && !self->_isPresenting)
  {
    unint64_t previousPresentedReasons = self->_previousPresentedReasons;
    v7 = SBLogDisplayEducation();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((previousPresentedReasons & 2) != 0)
    {
      if (v8)
      {
        uint64_t v11 = _SBFLoggingMethodProem();
        BOOL v12 = SBExternalDisplayEducationReasonMaskDescription();
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v11;
        __int16 v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are not satisfied. have presented unsatisfied alert before. rolling banner now. previousReasons: %{public}@", buf, 0x16u);
      }
      [(SBExternalDisplayEducationSession *)self _presentBanner];
    }
    else
    {
      if (v8)
      {
        int v9 = _SBFLoggingMethodProem();
        uint64_t v10 = SBExternalDisplayEducationReasonMaskDescription();
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v9;
        __int16 v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are not satisfied. haven't presented unsatisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__SBExternalDisplayEducationSession_deviceConnectionWindowExpired__block_invoke;
      v13[3] = &unk_1E6B08478;
      v13[4] = self;
      v13[5] = a2;
      [(SBExternalDisplayEducationSession *)self _presentEducationAlert:v13];
    }
  }
}

void __66__SBExternalDisplayEducationSession_deviceConnectionWindowExpired__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = SBLogDisplayEducation();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = _SBFLoggingMethodProem();
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as not satisfied alert", (uint8_t *)&v9, 0xCu);
    }
    v7 = +[SBDefaults localDefaults];
    v4 = [v7 externalDisplayDefaults];

    [v4 setExternalDisplayEducationReasons:*(void *)(*(void *)(a1 + 32) + 40) | 2];
  }
  else if (v5)
  {
    BOOL v8 = _SBFLoggingMethodProem();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v9, 0xCu);
  }
}

- (void)displayDisconnected
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(BSAtomicSignal *)self->_displayDisconnectSignal signal];
  int v3 = SBLogDisplayEducation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = _SBFLoggingMethodProem();
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ display disconnected", (uint8_t *)&v5, 0xCu);
  }
  if (self->_isPresenting)
  {
    [(SBExternalDisplayEducationSession *)self _dismissEducationAlert:@"Display Disconnected"];
    [(SBExternalDisplayEducationSession *)self _dismissBanner:@"Display Disconnected"];
  }
}

- (void)_dismissEducationAlert:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v6 = SBLogDisplayEducation();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (xpcConnection)
  {
    if (v7)
    {
      BOOL v8 = _SBFLoggingMethodProem();
      int v9 = self->_xpcConnection;
      int v13 = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alert for reason: %{public}@; via: xpcConnection (%{public}@)",
        (uint8_t *)&v13,
        0x20u);
    }
    uint64_t v10 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxy];
    [v10 dismissAnimated:1];
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = _SBFLoggingMethodProem();
      alertHandle = self->_alertHandle;
      int v13 = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = alertHandle;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alert for reason: %{public}@; via: alertHandle (%{public}@)",
        (uint8_t *)&v13,
        0x20u);
    }
    [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
  }
}

- (void)_presentEducationAlert:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 294, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  if (self->_isPresenting)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBExternalDisplayEducationObserver.m" lineNumber:295 description:@"we can only show education banner / alert once per display connection session"];
  }
  self->_isPresenting = 1;
  v6 = [MEMORY[0x1E4F29290] anonymousListener];
  listener = self->_listener;
  self->_listener = v6;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener activate];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.SpringBoardEducation" viewControllerClassName:@"SBERemoteViewController"];
  [v8 setPrefersEmbeddedDisplayPresentation:1];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  uint64_t v10 = [(NSXPCListener *)self->_listener endpoint];
  uint64_t v11 = [v10 _endpoint];
  [v9 setXpcEndpoint:v11];

  BOOL v12 = (SBSRemoteAlertHandle *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v8 configurationContext:v9];
  alertHandle = self->_alertHandle;
  self->_alertHandle = v12;

  id v14 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  v29[0] = &unk_1F334AA78;
  v28[0] = @"SBEducationRemoteViewControllerEducationTypeKey";
  v28[1] = @"SBEducationRemoteViewControllerHasPointerAndKeyboardConnectedKey";
  __int16 v15 = [NSNumber numberWithBool:self->_isHardwareAvailableDuringDisplayConnectionWindow];
  v29[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v14 setUserInfo:v16];

  __int16 v17 = (void *)MEMORY[0x1E4F4F670];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke;
  v25[3] = &unk_1E6B084A0;
  id v26 = v5;
  SEL v27 = a2;
  v25[4] = self;
  id v18 = v5;
  uint64_t v19 = [v17 responderWithHandler:v25];
  [v19 setQueue:MEMORY[0x1E4F14428]];
  BOOL v20 = (void *)MEMORY[0x1E4F1CAD0];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F4F668]) initWithInfo:0 responder:v19];
  SEL v22 = [v20 setWithObject:v21];
  [v14 setActions:v22];

  [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:v14];
}

void __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];
  if (v4)
  {
    id v5 = SBLogDisplayEducation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  else
  {
    v6 = [v3 info];
    uint64_t v7 = [v6 flagForSetting:1];

    if (v7) {
      int v8 = 1;
    }
    else {
      int v8 = 2;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      int v9 = 0;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = SBLogDisplayEducation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = _SBFLoggingMethodProem();
      int v16 = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received response from user. externalDisplayEnabled: %{BOOL}u", (uint8_t *)&v16, 0x12u);
    }
    BOOL v12 = v7 == 0;

    int v13 = +[SBDefaults localDefaults];
    id v5 = [v13 externalDisplayDefaults];

    id v14 = +[SBDefaults localDefaults];
    __int16 v15 = [v14 appSwitcherDefaults];
    [v15 setShouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates:0];

    [v5 setMirroringEnabled:v12];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_presentBanner
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isPresenting)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBExternalDisplayEducationObserver.m" lineNumber:338 description:@"we can only show education banner / alert once per display connection session"];
  }
  self->_isPresenting = 1;
  id v4 = +[SBDefaults localDefaults];
  id v5 = [v4 externalDisplayDefaults];

  v6 = -[SBExternalDisplayEducationPillViewController initWithExtendedDisplayEnabled:]([SBExternalDisplayEducationPillViewController alloc], "initWithExtendedDisplayEnabled:", [v5 isMirroringEnabled] ^ 1);
  educationBannerViewController = self->_educationBannerViewController;
  self->_educationBannerViewController = v6;

  [(SBExternalDisplayEducationPillViewController *)self->_educationBannerViewController setDelegate:self];
  bannerPoster = self->_bannerPoster;
  int v9 = self->_educationBannerViewController;
  id v18 = 0;
  [(BNPosting *)bannerPoster postPresentable:v9 withOptions:1 userInfo:0 error:&v18];
  id v10 = v18;
  if (v10)
  {
    uint64_t v11 = SBLogDisplayEducation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = _SBFLoggingMethodProem();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v14;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_ERROR, "%{public}@ error while presenting education banner: %{public}@", location, 0x16u);
    }
  }
  objc_initWeak((id *)location, self);
  bannerDismissTimer = self->_bannerDismissTimer;
  id v13 = MEMORY[0x1E4F14428];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__SBExternalDisplayEducationSession__presentBanner__block_invoke;
  v16[3] = &unk_1E6AF5838;
  objc_copyWeak(&v17, (id *)location);
  [(BSAbsoluteMachTimer *)bannerDismissTimer scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v16 queue:3.0 handler:0.05];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);
}

void __51__SBExternalDisplayEducationSession__presentBanner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissBanner:@"Timer"];
}

- (void)_dismissBanner:(id)a3
{
  id v7 = a3;
  bannerPoster = self->_bannerPoster;
  id v5 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:self->_educationBannerViewController];
  id v6 = (id)[(BNPosting *)bannerPoster revokePresentablesWithIdentification:v5 reason:v7 options:0 userInfo:0 error:0];
}

- (void)pillViewControllerDidReceiveUserTap:(id)a3
{
  [(BSAbsoluteMachTimer *)self->_bannerDismissTimer invalidate];
  bannerDismissTimer = self->_bannerDismissTimer;
  self->_bannerDismissTimer = 0;

  [(SBExternalDisplayEducationSession *)self _dismissBanner:@"User Interaction"];
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DISPLAY&path=DISPLAY_ARRANGEMENT"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v5, 0, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = [(BSAtomicSignal *)self->_displayDisconnectSignal hasBeenSignalled];
  if (v8)
  {
    int v9 = SBLogDisplayEducation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBExternalDisplayEducationSession listener:shouldAcceptNewConnection:]((uint64_t)self, (uint64_t)a2, v9);
    }
  }
  else
  {
    [v7 setExportedObject:self];
    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34C9CA8];
    [v7 setExportedInterface:v10];

    uint64_t v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35B19E8];
    [v7 setRemoteObjectInterface:v11];

    [v7 resume];
    objc_storeStrong((id *)&self->_xpcConnection, a4);
    int v9 = SBLogDisplayEducation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = _SBFLoggingMethodProem();
      int v14 = 138543362;
      __int16 v15 = v12;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ client connected ", (uint8_t *)&v14, 0xCu);
    }
  }

  return v8 ^ 1;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerDismissTimer, 0);
  objc_storeStrong((id *)&self->_educationBannerViewController, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_bannerPoster, 0);
  objc_storeStrong((id *)&self->_displayDisconnectSignal, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

void __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = _SBFLoggingMethodProem();
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ received error back from education service: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ client connected but our display is already gone. we're talking to a ghost.", (uint8_t *)&v5, 0xCu);
}

@end