@interface PKPayLaterTileDetailRow
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlightItem;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterTileDetailRow)initWithTitleText:(id)a3 subtitleText:(id)a4 text:(id)a5 detailText:(id)a6 textSubtitle:(id)a7 customView:(id)a8 selectionHandler:(id)a9;
- (unint64_t)accessory;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
- (void)setAccessory:(unint64_t)a3;
@end

@implementation PKPayLaterTileDetailRow

- (PKPayLaterTileDetailRow)initWithTitleText:(id)a3 subtitleText:(id)a4 text:(id)a5 detailText:(id)a6 textSubtitle:(id)a7 customView:(id)a8 selectionHandler:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PKPayLaterTileDetailRow;
  v19 = [(PKPayLaterTileDetailRow *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_titleText, a3);
    objc_storeStrong((id *)&v20->_subtitleText, a4);
    objc_storeStrong((id *)&v20->_text, a5);
    objc_storeStrong((id *)&v20->_detailText, a6);
    objc_storeStrong((id *)&v20->_textSubtitle, a7);
    objc_storeStrong((id *)&v20->_customView, a8);
    uint64_t v21 = objc_msgSend(v18, "copy", v24, v25, v26, v27);
    id selectionHandler = v20->_selectionHandler;
    v20->_id selectionHandler = (id)v21;
  }
  return v20;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_titleText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_subtitleText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_text) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_detailText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_textSubtitle) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = NSString;
  v7 = [NSNumber numberWithUnsignedInteger:self->_accessory];
  v8 = [v6 stringWithFormat:@"%@", v7];
  [v3 appendString:v8];

  v9 = (void *)[v3 copy];

  return (NSCopying *)v9;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v9 = a3;
  [(PKPayLaterTileDetailRow *)self cellClass];
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v9;
  if (isKindOfClass)
  {
    titleText = self->_titleText;
    id v7 = v9;
    [v7 setTitleText:titleText];
    [v7 setSubtitleText:self->_subtitleText];
    [v7 setText:self->_text];
    [v7 setDetailText:self->_detailText];
    [v7 setTextSubtitle:self->_textSubtitle];
    [v7 setCustomView:self->_customView];
    if (self->_selectionHandler) {
      unint64_t accessory = 1;
    }
    else {
      unint64_t accessory = self->_accessory;
    }
    [v7 setAccessory:accessory];

    v5 = v9;
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_titleText];
  [v3 safelyAddObject:self->_subtitleText];
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_detailText];
  [v3 safelyAddObject:self->_detailText];
  [v3 safelyAddObject:self->_textSubtitle];
  [v3 safelyAddObject:self->_customView];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterTileDetailRow *)a3;
  v5 = v4;
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
        titleText = v6->_titleText;
        v8 = self->_titleText;
        id v9 = titleText;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_40;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_41;
          }
        }
        subtitleText = v6->_subtitleText;
        v8 = self->_subtitleText;
        v13 = subtitleText;
        if (v8 == v13)
        {
        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_40;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_41;
          }
        }
        text = v6->_text;
        v8 = self->_text;
        v15 = text;
        if (v8 == v15)
        {
        }
        else
        {
          v10 = v15;
          LOBYTE(v11) = 0;
          if (!v8 || !v15) {
            goto LABEL_40;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v15];

          if (!v11) {
            goto LABEL_41;
          }
        }
        detailText = v6->_detailText;
        v8 = self->_detailText;
        id v17 = detailText;
        if (v8 == v17)
        {
        }
        else
        {
          v10 = v17;
          LOBYTE(v11) = 0;
          if (!v8 || !v17) {
            goto LABEL_40;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v17];

          if (!v11) {
            goto LABEL_41;
          }
        }
        textSubtitle = v6->_textSubtitle;
        v8 = self->_textSubtitle;
        v19 = textSubtitle;
        if (v8 == v19)
        {

LABEL_36:
          v8 = (NSString *)_Block_copy(self->_selectionHandler);
          v10 = _Block_copy(v6->_selectionHandler);
          LOBYTE(v11) = PKEqualObjects()
                     && PKEqualObjects()
                     && self->_accessory == v6->_accessory;
          goto LABEL_40;
        }
        v10 = v19;
        LOBYTE(v11) = 0;
        if (v8 && v19)
        {
          BOOL v11 = [(NSString *)v8 isEqualToString:v19];

          if (!v11) {
            goto LABEL_41;
          }
          goto LABEL_36;
        }
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_42:

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

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(unint64_t)a3
{
  self->_unint64_t accessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_textSubtitle, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);

  objc_storeStrong((id *)&self->_titleText, 0);
}

@end