@interface FMActionLandingView
- (_TtC6FindMy19FMActionLandingView)initWithCoder:(id)a3;
- (_TtC6FindMy19FMActionLandingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMActionLandingView

- (_TtC6FindMy19FMActionLandingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C298C();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_1000B7838((uint64_t)v3);
    v3(v5);
    sub_100036B90((uint64_t)v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001C2148((uint64_t)a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C227C();
}

- (_TtC6FindMy19FMActionLandingView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy19FMActionLandingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_bulletedListView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollContentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_deviceOwnerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMActionLandingView_heightConstraint));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMActionLandingView_scrollHandler);

  sub_100036B90(v3);
}

@end