@interface NTKRichComplicationRectangularTextGaugeMeteredView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (int64_t)progressFillStyle;
- (NTKRichComplicationRectangularTextGaugeMeteredView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationRectangularTextGaugeMeteredView

- (NTKRichComplicationRectangularTextGaugeMeteredView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeMeteredView;
  v2 = [(NTKRichComplicationRectangularTextGaugeView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NTKRichComplicationRectangularTextGaugeView *)v2 _enumerateLabelsWithBlock:&__block_literal_global_82];
  }
  return v3;
}

uint64_t __58__NTKRichComplicationRectangularTextGaugeMeteredView_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUppercase:0];
}

+ (int64_t)progressFillStyle
{
  return 1;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v10 = [v6 headerImageProvider];
  v7 = [v6 headerTextProvider];
  v8 = [v6 body1TextProvider];
  v9 = [v6 gaugeProvider];

  [(NTKRichComplicationRectangularTextGaugeView *)self _handleTemplateUpdateWithReason:a4 headerViewData:0 headerImageProvider:v10 headerTextProvider:v7 bodyTextProvider:v8 gaugeProvider:v9];
}

@end