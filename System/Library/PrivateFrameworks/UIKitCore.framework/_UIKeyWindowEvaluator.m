@interface _UIKeyWindowEvaluator
+ (id)sharedEvaluator;
- (NSString)debugDescription;
- (char)_stackForWindowScene:(char *)a1;
- (id)applicationKeyWindow;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyWindowForUserInterfaceIdiom:(uint64_t)a1;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_defaultEvaluationStrategyForIdiom:(uint64_t)a1;
- (uint64_t)_evaluationStrategyForScene:(uint64_t)a1;
- (uint64_t)windowScene:(uint64_t)a3 willTransitionToActivationState:;
- (void)_evaluateApplicationKeyWindowWithComparisonWindowScene:(uint64_t)a3 changingKeyWindowSceneActions:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9;
- (void)_setDefaultEvaluationStrategy:(uint64_t)a3 forIdiom:;
- (void)_updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:(unsigned __int16)a3;
- (void)dealloc;
- (void)evaluateApplicationKeyWindowForWindowScene:(int)a3 withWindowMadeKey:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9;
- (void)windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment:(char *)a1;
- (void)windowSceneDidConnect:(uint64_t)a1;
- (void)windowSceneWillInvalidate:(uint64_t)a1;
@end

@implementation _UIKeyWindowEvaluator

+ (id)sharedEvaluator
{
  if (_MergedGlobals_1217 != -1) {
    dispatch_once(&_MergedGlobals_1217, &__block_literal_global_479);
  }
  v2 = (void *)qword_1EB262E18;
  return v2;
}

- (id)applicationKeyWindow
{
  if (a1)
  {
    a1 = (id *)a1[25];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)windowScene:(uint64_t)a3 willTransitionToActivationState:
{
  if (result)
  {
    uint64_t v5 = result;
    result = [a2 _hasInvalidated];
    if ((result & 1) == 0)
    {
      result = [a2 activationState];
      uint64_t v6 = result;
      BOOL v8 = a3 == 2 && result != 2;
      if (result) {
        BOOL v9 = a3 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9 || v8)
      {
        char v10 = [(id)UIApp _isActivated];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke;
        v11[3] = &unk_1E53050C8;
        v11[6] = v6;
        v11[7] = a3;
        v11[4] = v5;
        v11[5] = a2;
        BOOL v12 = a3 == 0;
        char v13 = v10;
        BOOL v14 = a3 == 2;
        return [a2 _enqueuePostSettingsUpdateResponseBlock:v11 inPhase:0x1ED0EB320];
      }
    }
  }
  return result;
}

- (void)evaluateApplicationKeyWindowForWindowScene:(int)a3 withWindowMadeKey:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9
{
  if (a1)
  {
    if (!a2)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:sel_evaluateApplicationKeyWindowForWindowScene_withWindowMadeKey_sceneKeyWindowActions_ignoringOldKeyWindow_sceneResignKeyWindowActions_andSceneBecomeKeyWindowActions_forReason_, a1, @"_UIKeyWindowEvaluator.m", 625, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];
    }
    if (([a2 _hasInvalidated] & 1) == 0)
    {
      id v17 = _UIKeyWindowSceneObserverForScene(a2);
      id v18 = a2;
      [(_UIKeyWindowEvaluator *)(uint64_t)a1 _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:0];
      uint64_t v19 = -[_UIKeyWindowEvaluator _evaluationStrategyForScene:]((uint64_t)a1, v18);
      v20 = -[UIWindowScene _keyWindow]((id *)v18);

      if (!v19 && a3 && v20)
      {
        v21 = -[_UIKeyWindowEvaluator _stackForWindowScene:](a1, v18);
        -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:]((uint64_t)v21, v18, 0, a9);
      }
      id v22 = a9;
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]((uint64_t)a1, (id *)v18, 0, a4, a5, a6, a7, v23, a9, a10);
    }
  }
}

- (uint64_t)_evaluationStrategyForScene:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    v4 = [a2 _screen];
    uint64_t v5 = [v4 _userInterfaceIdiom];

    uint64_t v2 = -[_UIKeyWindowEvaluator _defaultEvaluationStrategyForIdiom:](v2, v5);
    if (_UIApplicationMayVendViews())
    {
      uint64_t v6 = [a2 _FBSScene];

      if (!v6) {
        return 0;
      }
    }
  }
  return v2;
}

