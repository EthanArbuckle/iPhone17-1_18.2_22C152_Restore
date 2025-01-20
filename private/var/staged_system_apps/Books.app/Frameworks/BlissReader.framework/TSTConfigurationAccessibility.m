@interface TSTConfigurationAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxSharedTableConfiguration;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIgnoreBeginEditingOnSingleTap;
- (BOOL)beginEditingOnSingleTap;
- (BOOL)tsaxSupportsContainedTextEditing;
- (void)_tsaxSetIgnoreBeginEditingOnSingleTap:(BOOL)a3;
- (void)tsaxPerformBlockDisablingIgnoringBeginEditingOnSingleTap:(id)a3;
@end

@implementation TSTConfigurationAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTConfiguration";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)tsaxSharedTableConfiguration
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(objc_msgSend(a1, "tsaxTargetClass"), "tsaxValueForKey:", @"sharedTableConfiguration"), 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxSupportsContainedTextEditing
{
  return [(TSTConfigurationAccessibility *)self tsaxBoolValueForKey:@"supportsContainedTextEditing"];
}

- (void)tsaxPerformBlockDisablingIgnoringBeginEditingOnSingleTap:(id)a3
{
  if ([(TSTConfigurationAccessibility *)self _tsaxIgnoreBeginEditingOnSingleTap])
  {
    char v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    [(TSTConfigurationAccessibility *)self _tsaxSetIgnoreBeginEditingOnSingleTap:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSTConfigurationAccessibility *)self _tsaxSetIgnoreBeginEditingOnSingleTap:0];
  }
}

- (BOOL)_tsaxIgnoreBeginEditingOnSingleTap
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738B9);
}

- (void)_tsaxSetIgnoreBeginEditingOnSingleTap:(BOOL)a3
{
}

- (BOOL)beginEditingOnSingleTap
{
  if ([(TSTConfigurationAccessibility *)self _tsaxIgnoreBeginEditingOnSingleTap]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTConfigurationAccessibility;
  return [(TSTConfigurationAccessibility *)&v4 beginEditingOnSingleTap];
}

@end