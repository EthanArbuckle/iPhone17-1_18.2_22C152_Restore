@interface FMPlatterAppStoreInfoAndButtonGroupView
- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithCoder:(id)a3;
- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMPlatterAppStoreInfoAndButtonGroupView

- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001CCD94();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001CC654((uint64_t)a3);
}

- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_sharedLockupViewGroup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_topSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end