@interface SBPeekSplitViewRoutingSwitcherModifier
+ (id)modifierForEvent:(id)a3;
- (BOOL)_isAppLayoutBeingResized:(id)a3;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4;
- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4;
- (SBPeekSplitViewRoutingSwitcherModifier)initWithPeekConfiguration:(int64_t)a3 spaceConfiguration:(int64_t)a4 peekingAppLayout:(id)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenDimmingAlpha;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_combinedResultingAppLayoutWithAppLayout:(id)a3;
- (id)_handleEvent:(id)a3;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugPotentialChildModifiers;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)fallbackModifierForRoutingModifier:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)homeScreenModifierForRoutingModifier:(id)a3;
- (id)keyboardSuppressionMode;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4;
- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4;
- (id)scrollModifierForRoutingModifier:(id)a3;
- (id)topMostLayoutElements;
- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)hiddenContainerStatusBarParts;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3;
- (unint64_t)transactionCompletionOptions;
- (void)_temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:(id)a3;
@end

@implementation SBPeekSplitViewRoutingSwitcherModifier

- (SBPeekSplitViewRoutingSwitcherModifier)initWithPeekConfiguration:(int64_t)a3 spaceConfiguration:(int64_t)a4 peekingAppLayout:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v27 init];
  if (v11)
  {
    if (!SBPeekConfigurationIsValid(a3))
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v11, @"SBPeekSplitViewRoutingSwitcherModifier.m", 93, @"Invalid parameter not satisfying: %@", @"SBPeekConfigurationIsValid(peekConfiguration)" object file lineNumber description];
    }
    if (SBSpaceConfigurationIsValid(a4))
    {
      if (v10)
      {
LABEL_6:
        v11->_peekConfiguration = a3;
        v11->_spaceConfiguration = a4;
        objc_storeStrong((id *)&v11->_peekingAppLayout, a5);
        uint64_t v12 = +[SBAppSwitcherDomain rootSettings];
        switcherSettings = v11->_switcherSettings;
        v11->_switcherSettings = (SBAppSwitcherSettings *)v12;

        v14 = objc_alloc_init(SBSplitAllDisplayItemsSwitcherModifier);
        [(SBChainableModifier *)v11 addChildModifier:v14 atLevel:1 key:0];
        v15 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
        peekingModifier = v11->_peekingModifier;
        v11->_peekingModifier = &v15->super.super;

        v17 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
        nonPeekingModifier = v11->_nonPeekingModifier;
        v11->_nonPeekingModifier = &v17->super.super;

        v19 = [SBRoutingSwitcherModifier alloc];
        v28[0] = v11->_peekingModifier;
        v28[1] = v11->_nonPeekingModifier;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
        uint64_t v21 = [(SBRoutingSwitcherModifier *)v19 initWithModifiers:v20 delegate:v11];
        routingModifier = v11->_routingModifier;
        v11->_routingModifier = (SBRoutingSwitcherModifier *)v21;

        [(SBChainableModifier *)v11 addChildModifier:v11->_routingModifier atLevel:2 key:0];
        goto LABEL_7;
      }
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v11, @"SBPeekSplitViewRoutingSwitcherModifier.m", 94, @"Invalid parameter not satisfying: %@", @"SBSpaceConfigurationIsValid(spaceConfiguration)" object file lineNumber description];

      if (v10) {
        goto LABEL_6;
      }
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v11, @"SBPeekSplitViewRoutingSwitcherModifier.m", 95, @"Invalid parameter not satisfying: %@", @"peekingAppLayout" object file lineNumber description];

    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t peekConfiguration = self->_peekConfiguration;
  int64_t spaceConfiguration = self->_spaceConfiguration;
  peekingAppLayout = self->_peekingAppLayout;
  return (id)[v4 initWithPeekConfiguration:peekConfiguration spaceConfiguration:spaceConfiguration peekingAppLayout:peekingAppLayout];
}

- (id)debugPotentialChildModifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  nonPeekingModifier = self->_nonPeekingModifier;
  v5[0] = self->_peekingModifier;
  v5[1] = nonPeekingModifier;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)modifierForEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = SBSafeCast(v4, v3);

  if (v5
    && [v5 isEnteringSplitViewPeekEvent]
    && ([v5 phase] == 1 || (objc_msgSend(v5, "isAnimated") & 1) == 0))
  {
    v7 = [SBPeekSplitViewRoutingSwitcherModifier alloc];
    uint64_t v8 = [v5 toPeekConfiguration];
    uint64_t v9 = [v5 toSpaceConfiguration];
    id v10 = [v5 toAppLayout];
    v6 = [(SBPeekSplitViewRoutingSwitcherModifier *)v7 initWithPeekConfiguration:v8 spaceConfiguration:v9 peekingAppLayout:v10];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (SBAppLayout *)a3;
  v28.receiver = self;
  v28.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v28 appLayoutContainingAppLayout:v4];
  v6 = (void *)v5;
  if (self->_uncondtionallyAllowAppLayoutContainment)
  {
    v7 = (SBAppLayout *)v5;
  }
  else if (self->_peekingAppLayout == v4)
  {
    v7 = (SBAppLayout *)v5;
    if ((SBAppLayout *)v5 == v4)
    {
      v7 = v4;
      v6 = v4;
      if ((unint64_t)(self->_peekState - 1) <= 1)
      {
        uint64_t v8 = [(SBAppLayout *)v4 itemForLayoutRole:1];
        uint64_t v9 = [[SBDisplayItem alloc] initWithType:0 bundleIdentifier:@"SBPeekSplitViewRoutingSwitcherModifier-placeholder-A" uniqueIdentifier:&stru_1F3084718];
        int64_t peekConfiguration = self->_peekConfiguration;
        if (peekConfiguration == 2) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 2;
        }
        if (peekConfiguration == 2) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 1;
        }
        v13 = [(SBAppLayout *)self->_peekingAppLayout layoutAttributesForItem:v8];
        v14 = v13;
        if (v13) {
          v15 = v13;
        }
        else {
          v15 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        }
        objc_super v27 = v15;

        v24 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        v25 = [SBAppLayout alloc];
        v26 = [NSNumber numberWithInteger:v11];
        v31[0] = v26;
        v32[0] = v8;
        v16 = [NSNumber numberWithInteger:v12];
        v31[1] = v16;
        v32[1] = v9;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
        uint64_t v18 = SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration);
        v29[0] = v8;
        v29[1] = v9;
        v30[0] = v27;
        v30[1] = v24;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
        v23 = (void *)v8;
        v20 = v9;
        v7 = [(SBAppLayout *)v25 initWithItemsForLayoutRoles:v17 configuration:v18 itemsToLayoutAttributes:v19 centerConfiguration:[(SBAppLayout *)v4 centerConfiguration] environment:[(SBAppLayout *)v4 environment] hidden:0 preferredDisplayOrdinal:[(SBPeekSplitViewRoutingSwitcherModifier *)self displayOrdinal]];

        v6 = v7;
      }
    }
  }
  else
  {
    v7 = v4;
  }
  uint64_t v21 = v7;

  return v21;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBPeekSplitViewRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &unk_1E6AF4B60;
  v8[4] = self;
  uint64_t v4 = objc_msgSend(a3, "bs_filter:", v8);
  v7.receiver = self;
  v7.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v7 adjustedAppLayoutsForAppLayouts:v4];

  return v5;
}

