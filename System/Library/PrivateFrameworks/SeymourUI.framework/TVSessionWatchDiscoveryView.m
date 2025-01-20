@interface TVSessionWatchDiscoveryView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithCoder:(id)a3;
- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithFrame:(CGRect)a3;
- (void)didTapStartStandaloneButton;
@end

@implementation TVSessionWatchDiscoveryView

- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A69C54C();
}

- (void)didTapStartStandaloneButton
{
  v2 = (void (*)(uint64_t))(*(void **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_presenter))[2];
  id v3 = self;
  if (v2)
  {
    uint64_t v4 = sub_239D03E2C((uint64_t)v2);
    v2(v4);
    sub_239C25118((uint64_t)v2);
  }
  [(TVSessionWatchDiscoveryView *)self removeFromSuperview];
}

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_startStandaloneButton);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI27TVSessionWatchDiscoveryView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI27TVSessionWatchDiscoveryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_lookingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_checkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_startStandaloneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_imageView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27TVSessionWatchDiscoveryView_connectingView);
}

@end