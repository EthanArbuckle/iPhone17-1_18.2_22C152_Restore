@interface UIView
+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3;
+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
+ (double)mt_horizontalMarginsForWidth:(double)a3;
- (BOOL)mt_areMarginsGenerous;
- (BOOL)mt_isRTL;
- (UIEdgeInsets)mt_layoutMargins;
- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3;
@end

@implementation UIView

- (UIEdgeInsets)mt_layoutMargins
{
  [(UIView *)self bounds];

  [(UIView *)self mt_layoutMarginsForWidth:v3];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  [(UIView *)self layoutMargins];
  double v5 = v4;
  double v7 = v6;
  [objc_opt_class() mt_horizontalMarginsForWidth:a3];
  double v9 = v8;
  double v10 = v5;
  double v11 = v7;
  double v12 = v9;
  result.right = v12;
  result.bottom = v11;
  result.left = v9;
  result.top = v10;
  return result;
}

- (BOOL)mt_areMarginsGenerous
{
  double v3 = objc_opt_class();
  [(UIView *)self bounds];

  return [v3 mt_areMarginsGenerousForWidth:v4];
}

+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3
{
  return a3 > 385.0;
}

+ (double)mt_horizontalMarginsForWidth:(double)a3
{
  unsigned int v3 = [a1 mt_areMarginsGenerousForWidth:a3];
  double result = 16.0;
  if (v3) {
    return 20.0;
  }
  return result;
}

+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  unsigned int v3 = [a1 mt_areMarginsGenerousForWidth:a3];
  double v4 = 20.0;
  if (!v3) {
    double v4 = 16.0;
  }
  double v5 = 8.0;
  double v6 = 8.0;
  double v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (BOOL)mt_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(UIView *)self semanticContentAttribute]] == (id)1;
}

- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3
{
  double v4 = (unsigned int (**)(id, UIView *))a3;
  if (v4[2](v4, self))
  {
    double v5 = self;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v6 = [(UIView *)self subviews];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) mt_recursivelyFindFirstViewMeetingCriteria:v4];
          if (v11)
          {
            double v5 = (UIView *)v11;

            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    double v5 = 0;
  }
LABEL_13:

  return v5;
}

@end