uint64_t __74__SBPeekSplitViewRoutingSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 itemForLayoutRole:1];
  uint64_t v4 = [v2 displayItemSupportsMedusa:v3];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_peekingAppLayout && (unint64_t)(self->_peekState - 1) <= 1)
  {
    [(SBPeekSplitViewRoutingSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    [(SBPeekSplitViewRoutingSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

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

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = (SBAppLayout *)a4;
  double v12 = v11;
  if (self->_peekingAppLayout == v11 && (unint64_t)(self->_peekState - 1) <= 1)
  {
    double v13 = [(SBAppLayout *)v11 itemForLayoutRole:a3];
    double v14 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayoutContainingAppLayout:v12];
    v41.receiver = self;
    v41.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, [v14 layoutRoleForItem:v13], v14, x, y, width, height);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    if ((unint64_t)(self->_peekState - 1) > 1)
    {
      double v30 = v15;
LABEL_13:

      goto LABEL_8;
    }
    char v22 = [(SBPeekSplitViewRoutingSwitcherModifier *)self isRTLEnabled];
    int64_t peekConfiguration = self->_peekConfiguration;
    if (v22)
    {
      if (peekConfiguration != 3)
      {
LABEL_6:
        [(SBPeekSplitViewRoutingSwitcherModifier *)self containerViewBounds];
        double v26 = v24 + v25;
        objc_super v27 = [(SBPeekSplitViewRoutingSwitcherModifier *)self switcherSettings];
        [v27 peekInsetWidth];
LABEL_12:
        double v30 = v26 - v28;

        goto LABEL_13;
      }
    }
    else if (peekConfiguration != 2)
    {
      goto LABEL_6;
    }
    [(SBPeekSplitViewRoutingSwitcherModifier *)self containerViewBounds];
    double v26 = v38;
    objc_super v27 = [(SBPeekSplitViewRoutingSwitcherModifier *)self switcherSettings];
    [v27 peekInsetWidth];
    double v28 = v19 - v39;
    goto LABEL_12;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v40, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v30 = v29;
  double v17 = v31;
  double v19 = v32;
  double v21 = v33;
LABEL_8:

  double v34 = v30;
  double v35 = v17;
  double v36 = v19;
  double v37 = v21;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v17 animationAttributesForLayoutElement:v4];
  if (*(_OWORD *)&self->_peekingAppLayout == __PAIR128__(3, (unint64_t)v4)
    && [(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v4])
  {
    toAppLayout = self->_toAppLayout;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__SBPeekSplitViewRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke;
    v16[3] = &unk_1E6AF4B38;
    v16[4] = self;
    double v7 = [(SBAppLayout *)toAppLayout appLayoutWithItemsPassingTest:v16];
    if (v7)
    {
      v15.receiver = self;
      v15.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
      double v8 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v15 animationAttributesForLayoutElement:v7];
      double v9 = [v8 positionSettings];
      double v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v8 layoutSettings];
      }
      double v12 = v11;

      double v13 = (void *)[v5 mutableCopy];
      [v13 setOpacitySettings:v12];

      uint64_t v5 = v13;
    }
  }
  return v5;
}

uint64_t __78__SBPeekSplitViewRoutingSwitcherModifier_animationAttributesForLayoutElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) containsItem:a2] ^ 1;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_peekingAppLayout && (unint64_t)(self->_peekState - 1) <= 1)
  {
    [(SBPeekSplitViewRoutingSwitcherModifier *)self splitViewInnerCornerRadius];
    SBRectCornerRadiiForRadius();
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    uint64_t v20 = 0;
    double v21 = (double *)&v20;
    uint64_t v22 = 0x4010000000;
    v23 = &unk_1D90ED3C6;
    long long v24 = 0u;
    long long v25 = 0u;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke;
    v19[3] = &unk_1E6AF6358;
    v19[5] = &v20;
    v19[6] = a3;
    v19[4] = self;
    [(SBPeekSplitViewRoutingSwitcherModifier *)self _temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:v19];
    double v8 = v21[4];
    double v10 = v21[5];
    double v12 = v21[6];
    double v14 = v21[7];
    _Block_object_dispose(&v20, 8);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

id __62__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id result = objc_msgSendSuper2(&v9, sel_cornerRadiiForIndex_, v2);
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  id v11 = a4;
  uint64_t v30 = 0;
  double v31 = (double *)&v30;
  uint64_t v32 = 0x4010000000;
  double v33 = &unk_1D90ED3C6;
  long long v34 = 0u;
  long long v35 = 0u;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke;
  v21[3] = &unk_1E6AF63A8;
  long long v24 = &v30;
  int64_t v25 = a3;
  id v12 = v11;
  double v26 = topLeft;
  double v27 = bottomLeft;
  double v28 = bottomRight;
  double v29 = topRight;
  id v22 = v12;
  v23 = self;
  [(SBPeekSplitViewRoutingSwitcherModifier *)self _temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:v21];
  double v13 = v31[4];
  double v14 = v31[5];
  double v15 = v31[6];
  double v16 = v31[7];

  _Block_object_dispose(&v30, 8);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.double topRight = v20;
  result.double bottomRight = v19;
  result.double bottomLeft = v18;
  result.double topLeft = v17;
  return result;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id result = objc_msgSendSuper2(&v10, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, v2, v3, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v5 = *(void **)(*(void *)(a1 + 48) + 8);
  v5[4] = v6;
  v5[5] = v7;
  v5[6] = v8;
  v5[7] = v9;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_peekingAppLayout)
  {
    unint64_t v7 = 15;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    unint64_t v7 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v9 maskedCornersForIndex:a3];
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v6 = a4;
  LOBYTE(a3) = [(SBPeekSplitViewRoutingSwitcherModifier *)&v8 isLayoutRoleSelectable:a3 inAppLayout:v6];
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v5->_peekingAppLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_peekingAppLayout)
  {
    int64_t peekState = self->_peekState;
    if (peekState) {
      BOOL v9 = peekState == 3;
    }
    else {
      BOOL v9 = 1;
    }
    BOOL v7 = v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    BOOL v7 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v11 isContentStatusBarVisibleForIndex:a3];
  }

  return v7;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  int64_t peekState = self->_peekState;
  return peekState == 3 || peekState == 0;
}

