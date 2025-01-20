@interface DebugLineView
- (_TtC7Measure13DebugLineView)initWithCoder:(id)a3;
- (_TtC7Measure13DebugLineView)initWithFrame:(CGRect)a3;
@end

@implementation DebugLineView

- (_TtC7Measure13DebugLineView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangles) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangleLabels) = (Class)_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DebugLineView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13DebugLineView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangles) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13DebugLineView_allRectangleLabels) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC7Measure13DebugLineView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end