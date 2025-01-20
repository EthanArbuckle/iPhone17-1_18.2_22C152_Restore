@interface SKUIItemRoomTableViewCell
- (SKUIItemBrowseCellLayout)layout;
- (SKUIItemRoomTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5;
@end

@implementation SKUIItemRoomTableViewCell

- (SKUIItemRoomTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemRoomTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIItemRoomTableViewCell;
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
  objc_super v11 = [v8 primaryItemOffer];
  [(SKUIItemCellLayout *)layout setItemOffer:v11];

  v12 = [(SKUIItemCellLayout *)self->_layout itemOfferButton];
  objc_msgSend(v12, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SKUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", [v8 numberOfUserRatings]);
  v13 = self->_layout;
  v14 = [v8 title];
  [(SKUIItemBrowseCellLayout *)v13 setTitle:v14];

  v15 = self->_layout;
  [v8 userRating];
  [(SKUIItemBrowseCellLayout *)v15 setUserRating:(float)(v16 / 5.0)];
  if ([v8 hasInAppPurchases])
  {
    v17 = [v9 valueForConfigurationKey:@"inappnote"];
  }
  else
  {
    v17 = 0;
  }
  [(SKUIItemCellLayout *)self->_layout setItemOfferNoticeString:v17];
  uint64_t v18 = [v8 itemKind];
  v19 = self->_layout;
  if (v18 == 17) {
    SKUILockupItemCountString(v8, v9);
  }
  else {
  v20 = [v8 categoryName];
  }
  [(SKUIItemBrowseCellLayout *)v19 setSubtitle:v20];

  v21.receiver = self;
  v21.super_class = (Class)SKUIItemRoomTableViewCell;
  [(SKUIItemTableViewCell *)&v21 configureForItem:v8 clientContext:v9 rowIndex:a5];
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
  v1 = "-[SKUIItemRoomTableViewCell initWithStyle:reuseIdentifier:]";
}

@end