@interface SUUIItemBrowseTableViewCell
- (SUUIItemBrowseCellLayout)layout;
- (SUUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5;
@end

@implementation SUUIItemBrowseTableViewCell

- (SUUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIItemBrowseTableViewCell;
  v4 = [(SUUITableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [[SUUIItemBrowseCellLayout alloc] initWithTableViewCell:v4];
    layout = v4->_layout;
    v4->_layout = v5;
  }
  return v4;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  layout = self->_layout;
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a5 + 1);
  [(SUUIItemBrowseCellLayout *)layout setIndexNumberString:v11];

  v12 = self->_layout;
  v13 = [v8 primaryItemOffer];
  [(SUUIItemCellLayout *)v12 setItemOffer:v13];

  v14 = [(SUUIItemCellLayout *)self->_layout itemOfferButton];
  objc_msgSend(v14, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SUUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", [v8 numberOfUserRatings]);
  v15 = self->_layout;
  v16 = [v8 title];
  [(SUUIItemBrowseCellLayout *)v15 setTitle:v16];

  v17 = self->_layout;
  [v8 userRating];
  [(SUUIItemBrowseCellLayout *)v17 setUserRating:(float)(v18 / 5.0)];
  if ([v8 hasInAppPurchases])
  {
    v19 = [v9 valueForConfigurationKey:@"inappnote"];
  }
  else
  {
    v19 = 0;
  }
  [(SUUIItemCellLayout *)self->_layout setItemOfferNoticeString:v19];
  uint64_t v20 = [v8 itemKind];
  v21 = self->_layout;
  if (v20 == 17) {
    SUUILockupItemCountString(v8, v9);
  }
  else {
  v22 = [v8 categoryName];
  }
  [(SUUIItemBrowseCellLayout *)v21 setSubtitle:v22];

  v23.receiver = self;
  v23.super_class = (Class)SUUIItemBrowseTableViewCell;
  [(SUUIItemTableViewCell *)&v23 configureForItem:v8 clientContext:v9 rowIndex:a5];
}

- (SUUIItemBrowseCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end