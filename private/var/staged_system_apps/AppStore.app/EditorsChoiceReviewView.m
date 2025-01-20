@interface EditorsChoiceReviewView
- (BOOL)accessibilityShowsBadge;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore17EditorsChoiceView)accessibilityBadgeView;
- (_TtC8AppStore23EditorsChoiceReviewView)initWithCoder:(id)a3;
- (_TtC8AppStore23EditorsChoiceReviewView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
@end

@implementation EditorsChoiceReviewView

- (_TtC8AppStore23EditorsChoiceReviewView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23EditorsChoiceReviewView *)sub_10023D958(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23EditorsChoiceReviewView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_isExpanded) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_showsBadge) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_pageTraits) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore23EditorsChoiceReviewView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10023EE98();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1002404A0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)moreFrom:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (_TtC8AppStore17EditorsChoiceView)accessibilityBadgeView
{
  return (_TtC8AppStore17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_badgeView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_showsBadge);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_backgroundImageView));
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_moreTapHandler);

  sub_10006012C(v3);
}

@end