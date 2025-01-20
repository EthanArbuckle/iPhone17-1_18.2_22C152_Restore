@interface SUUIEditorialLockupCellLayout
+ (double)_imagePaddingForArtworkSize:(int64_t)a3;
+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SUUILockupStyle *)a4;
- (BOOL)_isItemOfferButtonHidden;
- (BOOL)_showsItemOfferUnderEditorial;
- (BOOL)isIconImageHidden;
- (SUUILockupItemCellLayout)lockupCellLayout;
- (SUUITextBoxView)textBoxView;
- (UIEdgeInsets)contentInsets;
- (id)_editorialCellLayout;
- (id)_editorialContainerView;
- (id)_lockupView;
- (id)iconImage;
- (id)iconImageView;
- (id)itemOffer;
- (id)itemOfferNoticeString;
- (id)itemState;
- (int64_t)layoutStyle;
- (unint64_t)visibleFields;
- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4;
- (void)layoutForItemOfferChange;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageHidden:(BOOL)a3;
- (void)setItemOffer:(id)a3;
- (void)setItemOfferButtonAppearance:(id)a3;
- (void)setItemOfferNoticeString:(id)a3;
- (void)setItemState:(id)a3 animated:(BOOL)a4;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setVisibleFields:(unint64_t)a3;
@end

@implementation SUUIEditorialLockupCellLayout

+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SUUILockupStyle *)a4
{
  if (!SUUILockupLayoutStyleIsHorizontal(a4->layoutStyle))
  {
    double v7 = SUUILockupImageSizeForLockupSize(a4->artworkSize, 12);
    [a1 _imagePaddingForArtworkSize:a4->artworkSize];
    return a3 - (v7 + v8) + -15.0;
  }
  return a3;
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4
{
  id v13 = a3;
  v6 = [v13 bodyTextLayoutForOrientation:a4];
  double v7 = [v13 linkLayoutForOrientation:a4];
  uint64_t v8 = [v13 titleTextLayoutForOrientation:a4];
  v9 = (void *)v8;
  if (v6 || v7 || v8)
  {
    v10 = [(SUUIEditorialLockupCellLayout *)self _editorialContainerView];
    [v10 setHidden:0];
  }
  else
  {
    [(UIView *)self->_editorialContainerView setHidden:1];
  }
  v11 = [(SUUIEditorialLockupCellLayout *)self _editorialCellLayout];
  [v11 applyEditorialLayout:v13 withOrientation:a4 expanded:1];

  [v13 layoutHeightForOrientation:a4 expanded:1];
  self->_editorialHeight = v12;
  [(SUUICellLayout *)self setNeedsLayout];
}

- (SUUILockupItemCellLayout)lockupCellLayout
{
  v2 = [(SUUIEditorialLockupCellLayout *)self _lockupView];
  v3 = [v2 layout];

  return (SUUILockupItemCellLayout *)v3;
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  v5 = [v4 primaryTextColor];
  offerNoticeTextColor = self->_offerNoticeTextColor;
  self->_offerNoticeTextColor = v5;

  double v7 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  uint64_t v8 = v7;
  if (self->_offerNoticeTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v8 setTextColor:v9];
  }
  v10 = [(SUUIEditorialLockupCellLayout *)self _editorialCellLayout];
  [v10 setColoringWithColorScheme:v4];

  id v11 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v11 setColoringWithColorScheme:v4];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SUUILockupItemCellLayout *)self->_lockupLayout setLayoutStyle:"setLayoutStyle:"];
    BOOL v4 = [(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial];
    lockupLayout = self->_lockupLayout;
    if (v4)
    {
      v6 = [(SUUIItemCellLayout *)self->_lockupLayout itemOffer];
      v19.receiver = self;
      v19.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v19 setItemOffer:v6];

      double v7 = [(SUUIItemCellLayout *)self->_lockupLayout itemOfferNoticeString];
      v18.receiver = self;
      v18.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v18 setItemOfferNoticeString:v7];

      uint64_t v8 = [(SUUIItemCellLayout *)self->_lockupLayout itemState];
      v17.receiver = self;
      v17.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v17 setItemState:v8];

      [(SUUIItemCellLayout *)self->_lockupLayout setItemOffer:0];
      [(SUUIItemCellLayout *)self->_lockupLayout setItemOfferNoticeString:0];
      [(SUUIItemCellLayout *)self->_lockupLayout setItemState:0];
    }
    else
    {
      v9 = [(SUUIEditorialLockupCellLayout *)self itemOffer];
      [(SUUIItemCellLayout *)lockupLayout setItemOffer:v9];

      v10 = self->_lockupLayout;
      id v11 = [(SUUIEditorialLockupCellLayout *)self itemOfferNoticeString];
      [(SUUIItemCellLayout *)v10 setItemOfferNoticeString:v11];

      double v12 = self->_lockupLayout;
      id v13 = [(SUUIEditorialLockupCellLayout *)self itemState];
      [(SUUIItemCellLayout *)v12 setItemState:v13];

      v16.receiver = self;
      v16.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v16 setItemOffer:0];
      v15.receiver = self;
      v15.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v15 setItemOfferNoticeString:0];
      v14.receiver = self;
      v14.super_class = (Class)SUUIEditorialLockupCellLayout;
      [(SUUIItemCellLayout *)&v14 setItemState:0];
    }
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SUUILockupItemCellLayout setVisibleFields:](self->_lockupLayout, "setVisibleFields:");
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (SUUITextBoxView)textBoxView
{
  v2 = [(SUUIEditorialLockupCellLayout *)self _editorialCellLayout];
  v3 = [v2 textBoxView];

  return (SUUITextBoxView *)v3;
}

