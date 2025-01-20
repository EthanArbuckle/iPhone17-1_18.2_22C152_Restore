@interface NTKUtilityBatteryComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (void)_updateForTemplateChange;
- (void)updateRingWithRingDescription:(id)a3 backgroundRingAlpha:(double)a4;
@end

@implementation NTKUtilityBatteryComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCompatibleWithFamily:2];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_updateForTemplateChange
{
  id v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  char v4 = [v3 tintColor];
  [(NTKUtilityComplicationView *)self setOverrideColor:v4];

  id v9 = [(NTKUtilityComplicationView *)self complicationTemplate];
  v5 = [NTKRing alloc];
  [v9 level];
  v6 = -[NTKRing initWithFillFraction:style:](v5, "initWithFillFraction:style:", 0);
  [(NTKUtilitySmallRingComplicationView *)self updateRingWithRingDescription:v6];
  v7 = [(NTKUtilitySmallRingTextComplicationView *)self label];
  v8 = [v9 textProvider];
  [v7 setTextProvider:v8];
}

- (void)updateRingWithRingDescription:(id)a3 backgroundRingAlpha:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NTKUtilityBatteryComplicationView;
  [(NTKUtilitySmallRingComplicationView *)&v12 updateRingWithRingDescription:a3 backgroundRingAlpha:a4];
  v5 = [(NTKUtilityComplicationView *)self complicationTemplate];
  if ([v5 charging]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 level];
  *(float *)&double v7 = v7;
  v8 = +[NTKBatteryUtilities colorForLevel:v6 andState:v7];
  id v9 = [(NTKUtilitySmallRingComplicationView *)self fillFractionRing];
  v10 = v9;
  if (v8)
  {
    [v9 setColor:v8];
  }
  else
  {
    v11 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
    [v10 setColor:v11];
  }
}

@end