- (id)keyboardSuppressionMode
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  id v4 = [v2 setWithArray:v3];
  id v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v4];

  [v5 setApplyAssertionEvenIfAppIsHostingTheKeyboard:1];
  return v5;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  id v6 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  BOOL v7 = [v6 objectAtIndex:a4];

  double v8 = 0.0;
  if (v7 == self->_peekingAppLayout)
  {
    if ((unint64_t)(self->_peekState - 1) >= 2) {
      double v8 = 0.0;
    }
    else {
      double v8 = 1.0;
    }
  }

  return v8;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_peekingAppLayout == a4) {
    return 4;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  return -[SBPeekSplitViewRoutingSwitcherModifier shadowStyleForLayoutRole:inAppLayout:](&v5, sel_shadowStyleForLayoutRole_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v6 = a4;
  BOOL v7 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v10 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  BOOL v8 = -[SBPeekSplitViewRoutingSwitcherModifier _isAppLayoutBeingResized:](self, "_isAppLayoutBeingResized:", v6, v10.receiver, v10.super_class);

  if (v8 && !self->_isRotating) {
    return 1;
  }
  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  LOBYTE(v7) = [(SBPeekSplitViewRoutingSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  if ([(SBPeekSplitViewRoutingSwitcherModifier *)self _isAppLayoutBeingResized:v6]
    && !self->_isRotating)
  {
    int v7 = [(SBPeekSplitViewRoutingSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v6 = a4;
  [(SBPeekSplitViewRoutingSwitcherModifier *)&v13 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBPeekSplitViewRoutingSwitcherModifier isLayoutRoleBlurred:inAppLayout:](self, "isLayoutRoleBlurred:inAppLayout:", a3, v6, v13.receiver, v13.super_class);

  if (a3)
  {
    objc_super v9 = [(SBPeekSplitViewRoutingSwitcherModifier *)self switcherSettings];
    objc_super v10 = [v9 animationSettings];
    [v10 resizeBlurDelay];
    double v8 = v11;
  }
  return v8;
}

- (BOOL)_isAppLayoutBeingResized:(id)a3
{
  return self->_peekingAppLayout == a3 && self->_peekState < 2uLL;
}

- (BOOL)isContainerStatusBarVisible
{
  if (self->_peekState == 1) {
    return [(SBSwitcherModifier *)self->_nonPeekingModifier isContainerStatusBarVisible];
  }
  else {
    return 0;
  }
}

- (unint64_t)hiddenContainerStatusBarParts
{
  int64_t peekConfiguration = self->_peekConfiguration;
  if (peekConfiguration == 3) {
    return 8;
  }
  else {
    return 2 * (peekConfiguration == 2);
  }
}

- (id)visibleHomeAffordanceLayoutElements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  uint64_t v3 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v16 visibleHomeAffordanceLayoutElements];
  id v4 = (void *)[v3 mutableCopy];

  splitViewAppLayout = self->_splitViewAppLayout;
  if (splitViewAppLayout)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(SBAppLayout *)splitViewAppLayout leafAppLayouts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 removeObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }

    [v4 removeObject:self->_splitViewAppLayout];
  }
  if (self->_peekingAppLayout) {
    objc_msgSend(v4, "removeObject:");
  }
  return v4;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  if (self->_peekState != 3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  return [(SBPeekSplitViewRoutingSwitcherModifier *)&v4 isResizeGrabberVisibleForAppLayout:a3];
}

- (double)homeScreenDimmingAlpha
{
  double result = 1.0;
  if (self->_peekState != 3)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    [(SBPeekSplitViewRoutingSwitcherModifier *)&v3 homeScreenDimmingAlpha];
  }
  return result;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  BOOL v7 = -[SBPeekSplitViewRoutingSwitcherModifier canPerformKeyboardShortcutAction:forBundleIdentifier:](&v9, sel_canPerformKeyboardShortcutAction_forBundleIdentifier_);
  if ((unint64_t)a3 <= 0x12 && ((1 << a3) & 0x46808) != 0 && v7)
  {
    if (a4) {
      LOBYTE(v7) = !SBPeekConfigurationIsValid(self->_peekConfiguration);
    }
    else {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  objc_super v3 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v6 topMostLayoutElements];
  objc_super v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_peekingAppLayout, 0);

  return v4;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  if ([(SBPeekSplitViewRoutingSwitcherModifier *)self isReduceMotionEnabled]) {
    return 6;
  }
  else {
    return 2;
  }
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v5 = [(SBPeekSplitViewRoutingSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  BOOL v7 = v6 != self->_peekingAppLayout || (unint64_t)(self->_peekState - 1) >= 2;
  return v7;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if (![v4 isTransitionEvent])
  {
    long long v12 = 0;
    goto LABEL_44;
  }
  id v5 = v4;
  int v6 = [v5 isEnteringSplitViewPeekEvent];
  int v7 = [v5 isExitingSplitViewPeekEvent];
  uint64_t v8 = [v5 fromEnvironmentMode];
  unint64_t v9 = [v5 phase];
  if (!v6 || v9 != 1)
  {
    if (v9 > 1) {
      char v13 = v6;
    }
    else {
      char v13 = 0;
    }
    if (v13) {
      goto LABEL_11;
    }
    if (v9 == 1) {
      int v16 = v7;
    }
    else {
      int v16 = 0;
    }
    if (v16 != 1)
    {
      if (v9 > 1) {
        int v19 = v7;
      }
      else {
        int v19 = 0;
      }
      if (v19 != 1) {
        goto LABEL_29;
      }
      double v20 = [v5 toAppLayout];
      double v21 = [v20 itemForLayoutRole:2];

      id v22 = [v5 toAppLayout];
      objc_super v10 = v22;
      if (v21) {
        goto LABEL_14;
      }
      v23 = [(SBAppLayout *)v22 itemForLayoutRole:1];

      if (!v23) {
        goto LABEL_5;
      }
      long long v24 = [v5 toAppLayout];
      int64_t v25 = [v24 itemForLayoutRole:2];

      if (v25)
      {
LABEL_29:
        if ([v5 toEnvironmentMode] == 2)
        {
          objc_super v10 = 0;
          int64_t peekState = 2;
        }
        else
        {
          int64_t peekState = self->_peekState;
          objc_super v10 = self->_splitViewAppLayout;
        }
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    double v17 = [v5 toAppLayout];
    uint64_t v18 = [v17 itemForLayoutRole:2];

    if (!v18)
    {
LABEL_11:
      objc_super v10 = 0;
    }
    else
    {
      objc_super v10 = [v5 toAppLayout];
    }
    int64_t peekState = 1;
    goto LABEL_33;
  }
  if (v8 == 1)
  {
LABEL_5:
    objc_super v10 = 0;
    int64_t peekState = 4;
    goto LABEL_33;
  }
  long long v14 = [v5 fromAppLayout];
  long long v15 = [v14 itemForLayoutRole:2];

  if (v15)
  {
    objc_super v10 = [v5 fromAppLayout];
LABEL_14:
    int64_t peekState = 3;
    goto LABEL_33;
  }
LABEL_31:
  objc_super v10 = 0;
  int64_t peekState = 0;
LABEL_33:
  if (peekState == self->_peekState
    && self->_splitViewAppLayout == v10
    && (toAppLayout = self->_toAppLayout,
        [v5 toAppLayout],
        double v27 = (SBAppLayout *)objc_claimAutoreleasedReturnValue(),
        v27,
        toAppLayout == v27))
  {
    long long v12 = 0;
  }
  else
  {
    long long v12 = [[SBInvalidateSnapshotCacheSwitcherEventResponse alloc] initWithDisplayItems:0];
  }
  p_splitViewAppLayout = &self->_splitViewAppLayout;
  if (self->_splitViewAppLayout != v10)
  {
    double v29 = [(SBChainableModifier *)self childModifierByKey:@"SplitZoomingItemModifierKey"];
    if (v29) {
      [(SBChainableModifier *)self removeChildModifier:v29];
    }
    objc_storeStrong((id *)p_splitViewAppLayout, v10);
    uint64_t v30 = *p_splitViewAppLayout;
    if (*p_splitViewAppLayout)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54__SBPeekSplitViewRoutingSwitcherModifier_handleEvent___block_invoke;
      v43[3] = &unk_1E6AF4B38;
      v43[4] = self;
      double v31 = [(SBAppLayout *)v30 appLayoutWithItemsPassingTest:v43];
      [v31 allItems];
      uint64_t v32 = v10;
      v34 = int64_t v33 = peekState;
      objc_super v41 = [v34 firstObject];

      int64_t peekState = v33;
      objc_super v10 = v32;

      long long v35 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v41];
      [(SBChainableModifier *)self addChildModifier:v35 atLevel:0 key:@"SplitZoomingItemModifierKey"];
    }
  }
  self->_int64_t peekState = peekState;
  objc_msgSend(v5, "toAppLayout", v41);
  double v36 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  double v37 = self->_toAppLayout;
  self->_toAppLayout = v36;

LABEL_44:
  v42.receiver = self;
  v42.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  double v38 = [(SBChainableModifier *)&v42 handleEvent:v4];
  double v39 = SBAppendSwitcherModifierResponse(v12, v38);

  return v39;
}

uint64_t __54__SBPeekSplitViewRoutingSwitcherModifier_handleEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) containsItem:a2] ^ 1;
}

- (id)_handleEvent:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v25 _handleEvent:v4];
  uint64_t v6 = objc_opt_class();
  int v7 = SBSafeCast(v6, v4);
  uint64_t v8 = v7;
  if (v7 && [v7 isExitingSplitViewPeekEvent])
  {
    if ([v8 isAnimated] && objc_msgSend(v8, "phase") == 1)
    {
      unint64_t v9 = [SBTransitionSwitcherModifier alloc];
      objc_super v10 = [v8 transitionID];
      double v11 = [(SBTransitionSwitcherModifier *)v9 initWithTransitionID:v10];
      exitingTransitionTrackingModifier = self->_exitingTransitionTrackingModifier;
      self->_exitingTransitionTrackingModifier = v11;
    }
    else if (([v8 isAnimated] & 1) == 0)
    {
      [(SBChainableModifier *)self setState:1];
    }
  }
  char v13 = self->_exitingTransitionTrackingModifier;
  if (v13)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__SBPeekSplitViewRoutingSwitcherModifier__handleEvent___block_invoke;
    v18[3] = &unk_1E6AFA6F8;
    v18[4] = self;
    id v19 = v4;
    double v20 = &v21;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v13 usingBlock:v18];
    [(SBChainableModifier *)self->_exitingTransitionTrackingModifier setState:v22[3]];
    [(SBChainableModifier *)self setState:v22[3]];

    _Block_object_dispose(&v21, 8);
  }
  if ([(SBChainableModifier *)self state] == 1)
  {
    long long v14 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    long long v15 = SBAppendSwitcherModifierResponse(v14, v5);

    int v16 = [[SBInvalidateSnapshotCacheSwitcherEventResponse alloc] initWithDisplayItems:0];
    id v5 = SBAppendSwitcherModifierResponse(v16, v15);
  }
  return v5;
}

