@interface SBContinuousExposeAppToAppModifier
- (BOOL)_shouldIgnoreTapsUntilDelay:(double *)a3;
- (BOOL)asyncRenderingDisabled;
- (BOOL)isCommandTabTransition;
- (BOOL)isContinuousExposeConfigurationChangeTransition;
- (BOOL)isLaunchingFromDockTransition;
- (BOOL)isLaunchingFromSpotlightTransition;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isMorphFromInAppViewTransition;
- (BOOL)isTopAffordanceMenuTransition;
- (NSDictionary)fromDisplayItemLayoutAttributesMap;
- (NSDictionary)toDisplayItemLayoutAttributesMap;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)toAppLayout;
- (SBContinuousExposeAppToAppModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toAppLayout:(id)a6 toInterfaceOrientation:(int64_t)a7 fromDisplayItemLayoutAttributesMap:(id)a8 toDisplayItemLayoutAttributesMap:(id)a9;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (id)_ignoreTapsDuringMorphTransitionReason;
- (id)_layoutSettings;
- (id)_topMostDisplayItemInDisplayItemLayoutAttributesMap:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (int64_t)fromInterfaceOrientation;
- (int64_t)toInterfaceOrientation;
- (void)didMoveToParentModifier:(id)a3;
- (void)setCommandTabTransition:(BOOL)a3;
- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3;
- (void)setIsTopAffordanceMenuTransition:(BOOL)a3;
- (void)setLaunchingFromDockTransition:(BOOL)a3;
- (void)setLaunchingFromSpotlightTransition:(BOOL)a3;
- (void)setMorphFromInAppViewTransition:(BOOL)a3;
@end

@implementation SBContinuousExposeAppToAppModifier

- (SBContinuousExposeAppToAppModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toAppLayout:(id)a6 toInterfaceOrientation:(int64_t)a7 fromDisplayItemLayoutAttributesMap:(id)a8 toDisplayItemLayoutAttributesMap:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v33 = a8;
  id v32 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBContinuousExposeAppToAppModifier.m", 38, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"SBContinuousExposeAppToAppModifier.m", 39, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)SBContinuousExposeAppToAppModifier;
  v18 = [(SBTransitionSwitcherModifier *)&v34 initWithTransitionID:v15];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    v19->_fromInterfaceOrientation = a5;
    objc_storeStrong((id *)&v19->_toAppLayout, a6);
    v19->_toInterfaceOrientation = a7;
    objc_storeStrong((id *)&v19->_fromDisplayItemLayoutAttributesMap, a8);
    objc_storeStrong((id *)&v19->_toDisplayItemLayoutAttributesMap, a9);
    displayItemsChangingSize = v19->_displayItemsChangingSize;
    v19->_displayItemsChangingSize = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v21 = [(SBContinuousExposeAppToAppModifier *)v19 _topMostDisplayItemInDisplayItemLayoutAttributesMap:v19->_fromDisplayItemLayoutAttributesMap];
    fromTopMostDisplayItem = v19->_fromTopMostDisplayItem;
    v19->_fromTopMostDisplayItem = (SBDisplayItem *)v21;

    uint64_t v23 = [(SBContinuousExposeAppToAppModifier *)v19 _topMostDisplayItemInDisplayItemLayoutAttributesMap:v19->_toDisplayItemLayoutAttributesMap];
    toTopMostDisplayItem = v19->_toTopMostDisplayItem;
    v19->_toTopMostDisplayItem = (SBDisplayItem *)v23;

    v19->_ignoreTapsDuringMorphTransition = 1;
    v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];
    uniqueAnimationIdentifier = v19->_uniqueAnimationIdentifier;
    v19->_uniqueAnimationIdentifier = (NSString *)v26;
  }
  return v19;
}

