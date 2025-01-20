@interface LineRender
- (_TtC7Measure10LineRender)init;
- (_TtC7Measure10LineRender)initWithCoder:(id)a3;
- (void)dealloc;
@end

@implementation LineRender

- (_TtC7Measure10LineRender)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC7Measure10LineRender *)sub_1000F4F94();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1000EED80();
  swift_slowDealloc();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(LineRender *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___lineMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___minorSuggestedMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___dashedLineMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___linePrimeMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___visibilityThicknessGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___visibilityGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___thicknessGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___plainGuideMaterial));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure10LineRender____lazy_storage___objectLineMaterial));

  id v3 = (char *)self + OBJC_IVAR____TtC7Measure10LineRender_startTime;

  sub_1000DB3D4((uint64_t)v3);
}

- (_TtC7Measure10LineRender)init
{
  result = (_TtC7Measure10LineRender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end