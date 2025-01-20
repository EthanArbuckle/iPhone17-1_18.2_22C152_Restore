@interface SKUIEditorialLockupCellLayout
+ (double)_imagePaddingForArtworkSize:(int64_t)a3;
+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SKUILockupStyle *)a4;
- (BOOL)_isItemOfferButtonHidden;
- (BOOL)_showsItemOfferUnderEditorial;
- (BOOL)isIconImageHidden;
- (SKUILockupItemCellLayout)lockupCellLayout;
- (SKUITextBoxView)textBoxView;
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
- (void)iconImage;
- (void)iconImageView;
- (void)isIconImageHidden;
- (void)itemOffer;
- (void)itemOfferNoticeString;
- (void)itemState;
- (void)layoutForItemOfferChange;
- (void)layoutSubviews;
- (void)lockupCellLayout;
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
- (void)textBoxView;
@end

@implementation SKUIEditorialLockupCellLayout

+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SKUILockupStyle *)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  if (!SKUILockupLayoutStyleIsHorizontal(a4->layoutStyle))
  {
    double v15 = SKUILockupImageSizeForLockupSize(a4->artworkSize, 12);
    [a1 _imagePaddingForArtworkSize:a4->artworkSize];
    return a3 - (v15 + v16) + -15.0;
  }
  return a3;
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIEditorialLockupCellLayout applyEditorialLayout:withOrientation:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  double v15 = [v6 bodyTextLayoutForOrientation:a4];
  double v16 = [v6 linkLayoutForOrientation:a4];
  uint64_t v17 = [v6 titleTextLayoutForOrientation:a4];
  v18 = (void *)v17;
  if (v15 || v16 || v17)
  {
    v19 = [(SKUIEditorialLockupCellLayout *)self _editorialContainerView];
    [v19 setHidden:0];
  }
  else
  {
    [(UIView *)self->_editorialContainerView setHidden:1];
  }
  v20 = [(SKUIEditorialLockupCellLayout *)self _editorialCellLayout];
  [v20 applyEditorialLayout:v6 withOrientation:a4 expanded:1];

  [v6 layoutHeightForOrientation:a4 expanded:1];
  self->_editorialHeight = v21;
  [(SKUICellLayout *)self setNeedsLayout];
}

- (SKUILockupItemCellLayout)lockupCellLayout
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 lockupCellLayout];
      }
    }
  }
  uint64_t v11 = [(SKUIEditorialLockupCellLayout *)self _lockupView];
  uint64_t v12 = [v11 layout];

  return (SKUILockupItemCellLayout *)v12;
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 primaryTextColor];
  offerNoticeTextColor = self->_offerNoticeTextColor;
  self->_offerNoticeTextColor = v13;

  double v15 = [(SKUIItemCellLayout *)self itemOfferNoticeLabel];
  double v16 = v15;
  if (self->_offerNoticeTextColor)
  {
    objc_msgSend(v15, "setTextColor:");
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [v16 setTextColor:v17];
  }
  v18 = [(SKUIEditorialLockupCellLayout *)self _editorialCellLayout];
  [v18 setColoringWithColorScheme:v4];

  v19 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v19 setColoringWithColorScheme:v4];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIEditorialLockupCellLayout setContentInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_contentInsets.top;
  if (self->_contentInsets.left != left
    || v16 != top
    || self->_contentInsets.right != right
    || self->_contentInsets.bottom != bottom)
  {
    self->_contentInsets.double top = top;
    self->_contentInsets.double left = left;
    self->_contentInsets.double bottom = bottom;
    self->_contentInsets.double right = right;
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setLayoutStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SKUILockupItemCellLayout *)self->_lockupLayout setLayoutStyle:a3];
    BOOL v13 = [(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial];
    lockupLayout = self->_lockupLayout;
    if (v13)
    {
      uint64_t v15 = [(SKUIItemCellLayout *)self->_lockupLayout itemOffer];
      v28.receiver = self;
      v28.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v28 setItemOffer:v15];

      double v16 = [(SKUIItemCellLayout *)self->_lockupLayout itemOfferNoticeString];
      v27.receiver = self;
      v27.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v27 setItemOfferNoticeString:v16];

      uint64_t v17 = [(SKUIItemCellLayout *)self->_lockupLayout itemState];
      v26.receiver = self;
      v26.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v26 setItemState:v17];

      [(SKUIItemCellLayout *)self->_lockupLayout setItemOffer:0];
      [(SKUIItemCellLayout *)self->_lockupLayout setItemOfferNoticeString:0];
      [(SKUIItemCellLayout *)self->_lockupLayout setItemState:0];
    }
    else
    {
      v18 = [(SKUIEditorialLockupCellLayout *)self itemOffer];
      [(SKUIItemCellLayout *)lockupLayout setItemOffer:v18];

      v19 = self->_lockupLayout;
      v20 = [(SKUIEditorialLockupCellLayout *)self itemOfferNoticeString];
      [(SKUIItemCellLayout *)v19 setItemOfferNoticeString:v20];

      double v21 = self->_lockupLayout;
      v22 = [(SKUIEditorialLockupCellLayout *)self itemState];
      [(SKUIItemCellLayout *)v21 setItemState:v22];

      v25.receiver = self;
      v25.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v25 setItemOffer:0];
      v24.receiver = self;
      v24.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v24 setItemOfferNoticeString:0];
      v23.receiver = self;
      v23.super_class = (Class)SKUIEditorialLockupCellLayout;
      [(SKUIItemCellLayout *)&v23 setItemState:0];
    }
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setVisibleFields:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    [(SKUILockupItemCellLayout *)self->_lockupLayout setVisibleFields:a3];
    [(SKUICellLayout *)self setNeedsLayout];
  }
}

