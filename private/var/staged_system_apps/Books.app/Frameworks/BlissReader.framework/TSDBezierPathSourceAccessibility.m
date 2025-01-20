@interface TSDBezierPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDBezierPathAccessibility)_tsaxPath;
- (id)_tsaxInferredLabel;
@end

@implementation TSDBezierPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDBezierPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  v3 = [(TSDBezierPathSourceAccessibility *)self _tsaxPath];
  [(TSDPathSourceAccessibility *)self tsaxNaturalSize];

  return -[TSDBezierPathAccessibility tsaxInferredLabelForSize:](v3, "tsaxInferredLabelForSize:");
}

- (TSDBezierPathAccessibility)_tsaxPath
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDBezierPathAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDBezierPathSourceAccessibility *)self tsaxValueForKey:@"mPath"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end