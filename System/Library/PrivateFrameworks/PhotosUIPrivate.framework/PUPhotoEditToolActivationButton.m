@interface PUPhotoEditToolActivationButton
+ (id)buttonWithTitle:(id)a3;
- (NSString)selectedGlyphName;
- (NSString)title;
- (NSString)unselectedGlyphName;
- (UIButtonConfiguration)overrideButtonConfiguration;
- (UIButtonConfiguration)selectedConfiguration;
- (UIButtonConfiguration)unselectedConfiguration;
- (id)actionBlock;
- (id)baseConfiguration;
- (id)imageConfigurationForSelectedState:(BOOL)a3;
- (id)isSelectedBlock;
- (void)buttonTouchUpAction:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setIsSelectedBlock:(id)a3;
- (void)setOverrideButtonConfiguration:(id)a3;
- (void)setSelectedGlyphName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnselectedGlyphName:(id)a3;
- (void)updateConfiguration;
@end

@implementation PUPhotoEditToolActivationButton

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isSelectedBlock, 0);
  objc_storeStrong((id *)&self->_overrideButtonConfiguration, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setIsSelectedBlock:(id)a3
{
}

- (id)isSelectedBlock
{
  return self->_isSelectedBlock;
}

- (UIButtonConfiguration)overrideButtonConfiguration
{
  return self->_overrideButtonConfiguration;
}

- (void)setActionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (NSString)title
{
  return self->_title;
}

- (void)setOverrideButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overrideButtonConfiguration, a3);
  [(PUPhotoEditToolActivationButton *)self setNeedsUpdateConfiguration];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  [(PUPhotoEditToolActivationButton *)self setNeedsUpdateConfiguration];
}

- (void)setUnselectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphName, a3);
  [(PUPhotoEditToolActivationButton *)self setNeedsUpdateConfiguration];
}

- (void)setSelectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphName, a3);
  [(PUPhotoEditToolActivationButton *)self setNeedsUpdateConfiguration];
}

- (void)buttonTouchUpAction:(id)a3
{
  v4 = [(PUPhotoEditToolActivationButton *)self isSelectedBlock];

  if (!v4) {
    [(PUPhotoEditToolActivationButton *)self setSelected:[(PUPhotoEditToolActivationButton *)self isSelected] ^ 1];
  }
  v5 = [(PUPhotoEditToolActivationButton *)self actionBlock];

  if (v5)
  {
    v6 = [(PUPhotoEditToolActivationButton *)self actionBlock];
    ((void (**)(void, PUPhotoEditToolActivationButton *))v6)[2](v6, self);
  }
  v7 = [(PUPhotoEditToolActivationButton *)self isSelectedBlock];

  if (v7)
  {
    v8 = [(PUPhotoEditToolActivationButton *)self isSelectedBlock];
    [(PUPhotoEditToolActivationButton *)self setSelected:v8[2](v8, self)];
  }
}

- (void)updateConfiguration
{
  if ([(PUPhotoEditToolActivationButton *)self isSelected]) {
    [(PUPhotoEditToolActivationButton *)self selectedConfiguration];
  }
  else {
  id v6 = [(PUPhotoEditToolActivationButton *)self unselectedConfiguration];
  }
  v3 = [(PUPhotoEditToolActivationButton *)self overrideButtonConfiguration];

  if (v3)
  {
    uint64_t v4 = [(PUPhotoEditToolActivationButton *)self overrideButtonConfiguration];

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  [(PUPhotoEditToolActivationButton *)self setConfiguration:v5];
}

- (UIButtonConfiguration)unselectedConfiguration
{
  v3 = [(PUPhotoEditToolActivationButton *)self baseConfiguration];
  uint64_t v4 = +[PUInterfaceManager currentTheme];
  id v5 = [MEMORY[0x1E4FB1498] clearConfiguration];
  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v5 setStrokeColor:v7];

  [v5 setStrokeWidth:1.0];
  [v3 setBackground:v5];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__PUPhotoEditToolActivationButton_unselectedConfiguration__block_invoke;
  v24[3] = &unk_1E5F2AA18;
  id v8 = v4;
  id v25 = v8;
  [v3 setTitleTextAttributesTransformer:v24];
  [v3 contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(PUPhotoEditToolActivationButton *)self unselectedGlyphName];

  if (v17)
  {
    v18 = [(PUPhotoEditToolActivationButton *)self imageConfigurationForSelectedState:0];
    v19 = (void *)MEMORY[0x1E4FB1818];
    v20 = [(PUPhotoEditToolActivationButton *)self unselectedGlyphName];
    v21 = [v19 systemImageNamed:v20 withConfiguration:v18];
    [v3 setImage:v21];

    double v22 = v12 + -6.0;
  }
  else
  {
    double v22 = v12 + -5.0;
  }
  objc_msgSend(v3, "setContentInsets:", v10, v22, v14, v16 + -5.0);

  return (UIButtonConfiguration *)v3;
}

