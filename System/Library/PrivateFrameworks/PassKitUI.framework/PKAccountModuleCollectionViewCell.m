@interface PKAccountModuleCollectionViewCell
- (BOOL)configureWithAccount:(id)a3;
- (PKAccountModuleCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation PKAccountModuleCollectionViewCell

- (BOOL)configureWithAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = PKAccountModuleCollectionViewCell.configure(account:)(v4);

  return self & 1;
}

- (PKAccountModuleCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountModuleCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v5 = [(PKAccountModuleCollectionViewCell *)v3 layer];
    [v5 setCornerRadius:10.0];

    [(PKDashboardCollectionViewCell *)v4 setWantsCustomAppearance:0];
    [(PKDashboardCollectionViewCell *)v4 setWantsDefaultHighlightBehavior:1];
    [(PKDashboardCollectionViewCell *)v4 setMaskType:3];
    [(PKAccountModuleCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85188]];
  }
  return v4;
}

@end