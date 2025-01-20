@interface PosterLockupCollectionViewCell
- (NSString)accessibilityFallbackTitle;
- (UIView)accessibilityFooterView;
- (UIView)accessibilityHeadingView;
- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore30PosterLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterLockupCollectionViewCell

- (_TtC8AppStore30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30PosterLockupCollectionViewCell *)sub_1003CD65C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30PosterLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003CEE74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003CE140();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003CCC80();
}

- (UIView)accessibilityHeadingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_headingView));
}

- (NSString)accessibilityFallbackTitle
{
  if (*(void *)&self->fallbackTitle[OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_fallbackTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)acccessibilityFallbackTitleView
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_fallbackTitleView));
}

- (_TtC19AppStoreKitInternal11ArtworkView)acccessibilityEpicHeaderView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_epicHeaderView));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_offerButton));
}

- (UIView)accessibilityFooterView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_footerLabel));
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_fallbackTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_gradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore30PosterLockupCollectionViewCell_mediaViewContainer);
}

@end