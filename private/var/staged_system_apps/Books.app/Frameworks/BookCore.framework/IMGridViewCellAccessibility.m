@interface IMGridViewCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)accessibilityScrollToVisible;
@end

@implementation IMGridViewCellAccessibility

+ (id)imaxTargetClassName
{
  return @"IMGridViewCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityScrollToVisible
{
  id v51 = [(IMGridViewCellAccessibility *)self imaxValueForKey:@"gridView"];
  NSClassFromString(@"IMGridView");
  if ((objc_opt_isKindOfClass() & 1) == 0 && IMAccessibilityShouldPerformValidationChecks())
  {
    v3 = +[NSString stringWithFormat:@"AX: expected superview of %@ to be IMGridView. was: %@", self, v51];
    id v4 = +[NSException exceptionWithName:@"AX Error" reason:v3 userInfo:0];
  }
  [(IMGridViewCellAccessibility *)self frame];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  [v51 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat rect = v19;
  double v20 = v12 * 0.5;
  if (v8 < v12) {
    double v20 = 10.0;
  }
  double v45 = v20;
  v21 = [v51 window];
  v22 = [v21 windowScene];
  v23 = [v22 statusBarManager];

  [v51 contentInset];
  double v44 = v24;
  [v23 statusBarHeight];
  double v43 = v25;
  [v51 contentOffset];
  double v49 = v26;
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  double MinY = CGRectGetMinY(v53);
  CGFloat v27 = v6;
  v54.origin.x = v6;
  CGFloat v47 = v8;
  v54.origin.y = v8;
  v54.size.width = v10;
  v54.size.height = v12;
  double MaxX = CGRectGetMaxX(v54);
  CGFloat v29 = v14;
  v55.origin.x = v14;
  CGFloat v30 = v16;
  v55.origin.y = v16;
  CGFloat v31 = v18;
  v55.size.width = v18;
  v55.size.height = rect;
  CGFloat v32 = rect;
  if (MaxX >= CGRectGetMaxX(v55))
  {
    v59.origin.x = v27;
    CGFloat v34 = v47;
    v59.origin.y = v47;
    v59.size.width = v10;
    v59.size.height = v12;
    double v50 = CGRectGetMaxX(v59);
    v60.origin.x = v29;
    v60.origin.y = v30;
    v60.size.width = v31;
    v60.size.height = rect;
    double v49 = v50 - CGRectGetWidth(v60) + 10.0;
  }
  else
  {
    v56.origin.x = v27;
    v56.origin.y = v47;
    v56.size.width = v10;
    v56.size.height = v12;
    double MinX = CGRectGetMinX(v56);
    v57.origin.x = v29;
    v57.origin.y = v30;
    v57.size.width = v31;
    v57.size.height = rect;
    if (MinX >= CGRectGetMinX(v57))
    {
      CGFloat v34 = v47;
    }
    else
    {
      v58.origin.x = v27;
      CGFloat v34 = v47;
      v58.origin.y = v47;
      v58.size.width = v10;
      v58.size.height = v12;
      double v49 = CGRectGetMinX(v58) + -10.0;
    }
    CGFloat v32 = rect;
  }
  CGFloat v46 = v10;
  v61.origin.x = v27;
  v61.origin.y = v34;
  v61.size.width = v10;
  v61.size.height = v12;
  CGFloat v35 = v34;
  double MaxY = CGRectGetMaxY(v61);
  v62.origin.x = v29;
  v62.origin.y = v30;
  v62.size.width = v31;
  v62.size.height = v32;
  if (MaxY >= CGRectGetMaxY(v62))
  {
    v66.origin.x = v27;
    v66.origin.y = v35;
    v66.size.width = v46;
    v66.size.height = v12;
    double v40 = CGRectGetMaxY(v66);
    v67.origin.x = v29;
    v67.origin.y = v30;
    v67.size.width = v31;
    v67.size.height = v32;
    double v38 = v40 - CGRectGetHeight(v67);
    double v39 = 10.0;
    goto LABEL_16;
  }
  v63.origin.x = v27;
  v63.origin.y = v35;
  v63.size.width = v46;
  v63.size.height = v12;
  double v37 = CGRectGetMinY(v63);
  v64.origin.x = v29;
  v64.origin.y = v30;
  v64.size.width = v31;
  v64.size.height = v32;
  if (v37 < CGRectGetMinY(v64))
  {
    v65.origin.x = v27;
    v65.origin.y = v35;
    v65.size.width = v46;
    v65.size.height = v12;
    double v38 = CGRectGetMinY(v65);
    double v39 = -10.0;
LABEL_16:
    double v41 = v38 + v39;
    goto LABEL_18;
  }
  double v41 = MinY - v45 - (v44 + v43);
LABEL_18:
  [v51 setContentOffset:0 animated:v49];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)IMGridViewCellAccessibility;
  unint64_t v3 = [(IMGridViewCellAccessibility *)&v8 accessibilityTraits];
  id v4 = [(IMGridViewCellAccessibility *)self imaxValueForKey:@"isSelected"];
  unsigned int v5 = [v4 BOOLValue];

  UIAccessibilityTraits v6 = UIAccessibilityTraitSelected;
  if (!v5) {
    UIAccessibilityTraits v6 = 0;
  }
  return v6 | v3;
}

@end