@interface SKUIEditorialLockupCollectionViewCell
- (SKUIEditorialLockupCellLayout)layout;
- (SKUIEditorialLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureForItem:(id)a3 clientContext:(id)a4;
@end

@implementation SKUIEditorialLockupCollectionViewCell

- (SKUIEditorialLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLockupCollectionViewCell initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialLockupCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [(SKUICellLayout *)[SKUIEditorialLockupCellLayout alloc] initWithCollectionViewCell:v8];
    layout = v8->_layout;
    v8->_layout = v9;
  }
  return v8;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SKUIEditorialLockupCellLayout *)self->_layout lockupCellLayout];
  v9 = [v6 categoryName];
  [v8 setCategoryString:v9];

  v10 = SKUILockupItemCountString(v6, v7);
  [v8 setItemCountString:v10];

  objc_msgSend(v8, "setNumberOfUserRatings:", objc_msgSend(v6, "numberOfUserRatings"));
  v11 = [v6 title];
  [v8 setTitle:v11];

  [v6 userRating];
  *(float *)&double v13 = v12 / 5.0;
  [v8 setUserRating:v13];
  if (!v6)
  {
    [(SKUIEditorialLockupCellLayout *)self->_layout setItemOffer:0];
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if ([v6 itemKind] != 12)
  {
    if (!configureForItem_clientContext__sViewOffer_1)
    {
      v15 = [SKUIItemOffer alloc];
      if (v7) {
        [v7 localizedStringForKey:@"VIEW_BUTTON"];
      }
      else {
      v19 = +[SKUIClientContext localizedStringForKey:@"VIEW_BUTTON" inBundles:0];
      }
      uint64_t v20 = [(SKUIItemOffer *)v15 initWithButtonText:v19];
      v21 = (void *)configureForItem_clientContext__sViewOffer_1;
      configureForItem_clientContext__sViewOffer_1 = v20;
    }
    -[SKUIEditorialLockupCellLayout setItemOffer:](self->_layout, "setItemOffer:");
    v22 = [(SKUIItemCellLayout *)self->_layout itemOfferButton];
    [v22 setUniversal:0];

    goto LABEL_14;
  }
  if ([v6 hasInAppPurchases])
  {
    v14 = [v7 valueForConfigurationKey:@"inappnote"];
  }
  else
  {
    v14 = 0;
  }
  layout = self->_layout;
  v17 = [v6 primaryItemOffer];
  [(SKUIEditorialLockupCellLayout *)layout setItemOffer:v17];

  v18 = [(SKUIItemCellLayout *)self->_layout itemOfferButton];
  objc_msgSend(v18, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v6, "deviceFamilies")));

LABEL_15:
  [(SKUIEditorialLockupCellLayout *)self->_layout setItemOfferNoticeString:v14];
  v23.receiver = self;
  v23.super_class = (Class)SKUIEditorialLockupCollectionViewCell;
  [(SKUIItemCollectionViewCell *)&v23 configureForItem:v6 clientContext:v7];
}

- (SKUIEditorialLockupCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialLockupCollectionViewCell initWithFrame:]";
}

@end