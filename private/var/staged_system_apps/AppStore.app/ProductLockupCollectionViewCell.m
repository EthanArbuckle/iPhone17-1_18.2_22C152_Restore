@interface ProductLockupCollectionViewCell
- (UIView)accessibilityBannerView;
- (UIView)accessibilitySecondaryBannerView;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDeveloperLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDownloadProgressLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferSubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore11ChevronView)accessibilityDisclosureArrow;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore12HeaderButton)accessibilityShareButton;
- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtC8AppStore9VideoView)accessibilityVideoView;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)developerLabelTapped:(id)a3;
- (void)layoutDirectionDidChanged;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)prepareForReuse;
- (void)shareTappedFrom:(id)a3;
- (void)taglineLabelTapped:(id)a3;
- (void)userInterfaceStyleDidChanged;
@end

@implementation ProductLockupCollectionViewCell

- (void)prepareForReuse
{
  v2 = self;
  sub_10013E758();
}

- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ProductLockupCollectionViewCell *)sub_10044F0EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v2 = self;
  sub_100450A14();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_lockupContentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_uberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
  swift_unknownObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_100982B40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_taglineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_disclosureArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_secondaryBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_keylineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_iconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_theme;
  uint64_t v4 = type metadata accessor for ProductPageTheme();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_expandedOfferSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_downloadProgressLabel));
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_networkInquiry);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_networkObservation, &qword_1009977F0);
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareTapHandler));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler);

  sub_10006012C(v5);
}

- (_TtC8AppStore31ProductLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10045A2EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100452240();
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v4 = (char *)a3;
  uint64_t v5 = self;
  sub_100455284(v4);
}

- (void)shareTappedFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  [v4 bounds];
  v17[0] = v4;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  v17[4] = v9;
  char v18 = 1;
  __asm { FMOV            V0.2D, #10.0 }
  long long v19 = _Q0;
  long long v20 = _Q0;
  uint64_t v21 = 15;
  id v16 = v4;
  v15 = v5;
  sub_1001BC444((uint64_t)v17, (uint64_t)v15, (uint64_t)v16);
}

- (void)developerLabelTapped:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerTapHandler);
  if (v3)
  {
    id v5 = a3;
    uint64_t v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (void)taglineLabelTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10045B6C4();
}

- (void)layoutDirectionDidChanged
{
  v2 = self;
  sub_100143278(v2, (uint64_t)v2);
}

- (void)userInterfaceStyleDidChanged
{
  v2 = self;
  sub_100451170();
  sub_1004513C4();
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  id v3 = [(ProductLockupCollectionViewCell *)v2 traitCollection];
  sub_10045A168();
  id v5 = v4;

  [*(id *)((char *)&v2->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton) setImage:v5 forState:0];
}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_bannerView));
}

- (UIView)accessibilitySecondaryBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_secondaryBannerView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_iconView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDeveloperLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_developerLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_taglineLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_tertiaryTitleLabel);
  swift_beginAccess();
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)*v2;
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerButton));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_offerSubtitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDownloadProgressLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_downloadProgressLabel));
}

- (_TtC8AppStore12HeaderButton)accessibilityShareButton
{
  return (_TtC8AppStore12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_shareButton));
}

- (_TtC8AppStore11ChevronView)accessibilityDisclosureArrow
{
  return (_TtC8AppStore11ChevronView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore31ProductLockupCollectionViewCell_disclosureArrow));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  v2 = (void *)sub_100450E5C();

  return (_TtC8AppStore9VideoView *)v2;
}

@end