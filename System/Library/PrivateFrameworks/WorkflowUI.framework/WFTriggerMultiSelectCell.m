@interface WFTriggerMultiSelectCell
+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 selectedImage:(id)a4 title:(id)a5 tintColor:(id)a6 selected:(BOOL)a7;
+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 title:(id)a4 tintColor:(id)a5 selected:(BOOL)a6;
- (BOOL)isLeftViewSelected;
- (BOOL)isRightViewSelected;
- (BOOL)singleSelection;
- (NSArray)optionContainers;
- (NSArray)selectedCellViews;
- (UIColor)selectedViewTintColor;
- (UIStackView)stackView;
- (WFTriggerMultiSelectCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFTriggerMultiSelectCellDelegate)delegate;
- (WFTriggerOptionSelectionViewContainer)containerBottom;
- (WFTriggerOptionSelectionViewContainer)containerMiddle;
- (WFTriggerOptionSelectionViewContainer)containerTop;
- (void)configureWithLeftGlyph:(id)a3 leftTitle:(id)a4 leftTintColor:(id)a5 rightGlyph:(id)a6 rightTitle:(id)a7 rightTintColor:(id)a8;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setLeftViewSelected:(BOOL)a3;
- (void)setMultiSelectCellOptionConfigurations:(id)a3;
- (void)setRightViewSelected:(BOOL)a3;
- (void)setSelectedViewTintColor:(id)a3;
- (void)setSingleSelection:(BOOL)a3;
- (void)view:(id)a3 didSelectOptionWithLeftViewCurrentlySelected:(BOOL)a4;
- (void)view:(id)a3 didSelectOptionWithRightViewCurrentlySelected:(BOOL)a4;
@end

@implementation WFTriggerMultiSelectCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBottom, 0);
  objc_storeStrong((id *)&self->_containerMiddle, 0);
  objc_storeStrong((id *)&self->_containerTop, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedViewTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFTriggerOptionSelectionViewContainer)containerBottom
{
  return self->_containerBottom;
}

- (WFTriggerOptionSelectionViewContainer)containerMiddle
{
  return self->_containerMiddle;
}

- (WFTriggerOptionSelectionViewContainer)containerTop
{
  return self->_containerTop;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UIColor)selectedViewTintColor
{
  return self->_selectedViewTintColor;
}

- (void)setSingleSelection:(BOOL)a3
{
  self->_singleSelection = a3;
}

- (BOOL)singleSelection
{
  return self->_singleSelection;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerMultiSelectCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerMultiSelectCellDelegate *)WeakRetained;
}

- (void)setSelectedViewTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedViewTintColor, a3);
  id v5 = a3;
  v6 = [(WFTriggerMultiSelectCell *)self containerTop];
  [v6 setSelectedImageTintColor:v5];

  v7 = [(WFTriggerMultiSelectCell *)self containerMiddle];
  [v7 setSelectedImageTintColor:v5];

  id v8 = [(WFTriggerMultiSelectCell *)self containerBottom];
  [v8 setSelectedImageTintColor:v5];
}

- (void)configureWithLeftGlyph:(id)a3 leftTitle:(id)a4 leftTintColor:(id)a5 rightGlyph:(id)a6 rightTitle:(id)a7 rightTintColor:(id)a8
{
  v31[2] = *MEMORY[0x263EF8340];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_opt_class();
  v21 = [v19 platformImage];

  v22 = [v17 platformColor];

  v23 = [v20 multiSelectCellOptionConfigurationWithImage:v21 title:v18 tintColor:v22 selected:0];

  v31[0] = v23;
  v24 = objc_opt_class();
  v25 = [v16 platformImage];

  v26 = [v14 platformColor];

  v27 = [v24 multiSelectCellOptionConfigurationWithImage:v25 title:v15 tintColor:v26 selected:0];

  v31[1] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  [(WFTriggerMultiSelectCell *)self setMultiSelectCellOptionConfigurations:v28];

  v29 = [(WFTriggerMultiSelectCell *)self containerMiddle];
  [v29 setHidden:1];

  v30 = [(WFTriggerMultiSelectCell *)self containerBottom];
  [v30 setHidden:1];

  [(WFTriggerMultiSelectCell *)self setNeedsLayout];
}