- (void)_updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:(unsigned __int16)a3
{
  if (!a1) {
    goto LABEL_35;
  }
  id v6 = a2;
  v7 = [v6 _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  uint64_t v9 = a3 & 0xFF00;
  if ((_BYTE)a3 && (a3 & 0xFF00) != 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest_, a1, @"_UIKeyWindowEvaluator.m", 262, @"Invalid request. The scene cannot be connecting and invalidating: %@", v6 object file lineNumber description];

    goto LABEL_5;
  }
  if ((_BYTE)a3)
  {
LABEL_5:
    if ((unint64_t)(v8 - 11) <= 0xFFFFFFFFFFFFFFF3)
    {
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:sel__incrementFBSSceneBackedSceneCountForIdiom_, a1, @"_UIKeyWindowEvaluator.m", 234, @"Invalid parameter not satisfying: %@", @"(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)" object file lineNumber description];
    }
    ++*(void *)(a1 + 8 * v8 + 16);
  }
  unint64_t v10 = v8 - 11;
  if (v9)
  {
    if (v10 <= 0xFFFFFFFFFFFFFFF3)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__decrementFBSSceneBackedSceneCountForIdiom_, a1, @"_UIKeyWindowEvaluator.m", 239, @"Invalid parameter not satisfying: %@", @"(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)" object file lineNumber description];
    }
    --*(void *)(a1 + 8 * v8 + 16);
  }
  if (v10 <= 0xFFFFFFFFFFFFFFF3)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:sel__countOfFBSSceneBackedScenesForIdiom_, a1, @"_UIKeyWindowEvaluator.m", 229, @"Invalid parameter not satisfying: %@", @"(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)" object file lineNumber description];
  }
  uint64_t v11 = *(void *)(a1 + 8 * v8 + 16);
  unsigned int v12 = [v6 _isTargetOfKeyboardEventDeferringEnvironment];
  if (v11) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = -[_UIKeyWindowEvaluator _defaultEvaluationStrategyForIdiom:](a1, v8);
  if (v14 == -1) {
    -[_UIKeyWindowEvaluator _setDefaultEvaluationStrategy:forIdiom:](a1, v13, v8);
  }
  if (!_UIApplicationMayVendViews()
    || ([v6 _FBSScene],
        v15 = objc_claimAutoreleasedReturnValue(),
        BOOL v16 = v15 == 0,
        v15,
        !v16))
  {
    if (v14 != v13)
    {
      if (v14) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v13;
      }
      BOOL v18 = v14 == 1 && v11 == 0;
      if ((v13 & 1) != 0 || v18)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke;
        aBlock[3] = &__block_descriptor_56_e32_v16__0___UIKeyWindowSceneStack_8l;
        aBlock[4] = v13 ^ 1;
        aBlock[5] = v13;
        aBlock[6] = v8;
        uint64_t v19 = (void (**)(void *, void))_Block_copy(aBlock);
        v19[2](v19, *(void *)(a1 + 184));
        v19[2](v19, *(void *)(a1 + 192));
        -[_UIKeyWindowEvaluator _setDefaultEvaluationStrategy:forIdiom:](a1, v13, v8);
      }
    }
  }

LABEL_35:
}

- (uint64_t)_defaultEvaluationStrategyForIdiom:(uint64_t)a1
{
  if ((unint64_t)(a2 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:sel__defaultEvaluationStrategyForIdiom_, a1, @"_UIKeyWindowEvaluator.m", 244, @"Invalid parameter not satisfying: %@", @"(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)" object file lineNumber description];
  }
  return *(void *)(a1 + 8 * a2 + 104);
}

