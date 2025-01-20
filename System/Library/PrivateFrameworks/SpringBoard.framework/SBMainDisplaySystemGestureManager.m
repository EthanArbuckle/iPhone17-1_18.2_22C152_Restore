@interface SBMainDisplaySystemGestureManager
+ (id)sharedInstance;
- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3;
- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3;
- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3;
- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3 ignoringUCB:(BOOL)a4;
- (SBFZStackParticipant)accessibilityZStackParticipant;
- (id)_init;
- (id)_initWithDisplayIdentity:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)dealloc;
- (void)setAccessibilityZStackParticipant:(id)a3;
- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBMainDisplaySystemGestureManager

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  char v3 = 1;
  switch(a3)
  {
    case 0uLL:
    case 0x41uLL:
    case 0x8BuLL:
      return 0;
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x44uLL:
    case 0x66uLL:
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
      if (__sb__runningInSpringBoard())
      {
        return SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        v8 = [MEMORY[0x1E4F42948] currentDevice];
        char v3 = [v8 userInterfaceIdiom] == 1;
LABEL_6:
      }
      return v3;
    case 0x12uLL:
    case 0x13uLL:
      if (__sb__runningInSpringBoard())
      {
        return SBFEffectiveDeviceClass() == 2 && self->_multitaskingGesturesEnabled;
      }
      else
      {
        v10 = [MEMORY[0x1E4F42948] currentDevice];
        char v3 = [v10 userInterfaceIdiom] == 1 && self->_multitaskingGesturesEnabled;
      }
      return v3;
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x39uLL:
      v4 = +[SBWorkspace mainWorkspace];
      char v5 = [v4 isMedusaCapable];

      return v5;
    case 0x37uLL:
    case 0x38uLL:
      v8 = +[SBWorkspace mainWorkspace];
      if ([v8 isMedusaCapable]) {
        char v3 = SBFIsChamoisOverflowGestureAvailable();
      }
      else {
        char v3 = 0;
      }
      goto LABEL_6;
    case 0x3AuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
      return SBFEffectiveHomeButtonType() == 2;
    case 0x84uLL:
    case 0x85uLL:
      return SBUIIsSystemApertureEnabled();
    case 0x87uLL:
      v11 = [(id)SBApp systemActionControl];
      char v3 = v11 != 0;

      return v3;
    case 0x88uLL:
    case 0x89uLL:
      if (!+[SBCaptureHardwareButton isCaptureFeatureEnabled]()) {
        return 0;
      }
      if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
      {
        return 1;
      }
      else
      {
        return +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]();
      }
    default:
      return v3;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_31 != -1) {
    dispatch_once(&sharedInstance_onceToken_31, &__block_literal_global_236);
  }
  v2 = (void *)sharedInstance___sharedInstance_17;
  return v2;
}

void __51__SBMainDisplaySystemGestureManager_sharedInstance__block_invoke()
{
  id v0 = [[SBMainDisplaySystemGestureManager alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_17;
  sharedInstance___sharedInstance_17 = (uint64_t)v0;
}

- (id)_initWithDisplayIdentity:(id)a3
{
  char v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBMainDisplaySystemGestureManager.m" lineNumber:54 description:@"unallowed initializer"];

  return [(SBMainDisplaySystemGestureManager *)self _init];
}

- (id)_init
{
  char v3 = [MEMORY[0x1E4F62420] mainIdentity];
  v9.receiver = self;
  v9.super_class = (Class)SBMainDisplaySystemGestureManager;
  v4 = [(SBSystemGestureManager *)&v9 _initWithDisplayIdentity:v3];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F62420] mainIdentity];
    v6 = (void *)v4[23];
    v4[23] = v5;

    *((unsigned char *)v4 + 192) = BSSystemHasCapability();
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel__evaluateEnablement name:@"SBWorkspaceMedusaCapabilityChangedNotification" object:0];

    [v4 _evaluateEnablement];
  }
  return v4;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySystemGestureManager;
  [(SBMainDisplaySystemGestureManager *)&v4 dealloc];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainDisplaySystemGestureManager;
  objc_super v4 = [(SBSystemGestureManager *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_multitaskingGesturesEnabled withName:@"_multitaskingGesturesEnabled"];
  return v4;
}

- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = +[SBUIController sharedInstanceIfExists];
  char v6 = [v5 isIconListViewTornDown];

  objc_super v7 = +[SBIconController sharedInstanceIfExists];
  v8 = [v7 iconManager];
  int v9 = [v8 isFolderScrolling];

  if ((v6 & 1) != 0 || !v9)
  {
    v32.receiver = self;
    v32.super_class = (Class)SBMainDisplaySystemGestureManager;
    BOOL v12 = [(SBSystemGestureManager *)&v32 _isGestureWithTypeAllowed:a3];
    v13 = +[SBSetupManager sharedInstance];
    int v14 = [v13 isInSetupMode];

    if (v14)
    {
      v15 = +[SBSetupManager sharedInstance];
      int v16 = [v15 isInSetupModeReadyToExit];

      BOOL v18 = a3 == 2 || a3 == 11;
      if (v16) {
        BOOL v21 = a3 == 48 || a3 == 18 || (a3 & 0xFFFFFFFFFFFFFFFBLL) == 41;
      }
      else {
        BOOL v21 = 0;
      }
      return v18 || v21;
    }
    else
    {
      v22 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      v23 = [v22 policyAggregator];
      id v31 = 0;
      char v24 = [v23 allowsCapability:7 explanation:&v31];
      v25 = (__CFString *)v31;

      if ((v24 & 1) == 0)
      {
        v26 = SBLogSystemGestureDetail();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [MEMORY[0x1E4F62420] mainIdentity];
          v28 = (void *)v27;
          v29 = @"(unknown reason)";
          if (v25) {
            v29 = v25;
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v27;
          __int16 v35 = 2112;
          v36 = v29;
          _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "(Display - %{public}@) Not allowing system gestures because: %@", buf, 0x16u);
        }
        BOOL v12 = 0;
      }
    }
  }
  else
  {
    v10 = SBLogSystemGestureDetail();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [MEMORY[0x1E4F62420] mainIdentity];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = (uint64_t)v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "(Display - %{public}@) Not allowing system gestures because we are scrolling a folder", buf, 0xCu);
    }
    return 0;
  }
  return v12;
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3
{
  return -[SBMainDisplaySystemGestureManager shouldSystemGestureReceiveTouchWithLocation:ignoringUCB:](self, "shouldSystemGestureReceiveTouchWithLocation:ignoringUCB:", 0, a3.x, a3.y);
}

- (BOOL)shouldSystemGestureReceiveTouchWithLocation:(CGPoint)a3 ignoringUCB:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)SBMainDisplaySystemGestureManager;
  unsigned int v7 = -[SBSystemGestureManager shouldSystemGestureReceiveTouchWithLocation:](&v29, sel_shouldSystemGestureReceiveTouchWithLocation_);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E4F42C68], "allVisiblePeripheralFrames", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) CGRectValue];
        if (v13 > 60.0)
        {

          int v14 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  int v14 = 1;
  int v15 = 1;
  if (!v4) {
LABEL_12:
  }
    int v15 = objc_msgSend(MEMORY[0x1E4F42C68], "pointIsWithinKeyboardContent:", x, y) ^ 1;
  int v16 = v7 & v15;
  v17 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v42.double x = x;
    v42.double y = y;
    uint64_t v18 = NSStringFromPoint(v42);
    v19 = (void *)v18;
    v20 = @"NO";
    if (v16) {
      BOOL v21 = @"YES";
    }
    else {
      BOOL v21 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    uint64_t v31 = v18;
    if (v4) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    v33 = v21;
    __int16 v32 = 2112;
    if (v14) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    __int16 v34 = 2112;
    __int16 v35 = v22;
    if (!v15) {
      v20 = @"YES";
    }
    __int16 v36 = 2112;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Should system gesture recieve touch with location:%@ <%@> ignoringUCB:%@ keyboardIsUCB:%@ touchIsInsideKeyboard:%@", buf, 0x34u);
  }
  return v16;
}

- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBMainDisplaySystemGestureManager;
  -[SBSystemGestureManager setSystemGesturesDisabledForAccessibility:](&v11, sel_setSystemGesturesDisabledForAccessibility_);
  id v5 = [(SBMainDisplaySystemGestureManager *)self accessibilityZStackParticipant];

  if (!v3 || v5)
  {
    if (!v3)
    {
      if (v5)
      {
        uint64_t v10 = [(SBMainDisplaySystemGestureManager *)self accessibilityZStackParticipant];
        [v10 invalidate];

        [(SBMainDisplaySystemGestureManager *)self setAccessibilityZStackParticipant:0];
      }
    }
  }
  else
  {
    char v6 = [(id)SBApp windowSceneManager];
    unsigned int v7 = [v6 windowSceneForDisplayIdentity:self->_displayIdentity];

    v8 = [v7 zStackResolver];
    uint64_t v9 = [v8 acquireParticipantWithIdentifier:28 delegate:self];
    [(SBMainDisplaySystemGestureManager *)self setAccessibilityZStackParticipant:v9];
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:0];
  [v4 setHomeGestureConsumption:1];
}

- (SBFZStackParticipant)accessibilityZStackParticipant
{
  return self->_accessibilityZStackParticipant;
}

- (void)setAccessibilityZStackParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityZStackParticipant, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end