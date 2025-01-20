@interface RectanglePlatterSpatial
- (_TtC7Measure23RectanglePlatterSpatial)initWithCoder:(id)a3;
- (_TtC7Measure23RectanglePlatterSpatial)initWithFrame:(CGRect)a3;
@end

@implementation RectanglePlatterSpatial

- (_TtC7Measure23RectanglePlatterSpatial)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100028718();
}

- (_TtC7Measure23RectanglePlatterSpatial)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure23RectanglePlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_numberOfRowsChangedCallback));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_labelStrip));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilityLength));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilityWidth));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Measure23RectanglePlatterSpatial_accessibilitySeparator);
}

@end