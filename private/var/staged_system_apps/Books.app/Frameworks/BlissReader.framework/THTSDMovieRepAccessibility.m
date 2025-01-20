@interface THTSDMovieRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
@end

@implementation THTSDMovieRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMovieRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THTSDMovieRepAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSDMovieRepAccessibility"];
}

@end