- (void)didMoveToParentModifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposeAppToAppModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v21, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBAppLayout *)self->_toAppLayout allItems];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__SBContinuousExposeAppToAppModifier_didMoveToParentModifier___block_invoke;
    v20[3] = &unk_1E6AF4B38;
    v20[4] = self;
    objc_msgSend(v5, "bs_filter:", v20);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    displayItemsChangingSize = self->_displayItemsChangingSize;
    self->_displayItemsChangingSize = v6;

    v8 = (NSMutableArray *)[(NSArray *)self->_displayItemsChangingSize mutableCopy];
    pendingDisplayItemSceneUpdates = self->_pendingDisplayItemSceneUpdates;
    self->_pendingDisplayItemSceneUpdates = v8;

    if (![(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout])
    {
      if (self->_toAppLayout)
      {
        v10 = [(SBContinuousExposeAppToAppModifier *)self appLayouts];
        int v11 = [v10 containsObject:self->_toAppLayout];

        if (v11)
        {
          if ([(SBContinuousExposeAppToAppModifier *)self prefersStripHiddenAndDisabled]&& ![(SBContinuousExposeAppToAppModifier *)self isTopAffordanceMenuTransition]|| [(SBContinuousExposeAppToAppModifier *)self isCommandTabTransition]|| [(SBContinuousExposeAppToAppModifier *)self isLaunchingFromDockTransition]|| [(SBContinuousExposeAppToAppModifier *)self isLaunchingFromSpotlightTransition])
          {
            v12 = [SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier alloc];
            v13 = [(SBTransitionSwitcherModifier *)self transitionID];
            uint64_t v14 = [(SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *)v12 initWithTransitionID:v13 toAppLayout:self->_toAppLayout fromAppLayout:self->_fromAppLayout];
          }
          else
          {
            id v16 = [(SBContinuousExposeAppToAppModifier *)self switcherSettings];
            id v17 = [v16 chamoisSettings];
            int v18 = [v17 useLowFatigueStripAnimation];

            if (!v18) {
              return;
            }
            v19 = [SBContinuousExposeFullScreenToStripTransitionSwitcherModifier alloc];
            v13 = [(SBTransitionSwitcherModifier *)self transitionID];
            uint64_t v14 = [(SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *)v19 initWithTransitionID:v13 outgoingAppLayout:self->_fromAppLayout];
          }
          id v15 = (void *)v14;

          if (v15)
          {
            [(SBChainableModifier *)self addChildModifier:v15];
          }
        }
      }
    }
  }
}

