@interface THWZoomableCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxDelegate;
@end

@implementation THWZoomableCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWZoomableCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxDelegate
{
  return [(THWZoomableCanvasControllerAccessibility *)self tsaxValueForKey:@"delegate"];
}

@end