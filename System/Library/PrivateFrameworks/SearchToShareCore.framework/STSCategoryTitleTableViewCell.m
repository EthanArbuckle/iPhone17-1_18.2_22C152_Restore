@interface STSCategoryTitleTableViewCell
- (BOOL)clearButtonHidden;
- (STSCategoryResult)result;
- (STSCategoryTitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (STSCategoryTitleTableViewCellDelegate)selectionDelegate;
- (void)clearButtonPressed:(id)a3;
- (void)setClearButtonHidden:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setSelectionDelegate:(id)a3;
@end

@implementation STSCategoryTitleTableViewCell

- (STSCategoryTitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v29.receiver = self;
  v29.super_class = (Class)STSCategoryTitleTableViewCell;
  v4 = [(STSCategoryTitleTableViewCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v28 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
    v5 = [v28 fontDescriptor];
    v6 = [v5 fontDescriptorWithSymbolicTraits:2];

    v7 = [(STSCategoryTitleTableViewCell *)v4 textLabel];
    v8 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
    [v7 setFont:v8];

    v9 = [(STSCategoryTitleTableViewCell *)v4 textLabel];
    [v9 setAdjustsFontSizeToFitWidth:1];

    v10 = [MEMORY[0x263F824E8] buttonWithType:1];
    v11 = STSLocalizedString(@"CLEAR");
    [(UIButton *)v10 setTitle:v11 forState:0];
    v12 = [(UIButton *)v10 titleLabel];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    [v12 setFont:v13];

    v14 = [(UIButton *)v10 titleLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [MEMORY[0x263F825C8] systemPinkColor];
    [(UIButton *)v10 setTintColor:v15];

    [(UIButton *)v10 addTarget:v4 action:sel_clearButtonPressed_ forControlEvents:64];
    [(UIButton *)v10 setHidden:1];
    [(UIButton *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    clearButton = v4->_clearButton;
    v4->_clearButton = v10;
    v17 = v10;

    [(STSCategoryTitleTableViewCell *)v4 addSubview:v4->_clearButton];
    v18 = [MEMORY[0x263EFF980] array];
    v19 = [(STSCategoryTitleTableViewCell *)v4 readableContentGuide];
    v20 = [(UIButton *)v4->_clearButton centerYAnchor];
    v21 = [(STSCategoryTitleTableViewCell *)v4 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v18 addObject:v22];

    v23 = [(UIButton *)v4->_clearButton trailingAnchor];
    v24 = [(STSCategoryTitleTableViewCell *)v4 contentView];
    v25 = [v24 trailingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:-4.0];
    [v18 addObject:v26];

    [MEMORY[0x263F08938] activateConstraints:v18];
  }
  return v4;
}

- (void)setClearButtonHidden:(BOOL)a3
{
}

- (void)clearButtonPressed:(id)a3
{
  p_selectionDelegate = &self->_selectionDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_selectionDelegate);
  v6 = [(STSCategoryTitleTableViewCell *)self result];
  [WeakRetained clearButton:v5 pressedForCategoryResult:v6];
}

- (STSCategoryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)clearButtonHidden
{
  return self->_clearButtonHidden;
}

- (STSCategoryTitleTableViewCellDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSCategoryTitleTableViewCellDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end