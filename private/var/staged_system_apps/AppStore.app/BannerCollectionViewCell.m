@interface BannerCollectionViewCell
- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView;
- (_TtC8AppStore24BannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore24BannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BannerCollectionViewCell

- (_TtC8AppStore24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24BannerCollectionViewCell *)sub_1006696B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10066BC38();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10066A0AC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10066A810(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  id v2 = v3.receiver;
  [(BannerCollectionViewCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_100669F74();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_10066AAE8();
}

- (_TtC19AppStoreKitInternal19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC19AppStoreKitInternal19DynamicTypeTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_messageTextView);
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_bottomSeparatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_leadingArtworkTintColor));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_configuredMetrics;

  sub_1000A40BC((uint64_t)v3);
}

@end