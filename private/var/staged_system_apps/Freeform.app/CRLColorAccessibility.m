@interface CRLColorAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxHueNameForValue:(double)a3;
+ (id)crlaxOpacityDescriptionStringForAlphaComponent:(double)a3;
+ (id)crlaxTargetClassName;
- (NSString)crlaxApproximateColorDescription;
- (NSString)crlaxApproximateColorDescriptionWithOpacity;
- (NSString)crlaxHueName;
- (NSString)crlaxLightnessModifier;
- (NSString)crlaxSaturationModifier;
- (NSString)crlaxStyleInfoDescription;
- (UIColor)crlaxUIColor;
- (double)crlaxHue;
- (double)crlaxLuminance;
- (double)crlaxSaturation;
- (id)_crlaxCachedApproximateColorDescription;
- (id)_crlaxColorDescriptionForAttributes:(id)a3;
- (void)_crlaxSetCachedApproximateColorDescription:(id)a3;
@end

@implementation CRLColorAccessibility

- (UIColor)crlaxUIColor
{
  v2 = [(CRLColorAccessibility *)self crlaxTarget];
  v3 = [v2 UIColor];

  return (UIColor *)v3;
}

+ (id)crlaxTargetClassName
{
  return @"CRLColor";
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

- (id)_crlaxCachedApproximateColorDescription
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9A91);
}

- (void)_crlaxSetCachedApproximateColorDescription:(id)a3
{
}

- (double)crlaxHue
{
  v2 = [(CRLColorAccessibility *)self crlaxTarget];
  [v2 hueComponent];
  double v4 = v3;

  return v4;
}

- (double)crlaxSaturation
{
  v2 = [(CRLColorAccessibility *)self crlaxTarget];
  [v2 saturationComponent];
  double v4 = v3;

  return v4;
}

- (double)crlaxLuminance
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100408C24;
  v4[3] = &unk_1014CB140;
  v4[4] = self;
  v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)crlaxApproximateColorDescription
{
  double v3 = [(CRLColorAccessibility *)self _crlaxCachedApproximateColorDescription];
  if (!v3)
  {
    [(CRLColorAccessibility *)self crlaxHue];
    double v5 = v4;
    [(CRLColorAccessibility *)self crlaxSaturation];
    double v7 = v6;
    [(CRLColorAccessibility *)self crlaxLuminance];
    double v9 = v8;
    if (v8 > 0.99000001)
    {
      v10 = +[NSBundle mainBundle];
      v11 = v10;
      CFStringRef v12 = @"White";
LABEL_6:
      double v3 = [v10 localizedStringForKey:v12 value:0 table:0];
LABEL_16:

      [(CRLColorAccessibility *)self _crlaxSetCachedApproximateColorDescription:v3];
      goto LABEL_17;
    }
    if (v8 < 0.00999999978)
    {
      v10 = +[NSBundle mainBundle];
      v11 = v10;
      CFStringRef v12 = @"Black";
      goto LABEL_6;
    }
    if (v7 >= 0.0500000007)
    {
      uint64_t v17 = [(CRLColorAccessibility *)self crlaxLightnessModifier];
      v11 = (void *)v17;
      if (v5 > 0.0560000017 && v5 < 0.111000001 && v9 < 0.430000007)
      {
        v22[0] = v17;
        v13 = [(CRLColorAccessibility *)self crlaxSaturationModifier];
        v22[1] = v13;
        v14 = +[NSBundle mainBundle];
        v18 = [v14 localizedStringForKey:@"Brown" value:0 table:0];
        v22[2] = v18;
        v19 = +[NSArray arrayWithObjects:v22 count:3];
        double v3 = [(CRLColorAccessibility *)self _crlaxColorDescriptionForAttributes:v19];

LABEL_15:
        goto LABEL_16;
      }
      v21[0] = v17;
      v13 = [(CRLColorAccessibility *)self crlaxSaturationModifier];
      v21[1] = v13;
      v14 = [(CRLColorAccessibility *)self crlaxHueName];
      v21[2] = v14;
      v15 = v21;
      uint64_t v16 = 3;
    }
    else
    {
      v11 = [(CRLColorAccessibility *)self crlaxLightnessModifier];
      v23[0] = v11;
      v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"Gray" value:0 table:0];
      v23[1] = v14;
      v15 = v23;
      uint64_t v16 = 2;
    }
    v18 = +[NSArray arrayWithObjects:v15 count:v16];
    double v3 = [(CRLColorAccessibility *)self _crlaxColorDescriptionForAttributes:v18];
    goto LABEL_15;
  }
