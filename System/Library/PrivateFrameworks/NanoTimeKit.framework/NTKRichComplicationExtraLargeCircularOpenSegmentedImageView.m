@interface NTKRichComplicationExtraLargeCircularOpenSegmentedImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (int64_t)progressFillStyle;
- (NTKRichComplicationExtraLargeCircularOpenSegmentedImageView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationExtraLargeCircularOpenSegmentedImageView

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (int64_t)progressFillStyle
{
  return 6;
}

- (NTKRichComplicationExtraLargeCircularOpenSegmentedImageView)init
{
  return [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self initWithFamily:12];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self progressView];
  v8 = [v6 gaugeProvider];
  [v7 setGaugeProvider:v8];

  v9 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self centerImageView];
  v10 = [v6 imageProvider];
  [v9 setImageProvider:v10 reason:a4];

  id v12 = [(NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *)self smallLabel];
  v11 = [v6 textProvider];

  [v12 setTextProvider:v11];
}

@end