- (SKUITextBoxView)textBoxView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 textBoxView];
      }
    }
  }
  uint64_t v11 = [(SKUIEditorialLockupCellLayout *)self _editorialCellLayout];
  uint64_t v12 = [v11 textBoxView];

  return (SKUITextBoxView *)v12;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIEditorialCellLayout *)self->_editorialCellLayout setBackgroundColor:v4];
  [(UIView *)self->_editorialContainerView setBackgroundColor:v4];
  [(SKUICellLayoutView *)self->_lockupView setBackgroundColor:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLockupCellLayout;
  [(SKUIItemCellLayout *)&v13 setBackgroundColor:v4];
}

- (id)iconImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 iconImage];
      }
    }
  }
  uint64_t v11 = [(SKUIItemCellLayout *)self->_lockupLayout iconImage];

  return v11;
}

- (id)iconImageView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 iconImageView];
      }
    }
  }
  uint64_t v11 = [(SKUIItemCellLayout *)self->_lockupLayout iconImageView];

  return v11;
}

- (BOOL)isIconImageHidden
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 isIconImageHidden];
      }
    }
  }
  return [(SKUIItemCellLayout *)self->_lockupLayout isIconImageHidden];
}

- (id)itemOffer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 itemOffer];
      }
    }
  }
  if ([(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    uint64_t v11 = [(SKUIItemCellLayout *)&v13 itemOffer];
  }
  else
  {
    uint64_t v11 = [(SKUIItemCellLayout *)self->_lockupLayout itemOffer];
  }

  return v11;
}

- (id)itemOfferNoticeString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 itemOfferNoticeString];
      }
    }
  }
  if ([(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    uint64_t v11 = [(SKUIItemCellLayout *)&v13 itemOfferNoticeString];
  }
  else
  {
    uint64_t v11 = [(SKUIItemCellLayout *)self->_lockupLayout itemOfferNoticeString];
  }

  return v11;
}

- (id)itemState
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorialLockupCellLayout *)v3 itemState];
      }
    }
  }
  if (SKUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    uint64_t v11 = [(SKUIItemCellLayout *)self->_lockupLayout itemState];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    uint64_t v11 = [(SKUIItemCellLayout *)&v13 itemState];
  }

  return v11;
}

- (void)layoutForItemOfferChange
{
}

- (void)setClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setClientContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUILockupItemCellLayout *)self->_lockupLayout setClientContext:v4];
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLockupCellLayout;
  [(SKUICellLayout *)&v13 setClientContext:v4];
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setIconImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_super v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v13 setIconImage:v4];
}

- (void)setIconImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setIconImageHidden:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_super v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v13 setIconImageHidden:v3];
}

- (void)setItemOffer:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setItemOffer:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIEditorialLockupCellLayout;
    [(SKUIItemCellLayout *)&v14 setItemOffer:v4];
  }
  else
  {
    objc_super v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v13 setItemOffer:v4];
  }
}

- (void)setItemOfferButtonAppearance:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setItemOfferButtonAppearance:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_super v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v13 setItemOfferButtonAppearance:v4];

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLockupCellLayout;
  [(SKUIItemCellLayout *)&v14 setItemOfferButtonAppearance:v4];
}

