@interface THWScrollableCanvasControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THWScrollableCanvasControllerAccessibility)thaxScrollableCanvasController;
@end

@implementation THWScrollableCanvasControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWScrollableCanvasControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THWScrollableCanvasControllerAccessibility)thaxScrollableCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWScrollableCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"scrollableCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end