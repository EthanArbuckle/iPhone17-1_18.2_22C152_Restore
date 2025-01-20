@interface WeatherVFXView._VFXView
- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithCoder:(id)a3;
- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3;
- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3 options:(id)a4;
- (void)layoutSubviews;
@end

@implementation WeatherVFXView._VFXView

- (void)layoutSubviews
{
  v2 = self;
  sub_1B4355990();
}

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    uint64_t v8 = sub_1B4838BB0();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1B4355A68(v8, x, y, width, height);
}

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithFrame:(CGRect)a3
{
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1B4355BFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView)initWithCoder:(id)a3
{
  return (_TtCV9WeatherUI14WeatherVFXViewP33_101D7DA744F6F695065549099A4FF6838_VFXView *)sub_1B4355CDC(a3);
}

- (void).cxx_destruct
{
}

@end