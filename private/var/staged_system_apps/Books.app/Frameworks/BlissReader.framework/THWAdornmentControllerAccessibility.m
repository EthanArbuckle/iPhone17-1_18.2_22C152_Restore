@interface THWAdornmentControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxAlwaysShowPanels;
- (BOOL)thaxIsShowingAlternateUI;
- (THTSDRepAccessibility)thaxExpandedRep;
- (THWAdornmentCloseButtonAccessibility)thaxCloseButton;
- (THWAdornmentPanelAccessibility)thaxBottomPanel;
- (THWAdornmentPanelAccessibility)thaxControlPanel;
- (THWAdornmentPanelAccessibility)thaxTopPanel;
- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdornmentsVisible:(BOOL)a3;
- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8;
- (void)thaxHide;
- (void)thaxSetAlwaysShowPanels:(BOOL)a3;
- (void)thaxSetInsetsNeedUpdate;
- (void)thaxSetShowingAlternateUI:(BOOL)a3;
- (void)thaxShow;
@end

@implementation THWAdornmentControllerAccessibility

- (THWAdornmentCloseButtonAccessibility)thaxCloseButton
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWAdornmentCloseButtonAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAdornmentControllerAccessibility *)self tsaxValueForKey:@"closeButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THWAdornmentPanelAccessibility)thaxTopPanel
{
  char v7 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAdornmentControllerAccessibility *)self tsaxValueForKey:@"topPanel"], 1, &v7);
  if (v7) {
    abort();
  }
  char v5 = (THWAdornmentPanelAccessibility *)v4;
  [objc_class thaxCanvasView thaxSetUsesChildrenFramesForSorting:1];
  return v5;
}

- (THWAdornmentPanelAccessibility)thaxBottomPanel
{
  char v7 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAdornmentControllerAccessibility *)self tsaxValueForKey:@"bottomPanel"], 1, &v7);
  if (v7) {
    abort();
  }
  char v5 = (THWAdornmentPanelAccessibility *)v4;
  [v4 thaxCanvasView].thaxSetUsesChildrenFramesForSorting:1;
  return v5;
}

- (THWAdornmentPanelAccessibility)thaxControlPanel
{
  char v7 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAdornmentControllerAccessibility *)self tsaxValueForKey:@"controlPanel"], 1, &v7);
  if (v7) {
    abort();
  }
  char v5 = (THWAdornmentPanelAccessibility *)v4;
  [objc_class thaxCanvasView thaxSetUsesChildrenFramesForSorting:1];
  return v5;
}

+ (id)tsaxTargetClassName
{
  return @"THWAdornmentController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxAlwaysShowPanels
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A5A);
}

- (void)thaxSetAlwaysShowPanels:(BOOL)a3
{
}

- (BOOL)thaxIsShowingAlternateUI
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A5B);
}

- (void)thaxSetShowingAlternateUI:(BOOL)a3
{
}

- (void)thaxShow
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_287784;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)thaxHide
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_287838;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentControllerAccessibility;
  [(THWAdornmentControllerAccessibility *)&v6 p_updateAdornmentVisibilityAnimated:a3 forced:a4 completionBlock:a5];
  [(THWAdornmentControllerAccessibility *)self thaxSetInsetsNeedUpdate];
}

- (void)setAdornmentsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THWAdornmentControllerAccessibility *)self thaxAlwaysShowPanels])
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:](&v6, "setAdornmentsVisible:", 1, v5.receiver, v5.super_class, self, THWAdornmentControllerAccessibility);
  }
  else if (![(THWAdornmentControllerAccessibility *)self thaxIsShowingAlternateUI])
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:](&v5, "setAdornmentsVisible:", v3, self, THWAdornmentControllerAccessibility, v6.receiver, v6.super_class);
  }
}

- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  if ([(THWAdornmentControllerAccessibility *)self thaxAlwaysShowPanels])
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](&v16, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", 1, 1, v11, v10, 0, a8, v15.receiver, v15.super_class, self, THWAdornmentControllerAccessibility);
  }
  else if (![(THWAdornmentControllerAccessibility *)self thaxIsShowingAlternateUI])
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](&v15, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", v13, v12, v11, v10, v9, a8, self, THWAdornmentControllerAccessibility, v16.receiver, v16.super_class);
  }
}

- (THTSDRepAccessibility)thaxExpandedRep
{
  char v5 = 0;
  BOOL v3 = objc_opt_class();
  result = (THTSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAdornmentControllerAccessibility *)self tsaxValueForKey:@"expandedRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)thaxSetInsetsNeedUpdate
{
  v2 = [(THWAdornmentControllerAccessibility *)self thaxExpandedRep];
  +[TSAccessibilitySafeCategory tsaxTargetClass];
  if (objc_opt_isKindOfClass())
  {
    char v5 = 0;
    BOOL v3 = objc_opt_class();
    Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
    if (v5) {
      abort();
    }
    [(objc_class *)v4 thaxSetInsetsNeedUpdate];
  }
}

@end