@interface TVUpNextQueueButtonView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI23TVUpNextQueueButtonView)init;
- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithFrame:(CGRect)a3;
@end

@implementation TVUpNextQueueButtonView

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_button);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)init
{
  return (_TtC9SeymourUI23TVUpNextQueueButtonView *)sub_23A7751DC();
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_layout) = (Class)0x4050800000000000;
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_buttonContentView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TVUpNextQueueButtonContentView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_hideItemCountConstraints) = (Class)MEMORY[0x263F8EE78];

  result = (_TtC9SeymourUI23TVUpNextQueueButtonView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI23TVUpNextQueueButtonView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_buttonContentView));

  swift_bridgeObjectRelease();
}

@end