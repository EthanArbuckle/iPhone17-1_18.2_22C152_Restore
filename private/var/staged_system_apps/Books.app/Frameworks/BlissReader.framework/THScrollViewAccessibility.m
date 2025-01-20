@interface THScrollViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilityShouldUpdateQuickSpeakContent;
- (BOOL)_thaxIsScrollingEnabled;
- (BOOL)_thaxShouldIgnoreScrollingEnabledChanges;
- (THScrollViewAccessibility)initWithCoder:(id)a3;
- (THScrollViewAccessibility)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (void)_axInitializeScrollingEnabledFlag;
- (void)_thaxSetScrollingEnabled:(BOOL)a3;
- (void)_thaxSetShouldIgnoreScrollingEnabledChanges:(BOOL)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)tsaxLoadAccessibilityInformation;
@end

@implementation THScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THScrollView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_thaxIsScrollingEnabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A5C);
}

- (void)_thaxSetScrollingEnabled:(BOOL)a3
{
}

- (BOOL)_thaxShouldIgnoreScrollingEnabledChanges
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A5D);
}

- (void)_thaxSetShouldIgnoreScrollingEnabledChanges:(BOOL)a3
{
}

- (void)_axInitializeScrollingEnabledFlag
{
  if ([(THScrollViewAccessibility *)self tsaxBoolValueForKey:@"isScrollingEnabled"])
  {
    [(THScrollViewAccessibility *)self _thaxSetScrollingEnabled:1];
  }
}

- (THScrollViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  v3 = -[THScrollViewAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(THScrollViewAccessibility *)v3 _axInitializeScrollingEnabledFlag];
  return v3;
}

- (THScrollViewAccessibility)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  v3 = [(THScrollViewAccessibility *)&v5 initWithCoder:a3];
  [(THScrollViewAccessibility *)v3 _axInitializeScrollingEnabledFlag];
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = [(THScrollViewAccessibility *)self _thaxShouldIgnoreScrollingEnabledChanges];
  [(THScrollViewAccessibility *)self _thaxSetShouldIgnoreScrollingEnabledChanges:1];
  v11.receiver = self;
  v11.super_class = (Class)THScrollViewAccessibility;
  id v9 = -[THScrollViewAccessibility hitTest:withEvent:](&v11, "hitTest:withEvent:", a4, x, y);
  [(THScrollViewAccessibility *)self _thaxSetShouldIgnoreScrollingEnabledChanges:v8];
  return v9;
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  -[THScrollViewAccessibility setScrollEnabled:](&v5, "setScrollEnabled:");
  if (![(THScrollViewAccessibility *)self _thaxShouldIgnoreScrollingEnabledChanges])[(THScrollViewAccessibility *)self _thaxSetScrollingEnabled:v3]; {
}
  }

- (BOOL)_accessibilityScrollingEnabled
{
  return [(THScrollViewAccessibility *)self _thaxIsScrollingEnabled];
}

- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(THScrollViewAccessibility *)self thaxDocumentViewController];
  if ([v10 tsaxValueForKey:@"canvasScrollView"] != self
    || ![v10 tsaxBoolValueForKey:@"inFlowMode"])
  {
    v51.receiver = self;
    v51.super_class = (Class)THScrollViewAccessibility;
    -[THScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v51, "_accessibilityScrollToFrame:forView:", a4, x, y, width, height);
    return;
  }
  [(THScrollViewAccessibility *)self tsaxCGRectValueForKey:@"visibleBounds"];
  double v12 = v11;
  double v14 = v13;
  CGFloat rect = v15;
  CGFloat v17 = v16;
  if (a4 != self)
  {
    if (a4)
    {
      [a4 bounds];
      [a4 convertRect:self];
    }
    else
    {
      -[THScrollViewAccessibility convertRect:fromView:](self, "convertRect:fromView:", 0, x, y, width, height);
    }
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  double v22 = v14 + -20.0;
  double v23 = v12 + 20.0;
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  double MinX = CGRectGetMinX(v53);
  v54.origin.double x = v17;
  v54.origin.double y = v23;
  v54.size.double width = rect;
  v54.size.double height = v22;
  if (MinX < CGRectGetMinX(v54)) {
    goto LABEL_34;
  }
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  double MaxY = CGRectGetMaxY(v55);
  v56.origin.double x = v17;
  v56.origin.double y = v23;
  v56.size.double height = v22;
  v56.size.double width = rect;
  if (MaxY < CGRectGetMinY(v56)) {
    goto LABEL_34;
  }
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  double MaxX = CGRectGetMaxX(v57);
  v58.origin.double x = v17;
  v58.origin.double y = v23;
  v58.size.double height = v22;
  v58.size.double width = rect;
  if (MaxX > CGRectGetMaxX(v58)) {
    goto LABEL_34;
  }
  v59.origin.double x = x;
  v59.origin.double y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  double v27 = CGRectGetMaxY(v59);
  v60.origin.double x = v17;
  v60.origin.double y = v23;
  v60.size.double height = v22;
  v60.size.double width = rect;
  if (v27 > CGRectGetMaxY(v60))
  {
LABEL_34:
    [(THScrollViewAccessibility *)self bounds];
    CGFloat v28 = v61.origin.x;
    CGFloat v29 = v61.origin.y;
    CGFloat v30 = v61.size.width;
    CGFloat v31 = v61.size.height;
    v81.origin.double x = x;
    v81.origin.double y = y;
    v81.size.double width = width;
    v81.size.double height = height;
    if (!CGRectContainsRect(v61, v81))
    {
      [(THScrollViewAccessibility *)self contentOffset];
      double v47 = v33;
      double v48 = v32;
      v62.origin.double x = x;
      v62.origin.double y = y;
      v62.size.double width = width;
      v62.size.double height = height;
      CGFloat v34 = CGRectGetMinX(v62);
      v63.size.double height = v31;
      double v35 = v34;
      v63.origin.double x = v28;
      v63.origin.double y = v29;
      v63.size.double width = v30;
      CGFloat recta = v63.size.height;
      if (v35 >= CGRectGetMaxX(v63))
      {
        v67.origin.double x = x;
        v67.origin.double y = y;
        v67.size.double width = width;
        v67.size.double height = height;
        double v38 = CGRectGetMaxX(v67);
        v68.origin.double x = v28;
        v68.origin.double y = v29;
        v68.size.double width = v30;
        v68.size.double height = recta;
        double v37 = v38 - CGRectGetWidth(v68);
      }
      else
      {
        v64.origin.double x = x;
        v64.origin.double y = y;
        v64.size.double width = width;
        v64.size.double height = height;
        double v36 = CGRectGetMinX(v64);
        v65.origin.double x = v28;
        v65.origin.double y = v29;
        v65.size.double width = v30;
        v65.size.double height = recta;
        if (v36 >= CGRectGetMinX(v65)) {
          goto LABEL_20;
        }
        v66.origin.double x = x;
        v66.origin.double y = y;
        v66.size.double width = width;
        v66.size.double height = height;
        double v37 = CGRectGetMinX(v66);
      }
      double v48 = v37;
LABEL_20:
      v69.origin.double x = x;
      v69.origin.double y = y;
      v69.size.double width = width;
      v69.size.double height = height;
      double MinY = CGRectGetMinY(v69);
      v70.origin.double x = v28;
      v70.origin.double y = v29;
      v70.size.double width = v30;
      v70.size.double height = recta;
      if (MinY < CGRectGetMinY(v70))
      {
        v71.origin.double x = x;
        v71.origin.double y = y;
        v71.size.double width = width;
        v71.size.double height = height;
        double v40 = CGRectGetMinY(v71);
        double v41 = v48;
LABEL_29:
        -[THScrollViewAccessibility setContentOffset:animated:](self, "setContentOffset:animated:", 0, v41, v40);
        [(THScrollViewAccessibility *)self tsaxValueForKey:@"_adjustContentOffsetIfNecessary"];
        return;
      }
      v72.origin.double x = x;
      v72.origin.double y = y;
      v72.size.double width = width;
      v72.size.double height = height;
      double v42 = CGRectGetMaxY(v72);
      v73.origin.double x = v28;
      v73.origin.double y = v29;
      v73.size.double width = v30;
      v73.size.double height = recta;
      if (v42 <= CGRectGetMaxY(v73))
      {
        v78.origin.double x = x;
        v78.origin.double y = y;
        v78.size.double width = width;
        v78.size.double height = height;
        double v46 = CGRectGetMinY(v78);
        v79.origin.double x = v28;
        v79.origin.double y = v29;
        v79.size.double width = v30;
        v79.size.double height = recta;
        BOOL v44 = v46 < CGRectGetMinY(v79);
        double v40 = v47;
        double v41 = v48;
        if (!v44) {
          goto LABEL_29;
        }
      }
      else
      {
        v74.origin.double x = x;
        v74.origin.double y = y;
        v74.size.double width = width;
        v74.size.double height = height;
        double v43 = CGRectGetHeight(v74);
        v75.origin.double x = v28;
        v75.origin.double y = v29;
        v75.size.double width = v30;
        v75.size.double height = recta;
        BOOL v44 = v43 < CGRectGetHeight(v75);
        double v41 = v48;
        if (v44)
        {
          v76.origin.double x = x;
          v76.origin.double y = y;
          v76.size.double width = width;
          v76.size.double height = height;
          double v45 = CGRectGetMaxY(v76);
          v77.origin.double x = v28;
          v77.origin.double y = v29;
          v77.size.double width = v30;
          v77.size.double height = recta;
          double v40 = v45 - CGRectGetHeight(v77);
          goto LABEL_29;
        }
      }
      v80.origin.double x = x;
      v80.origin.double y = y;
      v80.size.double width = width;
      v80.size.double height = height;
      double v40 = CGRectGetMinY(v80);
      goto LABEL_29;
    }
  }
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THScrollViewAccessibility;
  [(THScrollViewAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THScrollViewAccessibility *)self _axInitializeScrollingEnabledFlag];
}

@end