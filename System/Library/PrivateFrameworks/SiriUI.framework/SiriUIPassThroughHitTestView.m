@interface SiriUIPassThroughHitTestView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SiriUIPassThroughHitTestView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v8 = [(SiriUIPassThroughHitTestView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        double v15 = v14;
        double v17 = v16;
        [v13 bounds];
        v28.double x = v15;
        v28.double y = v17;
        if (CGRectContainsPoint(v29, v28))
        {
          v18 = objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17);

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)SiriUIPassThroughHitTestView;
  v18 = -[SiriUIPassThroughHitTestView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
LABEL_11:

  return v18;
}

@end