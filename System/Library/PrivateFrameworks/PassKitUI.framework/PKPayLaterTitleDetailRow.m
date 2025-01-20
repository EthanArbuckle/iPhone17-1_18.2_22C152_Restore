@interface PKPayLaterTitleDetailRow
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (BOOL)showSpinner;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)detail;
- (NSString)title;
- (PKPayLaterTitleDetailRow)initWithTitle:(id)a3 detail:(id)a4 selectionHandler:(id)a5;
- (UIColor)detailColor;
- (UIColor)imageTintColor;
- (UIColor)titleColor;
- (UIFont)detailFont;
- (UIFont)titleFont;
- (UIImage)image;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setDetail:(id)a3;
- (void)setDetailColor:(id)a3;
- (void)setDetailFont:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation PKPayLaterTitleDetailRow

- (PKPayLaterTitleDetailRow)initWithTitle:(id)a3 detail:(id)a4 selectionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterTitleDetailRow;
  v12 = [(PKPayLaterTitleDetailRow *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_detail, a4);
    uint64_t v14 = [v11 copy];
    id selectionHandler = v13->_selectionHandler;
    v13->_id selectionHandler = (id)v14;
  }
  return v13;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_title) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_detail) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterTitleDetailRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    [v5 setText:self->_title];
    if (self->_titleFont)
    {
      v6 = [v5 textProperties];
      [v6 setFont:self->_titleFont];
    }
    if (self->_titleColor)
    {
      v7 = [v5 textProperties];
      [v7 setColor:self->_titleColor];
    }
    [v5 setSecondaryText:self->_detail];
    if (self->_detailFont)
    {
      v8 = [v5 secondaryTextProperties];
      [v8 setFont:self->_detailFont];
    }
    if (self->_detailColor)
    {
      id v9 = [v5 secondaryTextProperties];
      [v9 setColor:self->_detailColor];
    }
    if (self->_image)
    {
      objc_msgSend(v5, "setImage:");
      if (self->_imageTintColor)
      {
        id v10 = [v5 imageProperties];
        [v10 setTintColor:self->_imageTintColor];
      }
    }
    [v4 setContentConfiguration:v5];
    if (self->_showSpinner)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB1400]);
      [v11 startAnimating];
      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v11 placement:1];
      v19[0] = v12;
      v13 = (void **)v19;
    }
    else
    {
      if (!self->_selectionHandler)
      {
        objc_super v17 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_18;
      }
      id v14 = objc_alloc(MEMORY[0x1E4FB1838]);
      v15 = PKUIChevronImage();
      id v11 = (id)[v14 initWithImage:v15];

      v16 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v11 setTintColor:v16];

      v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v11 placement:1];
      v18 = v12;
      v13 = &v18;
    }
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

LABEL_18:
    [v4 setAccessories:v17];
    [v4 setUserInteractionEnabled:!self->_showSpinner];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_detail];
  [v3 safelyAddObject:self->_titleFont];
  [v3 safelyAddObject:self->_detailFont];
  [v3 safelyAddObject:self->_titleColor];
  [v3 safelyAddObject:self->_detailColor];
  id v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_image];
  [v3 safelyAddObject:self->_imageTintColor];
  PKCombinedHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterTitleDetailRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        title = v6->_title;
        v8 = self->_title;
        id v9 = title;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_28;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_29;
          }
        }
        detail = v6->_detail;
        v8 = self->_detail;
        v13 = detail;
        if (v8 == v13)
        {
        }
        else
        {
          id v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_28;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_29;
          }
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v8 = (NSString *)_Block_copy(self->_selectionHandler);
        id v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && PKEqualObjects()
                   && PKEqualObjects()
                   && self->_showSpinner == v6->_showSpinner;
LABEL_28:

        goto LABEL_29;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (void)handleCellSelection
{
  id selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2]();
  }
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (void)setDetailFont:(id)a3
{
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (void)setDetailColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_selectionHandler, 0);
}

@end