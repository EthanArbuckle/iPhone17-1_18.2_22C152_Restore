@interface NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 12;
}

- (NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationExtraLargeCircularOpenGaugeRangeTextView;
  return [(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)&v3 initWithFamily:12];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 gaugeProvider];
  v7 = [(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self progressView];
  [v7 setGaugeProvider:v6];

  v8 = [v5 leadingTextProvider];
  v9 = [(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self leadingSmallLabel];
  [v9 setTextProvider:v8];

  v10 = [v5 trailingTextProvider];
  v11 = [(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self trailingSmallLabel];
  [v11 setTextProvider:v10];

  id v13 = [v5 centerTextProvider];

  v12 = [(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self centerLabel];
  [v12 setTextProvider:v13];
}

@end