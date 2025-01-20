@interface PhoneSessionWatchDiscoveryView
- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithCoder:(id)a3;
- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didTapStartStandaloneButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PhoneSessionWatchDiscoveryView

- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C781DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_239C75798(a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_239C758F4((uint64_t)a4, x, y);

  return v10;
}

- (void)didTapStartStandaloneButton:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23A8009F8();
  swift_unknownObjectRelease();
  id v5 = (void (*)(uint64_t))(*(void **)((char *)&v4->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_presenter))[2];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_239C25118((uint64_t)v5);
  }
  [(PhoneSessionWatchDiscoveryView *)v4 removeFromSuperview];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI30PhoneSessionWatchDiscoveryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_messageStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_lookingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_checkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_startStandaloneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30PhoneSessionWatchDiscoveryView_connectingView);
}

@end