@interface SBMedusaHostedKeyboardWindow
+ (BOOL)_isSecure;
+ (BOOL)autorotates;
- (BOOL)_shouldControlAutorotation;
- (BOOL)isActive;
- (NSMutableArray)windowLevelAssertions;
- (NSString)description;
- (SBMedusaHostedKeyboardWindow)initWithWindowScene:(id)a3 keyboardScene:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)newWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateWindowLevel;
- (void)addWindowLevelAssertion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)medusaHostedKeyboardWindowWillHide:(id)a3;
- (void)medusaHostedKeyboardWindowWillShow:(id)a3;
- (void)removeWindowLevelAssertion:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setWindowLevelAssertions:(id)a3;
@end

@implementation SBMedusaHostedKeyboardWindow

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = SBLogMedusaKeyboard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    v7 = (void *)v6;
    v8 = "SHOWING";
    remoteHostedKeyboardScenePresenter = self->_remoteHostedKeyboardScenePresenter;
    if (v3) {
      v8 = "HIDING";
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v15 = v6;
    __int16 v16 = 2082;
    v17 = v8;
    v10 = "deactivating";
    if (!v3) {
      v10 = "activating";
    }
    __int16 v18 = 2080;
    v19 = v10;
    __int16 v20 = 2114;
    v21 = remoteHostedKeyboardScenePresenter;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}s the keyboard and %s scene presenter %{public}@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)SBMedusaHostedKeyboardWindow;
  [(SBWindow *)&v13 setHidden:v3];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12 = v11;
  if (v3)
  {
    [v11 postNotificationName:@"SBMedusaHostedKeyboardWindowWillHideNotification" object:self];

    [(UIScenePresenter *)self->_remoteHostedKeyboardScenePresenter deactivate];
  }
  else
  {
    [v11 postNotificationName:@"SBMedusaHostedKeyboardWindowWillShowNotification" object:self];

    [(UIScenePresenter *)self->_remoteHostedKeyboardScenePresenter activate];
  }
}

- (void)medusaHostedKeyboardWindowWillHide:(id)a3
{
  BOOL v3 = [a3 object];
  if (v3 == self)
  {
  }
  else
  {
    int v4 = [(UIScenePresenter *)self->_remoteHostedKeyboardScenePresenter isActive];

    if (v4)
    {
      remoteHostedKeyboardScenePresenter = self->_remoteHostedKeyboardScenePresenter;
      [(UIScenePresenter *)remoteHostedKeyboardScenePresenter deactivate];
    }
  }
}

- (SBMedusaHostedKeyboardWindow)initWithWindowScene:(id)a3 keyboardScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 settings];
  v10 = objc_msgSend(v9, "sb_displayIdentityForSceneManagers");
  v11 = [v10 UIScreen];

  if (!v11)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = [v8 settings];
    v35 = [v34 displayConfiguration];
    [v33 handleFailureInMethod:a2, self, @"SBMedusaHostedKeyboardWindow.m", 69, @"Must have a UIScreen associated to the display identity vended by the keyboard scene: %@", v35 object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)SBMedusaHostedKeyboardWindow;
  v12 = [(SBWindow *)&v36 initWithWindowScene:v7 rootViewController:0 layoutStrategy:0 role:@"SBTraitsParticipantRoleFloatingKeyboard" debugName:@"HostedKeyboardWindow"];
  if (v12)
  {
    objc_super v13 = [v8 uiPresentationManager];
    v14 = NSString;
    uint64_t v15 = [v7 _FBSScene];
    uint64_t v16 = [v15 identifier];
    v17 = (void *)v16;
    __int16 v18 = &stru_1F3084718;
    if (v16) {
      __int16 v18 = (__CFString *)v16;
    }
    v19 = [v14 stringWithFormat:@"%@-%@", @"SBMedusaHostedKeyboardWindow", v18];

    uint64_t v20 = [v13 createPresenterWithIdentifier:v19 priority:1];
    remoteHostedKeyboardScenePresenter = v12->_remoteHostedKeyboardScenePresenter;
    v12->_remoteHostedKeyboardScenePresenter = (UIScenePresenter *)v20;

    uint64_t v22 = objc_alloc_init(_SBHostedKeyboardViewController);
    v23 = [(_SBHostedKeyboardViewController *)v22 view];
    [v23 setAutoresizingMask:18];

    v24 = [(_SBHostedKeyboardViewController *)v22 view];
    v25 = [(UIScenePresenter *)v12->_remoteHostedKeyboardScenePresenter presentationView];
    [v24 addSubview:v25];

    [(SBMedusaHostedKeyboardWindow *)v12 setRootViewController:v22];
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    windowLevelAssertions = v12->_windowLevelAssertions;
    v12->_windowLevelAssertions = v26;

    uint64_t v28 = [(SBMedusaHostedKeyboardWindow *)v12 newWindowLevelAssertionWithPriority:0 windowLevel:*MEMORY[0x1E4F43F20] + 5.0 + 15.0];
    defaultWindowLevelAssertion = v12->_defaultWindowLevelAssertion;
    v12->_defaultWindowLevelAssertion = (SBMedusaHostedKeyboardWindowLevelAssertion *)v28;

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v12 selector:sel_medusaHostedKeyboardWindowWillShow_ name:@"SBMedusaHostedKeyboardWindowWillShowNotification" object:0];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v12 selector:sel_medusaHostedKeyboardWindowWillHide_ name:@"SBMedusaHostedKeyboardWindowWillHideNotification" object:0];
  }
  return v12;
}

