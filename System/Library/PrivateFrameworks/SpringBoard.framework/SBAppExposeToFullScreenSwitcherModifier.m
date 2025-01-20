@interface SBAppExposeToFullScreenSwitcherModifier
- (BOOL)_isEffectivelyFullScreen;
- (BOOL)_isIndexActive:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBAppExposeToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 bundleIdentifier:(id)a7 appExposeModifier:(id)a8 fullScreenModifier:(id)a9;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_newAppExposeModifier;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appLayouts;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (void)_performBlockBySimulatingPreTransitionState:(id)a3;
@end

@implementation SBAppExposeToFullScreenSwitcherModifier

- (SBAppExposeToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 bundleIdentifier:(id)a7 appExposeModifier:(id)a8 fullScreenModifier:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v38 = a6;
  id v17 = a7;
  id v39 = a8;
  id v18 = a9;
  v40.receiver = self;
  v40.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  v19 = [(SBTransitionSwitcherModifier *)&v40 initWithTransitionID:v15];
  if (!v19) {
    goto LABEL_9;
  }
  v37 = v17;
  if (!v16)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, v19, @"SBAppExposeToFullScreenSwitcherModifier.m", 46, @"Invalid parameter not satisfying: %@", @"fullScreenAppLayout" object file lineNumber description];
  }
  if (!v39)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, v19, @"SBAppExposeToFullScreenSwitcherModifier.m", 47, @"Invalid parameter not satisfying: %@", @"appExposeModifier" object file lineNumber description];

    if (v18) {
      goto LABEL_6;
    }
LABEL_11:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, v19, @"SBAppExposeToFullScreenSwitcherModifier.m", 48, @"Invalid parameter not satisfying: %@", @"fullScreenModifier" object file lineNumber description];

    goto LABEL_6;
  }
  if (!v18) {
    goto LABEL_11;
  }
LABEL_6:
  v19->_direction = a4;
  objc_storeStrong((id *)&v19->_fullScreenAppLayout, a5);
  objc_storeStrong((id *)&v19->_floatingAppLayout, a6);
  uint64_t v20 = [v37 copy];
  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v20;

  objc_storeStrong((id *)&v19->_appExposeModifier, a8);
  objc_storeStrong((id *)&v19->_fullscreenModifier, a9);
  v22 = [SBRouteToAppExposeSwitcherModifier alloc];
  id v23 = [(SBAppExposeToFullScreenSwitcherModifier *)v19 _newAppExposeModifier];
  uint64_t v24 = [(SBRouteToAppExposeSwitcherModifier *)v22 initWithTransitionID:v15 appExposeModifier:v23];
  routeToAppExposeModifier = v19->_routeToAppExposeModifier;
  v19->_routeToAppExposeModifier = (SBRouteToAppExposeSwitcherModifier *)v24;

  [(SBChainableModifier *)v19 addChildModifier:v19->_routeToAppExposeModifier atLevel:0 key:0];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v19->_fullScreenAppLayout, 0);
  v27 = v26;
  floatingAppLayout = v19->_floatingAppLayout;
  if (floatingAppLayout) {
    [v26 insertObject:floatingAppLayout atIndex:0];
  }
  v29 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
  id v30 = [(SBAppExposeToFullScreenSwitcherModifier *)v19 _newAppExposeModifier];
  v31 = [(SBGridToActiveAppLayoutsSwitcherModifier *)v29 initWithTransitionID:v15 direction:a4 activeAppLayouts:v27 gridModifier:v30];

  [(SBChainableModifier *)v19 addChildModifier:v31 atLevel:1 key:0];
  id v17 = v37;
LABEL_9:

  return v19;
}

