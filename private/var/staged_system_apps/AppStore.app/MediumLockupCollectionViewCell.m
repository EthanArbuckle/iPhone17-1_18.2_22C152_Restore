@interface MediumLockupCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore30MediumLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MediumLockupCollectionViewCell

- (_TtC8AppStore30MediumLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30MediumLockupCollectionViewCell *)sub_10065CEC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30MediumLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10065EAEC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10065DB98();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_subtitleLabel));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_offerButton));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_offerLabel));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_100982B40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_separatorView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30MediumLockupCollectionViewCell_separator, (uint64_t *)&unk_1009A3840);
}

@end