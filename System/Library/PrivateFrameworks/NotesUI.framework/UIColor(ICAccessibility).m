@interface UIColor(ICAccessibility)
+ (id)icaxHueNameForValue:()ICAccessibility;
- (__CFString)icaxLightnessModifier;
- (__CFString)icaxSaturationModifier;
- (double)icaxHue;
- (double)icaxLuma;
- (double)icaxSaturation;
- (id)_icaxColorDescriptionForHue:()ICAccessibility saturation:lightness:;
- (id)icaxApproximateColorDescription;
- (id)icaxDescriptionWithLuma;
- (uint64_t)icaxHueName;
@end

@implementation UIColor(ICAccessibility)

- (double)icaxHue
{
  double v2 = 0.0;
  [a1 getHue:&v2 saturation:0 brightness:0 alpha:0];
  return v2;
}

- (double)icaxSaturation
{
  double v2 = 0.0;
  [a1 getHue:0 saturation:&v2 brightness:0 alpha:0];
  return v2;
}

- (double)icaxLuma
{
  double v5 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v2 = 0.0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  double result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (id)icaxApproximateColorDescription
{
  double v2 = [a1 _icaxCachedApproximateColorDescription];
  if (!v2)
  {
    double v15 = 0.0;
    double v16 = 0.0;
    objc_msgSend(a1, "icaxLuma", 0, 0);
    double v4 = v3;
    [a1 getHue:&v16 saturation:&v15 brightness:&v14 alpha:&v13];
    if (v4 <= 0.99000001)
    {
      if (v4 >= 0.00999999978)
      {
        if (v15 >= 0.0500000007)
        {
          double v9 = v16;
          if (v16 <= 0.0560000017 || v16 >= 0.111000001 || (double v9 = 0.430000007, v4 >= 0.430000007))
          {
            uint64_t v10 = objc_msgSend(a1, "icaxHueName", v9);
          }
          else
          {
            uint64_t v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"brown" value:@"brown" table:0 allowSiri:1];
          }
          v7 = (void *)v10;
          v8 = [a1 icaxSaturationModifier];
          v11 = [a1 icaxLightnessModifier];
          double v2 = [a1 _icaxColorDescriptionForHue:v7 saturation:v8 lightness:v11];
        }
        else
        {
          v7 = objc_msgSend(MEMORY[0x1E4F83770], "localizedFrameworkStringForKey:value:table:allowSiri:", @"gray", @"gray", 0, 1, v15);
          v8 = [a1 icaxLightnessModifier];
          double v2 = [a1 _icaxColorDescriptionForHue:v7 saturation:0 lightness:v8];
        }

        goto LABEL_16;
      }
      double v5 = (void *)MEMORY[0x1E4F83770];
      v6 = @"black";
    }
    else
    {
      double v5 = (void *)MEMORY[0x1E4F83770];
      v6 = @"white";
    }
    double v2 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
LABEL_16:
    [a1 _icaxSetCachedApproximateColorDescription:v2];
  }
  return v2;
}

- (uint64_t)icaxHueName
{
  double v2 = objc_opt_class();
  [a1 icaxHue];
  return objc_msgSend(v2, "icaxHueNameForValue:");
}

