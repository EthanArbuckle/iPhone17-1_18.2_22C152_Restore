@interface AppStoreAppRecommendationCollectionViewCell
- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation AppStoreAppRecommendationCollectionViewCell

- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell *)sub_100404DBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppStoreAppRecommendationCollectionViewCell();
  v2 = (char *)v5.receiver;
  [(AppStoreAppRecommendationCollectionViewCell *)&v5 prepareForReuse];
  id v3 = sub_100404B9C();
  [v3 setConstant:46.0];

  id v4 = sub_100404BB0();
  [v4 setConstant:46.0];

  [*(id *)&v2[OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_iconImageView] setImage:0];
}

- (_TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100405F98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell_chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell____lazy_storage___imageViewWidthConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp43AppStoreAppRecommendationCollectionViewCell____lazy_storage___imageViewHeightConstraint);
}

@end