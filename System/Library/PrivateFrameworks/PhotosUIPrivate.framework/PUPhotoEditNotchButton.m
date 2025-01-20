@interface PUPhotoEditNotchButton
- (NSString)buttonSymbolName;
- (NSString)buttonTitle;
- (PUPhotoEditNotchButton)initWithFrame:(CGRect)a3;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (id)baseConfiguration;
- (id)imageConfiguration;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonSymbolName:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3 fallbackSymbolName:(id)a4;
- (void)updateConfiguration;
@end

@implementation PUPhotoEditNotchButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonSymbolName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)setButtonSymbolName:(id)a3
{
}

- (NSString)buttonSymbolName
{
  return self->_buttonSymbolName;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  [(PUPhotoEditNotchButton *)self setNeedsUpdateConfiguration];
}

- (void)setTitle:(id)a3 fallbackSymbolName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (setTitle_fallbackSymbolName__onceToken != -1) {
    dispatch_once(&setTitle_fallbackSymbolName__onceToken, &__block_literal_global_249);
  }
  if (setTitle_fallbackSymbolName__forceFallback && [v6 length]) {
    id v7 = 0;
  }
  else {
    id v7 = v8;
  }
  [(PUPhotoEditNotchButton *)self setButtonTitle:v7];
  [(PUPhotoEditNotchButton *)self setButtonSymbolName:v6];
  [(PUPhotoEditNotchButton *)self setNeedsUpdateConfiguration];
}

void __54__PUPhotoEditNotchButton_setTitle_fallbackSymbolName___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  setTitle_fallbackSymbolName__forceFallback = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

- (void)updateConfiguration
{
  id v3 = [(PUPhotoEditNotchButton *)self baseConfiguration];
  [(PUPhotoEditNotchButton *)self setConfiguration:v3];
}

- (id)imageConfiguration
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB1830];
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  v4 = [v2 configurationWithFont:v3];

  v5 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
  id v6 = (void *)MEMORY[0x1E4FB1830];
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v9 = [v6 configurationWithPaletteColors:v8];

  v10 = [v4 configurationByApplyingConfiguration:v9];
  v11 = [v10 configurationByApplyingConfiguration:v5];

  return v11;
}

- (id)baseConfiguration
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v3 setCornerStyle:2];
  v4 = [(PUPhotoEditNotchButton *)self buttonTitle];
  if ([v4 length])
  {
  }
  else
  {
    id v8 = [(PUPhotoEditNotchButton *)self buttonSymbolName];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      v10 = [(PUPhotoEditNotchButton *)self imageConfiguration];
      v11 = (void *)MEMORY[0x1E4FB1818];
      v12 = [(PUPhotoEditNotchButton *)self buttonSymbolName];
      v13 = [v11 systemImageNamed:v12 withConfiguration:v10];
      [v3 setImage:v13];

      goto LABEL_16;
    }
  }
  v5 = [(PUPhotoEditNotchButton *)self textColor];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v10 = v7;

  v33[0] = *MEMORY[0x1E4FB06F8];
  v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09B8]];
  v34[0] = v14;
  v33[1] = *MEMORY[0x1E4FB0700];
  char v15 = [(PUPhotoEditNotchButton *)self isEnabled];
  v16 = v10;
  if ((v15 & 1) == 0)
  {
    v16 = [v10 colorWithAlphaComponent:0.4];
  }
  v34[1] = v16;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  if ((v15 & 1) == 0) {

  }
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v18 = [(PUPhotoEditNotchButton *)self buttonTitle];
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = &stru_1F06BE7B8;
  }
  v21 = (void *)[v17 initWithString:v20 attributes:v12];
  [v3 setAttributedTitle:v21];

LABEL_16:
  v22 = +[PUInterfaceManager currentTheme];
  v23 = [(PUPhotoEditNotchButton *)self backgroundColor];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [v22 photoEditingNotchButtonBackgroundColor];
  }
  v26 = v25;

  if (([(PUPhotoEditNotchButton *)self isEnabled] & 1) == 0)
  {
    v27 = [(PUPhotoEditNotchButton *)self backgroundColor];
    if (v27)
    {
      v28 = [(PUPhotoEditNotchButton *)self backgroundColor];
      uint64_t v29 = [v28 colorWithAlphaComponent:0.4];

      v26 = v28;
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4FB1618] systemGray4Color];
    }

    v26 = (void *)v29;
  }
  [v3 setImagePadding:3.0];
  [v3 setButtonSize:2];
  [v3 setTitleLineBreakMode:4];
  [v3 setCornerStyle:4];
  v30 = [v3 background];
  [v30 setBackgroundColor:v26];

  v31 = [(PUPhotoEditNotchButton *)self titleLabel];
  [v31 setAdjustsFontSizeToFitWidth:1];
  [v3 contentInsets];
  objc_msgSend(v3, "setContentInsets:");

  return v3;
}

- (PUPhotoEditNotchButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditNotchButton;
  id v3 = -[PUPhotoEditNotchButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PUPhotoEditNotchButton *)v3 setAutomaticallyUpdatesConfiguration:1];
    [(PUPhotoEditNotchButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(PUPhotoEditNotchButton *)v4 baseConfiguration];
    [(PUPhotoEditNotchButton *)v4 setConfiguration:v5];

    [(PUPhotoEditNotchButton *)v4 setShowsLargeContentViewer:1];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PUPhotoEditNotchButton *)v4 addInteraction:v6];
  }
  return v4;
}

@end