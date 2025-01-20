@interface PUOutlineCell
- (BOOL)_hasEditSpecificAccessories;
- (BOOL)canBecomeFocused;
- (NSString)text;
- (PUOutlineCellDelegate)delegate;
- (PXNavigationListItem)item;
- (UIImage)image;
- (UIImageView)accessoryImageView;
- (id)_editingConfigurationForState:(unint64_t)a3;
- (int64_t)mediaRequestID;
- (int64_t)style;
- (void)_renameItem:(id)a3 toTitle:(id)a4;
- (void)_updateViewConfigurationsWithState:(unint64_t)a3;
- (void)prepareForReuse;
- (void)setAccessoryImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setItem:(id)a3;
- (void)setMediaRequestID:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation PUOutlineCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setAccessoryImageView:(id)a3
{
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setMediaRequestID:(int64_t)a3
{
  self->_mediaRequestID = a3;
}

- (int64_t)mediaRequestID
{
  return self->_mediaRequestID;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setDelegate:(id)a3
{
}

- (PUOutlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOutlineCellDelegate *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (PXNavigationListItem)item
{
  return self->_item;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)image
{
  return self->_image;
}

- (void)_renameItem:(id)a3 toTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUOutlineCell *)self delegate];
  [v8 outlineCell:self updatedTitle:v6 forItem:v7];
}

- (id)_editingConfigurationForState:(unint64_t)a3
{
  char v3 = a3;
  v5 = [(PUOutlineCell *)self item];
  if ((v3 & 0x10) == 0) {
    goto LABEL_5;
  }
  id v6 = [(PUOutlineCell *)self delegate];
  if (!v6) {
    goto LABEL_6;
  }
  int v7 = [v5 isRenamable];

  if (v7)
  {
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4FB2078]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__PUOutlineCell__editingConfigurationForState___block_invoke;
    v10[3] = &unk_1E5F25E60;
    objc_copyWeak(&v12, &location);
    id v11 = v5;
    id v6 = (void *)[v8 initWithDidEndHandler:v10];
    [v6 setUseTextInputAsLabel:1];
    [v6 setShouldEndHandler:&__block_literal_global_212];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

void __47__PUOutlineCell__editingConfigurationForState___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 proposedReplacementRange];
  uint64_t v5 = v4;
  id v6 = [v12 text];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v12 proposedReplacementText];
    id v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_1F06BE7B8;
    }
    uint64_t v10 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", v3, v5, v9);

    id v6 = (void *)v10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _renameItem:*(void *)(a1 + 32) toTitle:v6];
}