uint64_t __55__SBPeekSplitViewRoutingSwitcherModifier__handleEvent___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 160) handleEvent:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 160) state];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v15 handleTransitionEvent:v4];
  int v6 = [v4 isEnteringSplitViewPeekEvent];
  int v7 = [v4 isExitingSplitViewPeekEvent];
  uint64_t v8 = [v4 phase];
  if (v6 && (v8 == 1 || ([v4 isAnimated] & 1) == 0))
  {
    unint64_t v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v5);

    id v5 = (void *)v10;
  }
  if (v7 && self->_peekState == 3 && [v4 phase] == 3 && objc_msgSend(v4, "isAnimated"))
  {
    double v11 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:16 updateMode:3];
    uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v5);

    id v5 = (void *)v12;
  }
  if ([v4 phase] == 3 || !objc_msgSend(v4, "isAnimated"))
  {
    self->_isRotating = 0;
  }
  else
  {
    uint64_t v13 = [v4 fromInterfaceOrientation];
    self->_isRotating = v13 != [v4 toInterfaceOrientation];
  }
  self->_int64_t spaceConfiguration = [v4 toSpaceConfiguration];

  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  objc_super v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  id v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  id v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v12 handleTapAppLayoutEvent:v4];
  int v6 = [v4 appLayout];
  int v7 = [v6 isEqual:self->_peekingAppLayout];

  if (v7)
  {
    uint64_t v8 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
    [v8 setPeekConfiguration:1];
    objc_msgSend(v8, "setRetainsSiri:", -[SBPeekSplitViewRoutingSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    unint64_t v9 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v8 gestureInitiated:0];
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v5);

    id v5 = (void *)v10;
  }

  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v49.receiver = self;
  v49.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  objc_super v41 = v8;
  double v11 = [(SBChainableModifier *)&v49 responseForProposedChildResponse:v8 childModifier:v9 event:v10];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = SBSafeCast(v12, v10);
  objc_super v42 = (void *)v13;
  if (v13)
  {
    long long v14 = (void *)v13;
    objc_super v15 = [v11 responseByTransformingResponseWithTransformer:&__block_literal_global_89];

    int v16 = [v14 appLayout];
    double v17 = objc_msgSend(v16, "itemForLayoutRole:", objc_msgSend(v14, "layoutRole"));
    uint64_t v18 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v18 setPeekConfiguration:1];
    id v19 = [(SBPeekSplitViewRoutingSwitcherModifier *)self _combinedResultingAppLayoutWithAppLayout:v16];
    [(SBSwitcherTransitionRequest *)v18 setAppLayout:v19];

    [(SBSwitcherTransitionRequest *)v18 setActivatingDisplayItem:v17];
    [(SBSwitcherTransitionRequest *)v18 setRetainsSiri:[(SBPeekSplitViewRoutingSwitcherModifier *)self isSystemAssistantExperiencePersistentSiriEnabled]];
    double v20 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v18 gestureInitiated:0];
    double v11 = SBAppendSwitcherModifierResponse(v20, v15);
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v39 = SBSafeCast(v21, v10);
  if (v39)
  {
    id v22 = objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", &__block_literal_global_101, v39);

    uint64_t v23 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v23 setUnlockedEnvironmentMode:3];
    [(SBSwitcherTransitionRequest *)v23 setPeekConfiguration:self->_peekConfiguration];
    uint64_t v24 = [(SBAppLayout *)self->_peekingAppLayout appLayoutByModifyingConfiguration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration)];
    [(SBSwitcherTransitionRequest *)v23 setAppLayout:v24];

    objc_super v25 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v23 gestureInitiated:0];
    double v26 = SBAppendSwitcherModifierResponse(v25, v22);

    double v27 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    double v11 = SBAppendSwitcherModifierResponse(v27, v26);
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_3;
  v44[3] = &unk_1E6AFCB28;
  v44[4] = self;
  v44[5] = &v45;
  id v28 = (id)objc_msgSend(v11, "responseByTransformingResponseWithTransformer:", v44, v39);
  if (*((unsigned char *)v46 + 24))
  {
    double v29 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v29 setUnlockedEnvironmentMode:3];
    [(SBSwitcherTransitionRequest *)v29 setPeekConfiguration:self->_peekConfiguration];
    uint64_t v30 = [(SBAppLayout *)self->_peekingAppLayout appLayoutByModifyingConfiguration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration)];
    [(SBSwitcherTransitionRequest *)v29 setAppLayout:v30];

    double v31 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v29 gestureInitiated:1];
    uint64_t v32 = SBAppendSwitcherModifierResponse(v31, v11);

    int64_t v33 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    double v11 = SBAppendSwitcherModifierResponse(v33, v32);
  }
  uint64_t v34 = objc_opt_class();
  long long v35 = SBSafeCast(v34, v10);
  double v36 = v35;
  if (v35 && [v35 gestureType] == 1 && objc_msgSend(v36, "phase") == 3)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_4;
    v43[3] = &unk_1E6AFAF20;
    v43[4] = self;
    uint64_t v37 = [v11 responseByTransformingResponseWithTransformer:v43];

    double v11 = (void *)v37;
  }

  _Block_object_dispose(&v45, 8);
  return v11;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 1)
  {

    id v2 = 0;
  }
  return v2;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 1)
  {

    id v2 = 0;
  }
  return v2;
}

