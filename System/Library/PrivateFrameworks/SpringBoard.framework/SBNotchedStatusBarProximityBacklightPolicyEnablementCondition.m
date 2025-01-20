@interface SBNotchedStatusBarProximityBacklightPolicyEnablementCondition
- (BOOL)isEnabled;
- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)init;
- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)initWithMainDisplaySceneManager:(id)a3 windowSceneStatusBarManager:(id)a4 statusBarServer:(id)a5 orientationProvider:(id)a6;
- (SBNotchedStatusBarProximityBacklightPolicyEnablementConditionDelegate)delegate;
- (double)enabledStatusBarHeight;
- (void)_evaluateEnablement;
- (void)_setEnabled:(BOOL)a3 statusBarHeight:(double)a4;
- (void)dealloc;
- (void)invalidate;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
- (void)setDelegate:(id)a3;
- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4;
- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4;
@end

@implementation SBNotchedStatusBarProximityBacklightPolicyEnablementCondition

- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)init
{
  v3 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v4 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42E40]) initWithStatusBar:0];
  v6 = [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self initWithMainDisplaySceneManager:v3 windowSceneStatusBarManager:v4 statusBarServer:v5 orientationProvider:SBApp];

  return v6;
}

- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)initWithMainDisplaySceneManager:(id)a3 windowSceneStatusBarManager:(id)a4 statusBarServer:(id)a5 orientationProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicyEnablementCondition;
  v15 = [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mainDisplaySceneManager, a3);
    [(SBMainDisplaySceneManager *)v16->_mainDisplaySceneManager addObserver:v16];
    objc_storeStrong((id *)&v16->_windowSceneStatusBarManager, a4);
    uint64_t v17 = [v12 assertionManager];
    statusBarAssertionManager = v16->_statusBarAssertionManager;
    v16->_statusBarAssertionManager = (SBWindowSceneStatusBarAssertionManager *)v17;

    [(SBWindowSceneStatusBarAssertionManager *)v16->_statusBarAssertionManager addObserver:v16];
    objc_storeStrong((id *)&v16->_orientationProvider, a6);
    [(SpringBoard *)v16->_orientationProvider addActiveOrientationObserver:v16];
    objc_storeStrong((id *)&v16->_statusBarConnection, a5);
    [(UIStatusBarServer *)v16->_statusBarConnection setStatusBar:v16];
    [MEMORY[0x1E4F42E40] getStyleOverrides];
    v19 = STUIBackgroundActivityIdentifiersForStyleOverrides();
    uint64_t v20 = [v19 copy];
    currentBackgroundActivityIdentifiers = v16->_currentBackgroundActivityIdentifiers;
    v16->_currentBackgroundActivityIdentifiers = (NSSet *)v20;

    [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)v16 _evaluateEnablement];
  }

  return v16;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicyEnablementCondition.m" lineNumber:77 description:@"This object must be invalidated prior to being deallocated."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicyEnablementCondition;
  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)&v5 dealloc];
}

- (void)invalidate
{
  if (self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicyEnablementCondition.m" lineNumber:88 description:@"This object has already been invalidated."];
  }
  self->_invalidated = 1;
  [(SBMainDisplaySceneManager *)self->_mainDisplaySceneManager removeObserver:self];
  [(SBWindowSceneStatusBarAssertionManager *)self->_statusBarAssertionManager removeObserver:self];
  [(SpringBoard *)self->_orientationProvider removeActiveOrientationObserver:self];
  [(UIStatusBarServer *)self->_statusBarConnection setStatusBar:0];
  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self setDelegate:0];
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
}

