@interface SBDashBoardStatusBarController
- (NSNumber)statusBarAlpha;
- (SBDashBoardStatusBarController)initWithWindowSceneStatusBarManager:(id)a3;
- (_UILegibilitySettings)statusBarLegibilitySettings;
- (id)createFakeStatusBarWithReason:(id)a3 withFrame:(CGRect)a4;
- (id)effectiveStatusBarStyleRequestForAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5;
- (int64_t)statusBarStyle;
- (void)_enumerateStatusBarsAndPartAssertions:(id)a3;
- (void)clearStatusBarParameters;
- (void)dealloc;
- (void)destroyFakeStatusBar:(id)a3;
- (void)setStatusBarAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5;
- (void)setStatusBarHidden:(BOOL)a3 forReason:(id)a4;
- (void)setStatusBarPart:(unint64_t)a3 hidden:(BOOL)a4 animationDuration:(double)a5;
@end

@implementation SBDashBoardStatusBarController

- (SBDashBoardStatusBarController)initWithWindowSceneStatusBarManager:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardStatusBarController;
  v5 = [(SBDashBoardStatusBarController *)&v15 init];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    statusBarHiddenReasons = v5->_statusBarHiddenReasons;
    v5->_statusBarHiddenReasons = v6;

    objc_storeWeak((id *)&v5->_windowSceneStatusBarManager, v4);
    v8 = (void *)MEMORY[0x1E4F1CA80];
    v9 = [v4 statusBar];
    uint64_t v10 = [v8 setWithObject:v9];
    statusBars = v5->_statusBars;
    v5->_statusBars = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    statusBarsToVisbilityAssertions = v5->_statusBarsToVisbilityAssertions;
    v5->_statusBarsToVisbilityAssertions = (NSMapTable *)v12;
  }
  return v5;
}

- (void)dealloc
{
  if ([(NSMutableSet *)self->_statusBarHiddenReasons count])
  {
    v3 = SBLogCommon();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4) {
      NSLog(&cfstr_Sbdashboardsta.isa);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardStatusBarController;
  [(SBDashBoardStatusBarController *)&v5 dealloc];
}

- (id)effectiveStatusBarStyleRequestForAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(SBMutableStatusBarSettings);
  v11 = v10;
  if (v8) {
    [(SBMutableStatusBarSettings *)v10 setAlpha:v8];
  }
  if (a4 != -1) {
    [(SBMutableStatusBarSettings *)v11 setStyle:a4];
  }
  if (v9) {
    [(SBMutableStatusBarSettings *)v11 setLegibilitySettings:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
  v13 = [WeakRetained assertionManager];
  v14 = [v13 effectiveStatusBarStyleRequestWithSettings:v11];

  return v14;
}

- (id)createFakeStatusBarWithReason:(id)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_windowSceneStatusBarManager = &self->_windowSceneStatusBarManager;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_windowSceneStatusBarManager);
  uint64_t v12 = [WeakRetained reusePool];
  v13 = objc_msgSend(v12, "getReusableStatusBarWithReason:withFrame:", v10, x, y, width, height);

  [(NSMutableSet *)self->_statusBars addObject:v13];
  return v13;
}

- (void)destroyFakeStatusBar:(id)a3
{
  statusBarsToVisbilityAssertions = self->_statusBarsToVisbilityAssertions;
  id v5 = a3;
  v6 = [(NSMapTable *)statusBarsToVisbilityAssertions objectForKey:v5];
  [v6 invalidate];

  [(NSMapTable *)self->_statusBarsToVisbilityAssertions removeObjectForKey:v5];
  [(NSMutableSet *)self->_statusBars removeObject:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
  v7 = [WeakRetained reusePool];
  [v7 recycleStatusBar:v5];
}

- (void)setStatusBarHidden:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  statusBarHiddenReasons = self->_statusBarHiddenReasons;
  id v16 = v6;
  if (v4)
  {
    [(NSMutableSet *)statusBarHiddenReasons addObject:v6];
    id v8 = v16;
    if (self->_hideStatusBarAssertion) {
      goto LABEL_8;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
    id v10 = [WeakRetained assertionManager];

    v11 = objc_msgSend(NSString, "stringWithFormat:", @"SBDashBoardStatusBarController-0x%p", self);
    uint64_t v12 = (SBWindowSceneStatusBarSettingsAssertion *)[v10 newSettingsAssertionWithStatusBarHidden:1 atLevel:8 reason:v11];
    hideStatusBarAssertion = self->_hideStatusBarAssertion;
    self->_hideStatusBarAssertion = v12;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_hideStatusBarAssertion acquire];
    goto LABEL_7;
  }
  [(NSMutableSet *)statusBarHiddenReasons removeObject:v6];
  uint64_t v14 = [(NSMutableSet *)self->_statusBarHiddenReasons count];
  id v8 = v16;
  if (!v14)
  {
    objc_super v15 = self->_hideStatusBarAssertion;
    if (v15)
    {
      [(SBWindowSceneStatusBarSettingsAssertion *)v15 invalidate];
      id v10 = self->_hideStatusBarAssertion;
      self->_hideStatusBarAssertion = 0;
LABEL_7:

      id v8 = v16;
    }
  }
LABEL_8:
}