- (void)_evaluateApplicationKeyWindowWithComparisonWindowScene:(uint64_t)a3 changingKeyWindowSceneActions:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a2 || ([a2 _hasInvalidated] & 1) == 0)
  {
    uint64_t v15 = [a9 UTF8String];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E20);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v42 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)v53 = v15;
        _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "Evaluating application key window for reason: %{public}s", buf, 0xCu);
      }
    }
    if ((a3 != 0) == (a4 != 0))
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__evaluateApplicationKeyWindowWithComparisonWindowScene_changingKeyWindowSceneActions_sceneKeyWindowActions_ignoringOldKeyWindow_sceneResignKeyWindowActions_andSceneBecomeKeyWindowActions_forReason_, a1, @"_UIKeyWindowEvaluator.m", 496, @"Invalid actions specified", a1, "-[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]");
    }
    id v17 = (char *)*(id *)(a1 + 200);
    v49 = [*(id *)(a1 + 200) windowScene];
    -[_UIKeyWindowSceneStack keyWindowSceneInStack](*(id **)(a1 + 184));
    BOOL v18 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = -[UIWindowScene _keyWindow](v18);
    v20 = (char *)v19;
    BOOL v21 = v19 != 0;
    if (v19) {
      BOOL v22 = a2 != 0;
    }
    else {
      BOOL v22 = 0;
    }
    BOOL v23 = v18 == a2 && v22;
    if ((char *)v19 == v17) {
      BOOL v21 = 0;
    }
    BOOL v46 = v21;
    if (a3 && v18 && v18 != v49 && v19) {
      (*(void (**)(uint64_t, id *))(a3 + 16))(a3, v18);
    }
    v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E28) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67241474;
      *(_DWORD *)v53 = v20 != v17;
      *(_WORD *)&v53[4] = 2050;
      *(void *)&v53[6] = v49;
      *(_WORD *)&v53[14] = 2050;
      *(void *)&v53[16] = v18;
      __int16 v54 = 2050;
      v55 = v17;
      __int16 v56 = 2050;
      v57 = v20;
      __int16 v58 = 2082;
      uint64_t v59 = v15;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "Key window needs update: %{public}d; currentKeyWindowScene: %{public}p; evaluatedKeyWindowScene: %{public}p; cur"
        "rentApplicationKeyWindow: %{public}p; evaluatedApplicationKeyWindow: %{public}p; reason: %{public}s",
        buf,
        0x3Au);
    }
    if (v20 == v17)
    {
      if (a4) {
        (*(void (**)(uint64_t, void))(a4 + 16))(a4, 0);
      }
      if (a6 && (a5 & 1) == 0) {
        (*(void (**)(void))(a6 + 16))();
      }
      if (a7) {
        (*(void (**)(void))(a7 + 16))();
      }
      goto LABEL_59;
    }
    BOOL v44 = v23;
    if (a5) {
      v25 = 0;
    }
    else {
      v25 = v17;
    }
    v26 = v25;
    char v45 = _UIWindowKeyWindowAPIIsSceneLevel();
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v28 = v27;
    if (v46)
    {
      [v27 postNotificationName:@"_UIWindowWillBecomeApplicationKeyNotification" object:v20];
      if ((v45 & 1) == 0) {
        [v28 postNotificationName:@"_UIWindowWillBecomeKeyNotification" object:v20];
      }
      *(void *)(a1 + 200) = v20;
    }
    else
    {
      *(void *)(a1 + 200) = v20;
      if (!v20)
      {
        Name = "(nil)";
        goto LABEL_38;
      }
    }
    v29 = (objc_class *)objc_opt_class();
    Name = class_getName(v29);
