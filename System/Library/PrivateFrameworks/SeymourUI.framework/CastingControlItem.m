@interface CastingControlItem
- (_TtC9SeymourUI18CastingControlItem)initWithCoder:(id)a3;
- (_TtC9SeymourUI18CastingControlItem)initWithFrame:(CGRect)a3;
@end

@implementation CastingControlItem

- (_TtC9SeymourUI18CastingControlItem)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI18CastingControlItem_backgroundView;
  id v6 = objc_allocWithZone(MEMORY[0x263EFA978]);
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI18CastingControlItem *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI18CastingControlItem)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI18CastingControlItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18CastingControlItem_normalImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18CastingControlItem_selectedImage));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18CastingControlItem_backgroundView);
}

@end