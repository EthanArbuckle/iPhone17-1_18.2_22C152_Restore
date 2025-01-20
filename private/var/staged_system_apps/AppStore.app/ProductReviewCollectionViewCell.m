@interface ProductReviewCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore10RatingView)accessibilityRatingView;
- (_TtC8AppStore18ExpandableTextView)accessibilityBodyLabel;
- (_TtC8AppStore18ExpandableTextView)accessibilityResponseBodyLabel;
- (_TtC8AppStore31ProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31ProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)moreResponseFrom:(id)a3;
- (void)moreReviewFrom:(id)a3;
- (void)prepareForReuse;
@end

@implementation ProductReviewCollectionViewCell

- (_TtC8AppStore31ProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ProductReviewCollectionViewCell *)sub_1003DACF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31ProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView;
  type metadata accessor for ProductReviewView();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];

  result = (_TtC8AppStore31ProductReviewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003DB150();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003DB234();
}

- (void)moreReviewFrom:(id)a3
{
}

- (void)moreResponseFrom:(id)a3
{
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC8AppStore17ProductReviewView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC8AppStore17ProductReviewView_dateLabel));
}

- (_TtC8AppStore10RatingView)accessibilityRatingView
{
  return (_TtC8AppStore10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                              + OBJC_IVAR____TtC8AppStore17ProductReviewView_ratingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC8AppStore17ProductReviewView_authorLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                      + OBJC_IVAR____TtC8AppStore17ProductReviewView_bodyLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                                + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseDateLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView)
                                                                                      + OBJC_IVAR____TtC8AppStore17ProductReviewView_responseBodyLabel));
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31ProductReviewCollectionViewCell_reviewsView);
}

@end