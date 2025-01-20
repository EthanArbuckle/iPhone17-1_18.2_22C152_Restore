@interface RectangleHistoryCellWithScreenshot
- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithCoder:(id)a3;
- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation RectangleHistoryCellWithScreenshot

- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC7Measure34RectangleHistoryCellWithScreenshot *)sub_10012B8BC(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithCoder:(id)a3
{
  return (_TtC7Measure34RectangleHistoryCellWithScreenshot *)sub_10012B9F8(a3);
}

- (void)prepareForReuse
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC7Measure34RectangleHistoryCellWithScreenshot_screenshot;
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure34RectangleHistoryCellWithScreenshot_screenshot);
  uint64_t v6 = self;
  [v5 removeFromSuperview];
  v7 = (objc_class *)[objc_allocWithZone((Class)UIImageView) init];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v7;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(BaseRectangleHistoryCell *)&v9 prepareForReuse];
  sub_10012B294();
  sub_10012B3D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure34RectangleHistoryCellWithScreenshot_screenshot));
}

@end