id __95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 1 && *(void *)(*(void *)(a1 + 32) + 152) == 2)
  {
    id v4 = [v3 transitionRequest];
    id v5 = [v4 appLayout];
    uint64_t v6 = [v5 type];

    if (v6 == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

      id v7 = 0;
      goto LABEL_7;
    }
  }
  id v7 = v3;
LABEL_7:

  return v7;
}

SBPerformTransitionSwitcherEventResponse *__95__SBPeekSplitViewRoutingSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = SBSafeCast(v4, v3);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 transitionRequest];
    if ([v7 unlockedEnvironmentMode] == 2)
    {
      id v8 = (void *)[v7 mutableCopy];
      id v9 = v8;
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128);
    }
    else
    {
      double v11 = [v7 appLayout];

      if (v11)
      {
        uint64_t v12 = [v7 appLayout];
        if (!v12) {
          goto LABEL_10;
        }
        uint64_t v13 = (void *)v12;
        long long v14 = [v7 appLayout];
        objc_super v15 = +[SBAppLayout homeScreenAppLayout];

        if (v14 == v15) {
          goto LABEL_10;
        }
        id v9 = (void *)[v7 mutableCopy];
        int v16 = *(void **)(a1 + 32);
        double v17 = [v7 appLayout];
        uint64_t v18 = [v16 _combinedResultingAppLayoutWithAppLayout:v17];
        [v9 setAppLayout:v18];

        id v8 = v9;
        uint64_t v10 = 1;
      }
      else
      {
        id v9 = (void *)[v7 mutableCopy];
        id v19 = [*(id *)(*(void *)(a1 + 32) + 144) appLayoutByModifyingConfiguration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(*(void *)(*(void *)(a1 + 32) + 136))];
        [v9 setAppLayout:v19];

        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 128);
        id v8 = v9;
      }
    }
    [v8 setPeekConfiguration:v10];
    double v20 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v9, [v6 isGestureInitiated]);

    id v3 = v20;
