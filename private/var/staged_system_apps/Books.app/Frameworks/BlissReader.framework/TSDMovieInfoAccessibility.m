@interface TSDMovieInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxMovieLabel;
- (TSPDataAccessibility)_tsaxMovieData;
- (id)tsaxTypeDescription;
@end

@implementation TSDMovieInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMovieInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxMovieLabel
{
  v2 = [(TSDMovieInfoAccessibility *)self _tsaxMovieData];

  return [(TSPDataAccessibility *)v2 tsaxLabel];
}

- (id)tsaxTypeDescription
{
  return TSAccessibilityLocalizedString(@"movie");
}

- (TSPDataAccessibility)_tsaxMovieData
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSPDataAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDMovieInfoAccessibility *)self tsaxValueForKey:@"mMovieData"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end