- (__CFString)icaxLightnessModifier
{
  [a1 icaxLuma];
  if (v1 < 0.349999994)
  {
    double v2 = (void *)MEMORY[0x1E4F83770];
    double v3 = @"dark";
LABEL_5:
    double v4 = [v2 localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
    goto LABEL_7;
  }
  if (v1 > 0.850000024)
  {
    double v2 = (void *)MEMORY[0x1E4F83770];
    double v3 = @"light";
    goto LABEL_5;
  }
  double v4 = &stru_1F0973378;
LABEL_7:
  return v4;
}

- (__CFString)icaxSaturationModifier
{
  [a1 icaxSaturation];
  if (v2 < 0.200000003)
  {
    double v3 = (void *)MEMORY[0x1E4F83770];
    double v4 = @"grayish";
LABEL_6:
    v6 = [v3 localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
    goto LABEL_8;
  }
  if (v2 > 0.899999976)
  {
    [a1 icaxLuma];
    if (v5 > 0.699999988)
    {
      double v3 = (void *)MEMORY[0x1E4F83770];
      double v4 = @"vibrant";
      goto LABEL_6;
    }
  }
  v6 = &stru_1F0973378;
LABEL_8:
  return v6;
}

+ (id)icaxHueNameForValue:()ICAccessibility
{
  if (a1 >= 0.0 && a1 <= 1.0)
  {
    if (a1 < 0.0280000009)
    {
      v6 = (void *)MEMORY[0x1E4F83770];
LABEL_11:
      v7 = @"red";
      goto LABEL_42;
    }
    if (a1 >= 0.0560000017)
    {
      if (a1 >= 0.111000001)
      {
        if (a1 >= 0.128999993)
        {
          if (a1 >= 0.166999996)
          {
            if (a1 >= 0.222000003)
            {
              if (a1 >= 0.388999999)
              {
                if (a1 >= 0.469000012)
                {
                  if (a1 >= 0.540000021)
                  {
                    if (a1 >= 0.611000001)
                    {
                      if (a1 >= 0.666999996)
                      {
                        if (a1 >= 0.800000012)
                        {
                          if (a1 >= 0.888999999)
                          {
                            if (a1 >= 0.916999996)
                            {
                              if (a1 >= 0.958000004)
                              {
                                v6 = (void *)MEMORY[0x1E4F83770];
                                if (a1 >= 0.986000001) {
                                  goto LABEL_11;
                                }
                                v7 = @"pink red";
                              }
                              else
                              {
                                v6 = (void *)MEMORY[0x1E4F83770];
                                v7 = @"pink";
                              }
                            }
                            else
                            {
                              v6 = (void *)MEMORY[0x1E4F83770];
                              v7 = @"magenta pink";
                            }
                          }
                          else
                          {
                            v6 = (void *)MEMORY[0x1E4F83770];
                            v7 = @"magenta";
                          }
                        }
                        else
                        {
                          v6 = (void *)MEMORY[0x1E4F83770];
                          v7 = @"purple";
                        }
                      }
                      else
                      {
                        v6 = (void *)MEMORY[0x1E4F83770];
                        v7 = @"blue";
                      }
                    }
                    else
                    {
                      v6 = (void *)MEMORY[0x1E4F83770];
                      v7 = @"cyan blue";
                    }
                  }
                  else
                  {
                    v6 = (void *)MEMORY[0x1E4F83770];
                    v7 = @"cyan";
                  }
                }
                else
                {
                  v6 = (void *)MEMORY[0x1E4F83770];
                  v7 = @"blue green";
                }
              }
              else
              {
                v6 = (void *)MEMORY[0x1E4F83770];
                v7 = @"green";
              }
            }
            else
            {
              v6 = (void *)MEMORY[0x1E4F83770];
              v7 = @"yellow green";
            }
          }
          else
          {
            v6 = (void *)MEMORY[0x1E4F83770];
            v7 = @"yellow";
          }
        }
        else
        {
          v6 = (void *)MEMORY[0x1E4F83770];
          v7 = @"yellow orange";
        }
      }
      else
      {
        v6 = (void *)MEMORY[0x1E4F83770];
        v7 = @"orange";
      }
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F83770];
      v7 = @"red orange";
    }
LABEL_42:
    double v4 = objc_msgSend(v6, "localizedFrameworkStringForKey:value:table:allowSiri:", v7, v7, 0, 1, v1);
    return v4;
  }
  double v4 = 0;
  return v4;
}

- (id)icaxDescriptionWithLuma
{
  [a1 icaxLuma];
  uint64_t v3 = vcvtad_u64_f64(v2 * 100.0);
  double v4 = NSString;
  double v5 = [a1 icaxApproximateColorDescription];
  v6 = ICAccessibilityLocalizedUnsignedInteger(v3);
  v7 = [v4 localizedStringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

- (id)_icaxColorDescriptionForHue:()ICAccessibility saturation:lightness:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 length];
  uint64_t v11 = [v8 length];
  if (v10)
  {
    if (v11)
    {
      v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"ax.color.format.lightness.saturation.hue" value:@"%1$@ %2$@ %3$@" table:0 allowSiri:1];
      uint64_t v13 = NSString;
      id v16 = v8;
      id v17 = v7;
    }
    else
    {
      v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"ax.color.format.lightness.hue" value:@"%1$@ %2$@" table:0 allowSiri:1];
      uint64_t v13 = NSString;
      id v16 = v7;
    }
    objc_msgSend(v13, "localizedStringWithFormat:", v12, v9, v16, v17);
    goto LABEL_8;
  }
  if (v11)
  {
    v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"ax.color.format.saturation.hue" value:@"%1$@ %2$@" table:0 allowSiri:1];
    objc_msgSend(NSString, "localizedStringWithFormat:", v12, v8, v7, v17);
LABEL_8:
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  id v14 = v7;
LABEL_9:

  return v14;
}

@end