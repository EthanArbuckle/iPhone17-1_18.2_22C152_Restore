@interface InteractiveLabel
- (_TtC7Measure16InteractiveLabel)initWithCoder:(id)a3;
- (_TtC7Measure16InteractiveLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation InteractiveLabel

- (_TtC7Measure16InteractiveLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC7Measure16InteractiveLabel *)sub_10008611C(a4, x, y, width, height);
}

- (_TtC7Measure16InteractiveLabel)initWithCoder:(id)a3
{
  return (_TtC7Measure16InteractiveLabel *)sub_100086440(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10002F0C4((uint64_t)self + OBJC_IVAR____TtC7Measure16InteractiveLabel_configuration);

  swift_release();
}

@end