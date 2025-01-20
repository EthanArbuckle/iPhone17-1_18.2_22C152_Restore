@interface SKUIItemBrowseTableViewCell
- (SKUIItemBrowseCellLayout)layout;
- (SKUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5;
@end

@implementation SKUIItemBrowseTableViewCell

- (SKUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemBrowseTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIItemBrowseTableViewCell;
  v7 = [(SKUITableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = [[SKUIItemBrowseCellLayout alloc] initWithTableViewCell:v7];
    layout = v7->_layout;
    v7->_layout = v8;
  }
  return v7;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  layout = self->_layout;
  objc_super v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a5 + 1);
  [(SKUIItemBrowseCellLayout *)layout setIndexNumberString:v11];

  v12 = self->_layout;
  v13 = [v8 primaryItemOffer];
  [(SKUIItemCellLayout *)v12 setItemOffer:v13];

  v14 = [(SKUIItemCellLayout *)self->_layout itemOfferButton];
  objc_msgSend(v14, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SKUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", [v8 numberOfUserRatings]);
  v15 = self->_layout;
  v16 = [v8 title];
  [(SKUIItemBrowseCellLayout *)v15 setTitle:v16];

  v17 = self->_layout;
  [v8 userRating];
  [(SKUIItemBrowseCellLayout *)v17 setUserRating:(float)(v18 / 5.0)];
  if ([v8 hasInAppPurchases])
  {
    v19 = [v9 valueForConfigurationKey:@"inappnote"];
  }
  else
  {
    v19 = 0;
  }
  [(SKUIItemCellLayout *)self->_layout setItemOfferNoticeString:v19];
  uint64_t v20 = [v8 itemKind];
  v21 = self->_layout;
  if (v20 == 17) {
    SKUILockupItemCountString(v8, v9);
  }
  else {
  v22 = [v8 categoryName];
  }
  [(SKUIItemBrowseCellLayout *)v21 setSubtitle:v22];

  v23.receiver = self;
  v23.super_class = (Class)SKUIItemBrowseTableViewCell;
  [(SKUIItemTableViewCell *)&v23 configureForItem:v8 clientContext:v9 rowIndex:a5];
}

- (SKUIItemBrowseCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemBrowseTableViewCell initWithStyle:reuseIdentifier:]";
}

@end