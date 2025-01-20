@interface SubscriptionNameAreaView
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews11ArtworkView)accessibilityWordmarkArtworkView;
- (_TtC23ShelfKitCollectionViews13ChevronButton)accessibilityChannelLinkButton;
- (_TtC23ShelfKitCollectionViews24SubscriptionNameAreaView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews24SubscriptionNameAreaView)initWithFrame:(CGRect)a3;
@end

@implementation SubscriptionNameAreaView

- (_TtC23ShelfKitCollectionViews11ArtworkView)accessibilityWordmarkArtworkView
{
  v2 = self;
  v3 = sub_143434();

  return (_TtC23ShelfKitCollectionViews11ArtworkView *)v3;
}

- (_TtC23ShelfKitCollectionViews13ChevronButton)accessibilityChannelLinkButton
{
  v2 = self;
  id v3 = SubscriptionNameAreaView.channelLinkButton.getter();

  return (_TtC23ShelfKitCollectionViews13ChevronButton *)v3;
}

- (_TtC23ShelfKitCollectionViews24SubscriptionNameAreaView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews24SubscriptionNameAreaView *)sub_143CA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews24SubscriptionNameAreaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_144D7C();
}

- (UIView)viewForLastBaselineLayout
{
  v2 = self;
  Baseline = (void *)SubscriptionNameAreaView.forFirstBaselineLayout.getter();

  return (UIView *)Baseline;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SubscriptionNameAreaView_hStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SubscriptionNameAreaView____lazy_storage___wordmarkArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SubscriptionNameAreaView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24SubscriptionNameAreaView____lazy_storage___channelLinkButton));

  swift_release();
}

@end