@interface _TUIContainerContentView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _TUIContainerContentView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(_TUIContainerContentView *)self subviews];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[_TUIContainerContentView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        v14 = [v13 hitTest:v7];

        if (v14)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

@end