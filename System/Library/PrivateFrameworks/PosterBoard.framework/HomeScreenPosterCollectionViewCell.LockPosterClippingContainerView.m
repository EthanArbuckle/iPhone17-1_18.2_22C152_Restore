@interface HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView
- (_TtCC11PosterBoard34HomeScreenPosterCollectionViewCellP33_C8A19B11FAAC5FF8675EAB2737D1E84631LockPosterClippingContainerView)initWithCoder:(id)a3;
- (_TtCC11PosterBoard34HomeScreenPosterCollectionViewCellP33_C8A19B11FAAC5FF8675EAB2737D1E84631LockPosterClippingContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView

- (void)layoutSubviews
{
  v2 = self;
  sub_1D33224D4();
}

- (_TtCC11PosterBoard34HomeScreenPosterCollectionViewCellP33_C8A19B11FAAC5FF8675EAB2737D1E84631LockPosterClippingContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView();
  return -[HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC11PosterBoard34HomeScreenPosterCollectionViewCellP33_C8A19B11FAAC5FF8675EAB2737D1E84631LockPosterClippingContainerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView();
  return [(HomeScreenPosterCollectionViewCell.LockPosterClippingContainerView *)&v5 initWithCoder:a3];
}

@end