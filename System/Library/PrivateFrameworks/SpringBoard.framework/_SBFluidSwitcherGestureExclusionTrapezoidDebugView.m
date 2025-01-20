@interface _SBFluidSwitcherGestureExclusionTrapezoidDebugView
- (SBFluidSwitcherGestureExclusionTrapezoid)exclusionTrapezoid;
- (void)drawRect:(CGRect)a3;
- (void)setExclusionTrapezoid:(id)a3;
@end

@implementation _SBFluidSwitcherGestureExclusionTrapezoidDebugView

- (void)drawRect:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_SBFluidSwitcherGestureExclusionTrapezoidDebugView;
  -[_SBFluidSwitcherGestureExclusionTrapezoidDebugView drawRect:](&v21, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_exclusionTrapezoid)
  {
    [(_SBFluidSwitcherGestureExclusionTrapezoidDebugView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    [(SBFluidSwitcherGestureExclusionTrapezoid *)self->_exclusionTrapezoid baseHeight];
    double v9 = v8;
    [(SBFluidSwitcherGestureExclusionTrapezoid *)self->_exclusionTrapezoid trapezoidHeight];
    double v11 = v10;
    [(SBFluidSwitcherGestureExclusionTrapezoid *)self->_exclusionTrapezoid adjacentBaseXDistanceFromEdge];
    double v13 = v12;
    [(SBFluidSwitcherGestureExclusionTrapezoid *)self->_exclusionTrapezoid opposingBaseXDistanceFromEdge];
    double v15 = v14;
    v16 = [MEMORY[0x1E4F427D0] bezierPath];
    double v17 = v7 - v9;
    objc_msgSend(v16, "moveToPoint:", v13, v17);
    double v18 = v17 - v11;
    objc_msgSend(v16, "addLineToPoint:", v15, v18);
    objc_msgSend(v16, "addLineToPoint:", v5 - v15, v18);
    objc_msgSend(v16, "addLineToPoint:", v5 - v13, v17);
    [v16 closePath];
    v19 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v13, v17, v5 + v13 * -2.0, v9);
    [v16 appendPath:v19];

    v20 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.3];
    [v20 setFill];

    [v16 fill];
  }
}

- (SBFluidSwitcherGestureExclusionTrapezoid)exclusionTrapezoid
{
  return self->_exclusionTrapezoid;
}

- (void)setExclusionTrapezoid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end