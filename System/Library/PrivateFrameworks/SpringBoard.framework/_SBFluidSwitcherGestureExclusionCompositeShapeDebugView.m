@interface _SBFluidSwitcherGestureExclusionCompositeShapeDebugView
- (SBFluidSwitcherGestureExclusionCompositeShape)compositeShape;
- (void)drawRect:(CGRect)a3;
- (void)setCompositeShape:(id)a3;
@end

@implementation _SBFluidSwitcherGestureExclusionCompositeShapeDebugView

- (void)drawRect:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_SBFluidSwitcherGestureExclusionCompositeShapeDebugView;
  -[_SBFluidSwitcherGestureExclusionCompositeShapeDebugView drawRect:](&v15, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_compositeShape)
  {
    v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.3];
    [v4 setFill];

    CurrentContext = UIGraphicsGetCurrentContext();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = [(SBFluidSwitcherGestureExclusionCompositeShape *)self->_compositeShape rects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10) CGRectValue];
          CGContextFillRect(CurrentContext, v18);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (SBFluidSwitcherGestureExclusionCompositeShape)compositeShape
{
  return self->_compositeShape;
}

- (void)setCompositeShape:(id)a3
{
}

- (void).cxx_destruct
{
}

@end