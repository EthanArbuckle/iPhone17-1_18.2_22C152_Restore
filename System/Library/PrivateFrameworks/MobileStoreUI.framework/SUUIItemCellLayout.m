@interface SUUIItemCellLayout
- (BOOL)_canShowItemOfferNotice;
- (BOOL)_useCloudButtonForItemState:(id)a3;
- (BOOL)displaysItemOfferButton;
- (BOOL)isHighlighted;
- (BOOL)isIconImageHidden;
- (BOOL)isRestricted;
- (BOOL)isSelected;
- (NSString)itemOfferNoticeString;
- (SUUIItemOffer)itemOffer;
- (SUUIItemOfferButton)itemOfferButton;
- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance;
- (SUUIItemState)itemState;
- (UIImage)iconImage;
- (UILabel)itemOfferNoticeLabel;
- (UIView)iconImageView;
- (UIView)removeControlView;
- (id)_parentCollectionViewCell;
- (void)_cancelItemOfferConfirmationAction:(id)a3;
- (void)_getParentTableView:(id *)a3 collectionView:(id *)a4;
- (void)_itemOfferConfirmAction:(id)a3;
- (void)_reloadItemOfferButton:(BOOL)a3;
- (void)_reloadItemOfferVisibility;
- (void)_showItemOfferConfirmationAction:(id)a3;
- (void)dealloc;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)prepareForReuse;
- (void)resetLayout;
- (void)setBackgroundColor:(id)a3;
- (void)setDisplaysItemOfferButton:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageHidden:(BOOL)a3;
- (void)setItemOffer:(id)a3;
- (void)setItemOfferButtonAppearance:(id)a3;
- (void)setItemOfferNoticeString:(id)a3;
- (void)setItemState:(id)a3;
- (void)setItemState:(id)a3 animated:(BOOL)a4;
- (void)setRestricted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SUUIItemCellLayout

