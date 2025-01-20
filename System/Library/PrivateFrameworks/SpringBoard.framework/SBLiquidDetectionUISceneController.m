@interface SBLiquidDetectionUISceneController
+ (id)_setupInfo;
- (BOOL)isLiquidDetectionBlocked;
- (SBLiquidDetectionUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8;
- (void)addLiquidDetectionObserver:(id)a3;
- (void)dealloc;
- (void)removeLiquidDetectionObserver:(id)a3;
- (void)scenePresenter:(id)a3 didPresentScene:(id)a4;
- (void)scenePresenter:(id)a3 willDismissScene:(id)a4;
- (void)setDefaultPresenter:(id)a3;
@end

@implementation SBLiquidDetectionUISceneController

- (SBLiquidDetectionUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  v17.receiver = self;
  v17.super_class = (Class)SBLiquidDetectionUISceneController;
  v8 = [(SBSystemUISceneController *)&v17 initWithSceneWorkspaceIdentifier:a3 clientProcessIdentity:a4 sceneVendingPolicy:a5 traitsRole:a6 jobLabel:a7 level:a8];
  v9 = v8;
  if (v8)
  {
    v8->_presenting = 0;
    v10 = [(id)SBApp lockOutController];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    lockOutController = v9->_lockOutController;
    v9->_lockOutController = v14;

    [(SBFDeviceLockOutController *)v9->_lockOutController setLiquidDetectionBlockProvider:v9];
  }
  return v9;
}

- (void)dealloc
{
  [(SBFDeviceLockOutController *)self->_lockOutController setLiquidDetectionBlockProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBLiquidDetectionUISceneController;
  [(SBSystemUISceneController *)&v3 dealloc];
}

+ (id)_setupInfo
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"class";
  v5[0] = objc_opt_class();
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[1] = @"enabled";
  v4[2] = @"traitsRole";
  v4[3] = @"presentationStyle";
  v5[2] = @"SBTraitsParticipantRoleSystemUIScene";
  v5[3] = &unk_1F3349DA0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (void)setDefaultPresenter:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBLiquidDetectionUISceneController;
  [(SBSystemUISceneController *)&v5 setDefaultPresenter:v4];
  if (objc_opt_respondsToSelector()) {
    [v4 setPresentingDelegate:self];
  }
}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  v38[3] = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(a4, "definition", a3);
  v6 = [v5 specification];
  v7 = [v6 uiSceneSessionRole];

  v8 = objc_opt_new();
  v9 = [v8 uiSceneSessionRole];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    self->_presenting = 1;
    if (!self->_suppressSystemGestures)
    {
      uint64_t v11 = +[SBSystemGestureManager mainDisplayManager];
      id v12 = [v11 acquireSystemGestureDisableAssertionForReason:@"Liquid Detection Critical UI Presentation" exceptSystemGestureTypes:0];
      suppressSystemGestures = self->_suppressSystemGestures;
      self->_suppressSystemGestures = v12;
    }
    if (!self->_suppressSystemAperture)
    {
      v14 = [(id)SBApp systemApertureControllerForMainDisplay];
      v15 = [v14 systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility];
      suppressSystemAperture = self->_suppressSystemAperture;
      self->_suppressSystemAperture = v15;
    }
    if (!self->_disableIdleTimer)
    {
      objc_super v17 = +[SBIdleTimerGlobalCoordinator sharedInstance];
      v18 = [v17 acquireIdleTimerDisableAssertionForReason:@"Liquid Detection Critical UI Presentation"];
      disableIdleTimer = self->_disableIdleTimer;
      self->_disableIdleTimer = v18;
    }
    v20 = +[SBLockScreenManager sharedInstance];
    v37[0] = @"SBUILockOptionsLockAutomaticallyKey";
    v21 = [NSNumber numberWithBool:1];
    v38[0] = v21;
    v37[1] = @"SBUILockOptionsUseScreenOffModeKey";
    v22 = [NSNumber numberWithBool:0];
    v38[1] = v22;
    v37[2] = @"SBUILockOptionsForceLockKey";
    v23 = [NSNumber numberWithBool:1];
    v38[2] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    [v20 lockUIFromSource:14 withOptions:v24];

    v25 = +[SBLockScreenManager sharedInstance];
    [v25 requestUserAttentionScreenWakeFromSource:14 reason:@"Liquid Detection Critical UI Presentation"];

    v26 = +[SBLockScreenManager sharedInstance];
    [v26 setBiometricAutoUnlockingDisabled:1 forReason:@"Liquid Detection Critical UI Presentation"];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v27 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v33;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v31++) liquidDetectionBlockStatusChanged:self];
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v29);
    }
  }
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend(a4, "definition", a3);
  v6 = [v5 specification];
  v7 = [v6 uiSceneSessionRole];

  v8 = objc_opt_new();
  v9 = [v8 uiSceneSessionRole];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    self->_presenting = 0;
    [(BSInvalidatable *)self->_suppressSystemGestures invalidate];
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = 0;

    [(BSInvalidatable *)self->_suppressSystemAperture invalidate];
    suppressSystemAperture = self->_suppressSystemAperture;
    self->_suppressSystemAperture = 0;

    [(BSInvalidatable *)self->_disableIdleTimer invalidate];
    disableIdleTimer = self->_disableIdleTimer;
    self->_disableIdleTimer = 0;

    v14 = +[SBLockScreenManager sharedInstance];
    [v14 setBiometricAutoUnlockingDisabled:0 forReason:@"Liquid Detection Critical UI Presentation"];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v19++) liquidDetectionBlockStatusChanged:self];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (BOOL)isLiquidDetectionBlocked
{
  return self->_presenting;
}

- (void)addLiquidDetectionObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeLiquidDetectionObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_disableIdleTimer, 0);
  objc_storeStrong((id *)&self->_suppressSystemAperture, 0);
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
}

@end