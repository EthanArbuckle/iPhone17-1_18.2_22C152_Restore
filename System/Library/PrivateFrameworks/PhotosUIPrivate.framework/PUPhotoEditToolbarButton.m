@interface PUPhotoEditToolbarButton
+ (id)buttonForTool:(id)a3 showingLabel:(BOOL)a4 selectionIndicatorType:(int64_t)a5 spec:(id)a6;
+ (id)buttonWithImageNamed:(id)a3 selectedImageNamed:(id)a4 accessibilityLabel:(id)a5 spec:(id)a6;
+ (id)constraintsForSelectionIndicatorType:(int64_t)a3 buttonImageView:(id)a4 selectionIndicator:(id)a5;
+ (id)selectionIndicatorImageForType:(int64_t)a3;
- (BOOL)available;
- (BOOL)isTopToolbarButton;
- (BOOL)selectedGlyphHasHighlightColor;
- (BOOL)usesHierarchicalColor;
- (NSString)selectedGlyphName;
- (NSString)title;
- (NSString)unselectedGlyphName;
- (PUPhotoEditViewControllerSpec)photoEditSpec;
- (UIColor)selectedColor;
- (UIImageView)selectionIndicator;
- (UILabel)toolLabel;
- (id)actionBlock;
- (id)baseConfiguration;
- (id)imageConfigurationForSelectedState:(BOOL)a3;
- (id)imageForState:(unint64_t)a3;
- (id)largeContentImage;
- (id)selectedConfiguration;
- (id)unselectedConfiguration;
- (int64_t)selectionIndicatorType;
- (void)buttonTouchUpAction:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setIsTopToolbarButton:(BOOL)a3;
- (void)setPhotoEditSpec:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSelectedGlyphHasHighlightColor:(BOOL)a3;
- (void)setSelectedGlyphName:(id)a3;
- (void)setSelectionIndicator:(id)a3;
- (void)setSelectionIndicatorType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setToolLabel:(id)a3;
- (void)setUnselectedGlyphName:(id)a3;
- (void)setUsesHierarchicalColor:(BOOL)a3;
- (void)updateConfiguration;
@end

@implementation PUPhotoEditToolbarButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_selectionIndicator, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_toolLabel, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