- (void)setMultiSelectCellOptionConfigurations:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[v5 count] >= 7)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WFTriggerMultiSelectCell.m" lineNumber:199 description:@"A maximum of 6 configurations are supported!"];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__WFTriggerMultiSelectCell_setMultiSelectCellOptionConfigurations___block_invoke;
  v7[3] = &unk_2649CAA98;
  v7[4] = self;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __67__WFTriggerMultiSelectCell_setMultiSelectCellOptionConfigurations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v48 = v5;
  switch(a3)
  {
    case 0:
      v6 = [*(id *)(a1 + 32) containerTop];
      v7 = [v48 objectForKeyedSubscript:@"image"];
      id v8 = [v48 objectForKeyedSubscript:@"selectedImage"];
      v9 = [v48 objectForKeyedSubscript:@"color"];
      v10 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v11 = [v10 BOOLValue];
      v12 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v6 setLeftOptionImage:v7 selectedImage:v8 label:v9 selected:v11 tintColor:v12];

      goto LABEL_3;
    case 1:
LABEL_3:
      v13 = [*(id *)(a1 + 32) containerTop];
      id v14 = [v48 objectForKeyedSubscript:@"image"];
      id v15 = [v48 objectForKeyedSubscript:@"selectedImage"];
      id v16 = [v48 objectForKeyedSubscript:@"color"];
      id v17 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v18 = [v17 BOOLValue];
      id v19 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v13 setRightOptionImage:v14 selectedImage:v15 label:v16 selected:v18 tintColor:v19];

      goto LABEL_4;
    case 2:
LABEL_4:
      v20 = [*(id *)(a1 + 32) containerMiddle];
      v21 = [v48 objectForKeyedSubscript:@"image"];
      v22 = [v48 objectForKeyedSubscript:@"selectedImage"];
      v23 = [v48 objectForKeyedSubscript:@"color"];
      v24 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v25 = [v24 BOOLValue];
      v26 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v20 setLeftOptionImage:v21 selectedImage:v22 label:v23 selected:v25 tintColor:v26];

      goto LABEL_5;
    case 3:
LABEL_5:
      v27 = [*(id *)(a1 + 32) containerMiddle];
      v28 = [v48 objectForKeyedSubscript:@"image"];
      v29 = [v48 objectForKeyedSubscript:@"selectedImage"];
      v30 = [v48 objectForKeyedSubscript:@"color"];
      v31 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v32 = [v31 BOOLValue];
      v33 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v27 setRightOptionImage:v28 selectedImage:v29 label:v30 selected:v32 tintColor:v33];

      goto LABEL_6;
    case 4:
LABEL_6:
      v34 = [*(id *)(a1 + 32) containerBottom];
      v35 = [v48 objectForKeyedSubscript:@"image"];
      v36 = [v48 objectForKeyedSubscript:@"selectedImage"];
      v37 = [v48 objectForKeyedSubscript:@"color"];
      v38 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v39 = [v38 BOOLValue];
      v40 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v34 setLeftOptionImage:v35 selectedImage:v36 label:v37 selected:v39 tintColor:v40];

      goto LABEL_7;
    case 5:
LABEL_7:
      v41 = [*(id *)(a1 + 32) containerBottom];
      v42 = [v48 objectForKeyedSubscript:@"image"];
      v43 = [v48 objectForKeyedSubscript:@"selectedImage"];
      v44 = [v48 objectForKeyedSubscript:@"color"];
      v45 = [v48 objectForKeyedSubscript:@"selected"];
      uint64_t v46 = [v45 BOOLValue];
      v47 = [v48 objectForKeyedSubscript:@"tintColor"];
      [v41 setRightOptionImage:v42 selectedImage:v43 label:v44 selected:v46 tintColor:v47];

      id v5 = v48;
      break;
    default:
      break;
  }
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)WFTriggerMultiSelectCell;
  [(WFTriggerMultiSelectCell *)&v2 prepareForReuse];
}

- (void)setRightViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFTriggerMultiSelectCell *)self containerTop];
  [v4 setRightViewSelected:v3];
}

- (BOOL)isRightViewSelected
{
  objc_super v2 = [(WFTriggerMultiSelectCell *)self containerTop];
  char v3 = [v2 rightViewSelected];

  return v3;
}

- (void)setLeftViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFTriggerMultiSelectCell *)self containerTop];
  [v4 setLeftViewSelected:v3];
}

- (BOOL)isLeftViewSelected
{
  objc_super v2 = [(WFTriggerMultiSelectCell *)self containerTop];
  char v3 = [v2 leftViewSelected];

  return v3;
}

