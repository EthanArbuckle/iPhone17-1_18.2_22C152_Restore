@interface CRLRulerUnitsAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (double)crlaxConvertPoints:(double)a3 toMeasurementUnits:(unint64_t)a4;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3;
+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3 value:(double)a4;
+ (id)crlaxTargetClassName;
+ (unint64_t)crlaxMeasurementUnitsForCurrentLocale;
- (NSString)crlaxLocalizedCompatibleRulerUnitsForCanvas;
- (double)crlaxConvertPointsToRulerUnits:(double)a3;
- (unint64_t)crlaxRulerUnits;
@end

@implementation CRLRulerUnitsAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLRulerUnits";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

+ (unint64_t)crlaxMeasurementUnitsForCurrentLocale
{
  v2 = +[NSLocale currentLocale];
  id v3 = [v2 objectForKey:NSLocaleUsesMetricSystem];
  unsigned int v4 = [v3 BOOLValue];

  return v4;
}

+ (double)crlaxConvertPoints:(double)a3 toMeasurementUnits:(unint64_t)a4
{
  if (a4 == 1)
  {
    v5 = &qword_101175308;
    goto LABEL_5;
  }
  if (!a4)
  {
    v5 = &qword_101175300;
LABEL_5:
    double v6 = *(double *)v5;
    return a3 / v6;
  }
  double v6 = 1.0;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Measurement units must be CRLRulerUnitTypeCentimeters or CRLRulerUnitTypeInches.", v9, v10, v11, v12, v13, v14))abort(); {
  }
    }
  return a3 / v6;
}

+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v3 = +[NSBundle mainBundle];
      unsigned int v4 = v3;
      CFStringRef v5 = @"inches";
      goto LABEL_7;
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      unsigned int v4 = v3;
      CFStringRef v5 = @"centimeters";
      goto LABEL_7;
    case 2uLL:
      id v3 = +[NSBundle mainBundle];
      unsigned int v4 = v3;
      CFStringRef v5 = @"points";
      goto LABEL_7;
    case 3uLL:
      id v3 = +[NSBundle mainBundle];
      unsigned int v4 = v3;
      CFStringRef v5 = @"picas";
      goto LABEL_7;
    case 4uLL:
      id v3 = +[NSBundle mainBundle];
      unsigned int v4 = v3;
      CFStringRef v5 = @"pixels";
LABEL_7:
      double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      break;
    default:
      if (CRLAccessibilityShouldPerformValidationChecks())
      {
        int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unknown CRLRulerUnitType", v9, v10, v11, v12, v13, v14))abort(); {
      }
        }
      double v6 = 0;
      break;
  }

  return v6;
}

+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3 value:(double)a4
{
  if (a3 >= 5)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unknown CRLRulerUnitType", v8, v9, v10, v11, v12, v14))abort(); {
    }
      }
    CFStringRef v5 = 0;
  }
  else
  {
    CFStringRef v5 = CRLAccessibilityStringsDictKey(*(&off_1014DDF40 + a3));
    if (v5)
    {
      double v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, *(void *)&a4);
      goto LABEL_8;
    }
  }
  double v6 = 0;
LABEL_8:

  return v6;
}

- (double)crlaxConvertPointsToRulerUnits:(double)a3
{
  unsigned int v4 = [(CRLRulerUnitsAccessibility *)self crlaxTarget];
  [v4 convertPointsToRulerUnits:a3];
  double v6 = v5;

  return v6;
}

- (NSString)crlaxLocalizedCompatibleRulerUnitsForCanvas
{
  id v3 = objc_opt_class();
  unint64_t v4 = [(CRLRulerUnitsAccessibility *)self crlaxRulerUnits];

  return (NSString *)_[v3 crlaxLocalizedDescriptionForUnits:v4];
}

- (unint64_t)crlaxRulerUnits
{
  v2 = [(CRLRulerUnitsAccessibility *)self crlaxTarget];
  id v3 = [v2 rulerUnits];

  return (unint64_t)v3;
}

@end