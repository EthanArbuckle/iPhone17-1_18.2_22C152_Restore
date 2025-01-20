@interface NTKBatteryCircularSmallComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (void)_updateForTemplateChange;
@end

@implementation NTKBatteryCircularSmallComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCompatibleWithFamily:4];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_updateForTemplateChange
{
  id v9 = [(NTKCircularComplicationView *)self complicationTemplate];
  id v3 = [NTKRing alloc];
  [v9 level];
  char v4 = -[NTKRing initWithFillFraction:style:](v3, "initWithFillFraction:style:", 0);
  [(NTKCircularSmallRingComplicationView *)self updateRingWithRingDescription:v4];
  if ([v9 charging]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v9 level];
  *(float *)&double v6 = v6;
  v7 = +[NTKBatteryUtilities colorForLevel:v5 andState:v6];
  [(NTKCircularSmallRingComplicationView *)self updateRingWithOverrideColor:v7];
  v8 = [v9 textProvider];
  [(NTKCircularSmallRingTextComplicationView *)self _updateLabelWithTextProvider:v8];
}

- (void).cxx_destruct
{
}

@end