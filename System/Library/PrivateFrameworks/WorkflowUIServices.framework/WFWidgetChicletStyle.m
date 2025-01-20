@interface WFWidgetChicletStyle
+ (id)fallbackWidgetStyleWithAction:(id)a3;
+ (id)widgetStyleWithAction:(id)a3;
- (BOOL)needsSheenView;
- (NSString)foregroundCompositingFilter;
- (WFColor)foregroundColor;
- (WFGradient)baseGradient;
- (WFWidgetChicletStyle)init;
- (double)foregroundOpacity;
- (double)foregroundSaturation;
@end

@implementation WFWidgetChicletStyle

+ (id)widgetStyleWithAction:(id)a3
{
  id v3 = a3;
  id v4 = sub_21782CFB4(v3);

  return v4;
}

- (double)foregroundOpacity
{
  v2 = self;
  double v3 = sub_21782D1C4();

  return v3;
}

- (double)foregroundSaturation
{
  v2 = self;
  double v3 = sub_21782D284();

  return v3;
}

- (WFColor)foregroundColor
{
  v2 = self;
  id v3 = sub_21782D34C();

  return (WFColor *)v3;
}

- (NSString)foregroundCompositingFilter
{
  v2 = self;
  id v3 = sub_21782D414();

  return (NSString *)v3;
}

- (WFGradient)baseGradient
{
  v2 = self;
  id v3 = (void *)sub_21782D690();

  return (WFGradient *)v3;
}

- (BOOL)needsSheenView
{
  v2 = self;
  char v3 = sub_21782D714();

  return v3 & 1;
}

+ (id)fallbackWidgetStyleWithAction:(id)a3
{
  id v3 = a3;
  id v4 = sub_21782D768(v3);

  return v4;
}

- (WFWidgetChicletStyle)init
{
}

- (void).cxx_destruct
{
}

@end