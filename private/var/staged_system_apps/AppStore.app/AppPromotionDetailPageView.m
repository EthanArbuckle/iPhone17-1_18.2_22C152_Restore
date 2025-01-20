@interface AppPromotionDetailPageView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore12HeaderButton)accessibilityCloseButton;
- (_TtC8AppStore22SubscriptionLockupView)accessibilityLockupView;
- (_TtC8AppStore26AppPromotionDetailPageView)initWithCoder:(id)a3;
- (_TtC8AppStore26AppPromotionDetailPageView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (_TtC8AppStore9VideoView)accessibilityVideoView;
- (void)didTapCloseButton;
- (void)dismissTapGestureRecognized;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation AppPromotionDetailPageView

- (_TtC8AppStore26AppPromotionDetailPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100430BF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10042D6FC();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_100322B28();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1001EE584();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)dismissTapGestureRecognized
{
  v2 = self;
  sub_10042E90C();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10042FFAC((int)v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_appPromotionCloseButtonAppearanceCoordinator))
  {
    id v4 = a3;
    v5 = self;
    swift_retain();
    sub_10076BA20(v4);

    swift_release();
  }
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                                 + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_availabilityLabelView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_promotionKindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView) + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_subtitleView)
                                                                                                + qword_10099F508));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                                + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_detailLabel));
}

- (_TtC8AppStore12HeaderButton)accessibilityCloseButton
{
  return (_TtC8AppStore12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_closeButton));
}

- (_TtC8AppStore22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC8AppStore22SubscriptionLockupView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView)
                                                                                          + OBJC_IVAR____TtC8AppStore33AppPromotionDetailPageContentView_lockupView));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8AppStore9VideoView *)Strong;
}

- (_TtC8AppStore26AppPromotionDetailPageView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore26AppPromotionDetailPageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_pageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_pageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_learnMoreView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_videoBackgroundColor));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore26AppPromotionDetailPageView_mediaOverlayStyle;
  uint64_t v4 = type metadata accessor for MediaOverlayStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end