LABEL_10:
  }
  return v3;
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  id v7 = a4;
  id v8 = (SBSwitcherModifier *)a5;
  id v9 = v7;
  uint64_t v10 = objc_opt_class();
  double v11 = SBSafeCast(v10, v9);
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = (void *)[v11 copy];
    long long v14 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
    if (self->_peekingModifier == v8)
    {
      uint64_t v23 = [v12 fromAppLayout];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke;
      v44[3] = &unk_1E6AF4B38;
      double v36 = &v45;
      uint64_t v37 = v14;
      id v24 = v14;
      id v45 = v24;
      objc_super v25 = [v23 appLayoutWithItemsPassingTest:v44];
      [v13 setFromAppLayout:v25];

      uint64_t v18 = [v12 toAppLayout];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_2;
      v42[3] = &unk_1E6AF4B38;
      id v19 = &v43;
      id v43 = v24;
      double v20 = v42;
    }
    else
    {
      if (self->_nonPeekingModifier != v8)
      {
LABEL_11:
        if ([v12 fromEnvironmentMode] == 3
          && ([v13 fromAppLayout],
              double v27 = objc_claimAutoreleasedReturnValue(),
              v27,
              !v27))
        {
          uint64_t v29 = 1;
        }
        else
        {
          if ([v12 fromEnvironmentMode] != 1
            || ([v13 fromAppLayout],
                id v28 = objc_claimAutoreleasedReturnValue(),
                v28,
                !v28))
          {
LABEL_21:
            if ([v12 toEnvironmentMode] == 3
              && ([v13 toAppLayout],
                  uint64_t v30 = objc_claimAutoreleasedReturnValue(),
                  v30,
                  !v30))
            {
              uint64_t v32 = 1;
            }
            else
            {
              if ([v12 toEnvironmentMode] != 1) {
                goto LABEL_28;
              }
              double v31 = [v13 toAppLayout];

              if (!v31) {
                goto LABEL_28;
              }
              uint64_t v32 = 3;
            }
            [v13 setToEnvironmentMode:v32];
LABEL_28:
            if (self->_peekingModifier == v8 && [v12 fromEnvironmentMode] == 2) {
              [v13 setFromEnvironmentMode:3];
            }
            if (self->_peekingModifier == v8 && [v12 toEnvironmentMode] == 2) {
              [v13 setToEnvironmentMode:3];
            }
            if (self->_peekingModifier == v8)
            {
              [v13 setFromWindowPickerRole:0];
              [v13 setToWindowPickerRole:0];
            }

            goto LABEL_46;
          }
          uint64_t v29 = 3;
        }
        [v13 setFromEnvironmentMode:v29];
        goto LABEL_21;
      }
      objc_super v15 = [v12 fromAppLayout];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_3;
      v40[3] = &unk_1E6AF4B38;
      double v36 = &v41;
      uint64_t v37 = v14;
      id v16 = v14;
      id v41 = v16;
      double v17 = [v15 appLayoutWithItemsPassingTest:v40];
      [v13 setFromAppLayout:v17];

      uint64_t v18 = [v12 toAppLayout];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_4;
      v38[3] = &unk_1E6AF4B38;
      id v19 = &v39;
      id v39 = v16;
      double v20 = v38;
    }
    double v26 = [v18 appLayoutWithItemsPassingTest:v20];
    [v13 setToAppLayout:v26];

    long long v14 = v37;
    goto LABEL_11;
  }
  if ([v9 type] == 17)
  {
    uint64_t v21 = [v9 appLayout];
    id v22 = v21;
    uint64_t v13 = v9;
    if (!v21) {
      goto LABEL_45;
    }
    uint64_t v13 = v9;
    if (![v21 isEqual:self->_peekingAppLayout]) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if ([v9 type] != 16)
  {
    if ([v9 type] == 2 || objc_msgSend(v9, "type") == 5 || objc_msgSend(v9, "type") == 3)
    {
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = SBSafeCast(v33, v9);
      id v22 = v34;
      uint64_t v13 = v9;
      if (!v34) {
        goto LABEL_45;
      }
      if ([v34 gestureType] != 1)
      {
        uint64_t v13 = v9;
        if ([v22 gestureType] != 2) {
          goto LABEL_45;
        }
      }
      uint64_t v13 = v9;
      if (self->_peekingModifier != v8) {
        goto LABEL_45;
      }
LABEL_44:

      uint64_t v13 = 0;
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v13 = v9;
    if ([v9 type] != 14) {
      goto LABEL_46;
    }
  }
  uint64_t v13 = v9;
  if (self->_peekingModifier == v8)
  {

    uint64_t v13 = 0;
  }
LABEL_46:

  return v13;
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

uint64_t __76__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_event_forModifier___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  peekingAppLayout = self->_peekingAppLayout;
  id v8 = (SBSwitcherModifier *)a5;
  id v9 = a4;
  uint64_t v10 = [(SBAppLayout *)peekingAppLayout itemForLayoutRole:1];
  peekingModifier = self->_peekingModifier;

  if (peekingModifier == v8)
  {
    uint64_t v12 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    uint64_t v13 = __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
  }
  else
  {
    uint64_t v12 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v13 = __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2;
  }
  v12[2] = v13;
  v12[3] = &unk_1E6AF4B60;
  id v14 = v10;
  v12[4] = v14;
  objc_super v15 = objc_msgSend(v9, "bs_filter:", v12);

  return v15;
}

uint64_t __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

uint64_t __89__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)] ^ 1;
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  peekingAppLayout = self->_peekingAppLayout;
  id v8 = (SBSwitcherModifier *)a5;
  id v9 = a4;
  uint64_t v10 = [(SBAppLayout *)peekingAppLayout continuousExposeIdentifier];
  peekingModifier = self->_peekingModifier;

  if (peekingModifier == v8)
  {
    uint64_t v12 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    uint64_t v13 = __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke;
  }
  else
  {
    uint64_t v12 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    uint64_t v13 = __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke_2;
  }
  v12[2] = v13;
  v12[3] = &unk_1E6AF4A20;
  id v14 = v10;
  v12[4] = v14;
  objc_super v15 = objc_msgSend(v9, "bs_filter:", v12);

  return v15;
}

