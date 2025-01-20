@interface PUIStyleFontPickerButton
+ (CGSize)defaultFontPickerButtonSizeUsingSmallerSizing:(BOOL)a3;
+ (Class)fontPickerButtonClassForRole:(id)a3;
- (BOOL)isUsingSmallerSizing;
- (CGSize)cellSize;
- (NSLayoutConstraint)heightCellConstraint;
- (NSLayoutConstraint)widthCellConstraint;
- (NSString)contentText;
- (UIFont)contentFont;
- (void)_refreshHeightConstraint;
- (void)_refreshWidthConstraint;
- (void)configureWithAttributedString:(id)a3;
- (void)configureWithFont:(id)a3 text:(id)a4;
- (void)setContentFont:(id)a3;
- (void)setContentText:(id)a3;
- (void)setHeightCellConstraint:(id)a3;
- (void)setUsingSmallerSizing:(BOOL)a3;
- (void)setWidthCellConstraint:(id)a3;
@end

@implementation PUIStyleFontPickerButton

+ (Class)fontPickerButtonClassForRole:(id)a3
{
  [a3 isEqual:*MEMORY[0x263F5F458]];
  v3 = objc_opt_class();
  return (Class)v3;
}

+ (CGSize)defaultFontPickerButtonSizeUsingSmallerSizing:(BOOL)a3
{
  double v3 = 79.0;
  if (a3) {
    double v3 = 76.0;
  }
  double v4 = 64.0;
  if (a3) {
    double v4 = 62.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)cellSize
{
  double v3 = objc_opt_class();
  BOOL v4 = [(PUIStyleFontPickerButton *)self isUsingSmallerSizing];
  [v3 defaultFontPickerButtonSizeUsingSmallerSizing:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)configureWithFont:(id)a3 text:(id)a4
{
  double v6 = (UIFont *)a3;
  v7 = (NSString *)a4;
  contentFont = self->_contentFont;
  self->_contentFont = v6;
  v9 = v6;

  contentText = self->_contentText;
  self->_contentText = v7;

  [(PUIStyleFontPickerButton *)self _refreshHeightConstraint];
  [(PUIStyleFontPickerButton *)self _refreshWidthConstraint];
}

- (void)configureWithAttributedString:(id)a3
{
  id v4 = a3;
  id v10 = [v4 attributesAtIndex:0 effectiveRange:0];
  double v5 = [v10 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  }
  v8 = v7;

  v9 = [v4 string];

  [(PUIStyleFontPickerButton *)self configureWithFont:v8 text:v9];
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  if (self->_usingSmallerSizing != a3)
  {
    self->_usingSmallerSizing = a3;
    [(PUIStyleFontPickerButton *)self _refreshHeightConstraint];
    [(PUIStyleFontPickerButton *)self _refreshWidthConstraint];
  }
}

- (void)_refreshHeightConstraint
{
  v14[1] = *MEMORY[0x263EF8340];
  double v3 = [(PUIStyleFontPickerButton *)self heightCellConstraint];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08938];
    double v5 = [(PUIStyleFontPickerButton *)self heightCellConstraint];
    v14[0] = v5;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v4 deactivateConstraints:v6];
  }
  id v7 = [(PUIStyleFontPickerButton *)self heightAnchor];
  [(PUIStyleFontPickerButton *)self cellSize];
  v9 = [v7 constraintEqualToConstant:v8];
  [(PUIStyleFontPickerButton *)self setHeightCellConstraint:v9];

  id v10 = (void *)MEMORY[0x263F08938];
  v11 = [(PUIStyleFontPickerButton *)self heightCellConstraint];
  v13 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v10 activateConstraints:v12];
}

- (void)_refreshWidthConstraint
{
  v13[1] = *MEMORY[0x263EF8340];
  double v3 = [(PUIStyleFontPickerButton *)self widthCellConstraint];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08938];
    double v5 = [(PUIStyleFontPickerButton *)self widthCellConstraint];
    v13[0] = v5;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v4 deactivateConstraints:v6];
  }
  id v7 = [(PUIStyleFontPickerButton *)self widthAnchor];
  [(PUIStyleFontPickerButton *)self cellSize];
  double v8 = objc_msgSend(v7, "constraintEqualToConstant:");
  [(PUIStyleFontPickerButton *)self setWidthCellConstraint:v8];

  v9 = (void *)MEMORY[0x263F08938];
  id v10 = [(PUIStyleFontPickerButton *)self widthCellConstraint];
  v12 = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v9 activateConstraints:v11];
}

- (NSLayoutConstraint)widthCellConstraint
{
  return self->_widthCellConstraint;
}

- (void)setWidthCellConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightCellConstraint
{
  return self->_heightCellConstraint;
}

- (void)setHeightCellConstraint:(id)a3
{
}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
}

- (UIFont)contentFont
{
  return self->_contentFont;
}

- (void)setContentFont:(id)a3
{
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFont, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_heightCellConstraint, 0);
  objc_storeStrong((id *)&self->_widthCellConstraint, 0);
}

@end