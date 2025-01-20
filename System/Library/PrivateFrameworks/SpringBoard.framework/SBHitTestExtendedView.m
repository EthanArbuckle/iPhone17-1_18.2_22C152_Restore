@interface SBHitTestExtendedView
- (BOOL)hitTestsSubviewsOutsideBounds;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SBHitTestExtendedView)initWithFrame:(CGRect)a3;
- (void)setHitTestsSubviewsOutsideBounds:(BOOL)a3;
@end

@implementation SBHitTestExtendedView

- (void)setHitTestsSubviewsOutsideBounds:(BOOL)a3
{
  self->_hitTestsSubviewsOutsideBounds = a3;
}

- (SBHitTestExtendedView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHitTestExtendedView;
  result = -[SBHitTestExtendedView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_hitTestsSubviewsOutsideBounds = 1;
  }
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHitTestExtendedView;
  if (-[SBHitTestExtendedView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else if (self->_hitTestsSubviewsOutsideBounds)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(SBHitTestExtendedView *)self subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          -[SBHitTestExtendedView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if (objc_msgSend(v14, "pointInside:withEvent:", v7))
          {
            BOOL v8 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_14:
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hitTestsSubviewsOutsideBounds
{
  return self->_hitTestsSubviewsOutsideBounds;
}

@end