- (void)layoutSubviews
{
  v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  p_contentInsets = &self->_contentInsets;
  double v9 = v7 - self->_contentInsets.bottom;
  double v10 = v5 - self->_contentInsets.right;
  if (SUUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    id v11 = [(SUUIEditorialLockupCellLayout *)self _editorialContainerView];
    double left = self->_contentInsets.left;
    CGFloat v13 = p_contentInsets->top + -3.0;
    CGFloat v14 = self->_editorialHeight + 17.0;
    double v15 = v10 - left;
    id v49 = v11;
    objc_msgSend(v11, "setFrame:", left, v13, v10 - left, v14);
    objc_super v16 = [(SUUIEditorialLockupCellLayout *)self _editorialCellLayout];
    [v16 layoutSubviews];

    double v17 = self->_contentInsets.left;
    v51.origin.x = left;
    v51.origin.y = v13;
    v51.size.width = v10 - left;
    v51.size.height = v14;
    double MaxY = CGRectGetMaxY(v51);
    double v19 = v9 - self->_contentInsets.bottom - MaxY;
    v20 = [(SUUIEditorialLockupCellLayout *)self _lockupView];
    objc_msgSend(v20, "setFrame:", v17, MaxY, v15, v19);
  }
  else
  {
    id v49 = [(SUUIEditorialLockupCellLayout *)self _lockupView];
    unint64_t v21 = [(SUUILockupItemCellLayout *)self->_lockupLayout lockupSize];
    double v22 = SUUILockupImageSizeForLockupSize(v21, 12);
    double top = p_contentInsets->top;
    double v23 = self->_contentInsets.left;
    CGFloat v25 = v9 - p_contentInsets->top;
    [(id)objc_opt_class() _imagePaddingForArtworkSize:v21];
    CGFloat v27 = v22 + v26;
    objc_msgSend(v49, "setFrame:", v23, top, v27, v25);
    v20 = [(SUUIEditorialLockupCellLayout *)self _editorialContainerView];
    v52.origin.x = v23;
    v52.origin.y = top;
    v52.size.width = v27;
    v52.size.height = v25;
    double v28 = CGRectGetMaxX(v52) + 15.0;
    double v29 = p_contentInsets->top + -3.0;
    double v30 = self->_editorialHeight + 17.0;
    double v31 = v10 - v28;
    objc_msgSend(v20, "setFrame:", v28, v29, v31, v30);
    v32 = [(SUUIEditorialLockupCellLayout *)self _editorialCellLayout];
    [v32 layoutSubviews];

    v33 = [(SUUIItemCellLayout *)self itemOfferButton];
    v34 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
    if ([(SUUIEditorialLockupCellLayout *)self _isItemOfferButtonHidden])
    {
      [v33 setHidden:1];
      [v34 setHidden:1];
    }
    else if (v33)
    {
      [v33 frame];
      double v36 = v35;
      double v38 = v37;
      v53.origin.x = v28;
      v53.origin.y = v29;
      v53.size.width = v31;
      v53.size.height = v30;
      double v39 = CGRectGetMaxY(v53) + 0.0;
      [v33 setHidden:0];
      v40 = [v34 text];
      uint64_t v41 = [v40 length];

      if (v41)
      {
        if (v34)
        {
          objc_msgSend(v34, "sizeThatFits:", v36 + 10.0, 1.79769313e308);
          double v43 = v42;
          double v45 = v44;
          *(float *)&double v42 = (v36 - v42) * 0.5;
          double v46 = v28 + floorf(*(float *)&v42);
          v54.origin.x = v28;
          v54.origin.y = v39;
          v54.size.width = v36;
          v54.size.height = v38;
          CGFloat v47 = CGRectGetMaxY(v54) + 3.0;
          [v34 setHidden:0];
          objc_msgSend(v34, "setFrame:", v46, v47, v43, v45);
          if (self->_offerNoticeTextColor)
          {
            objc_msgSend(v34, "setTextColor:");
          }
          else
          {
            v48 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
            [v34 setTextColor:v48];
          }
        }
      }
      else
      {
        [v34 setHidden:1];
      }
      objc_msgSend(v33, "setFrame:", v28, v39, v36, v38);
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  editorialCellLayout = self->_editorialCellLayout;
  id v5 = a3;
  [(SUUIEditorialCellLayout *)editorialCellLayout setBackgroundColor:v5];
  [(UIView *)self->_editorialContainerView setBackgroundColor:v5];
  [(SUUICellLayoutView *)self->_lockupView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  [(SUUIItemCellLayout *)&v6 setBackgroundColor:v5];
}

- (id)iconImage
{
  return [(SUUIItemCellLayout *)self->_lockupLayout iconImage];
}

- (id)iconImageView
{
  return [(SUUIItemCellLayout *)self->_lockupLayout iconImageView];
}

- (BOOL)isIconImageHidden
{
  return [(SUUIItemCellLayout *)self->_lockupLayout isIconImageHidden];
}

- (id)itemOffer
{
  if ([(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    v3 = [(SUUIItemCellLayout *)&v5 itemOffer];
  }
  else
  {
    v3 = [(SUUIItemCellLayout *)self->_lockupLayout itemOffer];
  }
  return v3;
}

- (id)itemOfferNoticeString
{
  if ([(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    v3 = [(SUUIItemCellLayout *)&v5 itemOfferNoticeString];
  }
  else
  {
    v3 = [(SUUIItemCellLayout *)self->_lockupLayout itemOfferNoticeString];
  }
  return v3;
}

- (id)itemState
{
  if (SUUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    v3 = [(SUUIItemCellLayout *)self->_lockupLayout itemState];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    v3 = [(SUUIItemCellLayout *)&v5 itemState];
  }
  return v3;
}

- (void)layoutForItemOfferChange
{
  id v18 = [(SUUIItemCellLayout *)self itemOfferButton];
  [v18 frame];
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(v18, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  double v12 = v11;
  if (v11 && ([v11 isHidden] & 1) == 0)
  {
    [v12 frame];
    double v14 = v13;
    objc_msgSend(v12, "sizeThatFits:", v8 + 10.0, 1.79769313e308);
    double v16 = v15;
    *(float *)&double v15 = (v8 - v15) * 0.5;
    objc_msgSend(v12, "setFrame:", v4 + floorf(*(float *)&v15), v14, v16, v17);
  }
  objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);
}

- (void)setClientContext:(id)a3
{
  lockupLayout = self->_lockupLayout;
  id v5 = a3;
  [(SUUILockupItemCellLayout *)lockupLayout setClientContext:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  [(SUUICellLayout *)&v6 setClientContext:v5];
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v5 setIconImage:v4];
}

- (void)setIconImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v4 setIconImageHidden:v3];
}

- (void)setItemOffer:(id)a3
{
  id v4 = a3;
  if ([(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIEditorialLockupCellLayout;
    [(SUUIItemCellLayout *)&v6 setItemOffer:v4];
  }
  else
  {
    id v5 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v5 setItemOffer:v4];
  }
}

- (void)setItemOfferButtonAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v5 setItemOfferButtonAppearance:v4];

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  [(SUUIItemCellLayout *)&v6 setItemOfferButtonAppearance:v4];
}

- (void)setItemOfferNoticeString:(id)a3
{
  id v4 = a3;
  if ([(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIEditorialLockupCellLayout;
    [(SUUIItemCellLayout *)&v6 setItemOfferNoticeString:v4];
  }
  else
  {
    id v5 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v5 setItemOfferNoticeString:v4];
  }
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SUUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIEditorialLockupCellLayout;
    [(SUUIItemCellLayout *)&v8 setItemState:v6 animated:v4];
  }
  else
  {
    double v7 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v7 setItemState:v6 animated:v4];
  }
}

- (void)setRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v5 setRestricted:v3];

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  [(SUUIItemCellLayout *)&v6 setRestricted:v3];
}

- (id)_editorialCellLayout
{
  editorialCellLayout = self->_editorialCellLayout;
  if (!editorialCellLayout)
  {
    BOOL v4 = [SUUIEditorialCellLayout alloc];
    id v5 = [(SUUIEditorialLockupCellLayout *)self _editorialContainerView];
    objc_super v6 = [(SUUIEditorialCellLayout *)v4 initWithParentView:v5];
    double v7 = self->_editorialCellLayout;
    self->_editorialCellLayout = v6;

    objc_super v8 = self->_editorialCellLayout;
    double v9 = [(SUUICellLayout *)self parentCellView];
    double v10 = [v9 backgroundColor];
    [(SUUIEditorialCellLayout *)v8 setBackgroundColor:v10];

    -[SUUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    editorialCellLayout = self->_editorialCellLayout;
  }
  return editorialCellLayout;
}

- (id)_editorialContainerView
{
  editorialContainerView = self->_editorialContainerView;
  if (!editorialContainerView)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    id v5 = self->_editorialContainerView;
    self->_editorialContainerView = v4;

    objc_super v6 = self->_editorialContainerView;
    double v7 = [(SUUICellLayout *)self parentCellView];
    objc_super v8 = [v7 backgroundColor];
    [(UIView *)v6 setBackgroundColor:v8];

    double v9 = [(SUUICellLayout *)self contentView];
    [v9 addSubview:self->_editorialContainerView];

    editorialContainerView = self->_editorialContainerView;
  }
  return editorialContainerView;
}

+ (double)_imagePaddingForArtworkSize:(int64_t)a3
{
  double result = 10.0;
  if ((unint64_t)(a3 - 3) < 3) {
    return 15.0;
  }
  return result;
}

- (BOOL)_isItemOfferButtonHidden
{
  if (![(SUUIItemCellLayout *)self displaysItemOfferButton]
    || ([(SUUIEditorialLockupCellLayout *)self visibleFields] & 4) == 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  BOOL v4 = [(SUUIItemCellLayout *)&v6 itemOffer];
  if (v4) {
    BOOL v3 = [(SUUIItemCellLayout *)self isRestricted];
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)_lockupView
{
  lockupView = self->_lockupView;
  if (!lockupView)
  {
    BOOL v4 = objc_alloc_init(SUUICellLayoutView);
    id v5 = self->_lockupView;
    self->_lockupView = v4;

    objc_super v6 = [[SUUILockupItemCellLayout alloc] initWithParentView:self->_lockupView];
    lockupLayout = self->_lockupLayout;
    self->_lockupLayout = v6;

    objc_super v8 = self->_lockupLayout;
    double v9 = [(SUUICellLayout *)self clientContext];
    [(SUUILockupItemCellLayout *)v8 setClientContext:v9];

    [(SUUILockupItemCellLayout *)self->_lockupLayout setLayoutStyle:self->_layoutStyle];
    [(SUUILockupItemCellLayout *)self->_lockupLayout setVisibleFields:self->_visibleFields];
    [(SUUICellLayoutView *)self->_lockupView setLayout:self->_lockupLayout];
    double v10 = self->_lockupView;
    id v11 = [(SUUICellLayout *)self parentCellView];
    double v12 = [v11 backgroundColor];
    [(SUUICellLayoutView *)v10 setBackgroundColor:v12];

    double v13 = [(SUUICellLayout *)self contentView];
    [v13 addSubview:self->_lockupView];

    lockupView = self->_lockupView;
  }
  return lockupView;
}

- (BOOL)_showsItemOfferUnderEditorial
{
  return self->_layoutStyle == 3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
  objc_storeStrong((id *)&self->_offerNoticeTextColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_lockupLayout, 0);
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
}

@end