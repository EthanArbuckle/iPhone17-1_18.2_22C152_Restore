@interface SBRotationSwitcherModifier
- (BOOL)requireStripContentsInViewHierarchy;
- (BOOL)shouldNotUseAnchorPointToPinLayoutRolesToSpace;
- (BOOL)shouldPerformRotationAnimationForOrientationChange;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (SBAppLayout)appLayout;
- (SBRotationSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toInterfaceOrientation:(int64_t)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToResignActive;
- (id)keyboardSuppressionMode;
- (id)transitionWillBegin;
- (int64_t)fromInterfaceOrientation;
- (int64_t)toInterfaceOrientation;
- (void)setShouldNotUseAnchorPointToPinLayoutRolesToSpace:(BOOL)a3;
@end

@implementation SBRotationSwitcherModifier

- (SBRotationSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 fromInterfaceOrientation:(int64_t)a5 toInterfaceOrientation:(int64_t)a6
{
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBRotationSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  if (v13)
  {
    if (!v12)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"SBRotationSwitcherModifier.m", 24, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v13->_fromInterfaceOrientation = a5;
    v13->_toInterfaceOrientation = a6;
  }

  return v13;
}

- (id)transitionWillBegin
{
  v7.receiver = self;
  v7.super_class = (Class)SBRotationSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillBegin];
  if ([(SBRotationSwitcherModifier *)self appLayoutRequiresLegacyRotationSupport:self->_appLayout])
  {
    v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:1];
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    v3 = (void *)v5;
  }
  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRotationSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:1];
  return v4;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRotationSwitcherModifier;
    [(SBRotationSwitcherModifier *)&v6 rotationAngleForIndex:a3];
  }
  return result;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 1;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  if (self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRotationSwitcherModifier;
  return [(SBRotationSwitcherModifier *)&v4 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)fromInterfaceOrientation
{
  return self->_fromInterfaceOrientation;
}

- (int64_t)toInterfaceOrientation
{
  return self->_toInterfaceOrientation;
}

- (BOOL)shouldNotUseAnchorPointToPinLayoutRolesToSpace
{
  return self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace;
}

- (void)setShouldNotUseAnchorPointToPinLayoutRolesToSpace:(BOOL)a3
{
  self->_shouldNotUseAnchorPointToPinLayoutRolesToSpace = a3;
}

- (void).cxx_destruct
{
}

@end