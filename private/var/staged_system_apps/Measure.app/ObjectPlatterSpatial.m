@interface ObjectPlatterSpatial
- (_TtC7Measure20ObjectPlatterSpatial)initWithCoder:(id)a3;
- (_TtC7Measure20ObjectPlatterSpatial)initWithFrame:(CGRect)a3;
@end

@implementation ObjectPlatterSpatial

- (_TtC7Measure20ObjectPlatterSpatial)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D1BC0();
}

- (_TtC7Measure20ObjectPlatterSpatial)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure20ObjectPlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_numberOfRowsChangedCallback));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_labelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure20ObjectPlatterSpatial_tableView));

  swift_release();
}

@end