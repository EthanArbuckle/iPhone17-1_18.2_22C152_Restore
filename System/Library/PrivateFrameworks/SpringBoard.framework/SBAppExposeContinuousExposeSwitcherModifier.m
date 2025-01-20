@interface SBAppExposeContinuousExposeSwitcherModifier
- (BOOL)_canShowReopenClosedWindowsButton;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (NSString)bundleIdentifier;
- (SBAppExposeContinuousExposeSwitcherModifier)initWithBundleIdentifier:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (id)_updateReopenClosedWindowsButtonPresence;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)plusButtonStyle;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
@end

@implementation SBAppExposeContinuousExposeSwitcherModifier

- (SBAppExposeContinuousExposeSwitcherModifier)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v12 init];
  if (v6)
  {
    if (!v5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v6, @"SBAppExposeContinuousExposeSwitcherModifier.m", 39, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = objc_alloc_init(SBGridSwitcherModifier);
    [(SBChainableModifier *)v6 addChildModifier:v9];
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v4 = [(SBChainableModifier *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_bundleIdentifier copy];
  v6 = (void *)v4[17];
  v4[17] = v5;

  *((_OWORD *)v4 + 6) = self->_previousContentOffset;
  *((unsigned char *)v4 + 112) = self->_isScrollingForward;
  v4[15] = self->_numberOfHiddenAppLayouts;
  *((unsigned char *)v4 + 128) = self->_isShowingReopenClosedWindowsButton;
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v20 handleTransitionEvent:v4];
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  v6 = [v4 fromAppExposeBundleID];
  if (v6)
  {
  }
  else if ([v4 phase] == 2)
  {
    uint64_t v7 = [(SBAppExposeContinuousExposeSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    objc_super v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    v10 = SBAppendSwitcherModifierResponse(v9, v8);

    v11 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v10);
LABEL_17:
    uint64_t v5 = (void *)v12;
    goto LABEL_18;
  }
  uint64_t v13 = [v4 toAppExposeBundleID];
  if (v13)
  {
    v14 = (void *)v13;
    if ([v4 phase] == 3)
    {

LABEL_16:
      v11 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v5);
      v10 = v5;
      goto LABEL_17;
    }
    char v15 = [v4 isAnimated];

    if ((v15 & 1) == 0) {
      goto LABEL_16;
    }
  }
  uint64_t v16 = [v4 fromAppExposeBundleID];
  if (!v16) {
    goto LABEL_19;
  }
  v11 = (SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *)v16;
  uint64_t v17 = [v4 toAppExposeBundleID];
  if (!v17)
  {
    uint64_t v18 = [v4 phase];

    if (v18 != 2) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  v10 = (void *)v17;
LABEL_18:

LABEL_19:
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v11 handleRemovalEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v11.receiver, v11.super_class);

  if (v6 == 2)
  {
    uint64_t v7 = [(SBAppExposeContinuousExposeSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    objc_super v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    uint64_t v5 = SBAppendSwitcherModifierResponse(v9, v8);
  }
  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleInsertionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    uint64_t v7 = [(SBAppExposeContinuousExposeSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    uint64_t v5 = (void *)v8;
  }
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleTimerEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBAppExposeContinuousExposeReopenReason"];
  if (v4)
  {
    self->_isShowingReopenClosedWindowsButton = 1;
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    uint64_t v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  uint64_t v5 = [(SBAppExposeContinuousExposeSwitcherModifier *)&v18 adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:a3 identifiersInStrip:a4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsString:", self->_bundleIdentifier, (void)v14)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17.receiver = self;
  v17.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  id v6 = [(SBAppExposeContinuousExposeSwitcherModifier *)&v17 adjustedAppLayoutsForAppLayouts:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 environment] != 3
          && [v11 containsItemWithBundleIdentifier:self->_bundleIdentifier])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  id v10 = a4;
  -[SBAppExposeContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v29, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = objc_msgSend(v10, "allItems", v29.receiver, v29.super_class);

  uint64_t v20 = [v19 count];
  if (v20 == 1)
  {
    SBRectWithSize();
    UIRectCenteredRect();
    double v12 = v21;
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
  }
  double v25 = v12;
  double v26 = v14;
  double v27 = v16;
  double v28 = v18;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = [(SBAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
  id v6 = [v5 chamoisSettings];
  [v6 switcherCornerRadius];

  [(SBAppExposeContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
  SBRectCornerRadiiForRadius();
  result.topRight = v10;
  result.bottomRight = v9;
  result.bottomLeft = v8;
  result.topLeft = v7;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
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
  return 0;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)plusButtonAlpha
{
  return 1.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  if (![(SBAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton]|| (double result = 1.0, !self->_isShowingReopenClosedWindowsButton))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
    [(SBAppExposeContinuousExposeSwitcherModifier *)&v4 reopenClosedWindowsButtonAlpha];
  }
  return result;
}

- (double)reopenClosedWindowsButtonScale
{
  if (self->_isShowingReopenClosedWindowsButton) {
    return 1.0;
  }
  v3 = [(SBAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
  objc_super v4 = [v3 animationSettings];
  [v4 reopenButtonInitialScale];
  double v6 = v5;

  return v6;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 1;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  v3 = [(SBAppExposeContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v4 = [v3 firstObject];

  if (v4)
  {
    double v5 = [(SBAppExposeContinuousExposeSwitcherModifier *)self visibleAppLayouts];
    char v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {

      objc_super v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)_canShowReopenClosedWindowsButton
{
  return self->_numberOfHiddenAppLayouts != 0;
}

- (id)_updateReopenClosedWindowsButtonPresence
{
  BOOL v3 = [(SBAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton];
  self->_numberOfHiddenAppLayouts = [(SBAppExposeContinuousExposeSwitcherModifier *)self numberOfHiddenAppLayoutsForBundleIdentifier:self->_bundleIdentifier];
  objc_super v4 = 0;
  if ([(SBAppExposeContinuousExposeSwitcherModifier *)self _canShowReopenClosedWindowsButton]&& !v3)
  {
    self->_isShowingReopenClosedWindowsButton = 0;
    double v5 = [(SBAppExposeContinuousExposeSwitcherModifier *)self switcherSettings];
    char v6 = [v5 animationSettings];
    [v6 reopenButtonFadeInDelay];
    double v8 = v7;

    objc_initWeak(&location, self);
    double v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__SBAppExposeContinuousExposeSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke;
    v11[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v12, &location);
    objc_super v4 = [(SBTimerEventSwitcherEventResponse *)v9 initWithDelay:v11 validator:@"kSBAppExposeContinuousExposeReopenReason" reason:v8];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __87__SBAppExposeContinuousExposeSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end