uint64_t __62__SBContinuousExposeAppToAppModifier_didMoveToParentModifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 192) containsItem:v3])
  {
    if ([*(id *)(a1 + 32) isContinuousExposeConfigurationChangeTransition])
    {
      uint64_t v4 = 1;
    }
    else
    {
      v5 = [*(id *)(*(void *)(a1 + 32) + 224) objectForKey:v3];
      v6 = [*(id *)(*(void *)(a1 + 32) + 232) objectForKey:v3];
      v7 = [*(id *)(a1 + 32) chamoisLayoutAttributes];
      [*(id *)(a1 + 32) containerViewBounds];
      if (v5 == v6) {
        goto LABEL_12;
      }
      double v12 = v8;
      double v13 = v9;
      double v14 = v10;
      double v15 = v11;
      [v7 defaultWindowSize];
      double v17 = v16;
      double v19 = v18;
      [v7 screenEdgePadding];
      objc_msgSend(v5, "sizeInBounds:defaultSize:screenEdgePadding:", v12, v13, v14, v15, v17, v19, v20);
      double v22 = v21;
      double v24 = v23;
      [v7 defaultWindowSize];
      double v26 = v25;
      double v28 = v27;
      [v7 screenEdgePadding];
      objc_msgSend(v6, "sizeInBounds:defaultSize:screenEdgePadding:", v12, v13, v14, v15, v26, v28, v29);
      BOOL v32 = v22 == v31 && v24 == v30;
      if (v32 && (uint64_t v33 = [v5 sizingPolicy], v33 == objc_msgSend(v6, "sizingPolicy"))) {
LABEL_12:
      }
        uint64_t v4 = 0;
      else {
        uint64_t v4 = 1;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)asyncRenderingDisabled
{
  if (BSEqualObjects()) {
    return 1;
  }
  fromAppLayout = self->_fromAppLayout;
  toAppLayout = self->_toAppLayout;
  return [(SBAppLayout *)fromAppLayout containsAllItemsFromAppLayout:toAppLayout];
}

- (id)transitionWillBegin
{
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__41;
  double v25 = __Block_byref_object_dispose__41;
  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeAppToAppModifier;
  id v26 = [(SBTransitionSwitcherModifier *)&v20 transitionWillBegin];
  id v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  uint64_t v4 = SBAppendSwitcherModifierResponse(v3, v22[5]);
  v5 = (void *)v22[5];
  v22[5] = v4;

  if ([(SBContinuousExposeAppToAppModifier *)self isTopAffordanceMenuTransition])
  {
    toDisplayItemLayoutAttributesMap = self->_toDisplayItemLayoutAttributesMap;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke;
    v19[3] = &unk_1E6AFFE48;
    v19[4] = self;
    v19[5] = &v21;
    [(NSDictionary *)toDisplayItemLayoutAttributesMap enumerateKeysAndObjectsUsingBlock:v19];
  }
  double v18 = 0.0;
  if ([(SBContinuousExposeAppToAppModifier *)self _shouldIgnoreTapsUntilDelay:&v18])
  {
    objc_initWeak(&location, self);
    v7 = [SBTimerEventSwitcherEventResponse alloc];
    double v8 = v18;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke_2;
    v15[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v16, &location);
    double v9 = [(SBContinuousExposeAppToAppModifier *)self _ignoreTapsDuringMorphTransitionReason];
    double v10 = [(SBTimerEventSwitcherEventResponse *)v7 initWithDelay:v15 validator:v9 reason:v8];

    uint64_t v11 = SBAppendSwitcherModifierResponse(v10, v22[5]);
    double v12 = (void *)v22[5];
    v22[5] = v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 224) objectForKey:v5];
  double v8 = v7;
  if (v7)
  {
    [v7 attributedSize];
    if (v6)
    {
      [v6 attributedSize];
      if ((SBEqualDisplayItemAttributedSizes((uint64_t)v16, (uint64_t)v14) & 1) == 0)
      {
        [v6 attributedSize];
        if (v13 == 3)
        {
          double v9 = [[SBSetInterfaceOrientationFromUserResizingEventResponse alloc] initWithDisplayItem:v5 desiredContentOrientation:*(void *)(*(void *)(a1 + 32) + 216)];
          uint64_t v10 = SBAppendSwitcherModifierResponse(v9, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          double v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;
        }
      }
    }
    else
    {
      uint64_t v15 = 0;
      memset(v14, 0, sizeof(v14));
      SBEqualDisplayItemAttributedSizes((uint64_t)v16, (uint64_t)v14);
    }
  }
}

BOOL __57__SBContinuousExposeAppToAppModifier_transitionWillBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeAppToAppModifier;
  BOOL v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if ([(SBTransitionSwitcherModifier *)self isInterrupted])
  {
    uint64_t v4 = objc_alloc_init(SBCancelWindowMorphingSwitcherEventResponse);
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    BOOL v3 = (void *)v5;
  }
  return v3;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeAppToAppModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v12 handleSceneReadyEvent:v4];
  id v6 = [v4 appLayout];

  objc_super v7 = [v6 itemForLayoutRole:1];
  if ([(NSMutableArray *)self->_pendingDisplayItemSceneUpdates containsObject:v7])
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeAppToAppModifier;
    if (-[SBContinuousExposeAppToAppModifier isLayoutRoleContentReady:inAppLayout:](&v11, sel_isLayoutRoleContentReady_inAppLayout_, [v6 layoutRoleForItem:v7], v6))-[NSMutableArray removeObject:](self->_pendingDisplayItemSceneUpdates, "removeObject:", v7); {
  }
    }
  if ([(NSArray *)self->_displayItemsChangingSize containsObject:v7])
  {
    double v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:0];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    uint64_t v5 = (void *)v9;
  }

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBContinuousExposeAppToAppModifier *)self isMorphFromInAppViewTransition])
  {
LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)SBContinuousExposeAppToAppModifier;
    uint64_t v13 = [(SBSwitcherModifier *)&v21 handleTapAppLayoutEvent:v4];
    goto LABEL_11;
  }
  if (self->_ignoreTapsDuringMorphTransition)
  {
    uint64_t v5 = SBLogAppSwitcher();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      objc_super v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543362;
      double v24 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignored tap event because of ignore tap assertion", buf, 0xCu);
    }
    [v4 handleWithReason:@"Continuous Exposé App to App"];
    goto LABEL_10;
  }
  char v8 = [v4 isHandled];
  uint64_t v9 = SBLogAppSwitcher();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_super v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543362;
      double v24 = v12;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] tap detected but it has been handled already", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (v10)
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    double v17 = [v4 appLayout];
    double v18 = [v17 succinctDescription];
    *(_DWORD *)buf = 138543618;
    double v24 = v16;
    __int16 v25 = 2114;
    id v26 = v18;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] tap detected, cancelling any window morphing before transition completes: %{public}@", buf, 0x16u);
  }
  double v19 = objc_alloc_init(SBCancelWindowMorphingSwitcherEventResponse);
  v22.receiver = self;
  v22.super_class = (Class)SBContinuousExposeAppToAppModifier;
  objc_super v20 = [(SBSwitcherModifier *)&v22 handleTapAppLayoutEvent:v4];
  uint64_t v13 = SBAppendSwitcherModifierResponse(v19, v20);

