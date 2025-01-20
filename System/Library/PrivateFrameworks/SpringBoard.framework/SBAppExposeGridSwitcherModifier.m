@interface SBAppExposeGridSwitcherModifier
- (BOOL)_canShowReopenClosedWindowsButton;
- (BOOL)disableFullScreenCardScaleRounding;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)reversesFloatingCardDirection;
- (CGSize)floatingCardSize;
- (CGSize)fullScreenCardSize;
- (NSString)bundleIdentifier;
- (SBAppExposeGridSwitcherModifier)initWithBundleIdentifier:(id)a3 fullScreenCardSize:(CGSize)a4 floatingCardSize:(CGSize)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (id)_updateReopenClosedWindowsButtonPresence;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)plusButtonStyle;
- (void)didMoveToParentModifier:(id)a3;
- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3;
- (void)setReversesFloatingCardDirection:(BOOL)a3;
@end

@implementation SBAppExposeGridSwitcherModifier

- (SBAppExposeGridSwitcherModifier)initWithBundleIdentifier:(id)a3 fullScreenCardSize:(CGSize)a4 floatingCardSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v7 = a4.height;
  CGFloat v8 = a4.width;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v11->_fullScreenCardSize.CGFloat width = v8;
    v11->_fullScreenCardSize.CGFloat height = v7;
    v11->_floatingCardSize.CGFloat width = width;
    v11->_floatingCardSize.CGFloat height = height;
    v11->_reversesFloatingCardDirection = 1;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_mixedGridModifier)
    {
      v5 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width, self->_floatingCardSize.height);
      mixedGridModifier = self->_mixedGridModifier;
      self->_mixedGridModifier = v5;

      [(SBMixedGridSwitcherModifier *)self->_mixedGridModifier setMaximumNumberOfFullScreenCardsForSingleRow:2];
      [(SBMixedGridSwitcherModifier *)self->_mixedGridModifier setLowDensityGridLayoutAlignment:1];
      [(SBMixedGridSwitcherModifier *)self->_mixedGridModifier setReversesFloatingCardDirection:self->_reversesFloatingCardDirection];
      [(SBChainableModifier *)self addChildModifier:self->_mixedGridModifier];
    }
  }
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
  self->_reversesFloatingCardDirection = a3;
  -[SBMixedGridSwitcherModifier setReversesFloatingCardDirection:](self->_mixedGridModifier, "setReversesFloatingCardDirection:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v4 = [(SBChainableModifier *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_bundleIdentifier copy];
  v6 = (void *)*((void *)v4 + 18);
  *((void *)v4 + 18) = v5;

  *(CGSize *)(v4 + 152) = self->_fullScreenCardSize;
  *(CGSize *)(v4 + 168) = self->_floatingCardSize;
  v4[137] = self->_reversesFloatingCardDirection;
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAppExposeGridSwitcherModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v11 handleTransitionEvent:v4];
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  uint64_t v6 = [v4 fromAppExposeBundleID];
  if (v6)
  {
    objc_super v7 = (SBInvalidateReopenButtonTextSwitcherEventResponse *)v6;
  }
  else
  {
    if ([v4 phase] != 2) {
      goto LABEL_9;
    }
    objc_super v8 = [(SBAppExposeGridSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

    objc_super v7 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v9];
  }
LABEL_9:

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBAppExposeGridSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v11 handleRemovalEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v11.receiver, v11.super_class);

  if (v6 == 2)
  {
    objc_super v7 = [(SBAppExposeGridSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    objc_super v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v8];
  }
  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeGridSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleInsertionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    objc_super v7 = [(SBAppExposeGridSwitcherModifier *)self _updateReopenClosedWindowsButtonPresence];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    uint64_t v5 = (void *)v8;
  }
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeGridSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleTimerEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBAppExposeModifierShowReopenButtonReason"];
  if (v4)
  {
    self->_isShowingReopenClosedWindowsButton = 1;
    objc_super v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    uint64_t v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(SBMixedGridSwitcherModifier *)self->_mixedGridModifier adjustedAppLayoutsForAppLayouts:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        if ([v11 containsItemWithBundleIdentifier:self->_bundleIdentifier]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
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
  if (![(SBAppExposeGridSwitcherModifier *)self _canShowReopenClosedWindowsButton]
    || (double result = 1.0, !self->_isShowingReopenClosedWindowsButton))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBAppExposeGridSwitcherModifier;
    [(SBAppExposeGridSwitcherModifier *)&v4 reopenClosedWindowsButtonAlpha];
  }
  return result;
}

- (double)reopenClosedWindowsButtonScale
{
  if (self->_isShowingReopenClosedWindowsButton) {
    return 1.0;
  }
  v3 = [(SBAppExposeGridSwitcherModifier *)self switcherSettings];
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
  v3 = [(SBAppExposeGridSwitcherModifier *)self appLayouts];
  if ([(SBMixedGridSwitcherModifier *)self->_mixedGridModifier numberOfFloatingAppLayouts])
  {
    unint64_t v4 = [(SBMixedGridSwitcherModifier *)self->_mixedGridModifier indexOfFirstMainAppLayoutFromAppLayouts:v3];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      [v3 lastObject];
    }
    else {
    uint64_t v5 = [v3 objectAtIndex:v4 - 1];
    }
  }
  else
  {
    uint64_t v5 = [v3 firstObject];
  }
  double v6 = (void *)v5;
  if (v5
    && -[SBMixedGridSwitcherModifier isIndexVisible:](self->_mixedGridModifier, "isIndexVisible:", [v3 indexOfObject:v5]))
  {

    double v6 = 0;
  }

  return v6;
}

- (BOOL)_canShowReopenClosedWindowsButton
{
  return self->_numberOfHiddenAppLayouts != 0;
}

- (id)_updateReopenClosedWindowsButtonPresence
{
  BOOL v3 = [(SBAppExposeGridSwitcherModifier *)self _canShowReopenClosedWindowsButton];
  self->_numberOfHiddenAppLayouts = [(SBAppExposeGridSwitcherModifier *)self numberOfHiddenAppLayoutsForBundleIdentifier:self->_bundleIdentifier];
  unint64_t v4 = 0;
  if ([(SBAppExposeGridSwitcherModifier *)self _canShowReopenClosedWindowsButton]
    && !v3)
  {
    self->_isShowingReopenClosedWindowsButton = 0;
    uint64_t v5 = [(SBAppExposeGridSwitcherModifier *)self switcherSettings];
    double v6 = [v5 animationSettings];
    [v6 reopenButtonFadeInDelay];
    double v8 = v7;

    objc_initWeak(&location, self);
    uint64_t v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__SBAppExposeGridSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke;
    v11[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v12, &location);
    unint64_t v4 = [(SBTimerEventSwitcherEventResponse *)v9 initWithDelay:v11 validator:@"kSBAppExposeModifierShowReopenButtonReason" reason:v8];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __75__SBAppExposeGridSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke(uint64_t a1)
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

- (CGSize)fullScreenCardSize
{
  double width = self->_fullScreenCardSize.width;
  double height = self->_fullScreenCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)floatingCardSize
{
  double width = self->_floatingCardSize.width;
  double height = self->_floatingCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)reversesFloatingCardDirection
{
  return self->_reversesFloatingCardDirection;
}

- (BOOL)disableFullScreenCardScaleRounding
{
  return self->_disableFullScreenCardScaleRounding;
}

- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3
{
  self->_disableFullScreenCardScaleRounding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
}

@end