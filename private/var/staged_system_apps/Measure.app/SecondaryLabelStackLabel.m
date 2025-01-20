@interface SecondaryLabelStackLabel
- (_TtC7Measure24SecondaryLabelStackLabel)initWithCoder:(id)a3;
- (_TtC7Measure24SecondaryLabelStackLabel)initWithFrame:(CGRect)a3;
@end

@implementation SecondaryLabelStackLabel

- (_TtC7Measure24SecondaryLabelStackLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v7 = -[ViewWithInteractiveLabel initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_10010B8BC();
  v9 = v8;
  v11 = v10;
  v12 = *(Class *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR____TtC7Measure24ViewWithInteractiveLabel_label);
  [v12 setFont:v8];
  [v12 setTextColor:v11];

  return v7;
}

- (_TtC7Measure24SecondaryLabelStackLabel)initWithCoder:(id)a3
{
  return (_TtC7Measure24SecondaryLabelStackLabel *)sub_10010B7B0(a3);
}

@end