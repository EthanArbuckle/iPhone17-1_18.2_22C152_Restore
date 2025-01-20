@interface UIView
+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3;
+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
+ (double)mt_horizontalMarginsForWidth:(double)a3;
- (BOOL)mt_areMarginsGenerous;
- (BOOL)mt_enableAutomaticRTLMirroringForSubviews;
- (BOOL)mt_isExcludedFromAutomaticRTLMirroring;
- (BOOL)mt_isRTL;
- (UIEdgeInsets)mt_layoutMargins;
- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3;
- (id)mt_shouldRTLMirrorStackDepth;
- (void)mt_RTLMirrorIfNeeded;
- (void)mt_setEnableAutomaticRTLMirroringForSubviews:(BOOL)a3;
- (void)mt_setExcludedFromAutomaticRTLMirroring:(BOOL)a3;
- (void)mt_setShouldRTLMirror;
- (void)mt_setShouldRTLMirrorStackDepth:(id)a3;
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

- (void)mt_setShouldRTLMirror
{
  if ([(UIView *)self mt_isRTL])
  {
    id v4 = [(UIView *)self mt_shouldRTLMirrorStackDepth];
    unsigned int v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v4 integerValue] + 1);
    [(UIView *)self mt_setShouldRTLMirrorStackDepth:v3];
  }
}

- (void)mt_RTLMirrorIfNeeded
{
  if ([(UIView *)self mt_isRTL])
  {
    unsigned int v3 = [(UIView *)self mt_shouldRTLMirrorStackDepth];
    uint64_t v4 = (uint64_t)[v3 integerValue];

    uint64_t v5 = v4 <= 1 ? 0 : v4 - 1;
    double v6 = +[NSNumber numberWithInteger:v5];
    [(UIView *)self mt_setShouldRTLMirrorStackDepth:v6];

    if (v4 <= 1)
    {
      [(UIView *)self bounds];
      double MaxX = CGRectGetMaxX(v28);
      id v8 = +[UIScreen mainScreen];
      [v8 scale];
      double v10 = v9;

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v11 = [(UIView *)self subviews];
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if ((objc_msgSend(v16, "mt_isExcludedFromAutomaticRTLMirroring") & 1) == 0)
            {
              [v16 frame];
              CGFloat x = v29.origin.x;
              double y = v29.origin.y;
              double width = v29.size.width;
              double height = v29.size.height;
              double v21 = MaxX - CGRectGetMinX(v29);
              v30.origin.CGFloat x = x;
              v30.origin.double y = y;
              v30.size.double width = width;
              v30.size.double height = height;
              [v16 setFrame:round(v10 * (v21 - CGRectGetWidth(v30))) / v10, y, width, height];
            }
            if (objc_msgSend(v16, "mt_enableAutomaticRTLMirroringForSubviews")) {
              [v16 mt_RTLMirrorIfNeeded];
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v22 = [(UIView *)self contentView];
        [v22 mt_RTLMirrorIfNeeded];
      }
    }
  }
}

- (void)mt_setExcludedFromAutomaticRTLMirroring:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_10060A940, v4, (void *)1);
}

- (BOOL)mt_isExcludedFromAutomaticRTLMirroring
{
  v2 = objc_getAssociatedObject(self, &unk_10060A940);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)mt_setEnableAutomaticRTLMirroringForSubviews:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_10060A941, v4, (void *)1);
}

- (BOOL)mt_enableAutomaticRTLMirroringForSubviews
{
  v2 = objc_getAssociatedObject(self, &unk_10060A941);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)mt_setShouldRTLMirrorStackDepth:(id)a3
{
}

- (id)mt_shouldRTLMirrorStackDepth
{
  return objc_getAssociatedObject(self, &unk_10060A942);
}

@end