BOOL __47__PUOutlineCell__editingConfigurationForState___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 text];
  uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v4 = [v2 stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PUOutlineCell;
  [(PUOutlineCell *)&v5 prepareForReuse];
  [(PUOutlineCell *)self setItem:0];
  text = self->_text;
  self->_text = 0;

  image = self->_image;
  self->_image = 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)_hasEditSpecificAccessories
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PUOutlineCell *)self accessories];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) displayedState] == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  v64.receiver = self;
  v64.super_class = (Class)PUOutlineCell;
  -[PUOutlineCell _updateViewConfigurationsWithState:](&v64, sel__updateViewConfigurationsWithState_);
  objc_super v5 = [(PUOutlineCell *)self item];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 isExpandable])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1538]);
    [v7 setStyle:2];
    [v6 addObject:v7];
  }
  if ([v5 isReorderable])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1548]);
    [v6 addObject:v8];
  }
  if ([v5 isDeletable])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1508]);
    [v6 addObject:v9];
  }
  long long v10 = [v5 badgeString];
  if ([v10 length])
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v10];
    [v6 addObject:v11];
  }
  v60 = v10;
  uint64_t v12 = [v5 accessoryGlyphImageName];
  if ([v12 length])
  {
    v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v12];
    v14 = [v13 imageWithRenderingMode:2];

    v15 = [(PUOutlineCell *)self accessoryImageView];

    if (v15)
    {
      v16 = [(PUOutlineCell *)self accessoryImageView];
      [v16 setImage:v14];
    }
    else
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v14];
      [(PUOutlineCell *)self setAccessoryImageView:v16];
    }

    v17 = [(PUOutlineCell *)self accessoryImageView];
    [v17 setTintAdjustmentMode:1];

    v18 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v19 = [(PUOutlineCell *)self accessoryImageView];
    [v19 setTintColor:v18];

    v20 = [(PUOutlineCell *)self accessoryImageView];
    [v20 sizeToFit];

    id v21 = objc_alloc(MEMORY[0x1E4FB1500]);
    v22 = [(PUOutlineCell *)self accessoryImageView];
    v23 = (void *)[v21 initWithCustomView:v22 placement:1];

    [v23 setMaintainsFixedSize:1];
    [v6 addObject:v23];
  }
  [(PUOutlineCell *)self setAccessories:v6];
  v24 = [MEMORY[0x1E4FB1948] cellConfiguration];
  v25 = [(PUOutlineCell *)self configurationState];
  v26 = [v24 updatedConfigurationForState:v25];

  v27 = [v26 imageProperties];
  uint64_t v28 = [v27 preferredSymbolConfiguration];

  v29 = [v26 textProperties];
  v30 = [v29 resolvedColor];

  v58 = (void *)v28;
  v59 = v12;
  if (PLIsPhotosAppAnyPlatform())
  {
    v31 = [v26 imageProperties];
    v32 = [(PUOutlineCell *)self tintColor];
    v61 = [v31 resolvedTintColorForTintColor:v32];
  }
  else
  {
    v61 = 0;
  }
  v33 = objc_msgSend(MEMORY[0x1E4FB1FF8], "defaultOutlineCellConfigurationForState:", a3, v5);
  v34 = [(PUOutlineCell *)self _editingConfigurationForState:a3];
  objc_msgSend(v33, "set_textLabelEditingConfiguration:", v34);

  text = self->_text;
  v36 = [v33 textLabel];
  [v36 setText:text];

  v37 = [v33 textLabel];
  [v37 setTextColor:v30];

  v38 = [(PUOutlineCell *)self traitCollection];
  v39 = [v38 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v39)) {
    uint64_t v40 = 3;
  }
  else {
    uint64_t v40 = 2;
  }
  v41 = [v33 textLabel];
  [v41 setNumberOfLines:v40];

  v42 = [v33 textLabel];
  [v42 setLineBreakMode:4];

  [v33 directionalLayoutMargins];
  double v44 = v43;
  [v33 directionalLayoutMargins];
  objc_msgSend(v33, "setDirectionalLayoutMargins:", 8.0, v44, 8.0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke;
  aBlock[3] = &unk_1E5F2E690;
  id v45 = v6;
  id v63 = v45;
  v46 = _Block_copy(aBlock);
  v47 = v46;
  if ((a3 & 0x10) != 0 && ((*((uint64_t (**)(void *))v46 + 2))(v46) & 1) == 0)
  {
    id v49 = [MEMORY[0x1E4FB1618] _monochromeCellImageTintColor];

    v30 = v61;
    v61 = v49;
    v50 = v57;
    v48 = v58;
    goto LABEL_26;
  }
  v48 = v58;
  if ([(PUOutlineCell *)self style] == 1)
  {
    id v49 = 0;
    v50 = v57;
LABEL_26:

    v30 = v49;
    goto LABEL_27;
  }
  v50 = v57;
LABEL_27:
  v51 = [v33 textLabel];
  [v51 setTextColor:v30];

  v52 = [v33 imageView];
  v53 = [(PUOutlineCell *)self image];
  [v52 setImage:v53];

  v54 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v54 scaledValueForValue:28.0];
  double v56 = v55;

  [v52 setPreferredSymbolConfiguration:v48];
  objc_msgSend(v52, "setReservedLayoutSize:", v56, v56);
  [v52 reservedLayoutSize];
  objc_msgSend(v52, "setMaximumSize:");
  [v52 setCornerRadius:v56 / 9.3];
  [v52 setTintColor:v61];
  [(PUOutlineCell *)self _setContentViewConfiguration:v33];
}

uint64_t __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke()
{
  return PXExists();
}

BOOL __52__PUOutlineCell__updateViewConfigurationsWithState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 displayedState] == 1;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PUOutlineCell *)self _setNeedsConfigurationStateUpdate];
  }
}

- (void)setImage:(id)a3
{
  id v8 = (UIImage *)a3;
  objc_super v5 = self->_image;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(UIImage *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      [(PUOutlineCell *)self _setNeedsConfigurationStateUpdate];
    }
  }
}

- (void)setText:(id)a3
{
  id v8 = (NSString *)a3;
  uint64_t v4 = self->_text;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      text = self->_text;
      self->_text = v6;

      [(PUOutlineCell *)self _setNeedsConfigurationStateUpdate];
    }
  }
}

@end