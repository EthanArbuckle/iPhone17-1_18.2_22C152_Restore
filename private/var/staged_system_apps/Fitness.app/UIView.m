@interface UIView
- (double)centerXForElementAt:(int64_t)a3 width:(double)a4 percent:(double)a5;
- (double)scaledValueForSmallWidth:(double)a3 bigWidth:(double)a4;
- (double)valueForSmallWidth:(double)a3 mediumWidth:(double)a4 largeWidth:(double)a5;
- (void)ch_transformViewsForRightToLeftLanguages:(id)a3;
@end

@implementation UIView

- (double)scaledValueForSmallWidth:(double)a3 bigWidth:(double)a4
{
  v4 = +[UIScreen mainScreen];
  [v4 bounds];

  UIRoundToViewScale();
  return result;
}

- (double)valueForSmallWidth:(double)a3 mediumWidth:(double)a4 largeWidth:(double)a5
{
  v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v10 = v9;

  if (v10 <= 375.0) {
    double result = a4;
  }
  else {
    double result = a5;
  }
  if (v10 <= 320.0) {
    return a3;
  }
  return result;
}

- (double)centerXForElementAt:(int64_t)a3 width:(double)a4 percent:(double)a5
{
  [(UIView *)self bounds];
  if (a5 > 0.01)
  {
    [(UIView *)self scaledValueForSmallWidth:3.5 + 78.0 bigWidth:19.0 + 88.0];
    [(UIView *)self scaledValueForSmallWidth:30.0 bigWidth:40.0];
  }

  UIRoundToViewScale();
  return result;
}

- (void)ch_transformViewsForRightToLeftLanguages:(id)a3
{
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v8 frame];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        v17 = [v8 superview];
        [v17 bounds];
        double Width = CGRectGetWidth(v25);
        v26.origin.x = v10;
        v26.origin.y = v12;
        v26.size.width = v14;
        v26.size.height = v16;
        double v19 = Width - CGRectGetWidth(v26) - v10;

        [v8 setFrame:v19, v12, v14, v16];
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

@end