@interface SKUILockupSwooshCollectionViewCell
- (SKUILockupSwooshCellLayout)layout;
- (SKUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureForItem:(id)a3 clientContext:(id)a4;
@end

@implementation SKUILockupSwooshCollectionViewCell

- (SKUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshCollectionViewCell initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUILockupSwooshCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [[SKUILockupSwooshCellLayout alloc] initWithCollectionViewCell:v8];
    layout = v8->_layout;
    v8->_layout = v9;

    [(SKUIItemCellLayout *)v8->_layout setDisplaysItemOfferButton:0];
  }
  return v8;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  layout = self->_layout;
  v9 = [v6 artistName];
  [(SKUILockupSwooshCellLayout *)layout setArtistName:v9];

  v10 = self->_layout;
  v11 = [v6 categoryName];
  [(SKUILockupSwooshCellLayout *)v10 setCategory:v11];

  objc_super v12 = self->_layout;
  v13 = SKUILockupItemCountString(v6, v7);
  [(SKUILockupSwooshCellLayout *)v12 setItemCountString:v13];

  v14 = self->_layout;
  v15 = [v6 title];
  [(SKUILockupSwooshCellLayout *)v14 setTitle:v15];

  v16 = [v6 primaryItemOffer];
  if (!SKUIItemKindIsSoftwareKind([v6 itemKind]))
  {
    v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    if (!configureForItem_clientContext__sViewOffer_0)
    {
      v18 = [SKUIItemOffer alloc];
      if (v7) {
        [v7 localizedStringForKey:@"VIEW_BUTTON"];
      }
      else {
      v19 = +[SKUIClientContext localizedStringForKey:@"VIEW_BUTTON" inBundles:0];
      }
      uint64_t v20 = [(SKUIItemOffer *)v18 initWithButtonText:v19];
      v21 = (void *)configureForItem_clientContext__sViewOffer_0;
      configureForItem_clientContext__sViewOffer_0 = v20;

      v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    }
    id v22 = v17;

    v16 = v22;
  }
  [(SKUILockupSwooshCellLayout *)self->_layout setItemOffer:v16];
  v23.receiver = self;
  v23.super_class = (Class)SKUILockupSwooshCollectionViewCell;
  [(SKUIItemCollectionViewCell *)&v23 configureForItem:v6 clientContext:v7];
}

- (SKUILockupSwooshCellLayout)layout
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
  v1 = "-[SKUILockupSwooshCollectionViewCell initWithFrame:]";
}

@end