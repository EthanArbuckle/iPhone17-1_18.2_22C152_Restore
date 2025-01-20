@interface NTKRichComplicationCornerSegmentedGaugeImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (int64_t)progressFillStyle;
- (double)_progressViewHorizontalPaddingInRadius;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationCornerSegmentedGaugeImageView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (int64_t)progressFillStyle
{
  return 7;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v17 = [v6 imageProvider];
  v7 = [(NTKRichComplicationCornerGaugeImageView *)self imageView];
  [v7 setImageProvider:v17 reason:a4];

  v8 = [v6 gaugeProvider];
  v9 = [v6 leadingTextProvider];

  [(CDRichComplicationCornerBaseGaugeView *)self handleGaugeProvider:v8 leftTextProvider:v9 rightTextProvider:0];
  v10 = [(CDRichComplicationCornerBaseGaugeView *)self leftLabel];
  v11 = [v10 font];
  [v11 pointSize];
  double v13 = v12;

  v14 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v13 design:*MEMORY[0x1E4FB09D0]];
  v15 = [v14 CLKFontWithAlternativePunctuation];

  v16 = [(CDRichComplicationCornerBaseGaugeView *)self leftLabel];
  [v16 setFont:v15];
}

- (double)_progressViewHorizontalPaddingInRadius
{
  CLKDegreesToRadians();
  return result;
}

@end