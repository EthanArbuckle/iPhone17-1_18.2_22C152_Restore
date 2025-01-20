@interface NTKRichComplicationCircularOpenGaugeSimpleTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationCircularOpenGaugeSimpleTextView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationCircularOpenGaugeSimpleTextView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (NTKRichComplicationCircularOpenGaugeSimpleTextView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularOpenGaugeSimpleTextView;
  return [(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)&v3 initWithFamily:10];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 gaugeProvider];
  v7 = [(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self progressView];
  [v7 setGaugeProvider:v6];

  v8 = [v5 bottomTextProvider];
  v9 = [(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self smallLabel];
  [v9 setTextProvider:v8];

  id v11 = [v5 centerTextProvider];

  v10 = [(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self centerLabel];
  [v10 setTextProvider:v11];
}

@end