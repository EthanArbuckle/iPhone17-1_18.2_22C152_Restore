@interface SBExitSlideOverPeekSwitcherModifier
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBExitSlideOverPeekSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5;
@end

@implementation SBExitSlideOverPeekSwitcherModifier

- (SBExitSlideOverPeekSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBExitSlideOverPeekSwitcherModifier.m", 25, @"Invalid parameter not satisfying: %@", @"floatingAppLayout" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBExitSlideOverPeekSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v15 initWithTransitionID:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_floatingAppLayout, a4);
    v12->_floatingConfiguration = a5;
  }

  return v12;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBExitSlideOverPeekSwitcherModifier;
  -[SBExitSlideOverPeekSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBExitSlideOverPeekSwitcherModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];

  if ([v14 isEqual:self->_floatingAppLayout]
    && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2)
  {
    [(SBExitSlideOverPeekSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBExitSlideOverPeekSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:self->_floatingConfiguration];
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
  }

  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void).cxx_destruct
{
}

@end