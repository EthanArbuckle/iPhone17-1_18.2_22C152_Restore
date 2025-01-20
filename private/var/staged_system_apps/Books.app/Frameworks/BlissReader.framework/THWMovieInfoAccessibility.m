@interface THWMovieInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxMediaLabel;
@end

@implementation THWMovieInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWMovieInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxMediaLabel
{
  v3 = [(TSDDrawableInfoAccessibility *)self tsaxUserProvidedDescription];
  if (![(NSString *)v3 length])
  {
    char v7 = 0;
    v4 = (objc_class *)objc_opt_class();
    v5 = (NSString *)__TSAccessibilityCastAsClass(v4, (uint64_t)[(THWMovieInfoAccessibility *)self tsaxValueForKey:@"mediaDisplayName"], 1, &v7);
    if (v7) {
      abort();
    }
    return v5;
  }
  return v3;
}

@end