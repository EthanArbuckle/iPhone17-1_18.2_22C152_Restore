@interface SBMixedGridToFullScreenSwitcherModifier
- (BOOL)_isEffectivelyFullScreen;
- (BOOL)_isIndexActive:(unint64_t)a3;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBMixedGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 floatingConfiguration:(int64_t)a7 gridModifier:(id)a8 fullScreenModifier:(id)a9;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_appLayoutToScrollTo;
- (id)_firstFloatingAppLayout:(id)a3;
- (id)_newMixedGridModifier;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3;
@end

@implementation SBMixedGridToFullScreenSwitcherModifier

- (SBMixedGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingAppLayout:(id)a6 floatingConfiguration:(int64_t)a7 gridModifier:(id)a8 fullScreenModifier:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v41 = a9;
  v42.receiver = self;
  v42.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v18 = [(SBTransitionSwitcherModifier *)&v42 initWithTransitionID:v14];
  if (!v18) {
    goto LABEL_14;
  }
  if (!v15)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, v18, @"SBMixedGridToFullScreenSwitcherModifier.m", 39, @"Invalid parameter not satisfying: %@", @"fullScreenAppLayout" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
LABEL_16:
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, v18, @"SBMixedGridToFullScreenSwitcherModifier.m", 40, @"Invalid parameter not satisfying: %@", @"gridModifier" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v17) {
    goto LABEL_16;
  }
LABEL_4:
  id v36 = v17;
  id v37 = v15;
  if (!v41)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, v18, @"SBMixedGridToFullScreenSwitcherModifier.m", 41, @"Invalid parameter not satisfying: %@", @"fullScreenModifier" object file lineNumber description];
  }
  v18->_direction = a4;
  objc_storeStrong((id *)&v18->_fullScreenAppLayout, a5);
  objc_storeStrong((id *)&v18->_floatingAppLayout, a6);
  objc_storeStrong((id *)&v18->_mixedGridModifier, a8);
  objc_storeStrong((id *)&v18->_fullscreenModifier, a9);
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v18->_fullScreenAppLayout, 0);
  v20 = v19;
  floatingAppLayout = v18->_floatingAppLayout;
  if (floatingAppLayout) {
    [v19 insertObject:floatingAppLayout atIndex:0];
  }
  v22 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
  id v23 = [(SBMixedGridToFullScreenSwitcherModifier *)v18 _newMixedGridModifier];
  v24 = [(SBGridToActiveAppLayoutsSwitcherModifier *)v22 initWithTransitionID:v14 direction:a4 activeAppLayouts:v20 gridModifier:v23];

  [(SBChainableModifier *)v18 addChildModifier:v24];
  v25 = [SBRouteToMixedGridSwitcherModifier alloc];
  id v26 = [(SBMixedGridToFullScreenSwitcherModifier *)v18 _newMixedGridModifier];
  uint64_t v27 = [(SBRouteToMixedGridSwitcherModifier *)v25 initWithTransitionID:v14 mixedGridModifier:v26];
  routeToMixedGridModifier = v18->_routeToMixedGridModifier;
  v18->_routeToMixedGridModifier = (SBRouteToMixedGridSwitcherModifier *)v27;

  [(SBChainableModifier *)v18 addChildModifier:v18->_routeToMixedGridModifier];
  if (v16)
  {
    v29 = [SBRelocateFloatingAppLayoutSwitcherModifier alloc];
    if (a4) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = 2;
    }
    id v31 = [(SBMixedGridToFullScreenSwitcherModifier *)v18 _newMixedGridModifier];
    v32 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)v29 initWithTransitionID:v14 floatingAppLayout:v16 floatingConfiguration:a7 direction:v30 mixedGridModifier:v31];

    [(SBChainableModifier *)v18 addChildModifier:v32];
  }

  id v17 = v36;
  id v15 = v37;