LABEL_38:
    v31 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v18);
    v32 = *(id *)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E30) + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = [v20 _contextId];
      *(_DWORD *)buf = 136446978;
      *(void *)v53 = Name;
      *(_WORD *)&v53[8] = 2050;
      *(void *)&v53[10] = v20;
      *(_WORD *)&v53[18] = 1026;
      *(_DWORD *)&v53[20] = v33;
      __int16 v54 = 2082;
      v55 = v31;
      _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "Window did become application key: %{public}s: %{public}p; contextId: 0x%{public}X; scene identity: %{public}s",
        buf,
        0x26u);
    }

    if (a4) {
      (*(void (**)(uint64_t, BOOL))(a4 + 16))(a4, v44);
    }
    if (a6 && (a5 & 1) == 0) {
      (*(void (**)(void))(a6 + 16))();
    }
    if ((a5 & 1) == 0 && v26)
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = class_getName(v34);
      v36 = [v26 windowScene];
      v37 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v36);

      v38 = *(id *)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E38) + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = [v26 _contextId];
        *(_DWORD *)buf = 136446978;
        *(void *)v53 = v35;
        *(_WORD *)&v53[8] = 2050;
        *(void *)&v53[10] = v26;
        *(_WORD *)&v53[18] = 1026;
        *(_DWORD *)&v53[20] = v39;
        __int16 v54 = 2082;
        v55 = v37;
        _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "Window resigning application key: %{public}s: %{public}p; contextId: 0x%{public}X; scene identity: %{public}s",
          buf,
          0x26u);
      }

      [v28 postNotificationName:@"_UIWindowDidResignApplicationKeyNotification" object:v26];
      if ((v45 & 1) == 0)
      {
        [v26 resignKeyWindow];
        [v28 postNotificationName:@"UIWindowDidResignKeyNotification" object:v26];
      }
      -[UIWindow _resignApplicationKeyWindowStatus](v26);
    }
    if (a7) {
      (*(void (**)(void))(a7 + 16))();
    }
    if (v46)
    {
      v50 = @"Reason";
      v40 = [NSNumber numberWithUnsignedInteger:a10];
      v51 = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];

      [v28 postNotificationName:@"_UIWindowDidBecomeApplicationKeyNotification" object:v20 userInfo:v41];
      if ((v45 & 1) == 0)
      {
        [v20 becomeKeyWindow];
        [v28 postNotificationName:@"UIWindowDidBecomeKeyNotification" object:v20];
      }
      -[UIWindow _didBecomeApplicationKeyWindowWithOldApplicationKeyWindow:](v20, v26);
    }
LABEL_59:
  }
}

- (void)windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment:(char *)a1
{
  if (a1 && ([a2 _hasInvalidated] & 1) == 0)
  {
    id v4 = a2;
    [(_UIKeyWindowEvaluator *)(uint64_t)a1 _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:0];
    id v11 = [NSString stringWithFormat:@"%@: %p: Window scene became target of keyboard environment", objc_opt_class(), v4];
    uint64_t v5 = -[_UIKeyWindowEvaluator _stackForWindowScene:](a1, v4);
    id v6 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v5);
    -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:](v5, v4, 1, v11);
    uint64_t v7 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v5);
    uint64_t v8 = (void *)v7;
    if (v5 && (*(unsigned char *)(v5 + 32) & 1) != 0 && (void *)v7 != v6)
    {
      id v9 = v11;
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]((uint64_t)a1, (id *)v4, (uint64_t)&__block_literal_global_111, 0, 0, 0, 0, v10, v9, 1);
    }
  }
}