- (void)dealloc
{
  [(SBMedusaHostedKeyboardWindow *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindow;
  [(SBWindow *)&v3 dealloc];
}

- (void)invalidate
{
  [(UIScenePresenter *)self->_remoteHostedKeyboardScenePresenter invalidate];
  defaultWindowLevelAssertion = self->_defaultWindowLevelAssertion;
  [(SBMedusaHostedKeyboardWindowLevelAssertion *)defaultWindowLevelAssertion invalidate];
}

- (id)newWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4
{
  id v7 = [SBMedusaHostedKeyboardWindowLevelAssertion alloc];
  return [(SBMedusaHostedKeyboardWindowLevelAssertion *)v7 initWithMedusaHostedKeyboardWindow:self priority:a3 windowLevel:a4];
}

- (void)addWindowLevelAssertion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  windowLevelAssertions = self->_windowLevelAssertions;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __56__SBMedusaHostedKeyboardWindow_addWindowLevelAssertion___block_invoke;
  v10 = &unk_1E6AFFA58;
  id v6 = v4;
  id v11 = v6;
  v12 = &v13;
  [(NSMutableArray *)windowLevelAssertions enumerateObjectsUsingBlock:&v7];
  -[NSMutableArray insertObject:atIndex:](self->_windowLevelAssertions, "insertObject:atIndex:", v6, v14[3], v7, v8, v9, v10);
  [(SBMedusaHostedKeyboardWindow *)self _updateWindowLevel];

  _Block_object_dispose(&v13, 8);
}

void __56__SBMedusaHostedKeyboardWindow_addWindowLevelAssertion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 priority];
  unint64_t v8 = [v6 priority];

  if (v7 > v8) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (void)removeWindowLevelAssertion:(id)a3
{
  [(NSMutableArray *)self->_windowLevelAssertions removeObject:a3];
  [(SBMedusaHostedKeyboardWindow *)self _updateWindowLevel];
}

- (void)_updateWindowLevel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(NSMutableArray *)self->_windowLevelAssertions firstObject];
  id v4 = v3;
  if (v3)
  {
    [v3 windowLevel];
    -[SBMedusaHostedKeyboardWindow setWindowLevel:](self, "setWindowLevel:");
    v5 = SBLogMedusaKeyboard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      [v4 windowLevel];
      uint64_t v9 = v8;
      uint64_t v10 = [v4 priority];
      if ((unint64_t)(v10 - 1) > 2) {
        id v11 = @"Medusa";
      }
      else {
        id v11 = off_1E6AFFAA0[v10 - 1];
      }
      int v12 = 138543874;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating window level to %f for %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)autorotates
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (void)medusaHostedKeyboardWindowWillShow:(id)a3
{
  objc_super v3 = [a3 object];
  if (v3 == self)
  {
  }
  else
  {
    int v4 = [(UIScenePresenter *)self->_remoteHostedKeyboardScenePresenter isActive];

    if (v4)
    {
      remoteHostedKeyboardScenePresenter = self->_remoteHostedKeyboardScenePresenter;
      [(UIScenePresenter *)remoteHostedKeyboardScenePresenter deactivate];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaHostedKeyboardWindow;
  -[SBMedusaHostedKeyboardWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBMedusaHostedKeyboardWindow *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v5;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(SBMedusaHostedKeyboardWindow *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBMedusaHostedKeyboardWindow *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  int v4 = [(SBMedusaHostedKeyboardWindow *)self _debugName];
  id v5 = (id)[v3 appendObject:v4 withName:0 skipIfNil:1];

  [(SBMedusaHostedKeyboardWindow *)self frame];
  uint64_t v10 = _SBWindowFrameDescription(v6, v7, v8, v9);
  id v11 = (id)[v3 appendObject:v10 withName:@"frame"];

  id v12 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBMedusaHostedKeyboardWindow isHidden](self, "isHidden"), @"hidden", 1);
  uint64_t v13 = [(SBMedusaHostedKeyboardWindow *)self layer];
  id v14 = (id)[v3 appendObject:v13 withName:@"layer"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBMedusaHostedKeyboardWindow *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBMedusaHostedKeyboardWindow *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBMedusaHostedKeyboardWindow_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __70__SBMedusaHostedKeyboardWindow_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 960) withName:@"presenter"];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 976) count];
  id v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    id v5 = NSString;
    id v10 = [*(id *)(*(void *)(a1 + 40) + 976) firstObject];
    id v6 = [v5 stringWithFormat:@"( %@)", v10];
    id v7 = (id)[v4 appendObject:v6 withName:@"window level assertions"];
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 976);
    double v9 = *(void **)(a1 + 32);
    [v9 appendArraySection:v8 withName:@"window level assertions" skipIfEmpty:1];
  }
}

- (NSMutableArray)windowLevelAssertions
{
  return self->_windowLevelAssertions;
}

- (void)setWindowLevelAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowLevelAssertions, 0);
  objc_storeStrong((id *)&self->_defaultWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_remoteHostedKeyboardScenePresenter, 0);
}

@end