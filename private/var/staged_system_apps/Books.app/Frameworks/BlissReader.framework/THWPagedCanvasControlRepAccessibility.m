@interface THWPagedCanvasControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THWPagedCanvasControllerAccessibility)thaxPagedCanvasController;
@end

@implementation THWPagedCanvasControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWPagedCanvasControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THWPagedCanvasControllerAccessibility)thaxPagedCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"pagedCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end