void __106__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_statusBarServer_didReceiveStyleOverrides___block_invoke(uint64_t a1)
{
  STUIBackgroundActivityIdentifiersForStyleOverrides();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
  BSDispatchQueueAssertMain();
  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self _evaluateEnablement];
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5 = a4;
  BSDispatchQueueAssertMain();
  [v5 addObserver:self];

  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self _evaluateEnablement];
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5 = a4;
  BSDispatchQueueAssertMain();
  [v5 removeObserver:self];

  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self _evaluateEnablement];
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  applicationSceneSettingsDiffInspector = self->_applicationSceneSettingsDiffInspector;
  if (!applicationSceneSettingsDiffInspector)
  {
    id v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    id v13 = self->_applicationSceneSettingsDiffInspector;
    self->_applicationSceneSettingsDiffInspector = v12;

    objc_initWeak(&location, self);
    id v14 = self->_applicationSceneSettingsDiffInspector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v18[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v19, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v14 observeStatusBarStyleOverridesToSuppressWithBlock:v18];
    v15 = self->_applicationSceneSettingsDiffInspector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v16[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v17, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v15 observeForcedStatusBarForegroundTransparentWithBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    applicationSceneSettingsDiffInspector = self->_applicationSceneSettingsDiffInspector;
  }
  [(UIApplicationSceneSettingsDiffInspector *)applicationSceneSettingsDiffInspector inspectDiff:v9 withContext:0];
}

void __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateEnablement];
}

void __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateEnablement];
}

- (void)_setEnabled:(BOOL)a3 statusBarHeight:(double)a4
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    if (!a3) {
      a4 = 0.0;
    }
    self->_statusBarHeight = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained condition:self enablementDidChange:self->_isEnabled];
  }
}

- (void)_evaluateEnablement
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(NSSet *)self->_currentBackgroundActivityIdentifiers count]
    || [(SpringBoard *)self->_orientationProvider activeInterfaceOrientation] != 1)
  {
    double v13 = 0.0;
    id v14 = self;
    BOOL v15 = 0;
LABEL_18:
    [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)v14 _setEnabled:v15 statusBarHeight:v13];
    return;
  }
  if (![(SBWindowSceneStatusBarManager *)self->_windowSceneStatusBarManager isStatusBarEffectivelyHidden])
  {
    currentBackgroundActivityIdentifiers = self->_currentBackgroundActivityIdentifiers;
    id v17 = [(SBWindowSceneStatusBarAssertionManager *)self->_statusBarAssertionManager currentStatusBarSettings];
    v18 = [v17 backgroundActivitiesToSuppress];
    BOOL v19 = _STBackgroundActivityIdentifiersNotEmptyAfterSubtractingIdentifiers(currentBackgroundActivityIdentifiers, v18);

    [(id)*MEMORY[0x1E4F43630] statusBarHeight];
    id v14 = self;
    BOOL v15 = v19;
    goto LABEL_18;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [(SBMainDisplaySceneManager *)self->_mainDisplaySceneManager externalForegroundApplicationSceneHandles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) sceneIfExists];
        id v9 = v8;
        if (v8)
        {
          id v10 = [v8 uiSettings];
          if (([v10 statusBarDisabled] & 1) == 0
            && ([v10 forcedStatusBarForegroundTransparent] & 1) == 0)
          {
            id v11 = self->_currentBackgroundActivityIdentifiers;
            [v10 statusBarStyleOverridesToSuppress];
            id v12 = STUIBackgroundActivityIdentifiersForStyleOverrides();
            LOBYTE(v11) = _STBackgroundActivityIdentifiersNotEmptyAfterSubtractingIdentifiers(v11, v12);

            if (v11)
            {
              uint64_t v20 = (void *)MEMORY[0x1E4F42E28];
              v21 = [v9 uiClientSettings];
              uint64_t v4 = 1;
              objc_msgSend(v20, "heightForStyle:orientation:", objc_msgSend(v21, "statusBarStyle"), 1);
              double v5 = v22;

              goto LABEL_23;
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self _setEnabled:v4 statusBarHeight:v5];
}

- (SBNotchedStatusBarProximityBacklightPolicyEnablementConditionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBNotchedStatusBarProximityBacklightPolicyEnablementConditionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)enabledStatusBarHeight
{
  return self->_statusBarHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationSceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionManager, 0);
  objc_storeStrong((id *)&self->_windowSceneStatusBarManager, 0);
  objc_storeStrong((id *)&self->_statusBarConnection, 0);
  objc_storeStrong((id *)&self->_orientationProvider, 0);
}

@end