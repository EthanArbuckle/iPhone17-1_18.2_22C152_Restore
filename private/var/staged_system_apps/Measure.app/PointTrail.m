@interface PointTrail
- (_TtC7Measure10PointTrail)init;
- (_TtC7Measure10PointTrail)initWithCoder:(id)a3;
@end

@implementation PointTrail

- (_TtC7Measure10PointTrail)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_pointNodes) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_minDistance) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_stretchingRate) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_isStarted) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure10PointTrail_minDistanceSquared) = 0;
  id v4 = a3;

  result = (_TtC7Measure10PointTrail *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Measure10PointTrail)init
{
  result = (_TtC7Measure10PointTrail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end