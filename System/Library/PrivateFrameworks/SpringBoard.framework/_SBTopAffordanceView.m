@interface _SBTopAffordanceView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _SBTopAffordanceView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SBTopAffordanceView;
  if (-[_SBTopAffordanceView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(_SBTopAffordanceView *)self subviews];
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
          -[_SBTopAffordanceView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if (objc_msgSend(v14, "pointInside:withEvent:", v7))
          {
            BOOL v8 = 1;
            goto LABEL_13;
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
LABEL_13:
  }
  return v8;
}

@end