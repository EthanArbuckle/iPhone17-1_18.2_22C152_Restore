@interface THWScrollableCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3;
- (id)thaxDelegate;
- (id)thaxScrollView;
@end

@implementation THWScrollableCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWScrollableCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxScrollView
{
  return [(THWScrollableCanvasControllerAccessibility *)self tsaxValueForKey:@"scrollView"];
}

- (id)thaxDelegate
{
  return [(THWScrollableCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

@end