@interface SearchUIButtonItem
- (BOOL)allowsContextMenu;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOverflowButton;
- (BOOL)showsMenuAsPrimaryAction;
- (BOOL)useDefaultSymbolFillStyle;
- (Class)searchUI_viewControllerClass;
- (SFButtonItem)sfButtonItem;
- (SearchUIButtonItem)initWithSFButtonItem:(id)a3;
- (SearchUIButtonItemDelegate)delegate;
- (id)buttonAppearance;
- (id)command;
- (id)commandForStatus:(unint64_t)a3;
- (id)defaultSymbolNameForCommand;
- (id)fallbackImage;
- (id)image;
- (id)offStateCommand;
- (id)offStateImage;
- (id)offStateTitle;
- (id)onStateCommand;
- (id)onStateImage;
- (id)onStateTitle;
- (id)previewMenu;
- (id)title;
- (unint64_t)hash;
- (unint64_t)status;
- (void)command;
- (void)image;
- (void)setDelegate:(id)a3;
- (void)setIsOverflowButton:(BOOL)a3;
- (void)setSfButtonItem:(id)a3;
- (void)setShowsMenuAsPrimaryAction:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setUseDefaultSymbolFillStyle:(BOOL)a3;
- (void)title;
@end

@implementation SearchUIButtonItem

- (Class)searchUI_viewControllerClass
{
  v3 = [(SearchUIButtonItem *)self sfButtonItem];
  if (v3)
  {
    v4 = [(SearchUIButtonItem *)self sfButtonItem];
    v5 = (objc_class *)(id)objc_msgSend(v4, "searchUI_viewControllerClass");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItem;
    v5 = [(SFButtonItem *)&v7 searchUI_viewControllerClass];
  }

  return v5;
}

- (SearchUIButtonItem)initWithSFButtonItem:(id)a3
{
  v4 = (SearchUIButtonItem *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUIButtonItem;
    v5 = [(SearchUIButtonItem *)&v13 init];
    if (v5)
    {
      [(SearchUIButtonItem *)v5 setUniqueId:[(SearchUIButtonItem *)v4 uniqueId]];
      [(SearchUIButtonItem *)v5 setSfButtonItem:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v4;
        objc_super v7 = [(SearchUIButtonItem *)v6 command];
        [(SearchUIButtonItem *)v5 setCommand:v7];

        v8 = [(SearchUIButtonItem *)v6 image];
        [(SearchUIButtonItem *)v5 setImage:v8];

        v9 = [(SearchUIButtonItem *)v6 title];
        [(SearchUIButtonItem *)v5 setTitle:v9];

        v10 = [(SearchUIButtonItem *)v6 previewButtonItems];

        [(SearchUIButtonItem *)v5 setPreviewButtonItems:v10];
      }
      [(SearchUIButtonItem *)v5 setUseDefaultSymbolFillStyle:1];
    }
    self = v5;
  }
  v11 = v5;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SearchUIButtonItem *)self title];
    objc_super v7 = [v5 title];
    if (v6 == v7)
    {
      int v37 = 0;
    }
    else
    {
      v8 = [(SearchUIButtonItem *)self title];
      v9 = [v5 title];
      int v10 = [v8 isEqual:v9];

      int v37 = v10 ^ 1;
    }

    v12 = [(SearchUIButtonItem *)self image];
    objc_super v13 = [v5 image];
    if (v12 == v13)
    {
      int v17 = 0;
    }
    else
    {
      v14 = [(SearchUIButtonItem *)self image];
      v15 = [v5 image];
      int v16 = [v14 isEqual:v15];

      int v17 = v16 ^ 1;
    }

    v18 = [(SearchUIButtonItem *)self command];
    v19 = [v5 command];
    if (v18 == v19)
    {
      int v23 = 0;
    }
    else
    {
      v20 = [(SearchUIButtonItem *)self command];
      v21 = [v5 command];
      int v22 = [v20 isEqual:v21];

      int v23 = v22 ^ 1;
    }

    v24 = [(SearchUIButtonItem *)self previewButtonItems];
    v25 = [v5 previewButtonItems];
    if (v24 == v25)
    {
      char v29 = 0;
    }
    else
    {
      v26 = [(SearchUIButtonItem *)self previewButtonItems];
      v27 = [v5 previewButtonItems];
      char v28 = [v26 isEqualToArray:v27];

      char v29 = v28 ^ 1;
    }

    BOOL v30 = [(SearchUIButtonItem *)self showsMenuAsPrimaryAction];
    int v31 = [v5 showsMenuAsPrimaryAction];
    char v11 = 0;
    if (((v37 | v17 | v23) & 1) == 0 && (v29 & 1) == 0 && ((v30 ^ v31) & 1) == 0)
    {
      v32 = [(SearchUIButtonItem *)self sfButtonItem];
      v33 = [v5 sfButtonItem];
      if (v32 == v33)
      {
        char v11 = 1;
      }
      else
      {
        v34 = [(SearchUIButtonItem *)self sfButtonItem];
        v35 = [v5 sfButtonItem];
        char v11 = [v34 isEqual:v35];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SearchUIButtonItem *)self title];
  uint64_t v4 = [v3 hash];
  id v5 = [(SearchUIButtonItem *)self image];
  uint64_t v6 = [v5 hash] ^ v4;
  objc_super v7 = [(SearchUIButtonItem *)self command];
  uint64_t v8 = [v7 hash];
  v9 = [(SearchUIButtonItem *)self previewButtonItems];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  char v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SearchUIButtonItem showsMenuAsPrimaryAction](self, "showsMenuAsPrimaryAction"));
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (id)offStateTitle
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 title];
  return v2;
}

