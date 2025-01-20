@interface EditorialCardCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore19CrossLinkLockupView)accessibilityLockupView;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView;
- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)stateChangedFor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialCardCollectionViewCell

- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31EditorialCardCollectionViewCell *)sub_1002C14FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31EditorialCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002C5108();
}

- (void)dealloc
{
  v2 = self;
  sub_1002C29F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_cardContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_cardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_longPressGestureRecognizer));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_clickAction, &qword_10098D120);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002C2E58();
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002C3590(v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1002C03C4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002C43A4(a3);
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
  BOOL v9 = sub_1002C46BC(v6, v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_captionLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_subtitleLabel));
}

- (_TtC8AppStore19CrossLinkLockupView)accessibilityLockupView
{
  return (_TtC8AppStore19CrossLinkLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_lockupView));
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore31EditorialCardCollectionViewCell_appEventFormattedDateView));
}

@end