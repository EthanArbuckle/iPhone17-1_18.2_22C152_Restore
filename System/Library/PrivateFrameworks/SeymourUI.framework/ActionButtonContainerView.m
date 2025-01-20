@interface ActionButtonContainerView
- (_TtC9SeymourUI25ActionButtonContainerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25ActionButtonContainerView)initWithFrame:(CGRect)a3;
- (void)actionButtonTapped:(id)a3;
@end

@implementation ActionButtonContainerView

- (_TtC9SeymourUI25ActionButtonContainerView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_buttonActions) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_rootStackView) = 0;
  id v5 = a3;

  result = (_TtC9SeymourUI25ActionButtonContainerView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)actionButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23A319E48(v4);
}

- (_TtC9SeymourUI25ActionButtonContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI25ActionButtonContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_templateBuilder);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_viewFactory);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_rootStackView);
}

@end