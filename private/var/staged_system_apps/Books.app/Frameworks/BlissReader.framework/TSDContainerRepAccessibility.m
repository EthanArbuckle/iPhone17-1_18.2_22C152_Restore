@interface TSDContainerRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxChildReps;
@end

@implementation TSDContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDContainerRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)tsaxChildReps
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"childReps"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end