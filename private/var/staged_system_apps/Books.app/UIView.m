@interface UIView
+ (void)animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (BOOL)bk_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)bkaxAccessibilityShowContextMenuAtPoint:(CGPoint)a3;
- (CGRect)untransformedFrame;
- (void)addAnimatablePropertyWithKey:(id)a3;
- (void)setUntransformedFrame:(CGRect)a3;
@end

@implementation UIView

- (BOOL)bkaxAccessibilityShowContextMenuAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  if (!v5) {
    return 0;
  }
  v6 = v5;
  BOOL v7 = 0;
  do
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [v6 interactions];
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
          if (v13)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              if (objc_opt_respondsToSelector())
              {
                [v14 _presentMenuAtLocation:x, y];

                BOOL v7 = 1;
                goto LABEL_16;
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    uint64_t v15 = [v6 superview];

    v6 = (void *)v15;
  }
  while (v15);
  return v7;
}

- (void)addAnimatablePropertyWithKey:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    if (qword_100B4A4E8 != -1) {
      dispatch_once(&qword_100B4A4E8, &stru_100A488C0);
    }
    v4 = objc_getAssociatedObject(self, &off_100A488E0);
    if (([v4 containsObject:v6] & 1) == 0)
    {
      if (v4)
      {
        uint64_t v5 = [v4 setByAddingObject:v6];

        v4 = (void *)v5;
      }
      else
      {
        v4 = +[NSSet setWithObject:v6];
      }
      objc_setAssociatedObject(self, &off_100A488E0, v4, (void *)0x301);
    }
  }
}

- (BOOL)bk_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_getAssociatedObject(self, &off_100A488E0);
  if ([(UIView *)self bk_shouldAnimatePropertyWithKey:v4]) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v5 containsObject:v4];
  }

  return v6;
}

+ (void)animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v15 = a7;
  id v13 = a8;
  if (a5)
  {
    id v14 = a5;
    a5 = objc_alloc_init(BKCustomAnimationCurveFactory);
    [a5 setTimingFunction:v14];

    a6 |= 0x60000uLL;
  }
  +[UIView _animateWithDuration:a6 delay:a5 options:v15 factory:v13 animations:a3 completion:a4];
}

- (CGRect)untransformedFrame
{
  v2 = self;
  double v3 = sub_1004CC714();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)setUntransformedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  sub_1004CC8DC(x, y, width, height);
}

@end