LABEL_14:

  return v18;
}

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  v6 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  appLayoutsBeforeTransition = self->_appLayoutsBeforeTransition;
  self->_appLayoutsBeforeTransition = v6;

  if (self->_direction == 1)
  {
    v8 = [(SBMixedGridToFullScreenSwitcherModifier *)self _appLayoutToScrollTo];
    if (v8)
    {
      v9 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v8 alignment:0 animated:0];
      uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v5];

      v5 = (void *)v10;
    }
  }
  return v5;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if (!self->_direction)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  routeToMixedGridModifier = self->_routeToMixedGridModifier;
  id v5 = a3;
  uint64_t v6 = [(SBRouteToMixedGridSwitcherModifier *)routeToMixedGridModifier reversesFloatingCardDirection];
  [(SBRouteToMixedGridSwitcherModifier *)self->_routeToMixedGridModifier setReversesFloatingCardDirection:self->_direction == 1];
  v10.receiver = self;
  v10.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  objc_super v7 = [(SBTransitionSwitcherModifier *)&v10 adjustedAppLayoutsForAppLayouts:v5];

  [(SBRouteToMixedGridSwitcherModifier *)self->_routeToMixedGridModifier setReversesFloatingCardDirection:v6];
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

- (id)visibleAppLayouts
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = self;
  v7.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v4 = [(SBMixedGridToFullScreenSwitcherModifier *)&v7 visibleAppLayouts];
  id v5 = (void *)[v3 initWithSet:v4];

  [v5 addObject:self->_fullScreenAppLayout];
  if (self->_floatingAppLayout) {
    objc_msgSend(v5, "addObject:");
  }
  return v5;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction) {
    v2 = 0;
  }
  else {
    v2 = self->_fullScreenAppLayout;
  }
  return v2;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (id)topMostLayoutElements
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_direction == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v32.receiver = self;
    v32.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
    id v4 = [(SBMixedGridToFullScreenSwitcherModifier *)&v32 slideOverTongueLayoutElement];
    if (v4) {
      [v3 addObject:v4];
    }
    mixedGridModifier = self->_mixedGridModifier;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __64__SBMixedGridToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke;
    v30[3] = &unk_1E6AF5290;
    v30[4] = self;
    id v6 = v3;
    id v31 = v6;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v30];
    objc_super v7 = v31;
    id v8 = v6;

    v9 = v8;
    goto LABEL_32;
  }
  objc_super v10 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  id v8 = [(SBMixedGridToFullScreenSwitcherModifier *)self visibleAppLayouts];
  v11 = [MEMORY[0x1E4F1CA48] array];
  objc_super v12 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = v10;
  uint64_t v13 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (!v13) {
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v27;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v4);
      }
      id v17 = *(SBAppLayout **)(*((void *)&v26 + 1) + 8 * v16);
      if ([v8 containsObject:v17])
      {
        if ([(SBAppLayout *)v17 environment] == 2)
        {
          v18 = v11;
          if (v17 == self->_floatingAppLayout) {
            goto LABEL_14;
          }
LABEL_13:
          [v18 addObject:v17];
          goto LABEL_14;
        }
        BOOL v19 = [(SBAppLayout *)v17 isEqual:self->_fullScreenAppLayout];
        v18 = v12;
        if (!v19) {
          goto LABEL_13;
        }
      }
LABEL_14:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v20 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    uint64_t v14 = v20;
  }
  while (v20);
LABEL_19:

  v9 = objc_opt_new();
  v25.receiver = self;
  v25.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v21 = [(SBMixedGridToFullScreenSwitcherModifier *)&v25 slideOverTongueLayoutElement];
  if (v21) {
    [v9 addObject:v21];
  }
  if (self->_floatingAppLayout) {
    objc_msgSend(v9, "addObject:");
  }
  if ([v11 count]) {
    [v9 addObjectsFromArray:v11];
  }
  v24.receiver = self;
  v24.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  v22 = [(SBMixedGridToFullScreenSwitcherModifier *)&v24 switcherDimmingViewLayoutElement];
  if (v22) {
    [v9 addObject:v22];
  }
  if (self->_fullScreenAppLayout) {
    objc_msgSend(v9, "addObject:");
  }
  if ([v12 count]) {
    [v9 addObjectsFromArray:v12];
  }

LABEL_32:
  return v9;
}

