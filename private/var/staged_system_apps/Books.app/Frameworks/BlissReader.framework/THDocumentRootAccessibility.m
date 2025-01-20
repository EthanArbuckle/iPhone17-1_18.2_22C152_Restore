@interface THDocumentRootAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsEPUB;
- (THDocumentNavigationModelAccessibility)thaxNavigationModel;
- (THModelNodeAccessibility)thaxRootNode;
- (THTOCModelAccessibility)thaxTOCModel;
- (id)thaxContext;
@end

@implementation THDocumentRootAccessibility

+ (id)tsaxTargetClassName
{
  return @"THDocumentRoot";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THDocumentNavigationModelAccessibility)thaxNavigationModel
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THDocumentNavigationModelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentRootAccessibility *)self tsaxValueForKey:@"navigationModel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxContext
{
  return [(THDocumentRootAccessibility *)self tsaxValueForKey:@"context"];
}

- (THModelNodeAccessibility)thaxRootNode
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THModelNodeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentRootAccessibility *)self tsaxValueForKey:@"rootNode"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsEPUB
{
  return [(THDocumentRootAccessibility *)self tsaxBoolValueForKey:@"isEPUB"];
}

- (THTOCModelAccessibility)thaxTOCModel
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THTOCModelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentRootAccessibility *)self tsaxValueForKey:@"tocModel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end