- (id)transitionWillBegin
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v25 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  v6 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
  appLayoutsBeforeTransition = self->_appLayoutsBeforeTransition;
  self->_appLayoutsBeforeTransition = v6;

  if (self->_direction == 1)
  {
    v8 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
    v9 = [(SBAppExposeToFullScreenSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v8];

    v10 = self->_fullScreenAppLayout;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        uint64_t v15 = 0;
        id v16 = v10;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
          if (objc_msgSend(v17, "environment", (void)v21) == 1)
          {
            v10 = v16;
            goto LABEL_12;
          }
          v10 = v17;

          ++v15;
          id v16 = v10;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (v10)
    {
      id v18 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v10 alignment:0 animated:0];
      uint64_t v19 = +[SBChainableModifierEventResponse responseByAppendingResponse:v18 toResponse:v5];

      v5 = (void *)v19;
    }
  }
  return v5;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if (!self->_direction)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)appLayouts
{
  if (self->_isSimulatingPreTransitionState)
  {
    v2 = self->_appLayoutsBeforeTransition;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
    v2 = [(SBAppExposeToFullScreenSwitcherModifier *)&v4 appLayouts];
  }
  return v2;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  routeToAppExposeModifier = self->_routeToAppExposeModifier;
  id v5 = a3;
  uint64_t v6 = [(SBRouteToAppExposeSwitcherModifier *)routeToAppExposeModifier reversesFloatingCardDirection];
  [(SBRouteToAppExposeSwitcherModifier *)self->_routeToAppExposeModifier setReversesFloatingCardDirection:self->_direction == 1];
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  objc_super v7 = [(SBTransitionSwitcherModifier *)&v10 adjustedAppLayoutsForAppLayouts:v5];

  [(SBRouteToAppExposeSwitcherModifier *)self->_routeToAppExposeModifier setReversesFloatingCardDirection:v6];
  if (self->_direction)
  {
    v8 = v7;
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
    if (([v8 containsObject:self->_fullScreenAppLayout] & 1) == 0) {
      [v8 addObject:self->_fullScreenAppLayout];
    }
    if (self->_floatingAppLayout && (objc_msgSend(v8, "containsObject:") & 1) == 0) {
      [v8 insertObject:self->_floatingAppLayout atIndex:0];
    }
  }
  return v8;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if (!self->_direction)
  {
    uint64_t v14 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
    uint64_t v15 = [v14 objectAtIndex:a3];

    if ([v15 containsItemWithBundleIdentifier:self->_bundleIdentifier])
    {
      if ([(SBAppExposeToFullScreenSwitcherModifier *)self _isIndexActive:a3])
      {
        v28.receiver = self;
        v28.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        [(SBAppExposeToFullScreenSwitcherModifier *)&v28 frameForIndex:a3];
        double v6 = v16;
        double v8 = v17;
        double v10 = v18;
        double v12 = v19;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v31 = 0;
      v32 = (double *)&v31;
      uint64_t v33 = 0x4010000000;
      v34 = &unk_1D90ED3C6;
      long long v35 = 0u;
      long long v36 = 0u;
      NSUInteger v21 = [(NSArray *)self->_appLayoutsBeforeTransition indexOfObject:v15];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2 object:self file:@"SBAppExposeToFullScreenSwitcherModifier.m" lineNumber:160 description:@"preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"];
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke_2;
      v29[3] = &unk_1E6AF6358;
      v29[5] = &v31;
      v29[6] = v21;
      v29[4] = self;
      [(SBAppExposeToFullScreenSwitcherModifier *)self _performBlockBySimulatingPreTransitionState:v29];
    }
    else
    {
      uint64_t v31 = 0;
      v32 = (double *)&v31;
      uint64_t v33 = 0x4010000000;
      v34 = &unk_1D90ED3C6;
      fullscreenModifier = self->_fullscreenModifier;
      long long v35 = 0u;
      long long v36 = 0u;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke;
      v30[3] = &unk_1E6AF6358;
      v30[4] = self;
      v30[5] = &v31;
      v30[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v30];
    }
    double v6 = v32[4];
    double v8 = v32[5];
    double v10 = v32[6];
    double v12 = v32[7];
    _Block_object_dispose(&v31, 8);
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  [(SBAppExposeToFullScreenSwitcherModifier *)&v27 frameForIndex:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
LABEL_12:
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  double v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

uint64_t __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 176) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

id __57__SBAppExposeToFullScreenSwitcherModifier_frameForIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  id result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (!self->_direction)
  {
    uint64_t v8 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
    objc_super v9 = [v8 objectAtIndex:a3];

    if ([v9 containsItemWithBundleIdentifier:self->_bundleIdentifier])
    {
      if ([(SBAppExposeToFullScreenSwitcherModifier *)self _isIndexActive:a3])
      {
        v16.receiver = self;
        v16.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        [(SBAppExposeToFullScreenSwitcherModifier *)&v16 scaleForIndex:a3];
        double v6 = v10;
LABEL_11:

        return v6;
      }
      uint64_t v19 = 0;
      uint64_t v20 = (double *)&v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0;
      NSUInteger v12 = [(NSArray *)self->_appLayoutsBeforeTransition indexOfObject:v9];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"SBAppExposeToFullScreenSwitcherModifier.m" lineNumber:186 description:@"preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"];
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke_2;
      v17[3] = &unk_1E6AF6358;
      v17[5] = &v19;
      v17[6] = v12;
      v17[4] = self;
      [(SBAppExposeToFullScreenSwitcherModifier *)self _performBlockBySimulatingPreTransitionState:v17];
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = (double *)&v19;
      uint64_t v21 = 0x2020000000;
      fullscreenModifier = self->_fullscreenModifier;
      uint64_t v22 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
      v18[3] = &unk_1E6AF6358;
      v18[4] = self;
      v18[5] = &v19;
      v18[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v18];
    }
    double v6 = v20[3];
    _Block_object_dispose(&v19, 8);
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  [(SBAppExposeToFullScreenSwitcherModifier *)&v15 scaleForIndex:a3];
  return v5;
}

uint64_t __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 176) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