- (void)setStatusBarAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__SBDashBoardStatusBarController_setStatusBarAlpha_style_legibilitySettings___block_invoke;
  v19[3] = &unk_1E6B0E978;
  id v10 = v8;
  id v20 = v10;
  int64_t v22 = a4;
  id v11 = v9;
  id v21 = v11;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1D948C7A0](v19);
  statusBarParametersAssertion = self->_statusBarParametersAssertion;
  if (statusBarParametersAssertion)
  {
    [(SBWindowSceneStatusBarSettingsAssertion *)statusBarParametersAssertion modifySettingsWithBlock:v12];
  }
  else
  {
    uint64_t v14 = objc_alloc_init(SBMutableStatusBarSettings);
    ((void (**)(void, SBMutableStatusBarSettings *))v12)[2](v12, v14);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
    id v16 = [WeakRetained assertionManager];

    v17 = (SBWindowSceneStatusBarSettingsAssertion *)[v16 newSettingsAssertionWithSettings:v14 atLevel:7 reason:@"SBDashBoardStatusBar"];
    v18 = self->_statusBarParametersAssertion;
    self->_statusBarParametersAssertion = v17;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarParametersAssertion acquire];
  }
}

void __77__SBDashBoardStatusBarController_setStatusBarAlpha_style_legibilitySettings___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[4])
  {
    objc_msgSend(v3, "setAlpha:");
    id v3 = v4;
  }
  if (a1[6] != -1)
  {
    objc_msgSend(v4, "setStyle:");
    id v3 = v4;
  }
  if (a1[5])
  {
    objc_msgSend(v4, "setLegibilitySettings:");
    id v3 = v4;
  }
}

- (void)clearStatusBarParameters
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarParametersAssertion invalidate];
  statusBarParametersAssertion = self->_statusBarParametersAssertion;
  self->_statusBarParametersAssertion = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_statusBars;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = -[NSMapTable objectForKey:](self->_statusBarsToVisbilityAssertions, "objectForKey:", v9, (void)v11);
        [v10 invalidate];

        [(NSMapTable *)self->_statusBarsToVisbilityAssertions removeObjectForKey:v9];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (NSNumber)statusBarAlpha
{
  v2 = [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarParametersAssertion settings];
  id v3 = [v2 alpha];

  return (NSNumber *)v3;
}

- (int64_t)statusBarStyle
{
  v2 = [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarParametersAssertion settings];
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 style];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (_UILegibilitySettings)statusBarLegibilitySettings
{
  v2 = [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarParametersAssertion settings];
  id v3 = [v2 legibilitySettings];

  return (_UILegibilitySettings *)v3;
}

- (void)_enumerateStatusBarsAndPartAssertions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void, SBStatusBarPartVisibilityAssertion *))a3;
  if (!v5)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBDashBoardStatusBarController.m", 145, @"Invalid parameter not satisfying: %@", @"enumerationBlock" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_statusBars;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = [(NSMapTable *)self->_statusBarsToVisbilityAssertions objectForKey:v11];
        if (!v12)
        {
          long long v13 = [NSString stringWithFormat:@"SBDashBoardStatusBarController-<%@: %p>", objc_opt_class(), v11, (void)v15];
          long long v12 = [[SBStatusBarPartVisibilityAssertion alloc] initWithIdentifier:v13 statusBar:v11 forReason:@"SBDashBoardStatusBarController"];
          [(NSMapTable *)self->_statusBarsToVisbilityAssertions setObject:v12 forKey:v11];
        }
        v5[2](v5, v11, v12);
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)setStatusBarPart:(unint64_t)a3 hidden:(BOOL)a4 animationDuration:(double)a5
{
  if (a3 == 1)
  {
    uint64_t v8 = (id *)MEMORY[0x1E4F441C0];
  }
  else
  {
    if (a3)
    {
      id v9 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = (id *)MEMORY[0x1E4F441A8];
  }
  id v9 = *v8;
LABEL_7:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBDashBoardStatusBarController_setStatusBarPart_hidden_animationDuration___block_invoke;
  v11[3] = &unk_1E6B0E9A0;
  id v12 = v9;
  BOOL v14 = a4;
  double v13 = a5;
  id v10 = v9;
  [(SBDashBoardStatusBarController *)self _enumerateStatusBarsAndPartAssertions:v11];
}

uint64_t __76__SBDashBoardStatusBarController_setStatusBarPart_hidden_animationDuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setStatusBarPartWithIdentifier:*(void *)(a1 + 32) hidden:*(unsigned __int8 *)(a1 + 48) animatedWithDuration:*(double *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarsToVisbilityAssertions, 0);
  objc_storeStrong((id *)&self->_statusBars, 0);
  objc_destroyWeak((id *)&self->_windowSceneStatusBarManager);
  objc_storeStrong((id *)&self->_statusBarParametersAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarHiddenReasons, 0);
}

@end