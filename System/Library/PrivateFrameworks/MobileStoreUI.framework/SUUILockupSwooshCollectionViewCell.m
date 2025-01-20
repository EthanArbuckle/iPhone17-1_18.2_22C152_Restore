@interface SUUILockupSwooshCollectionViewCell
- (SUUILockupSwooshCellLayout)layout;
- (SUUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureForItem:(id)a3 clientContext:(id)a4;
@end

@implementation SUUILockupSwooshCollectionViewCell

- (SUUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUILockupSwooshCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[SUUILockupSwooshCellLayout alloc] initWithCollectionViewCell:v3];
    layout = v3->_layout;
    v3->_layout = v4;

    [(SUUIItemCellLayout *)v3->_layout setDisplaysItemOfferButton:0];
  }
  return v3;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  layout = self->_layout;
  v9 = [v6 artistName];
  [(SUUILockupSwooshCellLayout *)layout setArtistName:v9];

  v10 = self->_layout;
  v11 = [v6 categoryName];
  [(SUUILockupSwooshCellLayout *)v10 setCategory:v11];

  v12 = self->_layout;
  v13 = SUUILockupItemCountString(v6, v7);
  [(SUUILockupSwooshCellLayout *)v12 setItemCountString:v13];

  v14 = self->_layout;
  v15 = [v6 title];
  [(SUUILockupSwooshCellLayout *)v14 setTitle:v15];

  v16 = [v6 primaryItemOffer];
  if (!SUUIItemKindIsSoftwareKind([v6 itemKind]))
  {
    v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    if (!configureForItem_clientContext__sViewOffer_0)
    {
      v18 = [SUUIItemOffer alloc];
      if (v7) {
        [v7 localizedStringForKey:@"VIEW_BUTTON"];
      }
      else {
      v19 = +[SUUIClientContext localizedStringForKey:@"VIEW_BUTTON" inBundles:0];
      }
      uint64_t v20 = [(SUUIItemOffer *)v18 initWithButtonText:v19];
      v21 = (void *)configureForItem_clientContext__sViewOffer_0;
      configureForItem_clientContext__sViewOffer_0 = v20;

      v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    }
    id v22 = v17;

    v16 = v22;
  }
  [(SUUILockupSwooshCellLayout *)self->_layout setItemOffer:v16];
  v23.receiver = self;
  v23.super_class = (Class)SUUILockupSwooshCollectionViewCell;
  [(SUUIItemCollectionViewCell *)&v23 configureForItem:v6 clientContext:v7];
}

- (SUUILockupSwooshCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end