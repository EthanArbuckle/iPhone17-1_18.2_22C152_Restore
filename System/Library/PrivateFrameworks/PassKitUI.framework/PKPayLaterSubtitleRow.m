@interface PKPayLaterSubtitleRow
- (BOOL)excludeFromScreenCapture;
- (BOOL)hideDisclosure;
- (BOOL)isEqual:(id)a3;
- (BOOL)selected;
- (BOOL)shouldHighlightItem;
- (BOOL)showSpinner;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)axID;
- (NSString)subtitle;
- (NSString)title;
- (PKPayLaterSubtitleRow)initWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImage)titleIcon;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setAxID:(id)a3;
- (void)setExcludeFromScreenCapture:(BOOL)a3;
- (void)setHideDisclosure:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleIcon:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation PKPayLaterSubtitleRow

- (PKPayLaterSubtitleRow)initWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterSubtitleRow;
  v12 = [(PKPayLaterSubtitleRow *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
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
  if (self->_subtitle) {
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
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterSubtitleRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    if (self->_title) {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_title];
    }
    else {
      v5 = 0;
    }
    if (self->_titleIcon)
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EF1B5B50];
      id v7 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      [v7 setImage:self->_titleIcon];
      v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
      [v6 appendAttributedString:v8];
      if (v5) {
        [v6 appendAttributedString:v5];
      }
    }
    else
    {
      id v6 = v5;
    }
    id v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    [v9 setAttributedText:v6];
    [v9 setSecondaryText:self->_subtitle];
    id v10 = [v9 textProperties];
    id v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v10 setColor:v11];

    if (self->_titleFont)
    {
      v12 = [v9 textProperties];
      [v12 setFont:self->_titleFont];
    }
    if (self->_titleTextColor)
    {
      v13 = [v9 textProperties];
      [v13 setColor:self->_titleTextColor];
    }
    uint64_t v14 = [v9 secondaryTextProperties];
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [v14 setColor:v15];

    if (self->_subtitleFont)
    {
      v16 = [v9 secondaryTextProperties];
      [v16 setFont:self->_subtitleFont];
    }
    if (self->_subtitleTextColor)
    {
      objc_super v17 = [v9 secondaryTextProperties];
      [v17 setColor:self->_subtitleTextColor];
    }
    objc_msgSend(v9, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
    if (self->_showSpinner)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4FB1400]);
      [v18 startAnimating];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v18 placement:1];
      v26[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    }
    else
    {
      if (self->_selected)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
        id v25 = v18;
        v21 = (void *)MEMORY[0x1E4F1C978];
        v22 = &v25;
      }
      else
      {
        if (!self->_selectionHandler || self->_hideDisclosure)
        {
          v20 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_24;
        }
        id v18 = objc_alloc_init(MEMORY[0x1E4FB1518]);
        id v24 = v18;
        v21 = (void *)MEMORY[0x1E4F1C978];
        v22 = &v24;
      }
      v20 = objc_msgSend(v21, "arrayWithObjects:count:", v22, 1, v24, v25);
    }

LABEL_24:
    [v4 setAccessories:v20];
    [v4 setContentConfiguration:v9];
    v23 = [v4 contentView];
    objc_msgSend(v23, "pkui_setExcludedFromScreenCapture:andBroadcasting:", self->_excludeFromScreenCapture, self->_excludeFromScreenCapture);

    [v4 setAccessibilityIdentifier:self->_axID];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_subtitle];
  [v3 safelyAddObject:self->_titleFont];
  [v3 safelyAddObject:self->_subtitleFont];
  [v3 safelyAddObject:self->_titleTextColor];
  [v3 safelyAddObject:self->_subtitleTextColor];
  [v3 safelyAddObject:self->_titleIcon];
  id v4 = _Block_copy(self->_selectionHandler);
  [v3 safelyAddObject:v4];

  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterSubtitleRow *)a3;
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
        id v6 = v5;
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
            goto LABEL_30;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_31;
          }
        }
        subtitle = v6->_subtitle;
        v8 = self->_subtitle;
        v13 = subtitle;
        if (v8 == v13)
        {
        }
        else
        {
          id v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_30;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_31;
          }
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects()
          || !PKEqualObjects())
        {
          LOBYTE(v11) = 0;
LABEL_31:

          goto LABEL_32;
        }
        v8 = (NSString *)_Block_copy(self->_selectionHandler);
        id v10 = _Block_copy(v6->_selectionHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && self->_showSpinner == v6->_showSpinner
                   && self->_excludeFromScreenCapture == v6->_excludeFromScreenCapture
                   && self->_selected == v6->_selected
                   && self->_hideDisclosure == v6->_hideDisclosure;
LABEL_30:

        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_32:

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

- (UIImage)titleIcon
{
  return self->_titleIcon;
}

- (void)setTitleIcon:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
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

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void)setHideDisclosure:(BOOL)a3
{
  self->_hideDisclosure = a3;
}

- (BOOL)excludeFromScreenCapture
{
  return self->_excludeFromScreenCapture;
}

- (void)setExcludeFromScreenCapture:(BOOL)a3
{
  self->_excludeFromScreenCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_axID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleIcon, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_selectionHandler, 0);
}

@end