@interface TSUColorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxHueNameForValue:(double)a3;
+ (id)tsaxTargetClassName;
- (NSString)tsaxApproximateColorDescription;
- (NSString)tsaxHueName;
- (NSString)tsaxLightnessModifier;
- (NSString)tsaxSaturationModifier;
- (NSString)tsaxStyleInfoDescription;
- (double)tsaxHue;
- (double)tsaxLuminance;
- (double)tsaxSaturation;
- (id)_tsaxCachedApproximateColorDescription;
- (id)_tsaxColorDescriptionForAttributes:(id)a3;
- (id)tsaxUIColor;
- (void)_tsaxSetCachedApproximateColorDescription:(id)a3;
@end

@implementation TSUColorAccessibility

- (id)tsaxUIColor
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSUColorAccessibility *)self tsaxValueForKey:@"UIColor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"TSUColor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxCachedApproximateColorDescription
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5739DB);
}

- (void)_tsaxSetCachedApproximateColorDescription:(id)a3
{
}

- (double)tsaxHue
{
  [(TSUColorAccessibility *)self tsaxCGFloatValueForKey:@"hueComponent"];
  return result;
}

- (double)tsaxSaturation
{
  [(TSUColorAccessibility *)self tsaxCGFloatValueForKey:@"saturationComponent"];
  return result;
}

- (double)tsaxLuminance
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26D004;
  v4[3] = &unk_4577A0;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)tsaxApproximateColorDescription
{
  v3 = [(TSUColorAccessibility *)self _tsaxCachedApproximateColorDescription];
  if (!v3)
  {
    [(TSUColorAccessibility *)self tsaxHue];
    double v5 = v4;
    [(TSUColorAccessibility *)self tsaxSaturation];
    double v7 = v6;
    [(TSUColorAccessibility *)self tsaxLuminance];
    double v9 = v8;
    if (v8 <= 0.99000001)
    {
      if (v8 >= 0.00999999978)
      {
        if (v7 >= 0.0500000007)
        {
          v14 = [(TSUColorAccessibility *)self tsaxLightnessModifier];
          if (v5 <= 0.0560000017 || v5 >= 0.111000001 || v9 >= 0.430000007)
          {
            v16[0] = v14;
            v16[1] = [(TSUColorAccessibility *)self tsaxSaturationModifier];
            v16[2] = [(TSUColorAccessibility *)self tsaxHueName];
            v12 = v16;
          }
          else
          {
            v17[0] = v14;
            v17[1] = [(TSUColorAccessibility *)self tsaxSaturationModifier];
            v17[2] = TSAccessibilityLocalizedString(@"color.brown");
            v12 = v17;
          }
          uint64_t v13 = 3;
        }
        else
        {
          v18[0] = [(TSUColorAccessibility *)self tsaxLightnessModifier];
          v18[1] = TSAccessibilityLocalizedString(@"color.gray");
          v12 = v18;
          uint64_t v13 = 2;
        }
        v11 = [(TSUColorAccessibility *)self _tsaxColorDescriptionForAttributes:+[NSArray arrayWithObjects:v12 count:v13]];
        goto LABEL_16;
      }
      CFStringRef v10 = @"color.black";
    }
    else
    {
      CFStringRef v10 = @"color.white";
    }
    v11 = TSAccessibilityLocalizedString((uint64_t)v10);
LABEL_16:
    v3 = v11;
    [(TSUColorAccessibility *)self _tsaxSetCachedApproximateColorDescription:v11];
  }
  return v3;
}

- (NSString)tsaxHueName
{
  v3 = objc_opt_class();
  [(TSUColorAccessibility *)self tsaxHue];

  return [v3 tsaxHueNameForValue:];
}

- (NSString)tsaxLightnessModifier
{
  [(TSUColorAccessibility *)self tsaxLuminance];
  if (v2 >= 0.349999994)
  {
    if (v2 <= 0.850000024) {
      return (NSString *)&stru_46D7E8;
    }
    CFStringRef v3 = @"color.lightness.high";
  }
  else
  {
    CFStringRef v3 = @"color.lightness.low";
  }

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (NSString)tsaxSaturationModifier
{
  [(TSUColorAccessibility *)self tsaxSaturation];
  if (v3 >= 0.200000003)
  {
    if (v3 <= 0.899999976) {
      return (NSString *)&stru_46D7E8;
    }
    [(TSUColorAccessibility *)self tsaxLuminance];
    if (v5 <= 0.699999988) {
      return (NSString *)&stru_46D7E8;
    }
    CFStringRef v4 = @"color.saturation.high";
  }
  else
  {
    CFStringRef v4 = @"color.saturation.low";
  }

  return TSAccessibilityLocalizedString((uint64_t)v4);
}

+ (id)tsaxHueNameForValue:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Hue value should be in range [0..1f], got %f", v6, v7, v8, v9, v10, *(uint64_t *)&a3))abort(); {
    }
      }
    return 0;
  }
  else
  {
    CFStringRef v12 = @"color.hue.red";
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
                                  if (a3 < 0.986000001) {
                                    CFStringRef v12 = @"color.hue.pink.red";
                                  }
                                }
                                else
                                {
                                  CFStringRef v12 = @"color.hue.pink";
                                }
                              }
                              else
                              {
                                CFStringRef v12 = @"color.hue.magenta.pink";
                              }
                            }
                            else
                            {
                              CFStringRef v12 = @"color.hue.magenta";
                            }
                          }
                          else
                          {
                            CFStringRef v12 = @"color.hue.blue.magenta";
                          }
                        }
                        else
                        {
                          CFStringRef v12 = @"color.hue.blue";
                        }
                      }
                      else
                      {
                        CFStringRef v12 = @"color.hue.cyan.blue";
                      }
                    }
                    else
                    {
                      CFStringRef v12 = @"color.hue.cyan";
                    }
                  }
                  else
                  {
                    CFStringRef v12 = @"color.hue.green.cyan";
                  }
                }
                else
                {
                  CFStringRef v12 = @"color.hue.green";
                }
              }
              else
              {
                CFStringRef v12 = @"color.hue.yellow.green";
              }
            }
            else
            {
              CFStringRef v12 = @"color.hue.yellow";
            }
          }
          else
          {
            CFStringRef v12 = @"color.hue.orange.yellow";
          }
        }
        else
        {
          CFStringRef v12 = @"color.hue.orange";
        }
      }
      else
      {
        CFStringRef v12 = @"color.hue.red.orange";
      }
    }
    return TSAccessibilityLocalizedString((uint64_t)v12);
  }
}

- (NSString)tsaxStyleInfoDescription
{
  [(TSUColorAccessibility *)self tsaxLuminance];
  return +[NSString stringWithFormat:@"%@ %@", [(TSUColorAccessibility *)self tsaxApproximateColorDescription], TSAccessibilityLocalizedUnsignedInteger(vcvtad_u64_f64(v3 * 100.0))];
}

- (id)_tsaxColorDescriptionForAttributes:(id)a3
{
  id v4 = +[NSMutableString string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v4 length])
        {
          if ([v9 length]) {
            [v4 appendFormat:@" %@", v9];
          }
        }
        else
        {
          [v4 appendString:v9];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return +[NSString stringWithString:v4];
}

@end