@interface SBExternalHomeGestureFloatingSwitcherModifier
- (BOOL)isFloatingDockGesturePossible;
- (CGRect)containerViewBounds;
- (SBExternalHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToResignActive;
- (id)handleGestureEvent:(id)a3;
- (int64_t)currentFinalDestination;
- (void)_updateForGestureDidBeginOrChangeWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBExternalHomeGestureFloatingSwitcherModifier

- (SBExternalHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  v7 = [(SBGestureSwitcherModifier *)&v11 initWithGestureID:a3];
  v8 = v7;
  if (v7)
  {
    v7->_initialFloatingConfiguration = a4;
    v7->_interfaceOrientation = a5;
    BOOL v9 = SBFloatingConfigurationIsStashed(v7->_initialFloatingConfiguration) || v8->_initialFloatingConfiguration == 0;
    v8->_stashed = v9;
  }
  return v8;
}

- (void)didMoveToParentModifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v13, sel_didMoveToParentModifier_);
  if (a3)
  {
    int64_t initialFloatingConfiguration = self->_initialFloatingConfiguration;
    if (!SBFloatingConfigurationIsStashed(initialFloatingConfiguration))
    {
      if (SBFloatingConfigurationIsLeft(initialFloatingConfiguration)) {
        int64_t initialFloatingConfiguration = 3;
      }
      else {
        int64_t initialFloatingConfiguration = 4;
      }
    }
    [(SBExternalHomeGestureFloatingSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:self->_interfaceOrientation floatingConfiguration:initialFloatingConfiguration];
    self->_stashedContainerViewBounds.origin.x = v6;
    self->_stashedContainerViewBounds.origin.y = v7;
    self->_stashedContainerViewBounds.size.width = v8;
    self->_stashedContainerViewBounds.size.height = v9;
    int v10 = [(SBExternalHomeGestureFloatingSwitcherModifier *)self isRTLEnabled];
    uint64_t v11 = 3;
    if (v10) {
      uint64_t v11 = 4;
    }
    double v12 = 1.0;
    if (initialFloatingConfiguration == v11) {
      double v12 = -1.0;
    }
    self->_stashedContainerViewBounds.origin.x = self->_stashedContainerViewBounds.origin.x + v12;
  }
}

- (CGRect)containerViewBounds
{
  if (self->_stashed)
  {
    double x = self->_stashedContainerViewBounds.origin.x;
    double y = self->_stashedContainerViewBounds.origin.y;
    double width = self->_stashedContainerViewBounds.size.width;
    double height = self->_stashedContainerViewBounds.size.height;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
    [(SBExternalHomeGestureFloatingSwitcherModifier *)&v6 containerViewBounds];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isFloatingDockGesturePossible
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  v3 = [(SBGestureSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:3];
  return v4;
}

- (id)appLayoutsToResignActive
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_stashed)
  {
    CGFloat v8 = &unk_1F334B738;
    v2 = (void *)MEMORY[0x1E4F1CAD0];
    v3 = [(SBExternalHomeGestureFloatingSwitcherModifier *)self appLayouts];
    v4 = [v2 setWithArray:v3];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
    v5 = [(SBExternalHomeGestureFloatingSwitcherModifier *)&v7 appLayoutsToResignActive];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBExternalHomeGestureFloatingSwitcherModifier;
  objc_super v6 = [(SBGestureSwitcherModifier *)&v10 handleGestureEvent:v5];
  uint64_t v7 = [v5 phase];
  if ((unint64_t)(v7 - 1) < 2)
  {
    [(SBExternalHomeGestureFloatingSwitcherModifier *)self _updateForGestureDidBeginOrChangeWithEvent:v5];
  }
  else if (v7 == 3)
  {
    [(SBChainableModifier *)self setState:1];
  }
  else if (!v7)
  {
    CGFloat v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBExternalHomeGestureFloatingSwitcherModifier.m" lineNumber:119 description:@"Should not be getting PhasePossible"];
  }
  return v6;
}

- (void)_updateForGestureDidBeginOrChangeWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_stashed && [v4 phase] == 1 && objc_msgSend(v5, "type") != 3)
  {
    objc_super v6 = [[SBHomeGestureDockSwitcherModifier alloc] initWithDelegate:self startingEnvironmentMode:3 requireVerticalSwipeToTrackDock:1];
    dockModifier = self->_dockModifier;
    self->_dockModifier = v6;
  }
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x3010000000;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  v20 = &unk_1D90ED3C6;
  [v5 translationInContainerView];
  uint64_t v21 = v8;
  uint64_t v22 = v9;
  objc_super v10 = self->_dockModifier;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__SBExternalHomeGestureFloatingSwitcherModifier__updateForGestureDidBeginOrChangeWithEvent___block_invoke;
    v14[3] = &unk_1E6AFA6F8;
    v14[4] = self;
    id v15 = v5;
    v16 = &v17;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v10 usingBlock:v14];
  }
  if (!self->_stashed)
  {
    uint64_t v11 = self->_dockModifier;
    if (v11 && [(SBHomeGestureDockSwitcherModifier *)v11 wantsDockBehaviorAssertion])
    {
      if ([(SBHomeGestureDockSwitcherModifier *)self->_dockModifier isCurrentlyTrackingDock]) {
        goto LABEL_14;
      }
      if ([(SBExternalHomeGestureFloatingSwitcherModifier *)self isFloatingDockFullyPresented])
      {
LABEL_13:
        self->_stashed = 1;
        goto LABEL_14;
      }
    }
    double v12 = v18[5];
    [(SBExternalHomeGestureFloatingSwitcherModifier *)self floatingDockHeight];
    if (v12 < -v13) {
      goto LABEL_13;
    }
  }
LABEL_14:
  _Block_object_dispose(&v17, 8);
}

uint64_t __92__SBExternalHomeGestureFloatingSwitcherModifier__updateForGestureDidBeginOrChangeWithEvent___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 120) handleEvent:a1[5]];
  uint64_t result = objc_msgSend(*(id *)(a1[4] + 120), "adjustedTranslationForTranslation:", *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v4 = *(void *)(a1[6] + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (int64_t)currentFinalDestination
{
  return 4;
}

- (void).cxx_destruct
{
}

@end