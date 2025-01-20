@interface CondensedAppEventCardView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore25CondensedAppEventCardView)initWithCoder:(id)a3;
- (_TtC8AppStore25CondensedAppEventCardView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedAppEventCardView

- (_TtC8AppStore25CondensedAppEventCardView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore25CondensedAppEventCardView *)sub_1005E5C0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore25CondensedAppEventCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005E9254();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventTapGestureRecognizer);
  id v3 = self;
  [v2 removeTarget:v3 action:0];
  [*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_viewButton) removeTarget:v3 action:"handleTapWithGestureRecognizer:" forControlEvents:0xFFFFFFFFLL];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CondensedAppEventCardView();
  [(CondensedAppEventCardView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_viewButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventTapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction);

  sub_10006012C(v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005E64F0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1005E7724(a3);
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventFormattedDateView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_titleLabel));
}

@end