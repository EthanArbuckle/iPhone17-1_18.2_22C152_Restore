@interface TSKRulerUnitsAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxLocalizedCompatibleRulerUnitsForCanvas;
- (double)tsaxConvertPointsToRulerUnits:(double)a3;
- (int)tsaxRulerUnits;
@end

@implementation TSKRulerUnitsAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKRulerUnits";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (double)tsaxConvertPointsToRulerUnits:(double)a3
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2591E8;
  v5[3] = &unk_458E98;
  v5[4] = self;
  v5[5] = &v6;
  *(double *)&v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)tsaxLocalizedCompatibleRulerUnitsForCanvas
{
  unsigned int v2 = [(TSKRulerUnitsAccessibility *)self tsaxRulerUnits];
  if (v2 > 4) {
    return (NSString *)&stru_46D7E8;
  }
  double v3 = off_46BA20[v2];

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (int)tsaxRulerUnits
{
  return [self tsaxValueForKey:@"rulerUnits"] longLongValue];
}

@end