- (void)setPhotoEditSpec:(id)a3
{
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (void)setSelectionIndicatorType:(int64_t)a3
{
  self->_selectionIndicatorType = a3;
}

- (int64_t)selectionIndicatorType
{
  return self->_selectionIndicatorType;
}

- (void)setUsesHierarchicalColor:(BOOL)a3
{
  self->_usesHierarchicalColor = a3;
}

- (BOOL)usesHierarchicalColor
{
  return self->_usesHierarchicalColor;
}

- (void)setSelectionIndicator:(id)a3
{
}

- (UIImageView)selectionIndicator
{
  return self->_selectionIndicator;
}

- (void)setSelectedGlyphName:(id)a3
{
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (void)setUnselectedGlyphName:(id)a3
{
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)available
{
  return self->_available;
}

- (void)setSelectedColor:(id)a3
{
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedGlyphHasHighlightColor:(BOOL)a3
{
  self->_selectedGlyphHasHighlightColor = a3;
}

- (BOOL)selectedGlyphHasHighlightColor
{
  return self->_selectedGlyphHasHighlightColor;
}

- (void)setIsTopToolbarButton:(BOOL)a3
{
  self->_isTopToolbarButton = a3;
}

- (BOOL)isTopToolbarButton
{
  return self->_isTopToolbarButton;
}

- (void)setToolLabel:(id)a3
{
}

- (UILabel)toolLabel
{
  return self->_toolLabel;
}

- (void)setActionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (id)largeContentImage
{
  v3 = [(PUPhotoEditToolbarButton *)self imageConfigurationForSelectedState:0];
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [(PUPhotoEditToolbarButton *)self unselectedGlyphName];
  v6 = [v4 _systemImageNamed:v5 withConfiguration:v3];

  return v6;
}

- (id)imageForState:(unint64_t)a3
{
  v3 = [(PUPhotoEditToolbarButton *)self imageView];
  v4 = [v3 image];

  return v4;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
  [(PUPhotoEditToolbarButton *)self setNeedsUpdateConfiguration];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditToolbarButton;
  -[PUPhotoEditToolbarButton setSelected:](&v7, sel_setSelected_);
  double v5 = (double)v3;
  v6 = [(PUPhotoEditToolbarButton *)self selectionIndicator];
  [v6 setAlpha:v5];
}

- (void)buttonTouchUpAction:(id)a3
{
  v4 = [(PUPhotoEditToolbarButton *)self actionBlock];

  if (v4)
  {
    double v5 = [(PUPhotoEditToolbarButton *)self actionBlock];
    v5[2](v5, self);
  }
}

- (void)updateConfiguration
{
  if ([(PUPhotoEditToolbarButton *)self isSelected]) {
    [(PUPhotoEditToolbarButton *)self selectedConfiguration];
  }
  else {
  id v9 = [(PUPhotoEditToolbarButton *)self unselectedConfiguration];
  }
  BOOL v3 = [(PUPhotoEditToolbarButton *)self toolLabel];

  if (v3)
  {
    if ([(PUPhotoEditToolbarButton *)self isEnabled]
      && [(PUPhotoEditToolbarButton *)self available])
    {
      if ([(PUPhotoEditToolbarButton *)self isSelected])
      {
        v4 = [MEMORY[0x1E4FB1618] labelColor];
        int v5 = 0;
        int v6 = 0;
        int v7 = 1;
      }
      else
      {
        v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        int v7 = 0;
        int v6 = 0;
        int v5 = 1;
      }
    }
    else
    {
      v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      int v7 = 0;
      int v5 = 0;
      int v6 = 1;
    }
    v8 = [(PUPhotoEditToolbarButton *)self toolLabel];
    [v8 setTextColor:v4];

    if (v6)
    {

      if (!v5)
      {
LABEL_12:
        if (!v7) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else if (!v5)
    {
      goto LABEL_12;
    }

    if (v7) {
LABEL_13:
    }
  }
LABEL_14:
  [(PUPhotoEditToolbarButton *)self setConfiguration:v9];
}

- (id)unselectedConfiguration
{
  BOOL v3 = [(PUPhotoEditToolbarButton *)self baseConfiguration];
  v4 = [(PUPhotoEditToolbarButton *)self unselectedGlyphName];

  if (v4)
  {
    int v5 = [(PUPhotoEditToolbarButton *)self imageConfigurationForSelectedState:0];
    int v6 = (void *)MEMORY[0x1E4FB1818];
    int v7 = [(PUPhotoEditToolbarButton *)self unselectedGlyphName];
    v8 = [v6 _systemImageNamed:v7 withConfiguration:v5];
    [v3 setImage:v8];
  }
  return v3;
}

- (id)selectedConfiguration
{
  BOOL v3 = [(PUPhotoEditToolbarButton *)self baseConfiguration];
  v4 = [(PUPhotoEditToolbarButton *)self imageConfigurationForSelectedState:1];
  int v5 = (void *)MEMORY[0x1E4FB1818];
  int v6 = [(PUPhotoEditToolbarButton *)self selectedGlyphName];
  int v7 = v6;
  if (!v6)
  {
    int v7 = [(PUPhotoEditToolbarButton *)self unselectedGlyphName];
  }
  v8 = [v5 _systemImageNamed:v7 withConfiguration:v4];
  [v3 setImage:v8];

  if (!v6) {
  return v3;
  }
}

- (id)imageConfigurationForSelectedState:(BOOL)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  int v5 = +[PUInterfaceManager currentTheme];
  int v6 = (void *)MEMORY[0x1E4FB1830];
  if ([(PUPhotoEditToolbarButton *)self isTopToolbarButton]) {
    [v5 topToolbarToolButtonGlyphSize];
  }
  else {
    [v5 editToolbarButtonSize];
  }
  int v7 = objc_msgSend(v6, "configurationWithPointSize:");
  v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:4];
  id v9 = [(PUPhotoEditToolbarButton *)self selectedColor];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    if ([(PUPhotoEditToolbarButton *)self selectedGlyphHasHighlightColor]) {
      [v5 photoEditingToolbarMainButtonColor];
    }
    else {
    id v11 = [MEMORY[0x1E4FB1618] labelColor];
    }
  }
  v12 = v11;

  if ([(PUPhotoEditToolbarButton *)self isEnabled]
    && [(PUPhotoEditToolbarButton *)self available])
  {
    if (a3)
    {
      id v13 = v12;
    }
    else
    {
      id v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  v14 = v13;
  BOOL v15 = [(PUPhotoEditToolbarButton *)self usesHierarchicalColor];
  v16 = (void *)MEMORY[0x1E4FB1830];
  if (v15)
  {
    v17 = [MEMORY[0x1E4FB1830] configurationWithHierarchicalColor:v14];
  }
  else
  {
    v22[0] = v14;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v17 = [v16 configurationWithPaletteColors:v18];
  }
  v19 = [v7 configurationByApplyingConfiguration:v17];
  v20 = [v19 configurationByApplyingConfiguration:v8];

  return v20;
}

- (id)baseConfiguration
{
  BOOL v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v3 setButtonSize:2];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBaseBackgroundColor:v4];

  [v3 setTitleLineBreakMode:4];
  [v3 contentInsets];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(PUPhotoEditToolbarButton *)self photoEditSpec];
  if ([v9 shouldUseCompactToolbarSpacing]) {
    double v10 = 3.0;
  }
  else {
    double v10 = 9.0;
  }

  objc_msgSend(v3, "setContentInsets:", v6, v10, v8, v10);
  id v11 = [(PUPhotoEditToolbarButton *)self toolLabel];

  if (v11)
  {
    [v3 contentInsets];
    objc_msgSend(v3, "setContentInsets:");
  }
  return v3;
}

+ (id)constraintsForSelectionIndicatorType:(int64_t)a3 buttonImageView:(id)a4 selectionIndicator:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  switch(a3)
  {
    case 3:
      double v10 = [v8 centerYAnchor];
      id v11 = [v7 centerYAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v19[0] = v12;
      id v13 = [v9 rightAnchor];
      v14 = [v7 leftAnchor];
      BOOL v15 = [v13 constraintEqualToAnchor:v14 constant:-4.0];
      v19[1] = v15;
      v16 = v19;
      goto LABEL_7;
    case 2:
      double v10 = [v8 centerYAnchor];
      id v11 = [v7 centerYAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v20[0] = v12;
      id v13 = [v9 rightAnchor];
      v14 = [v7 leftAnchor];
      BOOL v15 = [v13 constraintEqualToAnchor:v14 constant:-4.0];
      v20[1] = v15;
      v16 = v20;
      goto LABEL_7;
    case 1:
      double v10 = [v8 centerXAnchor];
      id v11 = [v7 centerXAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v21[0] = v12;
      id v13 = [v9 bottomAnchor];
      v14 = [v7 topAnchor];
      BOOL v15 = [v13 constraintEqualToAnchor:v14 constant:-5.0];
      v21[1] = v15;
      v16 = v21;
LABEL_7:
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

      goto LABEL_9;
  }
  v17 = 0;
LABEL_9:

  return v17;
}

+ (id)selectionIndicatorImageForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", off_1E5F23520[a3 - 1], v3);
  }
  return v5;
}

+ (id)buttonWithImageNamed:(id)a3 selectedImageNamed:(id)a4 accessibilityLabel:(id)a5 spec:(id)a6
{
  id v9 = a5;
  double v10 = (void *)MEMORY[0x1E4FB14D8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 plainButtonConfiguration];
  BOOL v15 = +[PUPhotoEditToolbarButton buttonWithConfiguration:v14 primaryAction:0];
  [v15 setPhotoEditSpec:v11];

  [v15 setIsTopToolbarButton:1];
  v16 = [MEMORY[0x1E4F90858] configurationWithCursorEffect:1];
  objc_msgSend(v15, "setPx_configuration:", v16);

  [v15 setAutomaticallyUpdatesConfiguration:0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setAvailable:1];
  [v15 setUnselectedGlyphName:v13];

  [v15 setSelectedGlyphName:v12];
  [v15 setUsesHierarchicalColor:0];
  [v15 setPointerInteractionEnabled:1];
  if ([v9 length]) {
    [v15 setAccessibilityLabel:v9];
  }
  [v15 updateConfiguration];
  [v15 addTarget:v15 action:sel_buttonTouchUpAction_ forControlEvents:64];

  return v15;
}

+ (id)buttonForTool:(id)a3 showingLabel:(BOOL)a4 selectionIndicatorType:(int64_t)a5 spec:(id)a6
{
  BOOL v8 = a4;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = +[PUInterfaceManager currentTheme];
  v40 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  id v12 = +[PUPhotoEditToolbarButton buttonWithConfiguration:primaryAction:](PUPhotoEditToolbarButton, "buttonWithConfiguration:primaryAction:");
  [v12 setPhotoEditSpec:v10];

  id v13 = [MEMORY[0x1E4F90858] configurationWithCursorEffect:1];
  objc_msgSend(v12, "setPx_configuration:", v13);

  [v12 setAutomaticallyUpdatesConfiguration:0];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v9 localizedName];
  [v12 setTitle:v14];

  objc_msgSend(v12, "setAvailable:", objc_msgSend(v9, "enabled"));
  BOOL v15 = [v9 toolbarIconGlyphName];
  [v12 setUnselectedGlyphName:v15];

  v16 = [v9 selectedToolbarIconGlyphName];
  [v12 setSelectedGlyphName:v16];

  objc_msgSend(v12, "setUsesHierarchicalColor:", objc_msgSend(v9, "toolbarGlyphUsesHierarchicalColor"));
  [v12 setSelectionIndicatorType:a5];
  [v12 setPointerInteractionEnabled:1];
  uint64_t v17 = [v9 toolbarIconAccessibilityLabel];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v9 toolbarIconAccessibilityLabel];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      v21 = [v9 toolbarIconAccessibilityLabel];
      [v12 setAccessibilityLabel:v21];
    }
  }
  objc_msgSend(v12, "setTag:", objc_msgSend(v9, "toolControllerTag"));
  if (v8)
  {
    [v12 setShowsLargeContentViewer:1];
    id v22 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [v12 addInteraction:v22];
  }
  [v12 updateConfiguration];
  if (a5)
  {
    v23 = +[PUPhotoEditToolbarButton selectionIndicatorImageForType:a5];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v23];
    [v12 setSelectionIndicator:v24];
    [v24 setAlpha:0.0];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 addSubview:v24];
    v25 = [v12 imageView];
    v26 = +[PUPhotoEditToolbarButton constraintsForSelectionIndicatorType:a5 buttonImageView:v25 selectionIndicator:v24];
    [v12 addConstraints:v26];
  }
  [v12 addTarget:v12 action:sel_buttonTouchUpAction_ forControlEvents:64];
  if (v8)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v28 = [v11 photoEditingToolbarButtonCompactFont];
    [v27 setFont:v28];

    v29 = [v9 localizedName];
    [v27 setText:v29];

    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setToolLabel:v27];
    [v12 addSubview:v27];
    v38 = [v27 firstBaselineAnchor];
    v39 = [v12 imageView];
    v30 = [v39 bottomAnchor];
    v31 = [v38 constraintEqualToAnchor:v30 constant:12.0];
    v41[0] = v31;
    v32 = [v27 centerXAnchor];
    v33 = [v12 centerXAnchor];
    [v32 constraintEqualToAnchor:v33];
    v35 = v34 = v11;
    v41[1] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [v12 addConstraints:v36];

    id v11 = v34;
  }

  return v12;
}

@end