- (char)_stackForWindowScene:(char *)a1
{
  if (a1)
  {
    id v4 = a1;
    uint64_t v5 = [a2 _screen];
    uint64_t v6 = [v5 _userInterfaceIdiom];

    uint64_t v7 = [a2 session];
    uint64_t v8 = [v7 role];
    if (v8)
    {
      id v9 = v8;
      char v10 = [v8 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

      if (v6 != 3 && (v10 & 1) == 0)
      {
        uint64_t v13 = (void *)*((void *)v4 + 23);
        unsigned int v12 = (void **)(v4 + 184);
        id v11 = v13;
        if (!v13)
        {
          uint64_t v14 = [_UIKeyWindowSceneStack alloc];
          uint64_t v15 = @"KeyWindow";
          char v16 = 1;
LABEL_10:
          BOOL v18 = -[_UIKeyWindowSceneStack _initWithName:affectsApplicationKeyWindow:](v14, v15, v16);
          uint64_t v19 = *v12;
          *unsigned int v12 = v18;

          id v11 = *v12;
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v17 = (void *)*((void *)v4 + 24);
    unsigned int v12 = (void **)(v4 + 192);
    id v11 = v17;
    if (!v17)
    {
      uint64_t v14 = [_UIKeyWindowSceneStack alloc];
      uint64_t v15 = @"Excluded";
      char v16 = 0;
      goto LABEL_10;
    }
LABEL_11:
    a1 = v11;
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)windowSceneDidConnect:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 _FBSScene];
    [(_UIKeyWindowEvaluator *)a1 _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:v4 != 0];
  }
}

- (void)_setDefaultEvaluationStrategy:(uint64_t)a3 forIdiom:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    unsigned int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__setDefaultEvaluationStrategy_forIdiom_, a1, @"_UIKeyWindowEvaluator.m", 249, @"Invalid parameter not satisfying: %@", @"(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)" object file lineNumber description];
  }
  *(void *)(a1 + 8 * a3 + 104) = a2;
  _NSStringFromUIUserInterfaceIdiom(a3);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 UTF8String];

  uint64_t v8 = &stru_1ED0E84C0;
  if (a2 == 1) {
    uint64_t v8 = @"SystemShellManaged";
  }
  if (a2) {
    id v9 = v8;
  }
  else {
    id v9 = @"LastOneWins";
  }
  uint64_t v10 = [(__CFString *)v9 UTF8String];
  id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &_setDefaultEvaluationStrategy_forIdiom____s_category)
                     + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v14 = v7;
    __int16 v15 = 2082;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Setting default evaluation strategy for %{public}s to %{public}s", buf, 0x16u);
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  keyWindowSceneStack = self->_keyWindowSceneStack;
  if (keyWindowSceneStack) {
    uint64_t v7 = [(NSMapTable *)keyWindowSceneStack->_recordsByWindowScene count];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)[v5 appendUnsignedInteger:v7 withName:@"keyWindowSceneStack.count"];
  excludedSceneStack = self->_excludedSceneStack;
  if (excludedSceneStack) {
    uint64_t v10 = [(NSMapTable *)excludedSceneStack->_recordsByWindowScene count];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (id)[v5 appendUnsignedInteger:v10 withName:@"excludedSceneStack.count"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E52D9F98;
  id v12 = v5;
  id v17 = v12;
  BOOL v18 = self;
  id v13 = (id)[v12 modifyBody:v16];
  id v14 = v12;

  return v14;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyWindowEvaluator;
  [(_UIKeyWindowEvaluator *)&v3 dealloc];
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIKeyWindowEvaluator *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(_UIKeyWindowEvaluator *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if (self->_applicationKeyWindow)
  {
    id v4 = (objc_class *)objc_opt_class();
    Name = class_getName(v4);
    applicationKeyWindow = self->_applicationKeyWindow;
  }
  else
  {
    applicationKeyWindow = 0;
    Name = "(nil)";
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", Name, applicationKeyWindow);
  id v8 = (id)[v3 appendObject:v7 withName:@"applicationKeyWindow"];
  keyWindowSceneStack = self->_keyWindowSceneStack;
  if (keyWindowSceneStack) {
    uint64_t v10 = [(NSMapTable *)keyWindowSceneStack->_recordsByWindowScene count];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (id)[v3 appendUnsignedInteger:v10 withName:@"keyWindowSceneStack.count"];
  excludedSceneStack = self->_excludedSceneStack;
  if (excludedSceneStack) {
    uint64_t v13 = [(NSMapTable *)excludedSceneStack->_recordsByWindowScene count];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = (id)[v3 appendUnsignedInteger:v13 withName:@"excludedSceneStack.count"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIKeyWindowEvaluator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIKeyWindowEvaluator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)keyWindowForUserInterfaceIdiom:(uint64_t)a1
{
  if (a1)
  {
    if (a2 == 3)
    {
      uint64_t v2 = *(void *)(a1 + 192);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __56___UIKeyWindowEvaluator_keyWindowForUserInterfaceIdiom___block_invoke;
      v6[3] = &__block_descriptor_40_e23_B16__0__UIWindowScene_8l;
      v6[4] = 3;
      -[_UIKeyWindowSceneStack keyWindowSceneInStackPassingTest:](v2, (uint64_t)v6);
      objc_super v3 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _keyWindow](v3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = *(id *)(a1 + 200);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)windowSceneWillInvalidate:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = *(id *)(a1 + 200);
    id v5 = a2;
    id v6 = [v5 _FBSScene];
    [(_UIKeyWindowEvaluator *)a1 _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:(v6 != 0) << 8];

    uint64_t v7 = [NSString stringWithFormat:@"%@: %p: Window scene was invalidated", objc_opt_class(), v5];
    uint64_t v8 = -[_UIKeyWindowEvaluator _stackForWindowScene:]((char *)a1, v5);
    id v9 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
    -[_UIKeyWindowSceneStack removeWindowScene:forReason:](v8, v5, v7);
    uint64_t v10 = -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
    id v11 = (void *)v10;
    if (v8)
    {
      if ((*(unsigned char *)(v8 + 32) & 1) != 0 && (void *)v10 != v9)
      {
        id v12 = v7;
        -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](a1, 0, (uint64_t)&__block_literal_global_116, 0, 1, 0, 0, v13, v12, 3);
        if (v4 == *(id *)(a1 + 200))
        {
          id v14 = [v5 screen];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke_2;
          v40[3] = &unk_1E52E0620;
          v40[4] = v4;
          if (!v14)
          {
            v24 = [MEMORY[0x1E4F28B00] currentHandler];
            v25 = objc_msgSend(NSString, "stringWithUTF8String:", "UIWindow * _Nullable _UIKeyWindowEvaluatorFindNewKeyWindowOnScreenPassingTest(UIScreen * _Nonnull const __strong, BOOL (^ _Nullable const __strong)(UIWindow * _Nonnull __strong))");
            [v24 handleFailureInFunction:v25, @"_UIKeyWindowEvaluator.m", 462, @"Invalid parameter not satisfying: %@", @"screen" file lineNumber description];
          }
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E40);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            v26 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              *(void *)&uint8_t buf[4] = v14;
              _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Finding new application key window on screen: %{public}p", buf, 0xCu);
            }
          }
          if (!v14)
          {
            v27 = [MEMORY[0x1E4F28B00] currentHandler];
            v28 = [NSString stringWithUTF8String:"UIWindowScene * _Nullable _UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen(UIScreen * _Nonnull const __strong)"];
            [v27 handleFailureInFunction:v28, @"_UIKeyWindowEvaluator.m", 429, @"Invalid parameter not satisfying: %@", @"screen" file lineNumber description];
          }
          unint64_t v16 = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E58);
          if (*(unsigned char *)v16)
          {
            v29 = *(NSObject **)(v16 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              *(void *)&uint8_t buf[4] = v14;
              _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Finding new key window scene on screen: %{public}p", buf, 0xCu);
            }
          }
          id v17 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v14];
          BOOL v18 = [v17 _effectiveUISettings];
          int IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v18);

          if (v17 && IsForegroundActive && (id v20 = v17[43], v20, !v20))
          {
            BOOL v21 = v17;
          }
          else
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = ___UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen_block_invoke;
            v48 = &unk_1E52DFF48;
            v49 = v14;
            BOOL v21 = +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:buf];
          }
          BOOL v22 = v21;
          if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E60))
          {
            if (v22)
            {
              v30 = (objc_class *)objc_opt_class();
              Name = class_getName(v30);
            }
            else
            {
              Name = "(nil)";
            }
            unint64_t v34 = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E68);
            if (*(unsigned char *)v34)
            {
              v35 = *(NSObject **)(v34 + 8);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v41 = 134349570;
                v42 = v14;
                __int16 v43 = 2082;
                BOOL v44 = Name;
                __int16 v45 = 2050;
                BOOL v46 = v22;
                _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "Found new key window on screen: %{public}p; scene: %{public}s: %{public}p",
                  v41,
                  0x20u);
              }
            }
          }

          if (v22)
          {
            BOOL v23 = -[UIWindowScene _findNewKeyWindowPassingTest:](v22, v40);
          }
          else
          {
            BOOL v23 = 0;
          }
          if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E48))
          {
            if (v23)
            {
              v32 = (objc_class *)objc_opt_class();
              int v33 = class_getName(v32);
            }
            else
            {
              int v33 = "(nil)";
            }
            unint64_t v36 = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262E50);
            if (*(unsigned char *)v36)
            {
              v37 = *(NSObject **)(v36 + 8);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v38 = v37;
                int v39 = [v23 _contextId];
                *(_DWORD *)buf = 134349826;
                *(void *)&uint8_t buf[4] = v14;
                *(_WORD *)&buf[12] = 2082;
                *(void *)&buf[14] = v33;
                *(_WORD *)&buf[22] = 2050;
                v48 = v23;
                LOWORD(v49) = 1026;
                *(_DWORD *)((char *)&v49 + 2) = v39;
                _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "Found new application key window on screen: %{public}p; %{public}s: %{public}p; contextId: 0x%{public}X",
                  buf,
                  0x26u);
              }
            }
          }

          -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v23, 1, 0);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_excludedSceneStack, 0);
  objc_storeStrong((id *)&self->_keyWindowSceneStack, 0);
}

@end