- (id)onStateTitle
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 title];
  return v2;
}

- (id)title
{
  unint64_t v3 = [(SearchUIButtonItem *)self status];
  if (v3)
  {
    if (v3 == 1)
    {
      objc_super v4 = [(SearchUIButtonItem *)self onStateTitle];
    }
    else
    {
      id v5 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SearchUIButtonItem title]();
      }

      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = [(SearchUIButtonItem *)self offStateTitle];
  }
  return v4;
}

- (id)defaultSymbolNameForCommand
{
  v2 = +[SearchUICommandHandler handlerForButton:self rowModel:0 environment:0];
  unint64_t v3 = [v2 defaultSymbolName];

  return v3;
}

- (id)offStateImage
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 image];
  return v2;
}

- (id)onStateImage
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItem;
  v2 = [(SearchUIButtonItem *)&v4 image];
  return v2;
}

- (id)image
{
  unint64_t v3 = [(SearchUIButtonItem *)self status];
  if (v3)
  {
    if (v3 == 1)
    {
      objc_super v4 = [(SearchUIButtonItem *)self onStateImage];
    }
    else
    {
      id v5 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SearchUIButtonItem image]();
      }

      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = [(SearchUIButtonItem *)self offStateImage];
  }
  return v4;
}

- (id)fallbackImage
{
  unint64_t v3 = [(SearchUIButtonItem *)self status];
  if (v3)
  {
    if (v3 != 1)
    {
      id v5 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SearchUIButtonItem image]();
      }
      uint64_t v6 = 0;
      goto LABEL_10;
    }
    uint64_t v4 = [(SearchUIButtonItem *)self onStateSymbolName];
  }
  else
  {
    uint64_t v4 = [(SearchUIButtonItem *)self offStateSymbolName];
  }
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [[SearchUISymbolImage alloc] initWithSymbolName:v4];
LABEL_10:

    goto LABEL_12;
  }
  uint64_t v6 = 0;
LABEL_12:
  return v6;
}

- (id)offStateCommand
{
  return [(SearchUIButtonItem *)self commandForStatus:0];
}

- (id)onStateCommand
{
  return [(SearchUIButtonItem *)self commandForStatus:1];
}

- (id)command
{
  unint64_t v3 = [(SearchUIButtonItem *)self status];
  if (v3)
  {
    if (v3 == 1)
    {
      uint64_t v4 = [(SearchUIButtonItem *)self onStateCommand];
    }
    else
    {
      id v5 = SearchUIButtonItemLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SearchUIButtonItem command]();
      }

      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = [(SearchUIButtonItem *)self offStateCommand];
  }
  return v4;
}

- (id)commandForStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItem;
  unint64_t v3 = [(SearchUIButtonItem *)&v5 command];
  return v3;
}

- (id)previewMenu
{
  return 0;
}

- (id)buttonAppearance
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIButtonItem;
  unint64_t v3 = [(SearchUIButtonItem *)&v8 buttonAppearance];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(SearchUIButtonItem *)self sfButtonItem];
    id v5 = [v6 buttonAppearance];
  }
  return v5;
}

- (BOOL)allowsContextMenu
{
  return 1;
}

- (SFButtonItem)sfButtonItem
{
  return self->_sfButtonItem;
}

- (void)setSfButtonItem:(id)a3
{
}

- (BOOL)isOverflowButton
{
  return self->_isOverflowButton;
}

- (void)setIsOverflowButton:(BOOL)a3
{
  self->_isOverflowButton = a3;
}

- (BOOL)showsMenuAsPrimaryAction
{
  return self->_showsMenuAsPrimaryAction;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  self->_showsMenuAsPrimaryAction = a3;
}

- (BOOL)useDefaultSymbolFillStyle
{
  return self->_useDefaultSymbolFillStyle;
}

- (void)setUseDefaultSymbolFillStyle:(BOOL)a3
{
  self->_useDefaultSymbolFillStyle = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (SearchUIButtonItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIButtonItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sfButtonItem, 0);
}

- (void)title
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "Unsupported state for button title: %@", v2, v3, v4, v5, v6);
}

- (void)image
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "Unsupported state for button image: %@", v2, v3, v4, v5, v6);
}

- (void)command
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1E45B5000, v0, v1, "Unsupported state for button command: %@", v2, v3, v4, v5, v6);
}

@end