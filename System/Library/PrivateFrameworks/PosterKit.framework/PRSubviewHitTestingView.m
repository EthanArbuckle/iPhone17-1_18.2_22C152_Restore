@interface PRSubviewHitTestingView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PRSubviewHitTestingView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(PRSubviewHitTestingView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[PRSubviewHitTestingView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {

          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)PRSubviewHitTestingView;
  BOOL v14 = -[PRSubviewHitTestingView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
LABEL_11:

  return v14;
}

@end