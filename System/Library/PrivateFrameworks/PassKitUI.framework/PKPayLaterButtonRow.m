@interface PKPayLaterButtonRow
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (BOOL)showSpinner;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterButtonRow)initWithTitle:(id)a3 selectionHandler:(id)a4;
- (UIColor)textColor;
- (UIImage)image;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setDisabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKPayLaterButtonRow

- (PKPayLaterButtonRow)initWithTitle:(id)a3 selectionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterButtonRow;
  v8 = [(PKPayLaterButtonRow *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
      title = v9->_title;
      v9->_title = (NSAttributedString *)v10;
    }
    else
    {
      title = v8->_title;
      v8->_title = 0;
    }

    uint64_t v12 = [v7 copy];
    id selectionHandler = v9->_selectionHandler;
    v9->_id selectionHandler = (id)v12;
  }
  return v9;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  title = self->_title;
  if (title)
  {
    id v7 = [(NSAttributedString *)title string];
    [v3 appendString:v7];
  }
  if (self->_disabled) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [NSString stringWithFormat:@"disabled-%@", v8];
  [v3 appendString:v9];

  uint64_t v10 = (void *)[v3 copy];

  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterButtonRow *)self cellClass];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_25;
  }
  if (!self->_title)
  {
    p_image = &self->_image;
    if (!self->_image)
    {
      id v6 = 0;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:self->_title];
  id v6 = (void *)v5;
  p_image = &self->_image;
  if (self->_image)
  {
    if (v5)
    {
LABEL_8:
      id v8 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      [v8 setImage:*p_image];
      v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v6 appendAttributedString:v10];

      [v6 appendAttributedString:v9];
      goto LABEL_9;
    }
LABEL_7:
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EF1B5B50];
    goto LABEL_8;
  }
LABEL_9:
  v11 = [v4 defaultContentConfiguration];
  [v11 setAttributedText:v6];
  if (self->_selectionHandler && !self->_disabled)
  {
    uint64_t v12 = [v11 textProperties];
    v13 = v12;
    if (self->_showSpinner)
    {
      uint64_t v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else
    {
      if (self->_textColor)
      {
        objc_msgSend(v12, "setColor:");
        goto LABEL_17;
      }
      uint64_t v14 = [MEMORY[0x1E4FB1618] linkColor];
    }
    objc_super v15 = (void *)v14;
    [v13 setColor:v14];

LABEL_17:
  }
  [v4 setContentConfiguration:v11];
  BOOL v16 = !self->_disabled && !self->_showSpinner;
  [v4 setUserInteractionEnabled:v16];
  if (self->_showSpinner)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1400]);
    [v17 startAnimating];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v17 placement:1];
    v20[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v4 setAccessories:v19];

LABEL_25:
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_textColor];
  [v3 safelyAddObject:self->_title];
  id v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_image];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterButtonRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (PKEqualObjects() && PKEqualObjects() && PKEqualObjects())
    {
      id v7 = _Block_copy(self->_selectionHandler);
      id v8 = _Block_copy(v6[2]);
      BOOL v9 = PKEqualObjects()
        && self->_disabled == *((unsigned __int8 *)v6 + 25)
        && self->_showSpinner == *((unsigned __int8 *)v6 + 24);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
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

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
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

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end