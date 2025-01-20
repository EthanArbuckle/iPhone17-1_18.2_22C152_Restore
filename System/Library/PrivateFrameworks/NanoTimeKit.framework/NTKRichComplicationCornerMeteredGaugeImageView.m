@interface NTKRichComplicationCornerMeteredGaugeImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (int64_t)progressFillStyle;
- (NTKRichComplicationCornerMeteredGaugeImageView)initWithFontFallback:(int64_t)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationCornerMeteredGaugeImageView

- (NTKRichComplicationCornerMeteredGaugeImageView)initWithFontFallback:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationCornerMeteredGaugeImageView;
  v3 = [(CDRichComplicationCornerGaugeCustomView *)&v6 initWithFontFallback:a3];
  v4 = v3;
  if (v3) {
    [(CDRichComplicationCornerBaseGaugeView *)v3 _enumerateLabelsWithBlock:&__block_literal_global_145];
  }
  return v4;
}

uint64_t __71__NTKRichComplicationCornerMeteredGaugeImageView_initWithFontFallback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUppercase:0];
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
  return 4;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v11 = [v6 imageProvider];
  v7 = [(NTKRichComplicationCornerGaugeImageView *)self imageView];
  [v7 setImageProvider:v11 reason:a4];

  v8 = [v6 gaugeProvider];
  v9 = [v6 leadingTextProvider];
  v10 = [v6 trailingTextProvider];

  [(CDRichComplicationCornerBaseGaugeView *)self handleGaugeProvider:v8 leftTextProvider:v9 rightTextProvider:v10];
}

@end