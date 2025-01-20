@interface ColorPicker
- (_TtC7Measure11ColorPicker)initWithCoder:(id)a3;
- (_TtC7Measure11ColorPicker)initWithFrame:(CGRect)a3;
- (void)updateValue:(id)a3;
@end

@implementation ColorPicker

- (_TtC7Measure11ColorPicker)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_redSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_greenSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_blueSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_alphaSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_value) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[ColorPicker initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_10014EC58();

  return v9;
}

- (_TtC7Measure11ColorPicker)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_redSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_greenSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_blueSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_alphaSlider) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_value) = 0;
  id v4 = a3;

  result = (_TtC7Measure11ColorPicker *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateValue:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10014F678();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure11ColorPicker_alphaSlider);
}

@end