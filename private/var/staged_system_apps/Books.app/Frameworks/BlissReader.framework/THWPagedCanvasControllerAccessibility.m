@interface THWPagedCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3;
- (THTSDCanvasViewAccessibility)thaxCanvasView;
- (THTSDInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController;
- (id)_thaxScrollView;
- (id)thaxDelegate;
- (id)thaxScrollView;
- (void)interactiveCanvasControllerDidStopScrolling:(id)a3;
- (void)teardownView;
- (void)thaxInitializeAccessibility;
- (void)thaxTeardownAccessibility;
@end

@implementation THWPagedCanvasControllerAccessibility

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWPagedCanvasControllerAccessibility;
  [(THWPagedCanvasControllerAccessibility *)&v5 interactiveCanvasControllerDidStopScrolling:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2964EC;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 1.0);
}

- (void)thaxInitializeAccessibility
{
  if (objc_msgSend(-[THWPagedCanvasControllerAccessibility thaxDelegate](self, "thaxDelegate"), "conformsToProtocol:", &OBJC_PROTOCOL___THUIScrollViewAccessibilityDelegate))
  {
    id v3 = [(THWPagedCanvasControllerAccessibility *)self thaxDelegate];
    id v4 = [(THWPagedCanvasControllerAccessibility *)self _thaxScrollView];
    [v4 thaxSetScrollingDelegate:v3];
  }
}

- (void)thaxTeardownAccessibility
{
  id v2 = [(THWPagedCanvasControllerAccessibility *)self _thaxScrollView];

  [v2 thaxSetScrollingDelegate:0];
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

- (id)_thaxScrollView
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWPagedCanvasControllerAccessibility *)self thaxScrollView], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"THWPagedCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxScrollView
{
  return [(THWPagedCanvasControllerAccessibility *)self tsaxValueForKey:@"scrollView"];
}

- (id)thaxDelegate
{
  return [(THWPagedCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

- (THTSDCanvasViewAccessibility)thaxCanvasView
{
  id v2 = [(THWPagedCanvasControllerAccessibility *)self thaxInteractiveCanvasController];

  return [(THTSDInteractiveCanvasControllerAccessibility *)v2 thaxCanvasView];
}

- (THTSDInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWPagedCanvasControllerAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWPagedCanvasControllerAccessibility;
  BOOL v5 = -[THWPagedCanvasControllerAccessibility createViewIfNeededWithFrame:viewScale:](&v7, "createViewIfNeededWithFrame:viewScale:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  if ([(THWPagedCanvasControllerAccessibility *)self tsaxRespondsToSelector:"thaxInitializeAccessibility" fromExtrasProtocol:&OBJC_PROTOCOL___THWPagedCanvasControllerAccessibilityExtras])[(THWPagedCanvasControllerAccessibility *)self thaxInitializeAccessibility]; {
  return v5;
  }
}

- (void)teardownView
{
  if ([(THWPagedCanvasControllerAccessibility *)self tsaxRespondsToSelector:"thaxTeardownAccessibility" fromExtrasProtocol:&OBJC_PROTOCOL___THWPagedCanvasControllerAccessibilityExtras])[(THWPagedCanvasControllerAccessibility *)self thaxTeardownAccessibility]; {
  v3.receiver = self;
  }
  v3.super_class = (Class)THWPagedCanvasControllerAccessibility;
  [(THWPagedCanvasControllerAccessibility *)&v3 teardownView];
}

@end