uint64_t __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

uint64_t __106__SBPeekSplitViewRoutingSwitcherModifier_routingModifier_filteredContinuousExposeIdentifiers_forModifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2] ^ 1;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  peekingAppLayout = self->_peekingAppLayout;
  id v6 = a4;
  id v7 = [(SBAppLayout *)peekingAppLayout itemForLayoutRole:1];
  int v8 = [v6 containsItem:v7];

  id v9 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
  if (v8) {
    id v9 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
  }
  id v10 = *(id *)((char *)&self->super.super.super.isa + *v9);

  return v10;
}

- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (SBSwitcherModifier *)a4;
  if (self->_peekingModifier == v7)
  {
    v47.receiver = self;
    v47.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    [(SBPeekSplitViewRoutingSwitcherModifier *)&v47 containerViewBounds];
  }
  else
  {
    if ([(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:self->_peekingAppLayout])
    {
      int64_t peekState = self->_peekState;
      if (peekState == 2 || peekState == 1 && !self->_splitViewAppLayout)
      {
        objc_super v40 = [[SBDisplayItem alloc] initWithType:0 bundleIdentifier:@"SBPeekSplitViewRoutingSwitcherModifier-placeholder-B" uniqueIdentifier:&stru_1F3084718];
        id v41 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
        uint64_t v32 = [SBAppLayout alloc];
        uint64_t v33 = [NSNumber numberWithInteger:1];
        v50[0] = v33;
        v51[0] = v41;
        uint64_t v34 = [NSNumber numberWithInteger:2];
        v50[1] = v34;
        v51[1] = v40;
        long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
        id v19 = [(SBAppLayout *)v32 initWithItemsForLayoutRoles:v35 configuration:3 environment:[(SBAppLayout *)self->_peekingAppLayout environment] preferredDisplayOrdinal:[(SBPeekSplitViewRoutingSwitcherModifier *)self displayOrdinal]];

        v46.receiver = self;
        v46.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        [(SBPeekSplitViewRoutingSwitcherModifier *)&v46 containerViewBounds];
        v45.receiver = self;
        v45.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v19);
LABEL_20:
        double v28 = v20;
        double v29 = v21;
        double v30 = v22;
        double v31 = v23;

        goto LABEL_21;
      }
    }
    if ([(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:self->_peekingAppLayout])
    {
      int64_t v9 = self->_peekState;
      if (v9 == 3 || v9 == 1 && self->_splitViewAppLayout)
      {
        id v10 = [[SBDisplayItem alloc] initWithType:0 bundleIdentifier:@"SBPeekSplitViewRoutingSwitcherModifier-placeholder-C" uniqueIdentifier:&stru_1F3084718];
        objc_super v40 = v10;
        uint64_t v11 = 1;
        uint64_t v12 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
        id v41 = (void *)v12;
        int64_t peekConfiguration = self->_peekConfiguration;
        if (peekConfiguration == 2) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = 2;
        }
        if (peekConfiguration == 2) {
          uint64_t v11 = 2;
        }
        objc_super v15 = [SBAppLayout alloc];
        id v16 = [NSNumber numberWithInteger:v14];
        v48[0] = v16;
        v49[0] = v12;
        double v17 = [NSNumber numberWithInteger:v11];
        v48[1] = v17;
        v49[1] = v10;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
        id v19 = [(SBAppLayout *)v15 initWithItemsForLayoutRoles:v18 configuration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration) environment:[(SBAppLayout *)self->_peekingAppLayout environment] preferredDisplayOrdinal:[(SBPeekSplitViewRoutingSwitcherModifier *)self displayOrdinal]];

        v44.receiver = self;
        v44.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        [(SBPeekSplitViewRoutingSwitcherModifier *)&v44 containerViewBounds];
        v43.receiver = self;
        v43.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
        -[SBPeekSplitViewRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v43, sel_frameForLayoutRole_inAppLayout_withBounds_, v11, v19);
        goto LABEL_20;
      }
    }
    v42.receiver = self;
    v42.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    [(SBPeekSplitViewRoutingSwitcherModifier *)&v42 containerViewBounds];
  }
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
LABEL_21:

  double v36 = v28;
  double v37 = v29;
  double v38 = v30;
  double v39 = v31;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4
{
  id v6 = a3;
  id v7 = (SBSwitcherModifier *)a4;
  if (self->_peekingModifier == v7)
  {
    v33.receiver = self;
    v33.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    [(SBPeekSplitViewRoutingSwitcherModifier *)&v33 containerViewBounds];
    double v14 = v24;
    double v16 = v25;
    double v23 = v26;
    double v18 = v27;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
    unsigned int v8 = [(SBPeekSplitViewRoutingSwitcherModifier *)&v32 isRTLEnabled];
    int64_t v9 = [(SBPeekSplitViewRoutingSwitcherModifier *)self switcherSettings];
    [v9 peekInsetWidth];
    double v11 = v10;

    [(SBPeekSplitViewRoutingSwitcherModifier *)self containerViewBounds];
    double v14 = v12;
    double v16 = v15;
    double v18 = v17;
    int64_t peekConfiguration = self->_peekConfiguration;
    if (peekConfiguration == 2) {
      int v20 = v8;
    }
    else {
      int v20 = 1;
    }
    if (peekConfiguration == 3) {
      unsigned int v21 = v8;
    }
    else {
      unsigned int v21 = 0;
    }
    if (v20 != 1 || v21 != 0) {
      double v14 = v11 + v12;
    }
    double v23 = v13 - v11;
  }

  double v28 = v14;
  double v29 = v16;
  double v30 = v23;
  double v31 = v18;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  id v4 = a3;
  int64_t peekState = self->_peekState;
  if (peekState == 4
    || !peekState
    && [(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:self->_peekingAppLayout])
  {
    id v6 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
  }
  else
  {
    id v6 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  id v5 = a4;
  if ([v5 switcherLayoutElementType])
  {
    int64_t peekState = self->_peekState;
    if (peekState == 4
      || !peekState
      && [(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:self->_peekingAppLayout])
    {
      id v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
    }
    else
    {
      id v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
    }
  }
  else
  {
    int v8 = [v5 isEqual:self->_peekingAppLayout];
    id v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__nonPeekingModifier;
    if (v8) {
      id v7 = &OBJC_IVAR___SBPeekSplitViewRoutingSwitcherModifier__peekingModifier;
    }
  }
  id v9 = *(id *)((char *)&self->super.super.super.isa + *v7);

  return v9;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_nonPeekingModifier;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SBPeekSplitViewRoutingSwitcherModifier;
  id v4 = [(SBChainableModifier *)&v18 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = SBStringForPeekConfiguration(self->_peekConfiguration);
  id v6 = (id)[v4 appendObject:v5 withName:@"peekConfiguration"];

  id v7 = SBStringForSpaceConfiguration(self->_spaceConfiguration);
  id v8 = (id)[v4 appendObject:v7 withName:@"spaceConfiguration"];

  unint64_t v9 = self->_peekState - 1;
  if (v9 > 3) {
    double v10 = @"fullScreen";
  }
  else {
    double v10 = off_1E6AFCB48[v9];
  }
  id v11 = (id)[v4 appendObject:v10 withName:@"peekState"];
  id v12 = (id)[v4 appendBool:self->_uncondtionallyAllowAppLayoutContainment withName:@"uncondtionallyAllowAppLayoutContainment"];
  double v13 = [(SBChainableModifier *)self->_peekingModifier succinctDescription];
  id v14 = (id)[v4 appendObject:v13 withName:@"peekingAppLayout"];

  double v15 = [(SBAppLayout *)self->_splitViewAppLayout succinctDescription];
  id v16 = (id)[v4 appendObject:v15 withName:@"splitViewAppLayout"];

  return v4;
}

- (id)_combinedResultingAppLayoutWithAppLayout:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (self->_peekConfiguration == 2)
  {
    peekingAppLayout = self->_peekingAppLayout;
    id v5 = a3;
    id v6 = [(SBAppLayout *)peekingAppLayout allItems];
    id v7 = [v6 firstObject];

    id v8 = [(SBAppLayout *)self->_peekingAppLayout layoutAttributesForItem:v7];
    unint64_t v9 = [v5 allItems];
    double v10 = [v9 firstObject];

    id v11 = [v5 layoutAttributesForItem:v10];
  }
  else
  {
    id v12 = a3;
    double v13 = [v12 allItems];
    id v7 = [v13 firstObject];

    id v8 = [v12 layoutAttributesForItem:v7];

    id v14 = [(SBAppLayout *)self->_peekingAppLayout allItems];
    double v10 = [v14 firstObject];

    id v11 = [(SBAppLayout *)self->_peekingAppLayout layoutAttributesForItem:v10];
  }
  v23[0] = v7;
  v23[1] = v10;
  v24[0] = v8;
  v24[1] = v11;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v16 = [NSNumber numberWithInteger:1];
  v21[0] = v16;
  v22[0] = v7;
  double v17 = [NSNumber numberWithInteger:2];
  v21[1] = v17;
  v22[1] = v10;
  objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  id v19 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v18 configuration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(self->_spaceConfiguration) itemsToLayoutAttributes:v15 centerConfiguration:0 environment:1 hidden:0 preferredDisplayOrdinal:[(SBPeekSplitViewRoutingSwitcherModifier *)self displayOrdinal]];
  return v19;
}

- (void)_temporarilyAllowUnconditionaryAppLayoutContainmentWithBlock:(id)a3
{
  BOOL uncondtionallyAllowAppLayoutContainment = self->_uncondtionallyAllowAppLayoutContainment;
  self->_BOOL uncondtionallyAllowAppLayoutContainment = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL uncondtionallyAllowAppLayoutContainment = uncondtionallyAllowAppLayoutContainment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_splitViewAppLayout, 0);
  objc_storeStrong((id *)&self->_exitingTransitionTrackingModifier, 0);
  objc_storeStrong((id *)&self->_peekingAppLayout, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
  objc_storeStrong((id *)&self->_nonPeekingModifier, 0);
  objc_storeStrong((id *)&self->_peekingModifier, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end