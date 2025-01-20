@interface LargeDayInputBlockingView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)passthroughViews;
- (id)description;
- (void)setPassthroughViews:(id)a3;
@end

@implementation LargeDayInputBlockingView

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v17.receiver = self;
  v17.super_class = (Class)LargeDayInputBlockingView;
  v4 = [(LargeDayInputBlockingView *)&v17 description];
  [v3 appendFormat:@"%@", v4];

  v5 = [(LargeDayInputBlockingView *)self passthroughViews];
  id v6 = [v5 count];
  [v3 appendFormat:@"\n\tPassthrough views:"];
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v3 appendFormat:@"\n\t[%@]", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [v3 appendFormat:@"\n\tNone"];
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(LargeDayInputBlockingView *)self passthroughViews];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 bounds];
        -[LargeDayInputBlockingView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v20.CGFloat x = x;
        v20.CGFloat y = y;
        if (CGRectContainsPoint(v21, v20))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end