LABEL_11:
  return v13;
}

- (id)handleTimerEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeAppToAppModifier;
  id v4 = a3;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v13 handleTimerEvent:v4];
  id v6 = objc_msgSend(v4, "reason", v13.receiver, v13.super_class);

  objc_super v7 = [(SBContinuousExposeAppToAppModifier *)self _ignoreTapsDuringMorphTransitionReason];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = SBLogAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = (objc_class *)objc_opt_class();
      objc_super v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "[%{public}@] handling ignore tap assertion event", buf, 0xCu);
    }
    self->_ignoreTapsDuringMorphTransition = 0;
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeAppToAppModifier;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v18 animationAttributesForLayoutElement:v4];
  id v6 = (void *)[v5 mutableCopy];

  if ([v4 switcherLayoutElementType]) {
    goto LABEL_17;
  }
  if (!BSEqualObjects()) {
    goto LABEL_17;
  }
  if (BSEqualObjects()) {
    goto LABEL_17;
  }
  if (!self->_fromAppLayout) {
    goto LABEL_17;
  }
  objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
  int v8 = [(SBAppLayout *)self->_toAppLayout allItems];
  uint64_t v9 = [v7 setWithArray:v8];
  BOOL v10 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v11 = [(SBAppLayout *)self->_fromAppLayout allItems];
  objc_super v12 = [v10 setWithArray:v11];
  int v13 = BSEqualSets();

  if (v13)
  {
    [v6 setLayoutUpdateMode:3];
    double v14 = [(SBContinuousExposeAppToAppModifier *)self switcherSettings];
    uint64_t v15 = [v14 chamoisSettings];
    uint64_t v16 = [v15 stageFocusChangeSettings];
    [v6 setLayoutSettings:v16];
  }
  else
  {
LABEL_17:
    if ([v4 switcherLayoutElementType] || (BSEqualObjects() & 1) != 0 || BSEqualObjects())
    {
      [v6 setLayoutUpdateMode:3];
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
      [v14 setResponse:0.4];
      [v14 setDampingRatio:1.0];
      CAFrameRateRange v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
      [v6 setLayoutSettings:v14];
    }
    else
    {
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
      [v14 setResponse:0.54];
      [v14 setDampingRatio:0.92];
      CAFrameRateRange v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);
      [v6 setLayoutSettings:v14];
      [v6 setPositionSettings:v14];
      [v6 setOpacitySettings:v14];
      [v6 setUpdateMode:3];
    }
  }

  return v6;
}

- (id)topMostLayoutElements
{
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeAppToAppModifier;
  BOOL v3 = [(SBContinuousExposeAppToAppModifier *)&v13 topMostLayoutElements];
  id v4 = [(SBAppLayout *)self->_fromAppLayout leafAppLayoutForRole:4];
  uint64_t v5 = [(SBAppLayout *)self->_toAppLayout leafAppLayoutForRole:4];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v4) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
    goto LABEL_14;
  }
  char v10 = [v4 isEqual:v5];
  if ((v10 & 1) == 0)
  {
    objc_super v11 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);

    uint64_t v9 = objc_msgSend(v11, "sb_arrayByInsertingOrMovingObject:toIndex:", v6, 0);
    BOOL v3 = v11;
LABEL_14:

    BOOL v3 = (void *)v9;
  }
