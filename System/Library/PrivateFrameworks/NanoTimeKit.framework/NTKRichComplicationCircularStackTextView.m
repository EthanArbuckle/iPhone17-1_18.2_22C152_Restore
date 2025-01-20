@interface NTKRichComplicationCircularStackTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationCircularStackTextView)init;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
@end

@implementation NTKRichComplicationCircularStackTextView

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

- (NTKRichComplicationCircularStackTextView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularStackTextView;
  return [(NTKRichComplicationBaseCircularStackTextView *)&v3 initWithFamily:10];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  -[NTKRichComplicationBaseCircularStackTextView setHighlightMode:](self, "setHighlightMode:", [v5 highlightMode]);
  v6 = [v5 line1TextProvider];
  v7 = [(NTKRichComplicationBaseCircularStackTextView *)self line1Label];
  [v7 setTextProvider:v6];

  id v9 = [v5 line2TextProvider];

  v8 = [(NTKRichComplicationBaseCircularStackTextView *)self line2Label];
  [v8 setTextProvider:v9];
}

@end