@interface ChannelHeaderView
- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithFrame:(CGRect)a3;
- (void)buttonCaptionLabelTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ChannelHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_32EED8(a3);
}

- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17ChannelHeaderView *)sub_32F10C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17ChannelHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3329C0();
}

- (void)buttonCaptionLabelTapped
{
  v2 = self;
  sub_3322E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_upsellBanner));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___buttonCaptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView____lazy_storage___benefitsTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ChannelHeaderView_entitlementBadge));

  swift_release();
}

@end