id __57__SBAppExposeToFullScreenSwitcherModifier_scaleForIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  id result = objc_msgSendSuper2(&v5, sel_scaleForIndex_, v2);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v9 = a4;
  if (self->_direction)
  {
    v18.receiver = self;
    v18.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
    [(SBAppExposeToFullScreenSwitcherModifier *)&v18 opacityForLayoutRole:a3 inAppLayout:v9 atIndex:a5];
    double v11 = v10;
  }
  else
  {
    NSUInteger v12 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
    uint64_t v13 = [v12 objectAtIndex:a5];

    if ([v13 containsItemWithBundleIdentifier:self->_bundleIdentifier])
    {
      if ([(SBAppExposeToFullScreenSwitcherModifier *)self _isIndexActive:a5])
      {
        v19.receiver = self;
        v19.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
        [(SBAppExposeToFullScreenSwitcherModifier *)&v19 opacityForLayoutRole:a3 inAppLayout:v13 atIndex:a5];
        double v11 = v14;
      }
      else
      {
        uint64_t v26 = 0;
        objc_super v27 = (double *)&v26;
        uint64_t v28 = 0x2020000000;
        uint64_t v29 = 0;
        NSUInteger v15 = [(NSArray *)self->_appLayoutsBeforeTransition indexOfObject:v13];
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"SBAppExposeToFullScreenSwitcherModifier.m" lineNumber:208 description:@"preTransitionIndex should be valid for an app layout whose bundle identifier matches what we're showing in app expose"];
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __84__SBAppExposeToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
        v20[3] = &unk_1E6AF63F8;
        double v23 = &v26;
        int64_t v24 = a3;
        NSUInteger v25 = v15;
        id v21 = v13;
        uint64_t v22 = self;
        [(SBAppExposeToFullScreenSwitcherModifier *)self _performBlockBySimulatingPreTransitionState:v20];
        double v11 = v27[3];

        _Block_object_dispose(&v26, 8);
      }
    }
    else if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      double v11 = 0.0;
    }
    else
    {
      double v11 = 1.0;
    }
  }
  return v11;
}

id __84__SBAppExposeToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  id result = objc_msgSendSuper2(&v7, sel_opacityForLayoutRole_inAppLayout_atIndex_, v3, v2, v4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  return result;
}

- (double)plusButtonAlpha
{
  BOOL v2 = [(SBAppExposeToFullScreenSwitcherModifier *)self _isEffectivelyFullScreen];
  double result = 1.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeToFullScreenSwitcherModifier;
  uint64_t v4 = [(SBAppExposeToFullScreenSwitcherModifier *)&v7 visibleAppLayouts];
  objc_super v5 = (void *)[v3 initWithSet:v4];

  [v5 addObject:self->_fullScreenAppLayout];
  if (self->_floatingAppLayout) {
    objc_msgSend(v5, "addObject:");
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  NSUInteger v12 = &v11;
  uint64_t v13 = 0x2810000000;
  double v14 = &unk_1D90ED3C6;
  __int16 v15 = 0;
  appExposeModifier = self->_appExposeModifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBAppExposeToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AF6380;
  double v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v8];
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __80__SBAppExposeToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 168) asyncRenderingAttributesForAppLayout:a1[5]];
  *(_WORD *)(*(void *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)_newAppExposeModifier
{
  return (id)[(SBAppExposeGridSwitcherModifier *)self->_appExposeModifier copy];
}

- (BOOL)_isEffectivelyFullScreen
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (BOOL)_isIndexActive:(unint64_t)a3
{
  objc_super v5 = [(SBAppExposeToFullScreenSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_fullScreenAppLayout isEqual:v6])
  {
    char v7 = 1;
  }
  else
  {
    floatingAppLayout = self->_floatingAppLayout;
    if (floatingAppLayout) {
      char v7 = [(SBAppLayout *)floatingAppLayout isEqual:v6];
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)_performBlockBySimulatingPreTransitionState:(id)a3
{
  BOOL isSimulatingPreTransitionState = self->_isSimulatingPreTransitionState;
  self->_BOOL isSimulatingPreTransitionState = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isSimulatingPreTransitionState = isSimulatingPreTransitionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsBeforeTransition, 0);
  objc_storeStrong((id *)&self->_routeToAppExposeModifier, 0);
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end