LABEL_17:

  return (NSString *)v3;
}

- (NSString)crlaxApproximateColorDescriptionWithOpacity
{
  double v3 = [(CRLColorAccessibility *)self crlaxTarget];
  unsigned int v4 = [v3 isClear];

  if (v4)
  {
    double v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Clear" value:0 table:0];
  }
  else
  {
    double v7 = [(CRLColorAccessibility *)self crlaxTarget];
    int v8 = [v7 isOpaque];

    double v5 = [(CRLColorAccessibility *)self crlaxApproximateColorDescription];
    if (v8) {
      goto LABEL_6;
    }
    double v9 = [(CRLColorAccessibility *)self crlaxTarget];
    [v9 alphaComponent];
    v10 = +[CRLColorAccessibility crlaxOpacityDescriptionStringForAlphaComponent:](CRLColorAccessibility, "crlaxOpacityDescriptionStringForAlphaComponent:");
    uint64_t v6 = __CRLAccessibilityStringForVariables(1, v5, v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  double v5 = (void *)v6;
LABEL_6:

  return (NSString *)v5;
}

- (NSString)crlaxHueName
{
  double v3 = objc_opt_class();
  [(CRLColorAccessibility *)self crlaxHue];

  return [v3 crlaxHueNameForValue:];
}

- (NSString)crlaxLightnessModifier
{
  [(CRLColorAccessibility *)self crlaxLuminance];
  if (v2 < 0.349999994)
  {
    double v3 = +[NSBundle mainBundle];
    unsigned int v4 = v3;
    CFStringRef v5 = @"dark";
LABEL_5:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:0 table:0];

    goto LABEL_7;
  }
  if (v2 > 0.850000024)
  {
    double v3 = +[NSBundle mainBundle];
    unsigned int v4 = v3;
    CFStringRef v5 = @"light";
    goto LABEL_5;
  }
  uint64_t v6 = &stru_101538650;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)crlaxSaturationModifier
{
  [(CRLColorAccessibility *)self crlaxSaturation];
  if (v3 < 0.200000003)
  {
    unsigned int v4 = +[NSBundle mainBundle];
    CFStringRef v5 = v4;
    CFStringRef v6 = @"grayish";
LABEL_6:
    int v8 = [v4 localizedStringForKey:v6 value:0 table:0];

    goto LABEL_8;
  }
  if (v3 > 0.899999976)
  {
    [(CRLColorAccessibility *)self crlaxLuminance];
    if (v7 > 0.699999988)
    {
      unsigned int v4 = +[NSBundle mainBundle];
      CFStringRef v5 = v4;
      CFStringRef v6 = @"vibrant";
      goto LABEL_6;
    }
  }
  int v8 = &stru_101538650;
LABEL_8:

  return (NSString *)v8;
}

+ (id)crlaxHueNameForValue:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Hue value should be in range [0..1f], got %f", v6, v7, v8, v9, v10, *(uint64_t *)&a3))abort(); {
    }
      }
    uint64_t v11 = 0;
  }
  else
  {
    if (a3 >= 0.0280000009)
    {
      if (a3 >= 0.0560000017)
      {
        if (a3 >= 0.111000001)
        {
          if (a3 >= 0.128999993)
          {
            if (a3 >= 0.166999996)
            {
              if (a3 >= 0.222000003)
              {
                if (a3 >= 0.388999999)
                {
                  if (a3 >= 0.469000012)
                  {
                    if (a3 >= 0.540000021)
                    {
                      if (a3 >= 0.611000001)
                      {
                        if (a3 >= 0.666999996)
                        {
                          if (a3 >= 0.800000012)
                          {
                            if (a3 >= 0.888999999)
                            {
                              if (a3 >= 0.916999996)
                              {
                                if (a3 >= 0.958000004)
                                {
                                  uint64_t v12 = +[NSBundle mainBundle];
                                  uint64_t v13 = v12;
                                  if (a3 >= 0.986000001) {
                                    CFStringRef v14 = @"red";
                                  }
                                  else {
                                    CFStringRef v14 = @"pink red";
                                  }
                                }
                                else
                                {
                                  uint64_t v12 = +[NSBundle mainBundle];
                                  uint64_t v13 = v12;
                                  CFStringRef v14 = @"pink";
                                }
                              }
                              else
                              {
                                uint64_t v12 = +[NSBundle mainBundle];
                                uint64_t v13 = v12;
                                CFStringRef v14 = @"magenta pink";
                              }
                            }
                            else
                            {
                              uint64_t v12 = +[NSBundle mainBundle];
                              uint64_t v13 = v12;
                              CFStringRef v14 = @"magenta";
                            }
                          }
                          else
                          {
                            uint64_t v12 = +[NSBundle mainBundle];
                            uint64_t v13 = v12;
                            CFStringRef v14 = @"purple";
                          }
                        }
                        else
                        {
                          uint64_t v12 = +[NSBundle mainBundle];
                          uint64_t v13 = v12;
                          CFStringRef v14 = @"blue";
                        }
                      }
                      else
                      {
                        uint64_t v12 = +[NSBundle mainBundle];
                        uint64_t v13 = v12;
                        CFStringRef v14 = @"cyan blue";
                      }
                    }
                    else
                    {
                      uint64_t v12 = +[NSBundle mainBundle];
                      uint64_t v13 = v12;
                      CFStringRef v14 = @"cyan";
                    }
                  }
                  else
                  {
                    uint64_t v12 = +[NSBundle mainBundle];
                    uint64_t v13 = v12;
                    CFStringRef v14 = @"blue green";
                  }
                }
                else
                {
                  uint64_t v12 = +[NSBundle mainBundle];
                  uint64_t v13 = v12;
                  CFStringRef v14 = @"green";
                }
              }
              else
              {
                uint64_t v12 = +[NSBundle mainBundle];
                uint64_t v13 = v12;
                CFStringRef v14 = @"yellow green";
              }
            }
            else
            {
              uint64_t v12 = +[NSBundle mainBundle];
              uint64_t v13 = v12;
              CFStringRef v14 = @"yellow";
            }
          }
          else
          {
            uint64_t v12 = +[NSBundle mainBundle];
            uint64_t v13 = v12;
            CFStringRef v14 = @"yellow orange";
          }
        }
        else
        {
          uint64_t v12 = +[NSBundle mainBundle];
          uint64_t v13 = v12;
          CFStringRef v14 = @"orange";
        }
      }
      else
      {
        uint64_t v12 = +[NSBundle mainBundle];
        uint64_t v13 = v12;
        CFStringRef v14 = @"red orange";
      }
    }
    else
    {
      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v13 = v12;
      CFStringRef v14 = @"red";
    }
    uint64_t v11 = [v12 localizedStringForKey:v14 value:0 table:0];
  }

  return v11;
}

+ (id)crlaxOpacityDescriptionStringForAlphaComponent:(double)a3
{
  unsigned int v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"%d percent opaque" value:0 table:0];

  uint64_t v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, (int)sub_100407DFC(a3 * 100.0));

  return v6;
}

- (NSString)crlaxStyleInfoDescription
{
  [(CRLColorAccessibility *)self crlaxLuminance];
  uint64_t v4 = vcvtad_u64_f64(v3 * 100.0);
  CFStringRef v5 = [(CRLColorAccessibility *)self crlaxApproximateColorDescription];
  uint64_t v6 = CRLAccessibilityLocalizedUnsignedInteger(v4);
  uint64_t v7 = +[NSString stringWithFormat:@"%@ %@", v5, v6];

  return (NSString *)v7;
}

- (id)_crlaxColorDescriptionForAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableString string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 length])
        {
          if ([v10 length]) {
            [v4 appendFormat:@" %@", v10];
          }
        }
        else
        {
          [v4 appendString:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[NSString stringWithString:v4];

  return v11;
}

@end