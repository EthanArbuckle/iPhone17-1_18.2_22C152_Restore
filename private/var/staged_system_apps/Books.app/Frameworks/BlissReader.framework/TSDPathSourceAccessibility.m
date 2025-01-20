@interface TSDPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4;
+ (id)tsaxTargetClassName;
- (CGSize)tsaxNaturalSize;
- (NSString)_tsaxStoredLabel;
- (NSString)tsaxLabel;
- (id)_tsaxInferredLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_tsaxSetStoredLabel:(id)a3;
- (void)_tsaxUpdatePathSourceLabelForType:(int)a3;
@end

@implementation TSDPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)_tsaxStoredLabel
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_5738CA);
}

- (void)_tsaxSetStoredLabel:(id)a3
{
}

+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v6 = *(void *)&a3;
  char v14 = 0;
  v8 = objc_opt_class();
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___TSDPathSourceAccessibility;
  [super pathSourceForShapeType:v6 naturalSize:width, height];
  Class v10 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v9, 1, &v14);
  if (v14) {
    abort();
  }
  Class v11 = v10;
  [(objc_class *)v10 _tsaxUpdatePathSourceLabelForType:v6];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDPathSourceAccessibility;
  id v4 = [(TSDPathSourceAccessibility *)&v7 copyWithZone:a3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2656D0;
  v6[3] = &unk_456E38;
  v6[4] = v4;
  v6[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  return v4;
}

- (NSString)tsaxLabel
{
  v3 = [(TSDPathSourceAccessibility *)self _tsaxStoredLabel];
  if (!v3)
  {
    v3 = [(TSDPathSourceAccessibility *)self _tsaxInferredLabel];
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (!v3)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"_tsaxInferredLabel did not return an inferred label for object: %@", v5, v6, v7, v8, v9, (uint64_t)self))abort(); {
        return 0;
        }
      }
    }
  }
  return v3;
}

- (CGSize)tsaxNaturalSize
{
  [(TSDPathSourceAccessibility *)self tsaxCGSizeValueForKey:@"naturalSize"];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)_tsaxInferredLabel
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    double v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Class should override _tsaxInferredLabel: %@", v5, v6, v7, v8, v9, (uint64_t)v4))abort(); {
  }
    }
  return 0;
}

- (void)_tsaxUpdatePathSourceLabelForType:(int)a3
{
  if ((a3 - 1) > 0x12) {
    id v4 = 0;
  }
  else {
    id v4 = TSAccessibilityLocalizedString((uint64_t)off_46BD80[a3 - 1]);
  }

  [(TSDPathSourceAccessibility *)self _tsaxSetStoredLabel:v4];
}

@end