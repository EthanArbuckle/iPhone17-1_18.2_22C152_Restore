@interface LineDivisionsRender
- (_TtC7Measure19LineDivisionsRender)init;
- (_TtC7Measure19LineDivisionsRender)initWithCoder:(id)a3;
@end

@implementation LineDivisionsRender

- (_TtC7Measure19LineDivisionsRender)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100035384();
}

- (_TtC7Measure19LineDivisionsRender)init
{
  result = (_TtC7Measure19LineDivisionsRender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure19LineDivisionsRender_divisionsLOD0Material));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure19LineDivisionsRender_divisionsLOD1Material));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure19LineDivisionsRender_divisionsLOD2Material));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure19LineDivisionsRender_divisionsLOD3Material));

  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure19LineDivisionsRender_endNumber);
}

@end