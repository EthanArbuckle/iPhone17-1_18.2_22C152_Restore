@interface SBShelfIconBounceTransitionModifier
- (CGRect)bounceIconInitialFrame;
- (SBShelfIconBounceTransitionModifier)initWithTransitionID:(id)a3 shelf:(id)a4;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (id)appLayoutsToResignActive;
- (id)bounceIconBundleIdentifier;
- (id)keyboardSuppressionMode;
- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3;
@end

@implementation SBShelfIconBounceTransitionModifier

- (SBShelfIconBounceTransitionModifier)initWithTransitionID:(id)a3 shelf:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBShelfIconBounceTransitionModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v11 initWithTransitionID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_shelf, a4);
  }

  return v9;
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

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  [(SBShelfIconBounceTransitionModifier *)self presentationAttributesForShelf:self->_shelf];
  uint64_t v5 = v8;
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1 && v5 == 1) {
    return a3 + 1;
  }
  else {
    return a3;
  }
}

- (id)bounceIconBundleIdentifier
{
  return [(SBSwitcherShelf *)self->_shelf bundleIdentifier];
}

- (CGRect)bounceIconInitialFrame
{
  [(SBShelfIconBounceTransitionModifier *)self presentationAttributesForShelf:self->_shelf];
  double v2 = v6;
  double v3 = v7;
  double v4 = v8;
  double v5 = v9;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end