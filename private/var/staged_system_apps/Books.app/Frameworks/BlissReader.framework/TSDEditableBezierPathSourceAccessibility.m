@interface TSDEditableBezierPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxBezierPath;
- (id)_tsaxInferredLabel;
@end

@implementation TSDEditableBezierPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDEditableBezierPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  id v3 = [(TSDEditableBezierPathSourceAccessibility *)self _tsaxBezierPath];
  [(TSDPathSourceAccessibility *)self tsaxNaturalSize];

  return [v3 tsaxInferredLabelForSize:];
}

- (id)_tsaxBezierPath
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDEditableBezierPathSourceAccessibility *)self tsaxValueForKey:@"bezierPath"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end