- (void)setItemOfferNoticeString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setItemOfferNoticeString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIEditorialLockupCellLayout;
    [(SKUIItemCellLayout *)&v14 setItemOfferNoticeString:v4];
  }
  else
  {
    objc_super v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v13 setItemOfferNoticeString:v4];
  }
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIEditorialLockupCellLayout setItemState:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  if ([(SKUIEditorialLockupCellLayout *)self _showsItemOfferUnderEditorial])
  {
    v16.receiver = self;
    v16.super_class = (Class)SKUIEditorialLockupCellLayout;
    [(SKUIItemCellLayout *)&v16 setItemState:v6 animated:v4];
  }
  else
  {
    uint64_t v15 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
    [v15 setItemState:v6 animated:v4];
  }
}

- (void)setRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorialLockupCellLayout setRestricted:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIEditorialLockupCellLayout *)self lockupCellLayout];
  [v13 setRestricted:v3];

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLockupCellLayout;
  [(SKUIItemCellLayout *)&v14 setRestricted:v3];
}

- (id)_editorialCellLayout
{
  editorialCellLayout = self->_editorialCellLayout;
  if (!editorialCellLayout)
  {
    BOOL v4 = [SKUIEditorialCellLayout alloc];
    BOOL v5 = [(SKUIEditorialLockupCellLayout *)self _editorialContainerView];
    uint64_t v6 = [(SKUIEditorialCellLayout *)v4 initWithParentView:v5];
    uint64_t v7 = self->_editorialCellLayout;
    self->_editorialCellLayout = v6;

    uint64_t v8 = self->_editorialCellLayout;
    uint64_t v9 = [(SKUICellLayout *)self parentCellView];
    uint64_t v10 = [v9 backgroundColor];
    [(SKUIEditorialCellLayout *)v8 setBackgroundColor:v10];

    -[SKUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    editorialCellLayout = self->_editorialCellLayout;
  }

  return editorialCellLayout;
}

- (id)_editorialContainerView
{
  editorialContainerView = self->_editorialContainerView;
  if (!editorialContainerView)
  {
    BOOL v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    BOOL v5 = self->_editorialContainerView;
    self->_editorialContainerView = v4;

    uint64_t v6 = self->_editorialContainerView;
    uint64_t v7 = [(SKUICellLayout *)self parentCellView];
    uint64_t v8 = [v7 backgroundColor];
    [(UIView *)v6 setBackgroundColor:v8];

    uint64_t v9 = [(SKUICellLayout *)self contentView];
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
  if (![(SKUIItemCellLayout *)self displaysItemOfferButton]
    || ([(SKUIEditorialLockupCellLayout *)self visibleFields] & 4) == 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialLockupCellLayout;
  BOOL v4 = [(SKUIItemCellLayout *)&v6 itemOffer];
  if (v4) {
    BOOL v3 = [(SKUIItemCellLayout *)self isRestricted];
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
    BOOL v4 = objc_alloc_init(SKUICellLayoutView);
    BOOL v5 = self->_lockupView;
    self->_lockupView = v4;

    objc_super v6 = [[SKUILockupItemCellLayout alloc] initWithParentView:self->_lockupView];
    lockupLayout = self->_lockupLayout;
    self->_lockupLayout = v6;

    uint64_t v8 = self->_lockupLayout;
    uint64_t v9 = [(SKUICellLayout *)self clientContext];
    [(SKUILockupItemCellLayout *)v8 setClientContext:v9];

    [(SKUILockupItemCellLayout *)self->_lockupLayout setLayoutStyle:self->_layoutStyle];
    [(SKUILockupItemCellLayout *)self->_lockupLayout setVisibleFields:self->_visibleFields];
    [(SKUICellLayoutView *)self->_lockupView setLayout:self->_lockupLayout];
    uint64_t v10 = self->_lockupView;
    uint64_t v11 = [(SKUICellLayout *)self parentCellView];
    uint64_t v12 = [v11 backgroundColor];
    [(SKUICellLayoutView *)v10 setBackgroundColor:v12];

    uint64_t v13 = [(SKUICellLayout *)self contentView];
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

+ (void)editorialWidthForCellWidth:(uint64_t)a3 lockupStyle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyEditorialLayout:(uint64_t)a3 withOrientation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupCellLayout
{
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLayoutStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setVisibleFields:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)textBoxView
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)iconImage
{
}

- (void)iconImageView
{
}

- (void)isIconImageHidden
{
}

- (void)itemOffer
{
}

- (void)itemOfferNoticeString
{
}

- (void)itemState
{
}

- (void)setClientContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIconImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIconImageHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemOffer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemOfferButtonAppearance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemOfferNoticeString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemState:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setRestricted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end