- (void)dealloc
{
  [(SUUIItemOfferButton *)self->_itemOfferButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(SUUIItemOfferButton *)self->_itemOfferButton setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemCellLayout;
  [(SUUIItemCellLayout *)&v3 dealloc];
}

- (BOOL)displaysItemOfferButton
{
  return !self->_hidesItemOfferButton;
}

- (UIImage)iconImage
{
  return (UIImage *)[(SUUICellImageView *)self->_iconImageView image];
}

- (NSString)itemOfferNoticeString
{
  return [(UILabel *)self->_itemOfferNoticeLabel text];
}

- (void)resetLayout
{
  [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];
  [(UILabel *)self->_itemOfferNoticeLabel setHidden:1];
  [(SUUICellImageView *)self->_iconImageView removeFromSuperview];
  iconImageView = self->_iconImageView;
  self->_iconImageView = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCellLayout;
  [(SUUICellLayout *)&v4 resetLayout];
}

- (void)setDisplaysItemOfferButton:(BOOL)a3
{
  if (self->_hidesItemOfferButton == a3)
  {
    self->_hidesItemOfferButton = !a3;
    [(SUUIItemCellLayout *)self _reloadItemOfferButton:0];
  }
}

- (void)setIconImage:(id)a3
{
  id v23 = a3;
  id v4 = [(SUUICellImageView *)self->_iconImageView image];

  id v6 = v23;
  if (v4 != v23)
  {
    iconImageView = self->_iconImageView;
    if (!v23)
    {
      [(SUUICellImageView *)iconImageView removeFromSuperview];
      v22 = self->_iconImageView;
      self->_iconImageView = 0;

      goto LABEL_11;
    }
    if (!iconImageView)
    {
      v8 = objc_alloc_init(SUUICellImageView);
      v9 = self->_iconImageView;
      self->_iconImageView = v8;

      v10 = self->_iconImageView;
      v11 = [(SUUICellLayout *)self parentCellView];
      v12 = [v11 backgroundColor];
      [(SUUICellImageView *)v10 setBackgroundColor:v12];

      [(SUUICellImageView *)self->_iconImageView setHidden:[(SUUIItemCellLayout *)self isIconImageHidden]];
      v13 = [(SUUICellLayout *)self contentView];
      [v13 insertSubview:self->_iconImageView atIndex:0];

      iconImageView = self->_iconImageView;
    }
    v14 = [(SUUICellImageView *)iconImageView image];
    [v14 size];
    double v16 = v15;
    double v18 = v17;

    [(SUUICellImageView *)self->_iconImageView setImage:v23];
    uint64_t v5 = [v23 size];
    id v6 = v23;
    if (v16 != v20 || v18 != v19)
    {
      [(SUUICellImageView *)self->_iconImageView sizeToFit];
LABEL_11:
      uint64_t v5 = [(SUUICellLayout *)self setNeedsLayout];
      id v6 = v23;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setIconImageHidden:(BOOL)a3
{
  if (self->_iconImageHidden != a3)
  {
    self->_iconImageHidden = a3;
    -[SUUICellImageView setHidden:](self->_iconImageView, "setHidden:");
  }
}

- (void)setItemOffer:(id)a3
{
  uint64_t v5 = (SUUIItemOffer *)a3;
  if (self->_itemOffer == v5)
  {
    [(SUUIItemCellLayout *)self _reloadItemOfferVisibility];
  }
  else
  {
    objc_storeStrong((id *)&self->_itemOffer, a3);
    [(SUUIItemCellLayout *)self _reloadItemOfferButton:0];
  }
}

- (void)setItemOfferButtonAppearance:(id)a3
{
  uint64_t v5 = (SUUIItemOfferButtonAppearance *)a3;
  if (self->_itemOfferButtonAppearance != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_itemOfferButtonAppearance, a3);
    [(SUUIItemOfferButton *)self->_itemOfferButton setColoringWithAppearance:self->_itemOfferButtonAppearance];
    uint64_t v5 = v6;
  }
}

- (void)setItemOfferNoticeString:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_itemOfferNoticeLabel text];

  id v6 = v16;
  if (v4 != v16)
  {
    itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
    if (v16)
    {
      if (!itemOfferNoticeLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v9 = self->_itemOfferNoticeLabel;
        self->_itemOfferNoticeLabel = v8;

        v10 = self->_itemOfferNoticeLabel;
        v11 = [(SUUICellLayout *)self parentCellView];
        v12 = [v11 backgroundColor];
        [(UILabel *)v10 setBackgroundColor:v12];

        v13 = self->_itemOfferNoticeLabel;
        v14 = [MEMORY[0x263F81708] systemFontOfSize:7.0];
        [(UILabel *)v13 setFont:v14];

        [(UILabel *)self->_itemOfferNoticeLabel setNumberOfLines:3];
        [(UILabel *)self->_itemOfferNoticeLabel setTextAlignment:1];
        double v15 = [(SUUICellLayout *)self contentView];
        [v15 addSubview:self->_itemOfferNoticeLabel];

        itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
      }
      [(UILabel *)itemOfferNoticeLabel setText:v16];
      [(UILabel *)self->_itemOfferNoticeLabel setHidden:[(SUUIItemCellLayout *)self _canShowItemOfferNotice] ^ 1];
      uint64_t v5 = [(SUUICellLayout *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)itemOfferNoticeLabel setHidden:1];
      uint64_t v5 = [(UILabel *)self->_itemOfferNoticeLabel setText:0];
    }
    id v6 = v16;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setItemState:(id)a3
{
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  if (self->_itemState == a3)
  {
    [(SUUIItemCellLayout *)self _reloadItemOfferVisibility];
  }
  else
  {
    BOOL v5 = a4;
    id v6 = (SUUIItemState *)[a3 copy];
    itemState = self->_itemState;
    self->_itemState = v6;

    [(SUUIItemCellLayout *)self _reloadItemOfferButton:v5];
  }
}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    [(SUUIItemCellLayout *)self _reloadItemOfferButton:0];
  }
}

- (void)prepareForReuse
{
  [(SUUIItemOfferButton *)self->_itemOfferButton removeButtonStateAnimations];
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemCellLayout;
  [(SUUICellLayout *)&v3 prepareForReuse];
}

- (void)setBackgroundColor:(id)a3
{
  iconImageView = self->_iconImageView;
  id v5 = a3;
  [(SUUICellImageView *)iconImageView setBackgroundColor:v5];
  [(SUUIItemOfferButton *)self->_itemOfferButton setBackgroundColor:v5];
  [(UILabel *)self->_itemOfferNoticeLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCellLayout;
  [(SUUICellLayout *)&v6 setBackgroundColor:v5];
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  [(UILabel *)self->_itemOfferNoticeLabel setHidden:[(SUUIItemCellLayout *)self _canShowItemOfferNotice] ^ 1];
  [(SUUIItemCellLayout *)self layoutForItemOfferChange];
}

- (void)_cancelItemOfferConfirmationAction:(id)a3
{
}

- (void)_itemOfferConfirmAction:(id)a3
{
  id v10 = 0;
  id v11 = 0;
  [(SUUIItemCellLayout *)self _getParentTableView:&v11 collectionView:&v10];
  id v4 = v11;
  id v5 = v10;
  objc_super v6 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = [(SUUICellLayout *)self parentCellView];
    [v6 itemTableView:v4 didConfirmItemOfferForTableViewCell:v7];
  }
  v8 = [v5 delegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(SUUIItemCellLayout *)self _parentCollectionViewCell];
    [v8 itemCollectionView:v5 didConfirmItemOfferForCell:v9];
  }
}

- (void)_showItemOfferConfirmationAction:(id)a3
{
  id v4 = [(SUUIItemOfferButton *)self->_itemOfferButton superview];
  [v4 bringSubviewToFront:self->_itemOfferButton];

  itemOfferButton = self->_itemOfferButton;
  [(SUUIItemOfferButton *)itemOfferButton setShowingConfirmation:1 animated:1];
}

