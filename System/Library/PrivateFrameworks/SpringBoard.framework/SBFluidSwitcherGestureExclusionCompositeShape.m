@interface SBFluidSwitcherGestureExclusionCompositeShape
+ (id)exclusionCompositeShapeWithRects:(id)a3 allowHorizontalSwipes:(BOOL)a4;
- (BOOL)allowHorizontalSwipesInsideShapes;
- (BOOL)shouldBeginGestureAtStartingPoint:(CGPoint)a3 velocity:(CGPoint)a4 bounds:(CGRect)a5;
- (NSArray)rects;
- (double)topEdgeY;
- (id)debugView;
- (void)setAllowHorizontalSwipesInsideShapes:(BOOL)a3;
- (void)setRects:(id)a3;
- (void)setTopEdgeY:(double)a3;
@end

@implementation SBFluidSwitcherGestureExclusionCompositeShape

+ (id)exclusionCompositeShapeWithRects:(id)a3 allowHorizontalSwipes:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(SBFluidSwitcherGestureExclusionCompositeShape);
  [(SBFluidSwitcherGestureExclusionCompositeShape *)v6 setRects:v5];

  [(SBFluidSwitcherGestureExclusionCompositeShape *)v6 setAllowHorizontalSwipesInsideShapes:v4];
  return v6;
}

- (id)debugView
{
  v3 = objc_alloc_init(_SBFluidSwitcherGestureExclusionCompositeShapeDebugView);
  BOOL v4 = [MEMORY[0x1E4F428B8] clearColor];
  [(_SBFluidSwitcherGestureExclusionCompositeShapeDebugView *)v3 setBackgroundColor:v4];

  [(_SBFluidSwitcherGestureExclusionCompositeShapeDebugView *)v3 bs_setHitTestingDisabled:1];
  [(_SBFluidSwitcherGestureExclusionCompositeShapeDebugView *)v3 setCompositeShape:self];
  return v3;
}

- (BOOL)shouldBeginGestureAtStartingPoint:(CGPoint)a3 velocity:(CGPoint)a4 bounds:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (fabs(a4.x) > fabs(a4.y) && self->_allowHorizontalSwipesInsideShapes) {
    return 1;
  }
  if (BSFloatEqualToFloat())
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v8 = self->_rects;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) CGRectValue];
          if (v13 < self->_topEdgeY) {
            self->_topEdgeY = v13;
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }
  }
  if (y < self->_topEdgeY) {
    return 1;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = self->_rects;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "CGRectValue", (void)v25);
        CGFloat v20 = v36.origin.x;
        CGFloat v21 = v36.origin.y;
        CGFloat width = v36.size.width;
        CGFloat height = v36.size.height;
        if (x > CGRectGetMinX(v36))
        {
          v37.origin.double x = v20;
          v37.origin.double y = v21;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = height;
          if (x < CGRectGetMaxX(v37))
          {
            BOOL v14 = 0;
            goto LABEL_27;
          }
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_27:

  return v14;
}

- (NSArray)rects
{
  return self->_rects;
}

- (void)setRects:(id)a3
{
}

- (BOOL)allowHorizontalSwipesInsideShapes
{
  return self->_allowHorizontalSwipesInsideShapes;
}

- (void)setAllowHorizontalSwipesInsideShapes:(BOOL)a3
{
  self->_allowHorizontalSwipesInsideShapes = a3;
}

- (double)topEdgeY
{
  return self->_topEdgeY;
}

- (void)setTopEdgeY:(double)a3
{
  self->_topEdgeY = a3;
}

- (void).cxx_destruct
{
}

@end