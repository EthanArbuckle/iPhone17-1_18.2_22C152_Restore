@interface THWSceneControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THWSceneViewAccessibility)thaxSceneView;
@end

@implementation THWSceneControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWSceneController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THWSceneViewAccessibility)thaxSceneView
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWSceneViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWSceneControllerAccessibility *)self tsaxValueForKey:@"sceneView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end