- (NSArray)selectedCellViews
{
  char v3 = objc_opt_new();
  id v4 = [(WFTriggerMultiSelectCell *)self containerTop];
  int v5 = [v4 leftViewSelected];

  if (v5) {
    [v3 addObject:&unk_26E1CA288];
  }
  v6 = [(WFTriggerMultiSelectCell *)self containerTop];
  int v7 = [v6 rightViewSelected];

  if (v7) {
    [v3 addObject:&unk_26E1CA2A0];
  }
  id v8 = [(WFTriggerMultiSelectCell *)self containerMiddle];
  int v9 = [v8 leftViewSelected];

  if (v9) {
    [v3 addObject:&unk_26E1CA2B8];
  }
  v10 = [(WFTriggerMultiSelectCell *)self containerMiddle];
  int v11 = [v10 rightViewSelected];

  if (v11) {
    [v3 addObject:&unk_26E1CA2D0];
  }
  v12 = [(WFTriggerMultiSelectCell *)self containerBottom];
  int v13 = [v12 leftViewSelected];

  if (v13) {
    [v3 addObject:&unk_26E1CA2E8];
  }
  id v14 = [(WFTriggerMultiSelectCell *)self containerBottom];
  int v15 = [v14 rightViewSelected];

  if (v15) {
    [v3 addObject:&unk_26E1CA300];
  }
  return (NSArray *)v3;
}

- (void)view:(id)a3 didSelectOptionWithRightViewCurrentlySelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  BOOL v6 = [(WFTriggerMultiSelectCell *)self singleSelection];
  int v7 = v19;
  if (v6)
  {
    if ([v19 rightViewSelected] && v4) {
      goto LABEL_10;
    }
    id v8 = [(WFTriggerMultiSelectCell *)self containerTop];
    [v8 setLeftViewSelected:0];

    int v9 = [(WFTriggerMultiSelectCell *)self containerTop];
    [v9 setRightViewSelected:0];

    v10 = [(WFTriggerMultiSelectCell *)self containerMiddle];
    [v10 setLeftViewSelected:0];

    int v11 = [(WFTriggerMultiSelectCell *)self containerMiddle];
    [v11 setRightViewSelected:0];

    v12 = [(WFTriggerMultiSelectCell *)self containerBottom];
    [v12 setLeftViewSelected:0];

    int v13 = [(WFTriggerMultiSelectCell *)self containerBottom];
    [v13 setRightViewSelected:0];

    [v19 setLeftViewSelected:v4];
    int v7 = v19;
  }
  [v7 setRightViewSelected:v4 ^ 1];
  id v14 = [(WFTriggerMultiSelectCell *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  id v16 = [(WFTriggerMultiSelectCell *)self delegate];
  if (v15)
  {
    objc_msgSend(v16, "cell:didSelectOptionWithLeftViewSelected:rightViewSelected:", self, objc_msgSend(v19, "leftViewSelected"), objc_msgSend(v19, "rightViewSelected"));
  }
  else
  {
    char v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0) {
      goto LABEL_10;
    }
    id v16 = [(WFTriggerMultiSelectCell *)self delegate];
    uint64_t v18 = [(WFTriggerMultiSelectCell *)self selectedCellViews];
    [v16 cell:self didSelectOptions:v18];
  }
LABEL_10:
}

- (void)view:(id)a3 didSelectOptionWithLeftViewCurrentlySelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  if ([(WFTriggerMultiSelectCell *)self singleSelection])
  {
    if ([v17 leftViewSelected] && v4) {
      goto LABEL_11;
    }
    BOOL v6 = [(WFTriggerMultiSelectCell *)self containerTop];
    [v6 setLeftViewSelected:0];

    int v7 = [(WFTriggerMultiSelectCell *)self containerTop];
    [v7 setRightViewSelected:0];

    id v8 = [(WFTriggerMultiSelectCell *)self containerMiddle];
    [v8 setLeftViewSelected:0];

    int v9 = [(WFTriggerMultiSelectCell *)self containerMiddle];
    [v9 setRightViewSelected:0];

    v10 = [(WFTriggerMultiSelectCell *)self containerBottom];
    [v10 setLeftViewSelected:0];

    int v11 = [(WFTriggerMultiSelectCell *)self containerBottom];
    [v11 setRightViewSelected:0];

    [v17 setLeftViewSelected:v4 ^ 1];
    [v17 setRightViewSelected:v4];
  }
  else
  {
    [v17 setLeftViewSelected:v4 ^ 1];
  }
  v12 = [(WFTriggerMultiSelectCell *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  id v14 = [(WFTriggerMultiSelectCell *)self delegate];
  if (v13)
  {
    objc_msgSend(v14, "cell:didSelectOptionWithLeftViewSelected:rightViewSelected:", self, objc_msgSend(v17, "leftViewSelected"), objc_msgSend(v17, "rightViewSelected"));
  }
  else
  {
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_11;
    }
    id v14 = [(WFTriggerMultiSelectCell *)self delegate];
    id v16 = [(WFTriggerMultiSelectCell *)self selectedCellViews];
    [v14 cell:self didSelectOptions:v16];
  }
LABEL_11:
}