- (BOOL)_canShowItemOfferNotice
{
  objc_super v3 = [(UILabel *)self->_itemOfferNoticeLabel text];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    return v5;
  }
  BOOL v5 = [(SUUIItemCellLayout *)self displaysItemOfferButton];
  if (v5)
  {
    if (![(SUUIItemCellLayout *)self isRestricted])
    {
      objc_super v6 = [(SUUIItemCellLayout *)self itemState];
      uint64_t v7 = [v6 state];

      LOBYTE(v5) = (v7 & 0xFFFFFFFFFFFFFFEFLL) == 0;
      return v5;
    }
    goto LABEL_4;
  }
  return v5;
}

- (void)_getParentTableView:(id *)a3 collectionView:(id *)a4
{
  id v14 = [(SUUICellLayout *)self parentCellView];
  uint64_t v6 = [v14 superview];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = 0;
        v9 = v7;
      }
      else
      {
        objc_opt_class();
        v9 = 0;
        id v10 = 0;
        id v11 = 0;
        v8 = v7;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_7;
        }
      }
      id v12 = v7;
      id v10 = v8;
      id v11 = v9;
LABEL_7:
      v13 = [v7 superview];

      if (!v11 && !v10)
      {
        uint64_t v7 = v13;
        if (v13) {
          continue;
        }
      }
      goto LABEL_12;
    }
  }
  id v10 = 0;
  id v11 = 0;
  v13 = 0;
LABEL_12:
  if (a4) {
    *a4 = v10;
  }
  if (a3) {
    *a3 = v11;
  }
}

- (id)_parentCollectionViewCell
{
  v2 = [(SUUICellLayout *)self parentCellView];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_reloadItemOfferButton:(BOOL)a3
{
  if (!self->_itemOffer
    || self->_hidesItemOfferButton
    || (BOOL v4 = a3, [(SUUIItemCellLayout *)self isRestricted]))
  {
    [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];
  }
  else
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton)
    {
      v8 = +[SUUIItemOfferButton itemOfferButtonWithAppearance:self->_itemOfferButtonAppearance];
      v9 = self->_itemOfferButton;
      self->_itemOfferButton = v8;

      [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__cancelItemOfferConfirmationAction_ forControlEvents:0x10000];
      [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__itemOfferConfirmAction_ forControlEvents:0x20000];
      [(SUUIItemOfferButton *)self->_itemOfferButton addTarget:self action:sel__showItemOfferConfirmationAction_ forControlEvents:0x40000];
      id v10 = self->_itemOfferButton;
      id v11 = [(SUUICellLayout *)self parentCellView];
      id v12 = [v11 backgroundColor];
      [(SUUIItemOfferButton *)v10 setBackgroundColor:v12];

      LODWORD(v13) = -0.5;
      [(SUUIItemOfferButton *)self->_itemOfferButton setCharge:v13];
      [(SUUIItemOfferButton *)self->_itemOfferButton setDelegate:self];
      id v14 = [(SUUICellLayout *)self contentView];
      [v14 addSubview:self->_itemOfferButton];

      itemOfferButton = self->_itemOfferButton;
    }
    [(SUUIItemOfferButton *)itemOfferButton setHidden:0];
    double v15 = [(SUUIItemCellLayout *)self itemState];
    id v16 = self->_itemOfferButton;
    itemOffer = self->_itemOffer;
    double v18 = [(SUUICellLayout *)self clientContext];
    BOOL v19 = [(SUUIItemOfferButton *)v16 setValuesUsingItemOffer:itemOffer itemState:v15 clientContext:v18 animated:v4];

    if (v19)
    {
      [(SUUIItemOfferButton *)self->_itemOfferButton sizeToFit];
      [(SUUICellLayout *)self setNeedsLayout];
    }
  }
  itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
  uint64_t v6 = [(SUUIItemCellLayout *)self _canShowItemOfferNotice] ^ 1;
  [(UILabel *)itemOfferNoticeLabel setHidden:v6];
}

- (void)_reloadItemOfferVisibility
{
  BOOL v3 = !self->_itemOffer || self->_hidesItemOfferButton || [(SUUIItemCellLayout *)self isRestricted];
  [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:v3];
  itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
  uint64_t v5 = [(SUUIItemCellLayout *)self _canShowItemOfferNotice] ^ 1;
  [(UILabel *)itemOfferNoticeLabel setHidden:v5];
}

- (BOOL)_useCloudButtonForItemState:(id)a3
{
  return ([a3 state] & 0x2F) == 8;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isIconImageHidden
{
  return self->_iconImageHidden;
}

- (UIView)iconImageView
{
  return &self->_iconImageView->super.super;
}

- (SUUIItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SUUIItemOfferButton)itemOfferButton
{
  return self->_itemOfferButton;
}

- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  return self->_itemOfferButtonAppearance;
}

- (UILabel)itemOfferNoticeLabel
{
  return self->_itemOfferNoticeLabel;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UIView)removeControlView
{
  return self->_removeControlView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeControlView, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferNoticeLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end