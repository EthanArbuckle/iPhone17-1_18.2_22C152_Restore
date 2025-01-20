@interface NTKWellnessCircularMediumComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (BOOL)usesMediumLayout;
@end

@implementation NTKWellnessCircularMediumComplicationView

- (BOOL)usesMediumLayout
{
  return 1;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCompatibleWithFamily:*MEMORY[0x1E4F19648]];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end