- (NSArray)optionContainers
{
  char v3 = objc_opt_new();
  BOOL v4 = [(WFTriggerMultiSelectCell *)self containerTop];
  objc_msgSend(v3, "if_addObjectIfNonNil:", v4);

  int v5 = [(WFTriggerMultiSelectCell *)self containerMiddle];
  objc_msgSend(v3, "if_addObjectIfNonNil:", v5);

  BOOL v6 = [(WFTriggerMultiSelectCell *)self containerBottom];
  objc_msgSend(v3, "if_addObjectIfNonNil:", v6);

  return (NSArray *)v3;
}

- (WFTriggerMultiSelectCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v35[4] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)WFTriggerMultiSelectCell;
  BOOL v4 = [(WFTriggerMultiSelectCell *)&v34 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    int v5 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerTop = v4->_containerTop;
    v4->_containerTop = v5;

    [(WFTriggerOptionSelectionViewContainer *)v4->_containerTop setDelegate:v4];
    int v7 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerMiddle = v4->_containerMiddle;
    v4->_containerMiddle = v7;

    [(WFTriggerOptionSelectionViewContainer *)v4->_containerMiddle setDelegate:v4];
    int v9 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerBottom = v4->_containerBottom;
    v4->_containerBottom = v9;

    [(WFTriggerOptionSelectionViewContainer *)v4->_containerBottom setDelegate:v4];
    [(WFTriggerOptionSelectionViewContainer *)v4->_containerBottom setHidden:1];
    int v11 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v4->_stackView;
    v4->_stackView = v11;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView setDistribution:1];
    [(UIStackView *)v4->_stackView setAxis:1];
    char v13 = [(WFTriggerMultiSelectCell *)v4 contentView];
    [v13 addSubview:v4->_stackView];

    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_containerTop];
    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_containerMiddle];
    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_containerBottom];
    v26 = (void *)MEMORY[0x263F08938];
    uint64_t v32 = [(UIStackView *)v4->_stackView topAnchor];
    v33 = [(WFTriggerMultiSelectCell *)v4 contentView];
    v31 = [v33 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v28 = [(UIStackView *)v4->_stackView bottomAnchor];
    v29 = [(WFTriggerMultiSelectCell *)v4 contentView];
    v27 = [v29 bottomAnchor];
    uint64_t v25 = [v28 constraintEqualToAnchor:v27];
    v35[1] = v25;
    id v14 = [(UIStackView *)v4->_stackView leadingAnchor];
    char v15 = [(WFTriggerMultiSelectCell *)v4 contentView];
    id v16 = [v15 leadingAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16];
    v35[2] = v17;
    uint64_t v18 = [(UIStackView *)v4->_stackView trailingAnchor];
    id v19 = [(WFTriggerMultiSelectCell *)v4 contentView];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v35[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
    [v26 activateConstraints:v22];

    v23 = v4;
  }

  return v4;
}

+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 selectedImage:(id)a4 title:(id)a5 tintColor:(id)a6 selected:(BOOL)a7
{
  BOOL v7 = a7;
  v22[4] = *MEMORY[0x263EF8340];
  int v11 = (void *)MEMORY[0x263EFF9A0];
  v21[0] = @"image";
  v21[1] = @"color";
  v22[0] = a3;
  v22[1] = a5;
  v21[2] = @"selected";
  v12 = NSNumber;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 numberWithBool:v7];
  v21[3] = @"selectedImage";
  v22[2] = v17;
  v22[3] = v15;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  id v19 = [v11 dictionaryWithDictionary:v18];

  objc_msgSend(v19, "if_setObjectIfNonNil:forKey:", v13, @"tintColor");
  return v19;
}

+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 title:(id)a4 tintColor:(id)a5 selected:(BOOL)a6
{
  BOOL v6 = a6;
  v19[3] = *MEMORY[0x263EF8340];
  int v9 = (void *)MEMORY[0x263EFF9A0];
  v18[0] = @"image";
  v18[1] = @"color";
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = @"selected";
  v10 = NSNumber;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 numberWithBool:v6];
  v19[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v16 = [v9 dictionaryWithDictionary:v15];

  objc_msgSend(v16, "if_setObjectIfNonNil:forKey:", v11, @"tintColor");
  return v16;
}

@end