LABEL_15:

  return v3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 0.0;
  if (![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeAppToAppModifier;
    [(SBContinuousExposeAppToAppModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (![v4 isEqual:self->_toAppLayout]
    || (double v5 = 0.0, [(SBTransitionSwitcherModifier *)self transitionPhase] != 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeAppToAppModifier;
    [(SBContinuousExposeAppToAppModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeAppToAppModifier;
  if ([(SBContinuousExposeAppToAppModifier *)&v10 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6])
  {
    goto LABEL_2;
  }
  if (![v6 isEqual:self->_toAppLayout])
  {
    BOOL v7 = 0;
    goto LABEL_7;
  }
  if ([(SBContinuousExposeAppToAppModifier *)self isContinuousExposeConfigurationChangeTransition])
  {
LABEL_2:
    BOOL v7 = 1;
  }
  else
  {
    objc_super v8 = [v6 itemForLayoutRole:a3];
    BOOL v7 = [(NSArray *)self->_displayItemsChangingSize containsObject:v8];
  }
LABEL_7:

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 itemForLayoutRole:a3];
  if ([(NSArray *)self->_displayItemsChangingSize containsObject:v7]
    && [(NSMutableArray *)self->_pendingDisplayItemSceneUpdates containsObject:v7])
  {
    LODWORD(a3) = ![(SBContinuousExposeAppToAppModifier *)self isMorphFromInAppViewTransition];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeAppToAppModifier;
    LOBYTE(a3) = [(SBContinuousExposeAppToAppModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 itemForLayoutRole:a3];
  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeAppToAppModifier;
  [(SBContinuousExposeAppToAppModifier *)&v14 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v9 = v8;

  if ([(NSArray *)self->_displayItemsChangingSize containsObject:v7]
    && ![(SBContinuousExposeAppToAppModifier *)self isMorphFromInAppViewTransition])
  {
    objc_super v10 = [(SBContinuousExposeAppToAppModifier *)self switcherSettings];
    objc_super v11 = [v10 animationSettings];
    [v11 resizeBlurDelay];
    double v9 = v12;
  }
  return v9;
}

- (id)_layoutSettings
{
  v2 = [(SBContinuousExposeAppToAppModifier *)self switcherSettings];
  BOOL v3 = [v2 chamoisSettings];
  id v4 = [v3 appToAppLayoutSettings];

  return v4;
}

- (BOOL)_shouldIgnoreTapsUntilDelay:(double *)a3
{
  BOOL v5 = [(SBContinuousExposeAppToAppModifier *)self isMorphFromInAppViewTransition];
  if (v5)
  {
    id v6 = [(SBContinuousExposeAppToAppModifier *)self switcherSettings];
    BOOL v7 = [v6 animationSettings];
    [v7 disableTapDuringMorphFromInAppViewTransitionDelay];
    double v9 = v8;
    UIAnimationDragCoefficient();
    *a3 = v9 * v10;
  }
  return v5;
}

- (id)_ignoreTapsDuringMorphTransitionReason
{
  return (id)[NSString stringWithFormat:@"%@-IgnoreTapsDuringMorphTransitionReason", self->_uniqueAnimationIdentifier];
}

- (id)_topMostDisplayItemInDisplayItemLayoutAttributesMap:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    double v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v12 = [v3 objectForKey:v11];
        uint64_t v13 = [v12 lastInteractionTime];
        if (v13 > v7)
        {
          uint64_t v14 = v13;
          id v15 = v11;

          uint64_t v7 = v14;
          double v8 = v15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (NSDictionary)fromDisplayItemLayoutAttributesMap
{
  return self->_fromDisplayItemLayoutAttributesMap;
}

- (NSDictionary)toDisplayItemLayoutAttributesMap
{
  return self->_toDisplayItemLayoutAttributesMap;
}

- (BOOL)isContinuousExposeConfigurationChangeTransition
{
  return self->_continuousExposeConfigurationChangeTransition;
}

- (void)setContinuousExposeConfigurationChangeTransition:(BOOL)a3
{
  self->_continuousExposeConfigurationChangeTransition = a3;
}

- (BOOL)isCommandTabTransition
{
  return self->_commandTabTransition;
}

- (void)setCommandTabTransition:(BOOL)a3
{
  self->_commandTabTransition = a3;
}

- (BOOL)isLaunchingFromDockTransition
{
  return self->_launchingFromDockTransition;
}

- (void)setLaunchingFromDockTransition:(BOOL)a3
{
  self->_launchingFromDockTransition = a3;
}

- (BOOL)isMorphFromInAppViewTransition
{
  return self->_morphFromInAppViewTransition;
}

- (void)setMorphFromInAppViewTransition:(BOOL)a3
{
  self->_morphFromInAppViewTransition = a3;
}

- (BOOL)isLaunchingFromSpotlightTransition
{
  return self->_launchingFromSpotlightTransition;
}

- (void)setLaunchingFromSpotlightTransition:(BOOL)a3
{
  self->_launchingFromSpotlightTransition = a3;
}

- (BOOL)isTopAffordanceMenuTransition
{
  return self->_isTopAffordanceMenuTransition;
}

- (void)setIsTopAffordanceMenuTransition:(BOOL)a3
{
  self->_isTopAffordanceMenuTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_fromDisplayItemLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_uniqueAnimationIdentifier, 0);
  objc_storeStrong((id *)&self->_toTopMostDisplayItem, 0);
  objc_storeStrong((id *)&self->_fromTopMostDisplayItem, 0);
  objc_storeStrong((id *)&self->_pendingDisplayItemSceneUpdates, 0);
  objc_storeStrong((id *)&self->_displayItemsChangingSize, 0);
}

@end