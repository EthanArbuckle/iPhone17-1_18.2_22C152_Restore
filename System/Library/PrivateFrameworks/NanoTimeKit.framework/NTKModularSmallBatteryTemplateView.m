@interface NTKModularSmallBatteryTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKModularSmallBatteryTemplateView)initWithFrame:(CGRect)a3;
- (id)forcedRingColor;
- (id)preferredRingColor;
- (void)_refreshRingImage;
- (void)_update;
- (void)applyColorScheme:(id)a3;
@end

@implementation NTKModularSmallBatteryTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 isCompatibleWithFamily:0]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 isCompatibleWithFamily:7];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallBatteryTemplateView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKModularSmallBatteryTemplateView;
  id v3 = -[NTKModularSmallRingTemplateView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    v5 = [(NTKModularSmallRingTemplateView *)v3 label];
    [v5 setHidden:0];
  }
  return v4;
}

- (void)_update
{
  id v15 = [(NTKModularTemplateView *)self complicationTemplate];
  id v3 = [(NTKModularSmallRingTemplateView *)self label];
  char v4 = [v15 textProvider];
  [v3 setTextProvider:v4];

  v5 = [NTKRing alloc];
  [v15 level];
  v6 = -[NTKRing initWithFillFraction:style:](v5, "initWithFillFraction:style:", 0);
  [(NTKModularSmallRingTemplateView *)self _updateRingWithRingDescription:v6];
  objc_super v7 = [(NTKModularSmallBatteryTemplateView *)self forcedRingColor];
  v8 = [(NTKModularSmallBatteryTemplateView *)self preferredRingColor];
  v9 = [(NTKModuleView *)self colorScheme];
  v10 = [(NTKModularSmallRingTemplateView *)self stateRing];
  v11 = v10;
  if (v7)
  {
    v12 = v7;
LABEL_6:
    [v10 setColor:v12];
    goto LABEL_8;
  }
  if ([v9 containsOverrideFaceColor] && v8)
  {
    v10 = v11;
    v12 = v8;
    goto LABEL_6;
  }
  v13 = [v9 foregroundColor];
  [v11 setColor:v13];

LABEL_8:
  v14 = [(NTKModuleView *)self contentView];
  [v14 setNeedsLayout];
}

- (void)_refreshRingImage
{
  id v5 = [(NTKModularTemplateView *)self complicationTemplate];
  id v3 = [NTKRing alloc];
  [v5 level];
  char v4 = -[NTKRing initWithFillFraction:style:](v3, "initWithFillFraction:style:", 0);
  [(NTKModularSmallRingTemplateView *)self _refreshRingImageWithRing:v4];
}

- (void)applyColorScheme:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKModularSmallBatteryTemplateView;
  [(NTKModuleView *)&v9 applyColorScheme:v4];
  id v5 = [(NTKModularSmallRingTemplateView *)self stateRing];
  v6 = [(NTKModularSmallBatteryTemplateView *)self forcedRingColor];
  objc_super v7 = [(NTKModularSmallBatteryTemplateView *)self preferredRingColor];
  v8 = v6;
  if (v6 || [v4 containsOverrideFaceColor] && (v8 = v7) != 0) {
    [v5 setColor:v8];
  }
}

- (id)forcedRingColor
{
  v2 = [(NTKModularTemplateView *)self complicationTemplate];
  if ([v2 charging]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v2 level];
  *(float *)&double v4 = v4;
  id v5 = +[NTKBatteryUtilities colorForLevel:v3 andState:v4];

  return v5;
}

- (id)preferredRingColor
{
  v2 = [(NTKModularTemplateView *)self complicationTemplate];
  [v2 level];
  *(float *)&double v3 = v3;
  double v4 = +[NTKBatteryUtilities modularRingColorForLevel:v3];

  return v4;
}

@end