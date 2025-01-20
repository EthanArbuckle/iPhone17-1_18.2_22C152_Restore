@interface PKAccountPromotionCollectionViewCell
- (BOOL)configureWithPromotion:(id)a3 remoteImagePreparer:(id)a4 actionHandler:(id)a5;
- (PKAccountPromotionCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation PKAccountPromotionCollectionViewCell

- (BOOL)configureWithPromotion:(id)a3 remoteImagePreparer:(id)a4 actionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  LOBYTE(self) = PKAccountPromotionCollectionViewCell.configure(promotion:remoteImagePreparer:actionHandler:)(v10, (uint64_t)v11, (uint64_t)sub_19F9806C4, v9);

  swift_release();
  return self & 1;
}

- (PKAccountPromotionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountPromotionCollectionViewCell;
  v3 = -[PKAccountPromotionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKAccountPromotionCollectionViewCell *)v3 layer];
    [v5 setCornerRadius:10.0];

    v6 = PKRewardsHubCellBackgroundColor();
    [(PKAccountPromotionCollectionViewCell *)v4 setBackgroundColor:v6];

    [(PKAccountPromotionCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F858A8]];
  }
  return v4;
}

@end