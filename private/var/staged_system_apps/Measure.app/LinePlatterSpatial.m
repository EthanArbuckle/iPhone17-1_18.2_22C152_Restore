@interface LinePlatterSpatial
- (_TtC7Measure18LinePlatterSpatial)initWithCoder:(id)a3;
- (_TtC7Measure18LinePlatterSpatial)initWithFrame:(CGRect)a3;
@end

@implementation LinePlatterSpatial

- (_TtC7Measure18LinePlatterSpatial)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008A758();
}

- (_TtC7Measure18LinePlatterSpatial)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure18LinePlatterSpatial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_100028914(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_numberOfRowsChangedCallback));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_sketchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_labelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityLabelStrip));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityElevation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityDistance));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilityAngle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorOne));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorTwo));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure18LinePlatterSpatial_accessibilitySeparatorThree);
}

@end