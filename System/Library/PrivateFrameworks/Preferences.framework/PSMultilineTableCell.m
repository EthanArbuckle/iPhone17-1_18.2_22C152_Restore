@interface PSMultilineTableCell
- (UIImage)iconImage;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconImage:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation PSMultilineTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSMultilineTableCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(PSMultilineTableCell *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v5 = [(PSTableCell *)self specifier];
  v6 = (void *)[v4 copy];
  v7 = [v5 objectForKeyedSubscript:@"enabled"];

  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"enabled"];
    int v9 = [v8 BOOLValue];

    uint64_t v10 = v9 ^ 1u;
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v6 setDisabled:v10];
  v11 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
  v12 = [v11 updatedConfigurationForState:v6];

  double v13 = *MEMORY[0x1E4F43BA0];
  v14 = [v12 imageProperties];
  objc_msgSend(v14, "setReservedLayoutSize:", 0.0, v13);

  v15 = [v5 name];
  [v12 setText:v15];

  v16 = [(PSTableCell *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v18 = [(PSTableCell *)self value];
    [v12 setSecondaryText:v18];
  }
  else
  {
    [v12 setSecondaryText:0];
  }
  v19 = [v5 objectForKeyedSubscript:@"useLazyIcons"];

  if (!v19)
  {
    v20 = [v5 objectForKeyedSubscript:@"iconImage"];
    [(PSMultilineTableCell *)self setIconImage:v20];
  }
  v21 = [(PSMultilineTableCell *)self iconImage];
  [v12 setImage:v21];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54__PSMultilineTableCell_updateConfigurationUsingState___block_invoke;
  v34[3] = &unk_1E5C5E2F0;
  id v35 = v4;
  id v22 = v4;
  v23 = [v12 textProperties];
  [v23 setColorTransformer:v34];

  v24 = [(PSMultilineTableCell *)self traitCollection];
  uint64_t v25 = [v24 layoutDirection];

  [(PSMultilineTableCell *)self directionalLayoutMargins];
  double v27 = v26;
  [(PSMultilineTableCell *)self safeAreaInsets];
  if (v25 == 1) {
    double v30 = v29;
  }
  else {
    double v30 = v28;
  }
  double v31 = v27 - v30;
  [v12 directionalLayoutMargins];
  if (v32 < v31)
  {
    [v12 directionalLayoutMargins];
    objc_msgSend(v12, "setDirectionalLayoutMargins:");
  }
  v33 = [v5 identifier];
  [(PSMultilineTableCell *)self setAccessibilityIdentifier:v33];

  [(PSMultilineTableCell *)self setContentConfiguration:v12];
}

id __54__PSMultilineTableCell_updateConfigurationUsingState___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSelected])
  {
    v1 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  else
  {
    v2 = +[PSListController appearance];
    v1 = [v2 textColor];
  }
  return v1;
}

- (void)setIcon:(id)a3
{
  [(PSMultilineTableCell *)self setIconImage:a3];
  [(PSMultilineTableCell *)self setNeedsUpdateConfiguration];
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end