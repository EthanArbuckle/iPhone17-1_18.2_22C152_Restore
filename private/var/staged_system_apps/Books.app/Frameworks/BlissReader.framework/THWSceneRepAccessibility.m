@interface THWSceneRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsExpanded;
- (THWSceneControllerAccessibility)thaxSceneController;
- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController;
- (id)thaxExpandedRepController;
- (void)p_setupSceneControllerIfNecessary:(BOOL)a3;
- (void)replaceContentsFromRep:(id)a3;
- (void)thaxRemoveInsets;
- (void)thaxSetInsetsNeedUpdate;
- (void)thaxUpdateInsets;
@end

@implementation THWSceneRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWSceneRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THWSceneControllerAccessibility)thaxSceneController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWSceneControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"_sceneController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxExpandedRepController
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"expandedRepController"];
}

- (BOOL)thaxIsExpanded
{
  return [(THWSceneRepAccessibility *)self tsaxBoolValueForKey:@"isExpanded"];
}

- (void)thaxSetInsetsNeedUpdate
{
  if ([(THWSceneRepAccessibility *)self tsaxRespondsToSelector:"thaxUpdateInsets" fromExtrasProtocol:&OBJC_PROTOCOL___THWSceneRepAccessibilityExtras])
  {
    [(THWSceneRepAccessibility *)self thaxUpdateInsets];
  }
}

- (void)p_setupSceneControllerIfNecessary:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWSceneRepAccessibility;
  [(THWSceneRepAccessibility *)&v4 p_setupSceneControllerIfNecessary:a3];
  [(THWSceneRepAccessibility *)self thaxSetInsetsNeedUpdate];
}

- (void)replaceContentsFromRep:(id)a3
{
  if (![(THWSceneRepAccessibility *)self thaxIsExpanded]
    && [(THWSceneRepAccessibility *)self tsaxRespondsToSelector:"thaxRemoveInsets" fromExtrasProtocol:&OBJC_PROTOCOL___THWSceneRepAccessibilityExtras])
  {
    [a3 thaxRemoveInsets];
  }
  v5.receiver = self;
  v5.super_class = (Class)THWSceneRepAccessibility;
  [(THWSceneRepAccessibility *)&v5 replaceContentsFromRep:a3];
}

- (void)thaxUpdateInsets
{
  v3 = [(THWSceneControllerAccessibility *)[(THWSceneRepAccessibility *)self thaxSceneController] thaxSceneView];
  objc_super v4 = [(THWSceneRepAccessibility *)self thaxExpandedViewController];
  id v5 = [(THWAdornmentPanelAccessibility *)[(THWAdornmentControllerAccessibility *)[(THWiOSExpandedViewControllerAccessibility *)v4 thaxAdornmentController] thaxTopPanel] thaxView];
  id v6 = [(THWAdornmentPanelAccessibility *)[(THWAdornmentControllerAccessibility *)[(THWiOSExpandedViewControllerAccessibility *)v4 thaxAdornmentController] thaxBottomPanel] thaxView];
  double Height = 0.0;
  [(THWSceneViewAccessibility *)v3 thaxSetAccessibilityFrameLeftInset:0.0];
  [(THWSceneViewAccessibility *)v3 thaxSetAccessibilityFrameRightInset:0.0];
  if ([(THWiOSExpandedViewControllerAccessibility *)v4 thaxExpandedRepControllerState] == 2)
  {
    [v5 frame];
    [(THWSceneViewAccessibility *)v3 thaxSetAccessibilityFrameTopInset:CGRectGetHeight(v9)];
    [v6 frame];
    double Height = CGRectGetHeight(v10);
  }
  else
  {
    [(THWSceneViewAccessibility *)v3 thaxSetAccessibilityFrameTopInset:0.0];
  }

  [(THWSceneViewAccessibility *)v3 thaxSetAccessibilityFrameBottomInset:Height];
}

- (void)thaxRemoveInsets
{
  v2 = [(THWSceneControllerAccessibility *)[(THWSceneRepAccessibility *)self thaxSceneController] thaxSceneView];
  [(THWSceneViewAccessibility *)v2 thaxSetAccessibilityFrameLeftInset:0.0];
  [(THWSceneViewAccessibility *)v2 thaxSetAccessibilityFrameRightInset:0.0];
  [(THWSceneViewAccessibility *)v2 thaxSetAccessibilityFrameTopInset:0.0];

  [(THWSceneViewAccessibility *)v2 thaxSetAccessibilityFrameBottomInset:0.0];
}

- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWiOSExpandedViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWSceneRepAccessibility *)self thaxExpandedRepController], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end