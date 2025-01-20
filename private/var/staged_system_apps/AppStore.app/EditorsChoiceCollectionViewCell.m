@interface EditorsChoiceCollectionViewCell
- (BOOL)accessibilityShowsBadge;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore17EditorsChoiceView)accessibilityBadgeView;
- (_TtC8AppStore31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
- (void)prepareForReuse;
@end

@implementation EditorsChoiceCollectionViewCell

- (_TtC8AppStore31EditorsChoiceCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31EditorsChoiceCollectionViewCell *)sub_10025EA10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31EditorsChoiceCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView;
  type metadata accessor for EditorsChoiceReviewView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_itemLayoutContext;
  uint64_t v9 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC8AppStore31EditorsChoiceCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EditorsChoiceCollectionViewCell();
  id v2 = v3.receiver;
  [(EditorsChoiceCollectionViewCell *)&v3 prepareForReuse];
  sub_100241898(0, 0);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_10025EE4C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView);
  v4 = self;
  [(EditorsChoiceCollectionViewCell *)v4 layoutMargins];
  CGSize.subtracting(insets:)();
  [v3 sizeThatFits:];
  [(EditorsChoiceCollectionViewCell *)v4 layoutMargins];
  CGSize.adding(outsets:)();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)moreFrom:(id)a3
{
  objc_super v3 = *(void (**)(uint64_t))(*(char **)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
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
  return (_TtC8AppStore17EditorsChoiceView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                     + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_badgeView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView)
                                                                                                + OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_textLabel));
}

- (BOOL)accessibilityShowsBadge
{
  return (*(unsigned char **)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView))[OBJC_IVAR____TtC8AppStore23EditorsChoiceReviewView_showsBadge];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_editorsChoiceReviewView));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8AppStore31EditorsChoiceCollectionViewCell_itemLayoutContext;

  sub_1000A1D30((uint64_t)v3);
}

@end