@interface AppEventDetailPageView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UIButton)accessibilityShareButton;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRequirementsLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore12HeaderButton)accessibilityCloseButton;
- (_TtC8AppStore14NotifyMeButton)accessibilityNotifyMeButton;
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore22AppEventDetailPageView)initWithCoder:(id)a3;
- (_TtC8AppStore22AppEventDetailPageView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (_TtC8AppStore9VideoView)accessibilityVideoView;
- (void)didTapCloseButton:(id)a3;
- (void)didTapShareButton:(id)a3;
- (void)dismissTapGestureRecognized:(id)a3;
- (void)layoutSubviews;
- (void)lockupTapGestureRecognized:(id)a3;
- (void)notifyMeButtonTapped:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)videoTapGestureRecognized:(id)a3;
@end

@implementation AppEventDetailPageView

- (_TtC8AppStore22AppEventDetailPageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22AppEventDetailPageView *)sub_100398C40();
}

- (_TtC8AppStore22AppEventDetailPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100399C48();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100394570();
}

- (void)didTapCloseButton:(id)a3
{
}

- (void)dismissTapGestureRecognized:(id)a3
{
}

- (void)didTapShareButton:(id)a3
{
  id v4 = a3;
  v5 = self;
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
  id v15 = v4;
  v16 = v5;
  sub_1001BC134((uint64_t)v17, (uint64_t)v16);
}

- (void)videoTapGestureRecognized:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100395B34();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)&v5);
}

- (void)notifyMeButtonTapped:(id)a3
{
}

- (void)lockupTapGestureRecognized:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v5 = *(void (**)(unsigned char *))((char *)&v4->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_lockupTapGestureActionBlock);
  if (v5)
  {
    swift_retain();
    v5(v6);
    sub_10006012C((uint64_t)v5);
  }

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  BOOL v9 = sub_1003968F0(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  BOOL v9 = sub_100396A40(v6, v7);

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100396FC8(a3);
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_formattedDateView));
}

- (UIButton)accessibilityShareButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_shareButton));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_kindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDetailLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_detailLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRequirementsLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_requirementsLabel));
}

- (_TtC8AppStore12HeaderButton)accessibilityCloseButton
{
  return (_TtC8AppStore12HeaderButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_closeButton));
}

- (_TtC8AppStore14NotifyMeButton)accessibilityNotifyMeButton
{
  return (_TtC8AppStore14NotifyMeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_notifyMeButton));
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_lockupView));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8AppStore9VideoView *)Strong;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_cardScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_cardContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_mediaContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_overlayContentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_closeButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_notifyMeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_contentBackgroundBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_mediaReplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_requirementsLabel));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_closeButtonActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_dismissTapGestureRecognizer));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_dismissTapGestureActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_videoTapGestureRecognizer));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_shareButtonActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_lockupTapGestureRecognizer));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_lockupTapGestureActionBlock));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_videoBackgroundColor));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore22AppEventDetailPageView_mediaOverlayStyle;
  uint64_t v4 = type metadata accessor for MediaOverlayStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end