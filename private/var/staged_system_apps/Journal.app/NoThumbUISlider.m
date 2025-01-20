@interface NoThumbUISlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (_TtC7Journal15NoThumbUISlider)initWithCoder:(id)a3;
- (_TtC7Journal15NoThumbUISlider)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NoThumbUISlider

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)type metadata accessor for NoThumbUISlider();
  id v12 = v30.receiver;
  -[NoThumbUISlider thumbRectForBounds:trackRect:value:](&v30, "thumbRectForBounds:trackRect:value:", v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v29 = v19;
  double v20 = v17 * 0.5;
  [v12 maximumValue];
  LODWORD(v8) = v21;
  [v12 minimumValue];
  LODWORD(v9) = v22;

  double v23 = v14 + (v20 + v20) * (float)(a5 / (float)(*(float *)&v8 - *(float *)&v9)) - v20;
  double v24 = v16;
  double v25 = v18;
  double v26 = v29;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005D62EC();
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (_TtC7Journal15NoThumbUISlider)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoThumbUISlider();
  return -[NoThumbUISlider initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal15NoThumbUISlider)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoThumbUISlider();
  return [(NoThumbUISlider *)&v5 initWithCoder:a3];
}

@end