id __58__PUPhotoEditToolActivationButton_unselectedConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  uint64_t v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  id v5 = [*(id *)(a1 + 32) topToolbarToolButtonFont];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (UIButtonConfiguration)selectedConfiguration
{
  v3 = [(PUPhotoEditToolActivationButton *)self baseConfiguration];
  uint64_t v4 = +[PUInterfaceManager currentTheme];
  id v5 = [MEMORY[0x1E4FB1498] clearConfiguration];
  id v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
  [v5 setBackgroundColor:v6];

  [v3 setBackground:v5];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__PUPhotoEditToolActivationButton_selectedConfiguration__block_invoke;
  v23[3] = &unk_1E5F2AA18;
  id v7 = v4;
  id v24 = v7;
  [v3 setTitleTextAttributesTransformer:v23];
  [v3 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(PUPhotoEditToolActivationButton *)self selectedGlyphName];

  if (v16)
  {
    v17 = [(PUPhotoEditToolActivationButton *)self imageConfigurationForSelectedState:1];
    v18 = (void *)MEMORY[0x1E4FB1818];
    v19 = [(PUPhotoEditToolActivationButton *)self selectedGlyphName];
    v20 = [v18 systemImageNamed:v19 withConfiguration:v17];
    [v3 setImage:v20];

    double v21 = v11 + -6.0;
  }
  else
  {
    double v21 = v11 + -5.0;
  }
  objc_msgSend(v3, "setContentInsets:", v9, v21, v13, v15 + -5.0);

  return (UIButtonConfiguration *)v3;
}

id __56__PUPhotoEditToolActivationButton_selectedConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  id v5 = [*(id *)(a1 + 32) topToolbarToolButtonFont];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (id)imageConfigurationForSelectedState:(BOOL)a3
{
  BOOL v3 = a3;
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
  id v6 = [v4 configurationWithFont:v5];

  if (v3) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 4;
  }
  double v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:v7];
  double v9 = (void *)MEMORY[0x1E4FB1830];
  if (v3)
  {
    double v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
    double v11 = [v9 configurationWithHierarchicalColor:v10];
  }
  else
  {
    double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v16[0] = v10;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    double v11 = [v9 configurationWithPaletteColors:v12];
  }
  double v13 = [v6 configurationByApplyingConfiguration:v11];
  double v14 = [v13 configurationByApplyingConfiguration:v8];

  return v14;
}

- (id)baseConfiguration
{
  BOOL v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v3 setCornerStyle:2];
  [v3 setTitle:self->_title];
  [v3 setImagePadding:3.0];
  [v3 setButtonSize:2];
  [v3 setTitleLineBreakMode:4];
  return v3;
}

+ (id)buttonWithTitle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  id v5 = +[PUPhotoEditToolActivationButton buttonWithConfiguration:v4 primaryAction:0];
  id v6 = [MEMORY[0x1E4F90858] configurationWithCursorEffect:2];
  objc_msgSend(v5, "setPx_configuration:", v6);

  [v5 setAutomaticallyUpdatesConfiguration:1];
  uint64_t v7 = (void *)v5[95];
  v5[95] = v3;
  id v8 = v3;

  [v5 addTarget:v5 action:sel_buttonTouchUpAction_ forControlEvents:64];
  double v9 = [v5 heightAnchor];
  double v10 = [v9 constraintEqualToConstant:23.0];
  [v10 setActive:1];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v5;
}

@end