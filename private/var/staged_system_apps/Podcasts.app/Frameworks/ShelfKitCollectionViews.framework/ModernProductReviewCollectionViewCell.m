@interface ModernProductReviewCollectionViewCell
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDateLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityUsernameLabel;
- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView;
- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)accessibilityReviewMoreButton;
- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tintColorDidChange;
@end

@implementation ModernProductReviewCollectionViewCell

- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell *)sub_2E653C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2E959C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2E7DD4();
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModernProductReviewCollectionViewCell();
  v2 = (char *)v5.receiver;
  [(ModernProductReviewCollectionViewCell *)&v5 tintColorDidChange];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more];
  id v4 = [v2 tintColor];
  [v3 setTitleColor:v4 forState:0];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ModernProductReviewCollectionViewCell();
  id v4 = a3;
  id v5 = v8.receiver;
  id v6 = [(ModernProductReviewCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];
  if (*((unsigned char *)v5 + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_isReviewExpanded) == 1)
  {
    [v5 setNeedsLayout];
    [v5 layoutIfNeeded];
  }

  return v6;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2E8078();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_rating));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_date));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_username));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_body));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_contentBackgroundColor));
  swift_release();
  sub_227880((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_currentPresentation);
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_cellReloadingHandler));

  swift_release();
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_title);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_date);
}

- (_TtC23ShelfKitCollectionViews16ReviewRatingView)accessibilityRatingView
{
  return (_TtC23ShelfKitCollectionViews16ReviewRatingView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_rating);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityUsernameLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_username);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_body);
}

- (_TtC23ShelfKitCollectionViews17DynamicTypeButton)accessibilityReviewMoreButton
{
  return (_TtC23ShelfKitCollectionViews17DynamicTypeButton *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews37ModernProductReviewCollectionViewCell_more);
}

@end