void __64__SBMixedGridToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) appLayouts];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) rangeOfVisibleAppLayouts];
  id v3 = *(void **)(a1 + 40);
  id v5 = objc_msgSend(v6, "subarrayWithRange:", v2, v4);
  [v3 addObjectsFromArray:v5];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2810000000;
  uint64_t v14 = &unk_1D90ED3C6;
  __int16 v15 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBMixedGridToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AF6380;
  objc_super v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v8];
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __80__SBMixedGridToFullScreenSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 160) asyncRenderingAttributesForAppLayout:a1[5]];
  *(_WORD *)(*(void *)(a1[6] + 8) + 32) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];
  if ([(SBAppLayout *)v6 environment] != 2
    || self->_direction
    || (floatingAppLayout = self->_floatingAppLayout, v6 == floatingAppLayout))
  {
    -[SBMixedGridToFullScreenSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, a3, self, SBMixedGridToFullScreenSwitcherModifier);
LABEL_4:
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    goto LABEL_5;
  }
  if (floatingAppLayout)
  {
    uint64_t v20 = objc_msgSend(v5, "indexOfObject:");
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v28.receiver = self;
      v28.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
      -[SBMixedGridToFullScreenSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, v20, v26.receiver, v26.super_class);
      goto LABEL_4;
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
  [(SBMixedGridToFullScreenSwitcherModifier *)&v27 frameForIndex:a3];
  double v12 = v22;
  double v13 = v23;
  double v14 = v24;
  if (self->_floatingAppLayout)
  {
    double v11 = v21;
  }
  else if ([(SBMixedGridToFullScreenSwitcherModifier *)self isRTLEnabled])
  {
    double v11 = -v13;
  }
  else
  {
    [(SBMixedGridToFullScreenSwitcherModifier *)self switcherViewBounds];
    double v11 = v25;
  }
LABEL_5:

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  id v5 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 environment] == 2 && self->_direction == 1)
  {
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SBMixedGridToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v12];
    double v8 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMixedGridToFullScreenSwitcherModifier;
    [(SBMixedGridToFullScreenSwitcherModifier *)&v11 scaleForIndex:a3];
    double v8 = v9;
  }

  return v8;
}

uint64_t __57__SBMixedGridToFullScreenSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 160) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)_newMixedGridModifier
{
  return (id)[(SBMixedGridSwitcherProviding *)self->_mixedGridModifier copy];
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
  id v5 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
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

- (id)_appLayoutToScrollTo
{
  BOOL v3 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  BOOL v4 = [(SBMixedGridToFullScreenSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v3];

  id v5 = [(SBMixedGridToFullScreenSwitcherModifier *)self _firstFloatingAppLayout:v4];
  id v6 = v5;
  if (v5)
  {
    char v7 = v5;
  }
  else
  {
    char v7 = [v4 firstObject];
  }
  double v8 = v7;
  if (self->_fullScreenAppLayout)
  {
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke;
    v14[3] = &unk_1E6AFA6F8;
    v14[4] = self;
    id v15 = v4;
    uint64_t v16 = &v17;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v14];
    fullScreenAppLayout = v8;
    if (*((unsigned char *)v18 + 24)) {
      fullScreenAppLayout = self->_fullScreenAppLayout;
    }
    objc_super v11 = fullScreenAppLayout;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_super v11 = v7;
  }
  double v12 = v11;

  return v12;
}

void __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke_2;
  v5[3] = &unk_1E6AFA6F8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 _performBlockWhileSimulatingPostPresentationScrollViewContentOffset:v5];
}

uint64_t __63__SBMixedGridToFullScreenSwitcherModifier__appLayoutToScrollTo__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 160), "isIndexFullyVisible:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(void *)(*(void *)(a1 + 40) + 144)));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_firstFloatingAppLayout:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      double v9 = v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (objc_msgSend(v10, "environment", (void)v12) == 1)
        {
          id v6 = v9;
          goto LABEL_12;
        }
        id v6 = v10;

        ++v8;
        double v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBMixedGridToFullScreenSwitcherModifier *)self appLayouts];
  id v6 = [(SBMixedGridToFullScreenSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v5];

  uint64_t v7 = [(SBMixedGridToFullScreenSwitcherModifier *)self _firstFloatingAppLayout:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 firstObject];
  }
  double v10 = v9;
  -[SBMixedGridToFullScreenSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", [v6 indexOfObject:v9], 3);
  long long v13 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v11, v12);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__SBMixedGridToFullScreenSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke;
  v15[3] = &unk_1E6AF5300;
  id v16 = v4;
  id v14 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v13 usingBlock:v15];
}

uint64_t __111__SBMixedGridToFullScreenSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsBeforeTransition, 0);
  objc_storeStrong((id *)&self->_routeToMixedGridModifier, 0);
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end