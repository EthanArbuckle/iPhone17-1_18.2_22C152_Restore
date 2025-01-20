@interface STSingleLineButtonHeaderView
- (STSingleLineButtonHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4;
- (UIButton)button;
- (double)preferredHeightForWidth:(double)a3;
- (void)reloadFromSpecifier;
- (void)setSpecifier:(id)a3;
@end

@implementation STSingleLineButtonHeaderView

- (STSingleLineButtonHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4
{
  BOOL v4 = a4;
  v43[4] = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)STSingleLineButtonHeaderView;
  id v5 = a3;
  v6 = [(STSingleLineHeaderView *)&v42 initWithSpecifier:v5 useContentLayoutGuide:v4];
  uint64_t v7 = [MEMORY[0x263F824E8] buttonWithType:1];
  button = v6->_button;
  v6->_button = (UIButton *)v7;

  [(UIButton *)v6->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = v6->_button;
  v10 = [v5 target];
  uint64_t v11 = [v5 buttonAction];

  [(UIButton *)v9 addTarget:v10 action:v11 forEvents:0x2000];
  v12 = [(UIButton *)v6->_button titleLabel];
  v13 = [(STSingleLineHeaderView *)v6 titleLabel];
  v14 = [v13 font];
  [v12 setFont:v14];

  [v12 setNumberOfLines:2];
  [v12 setLineBreakMode:0];
  objc_msgSend(v12, "setTextAlignment:", 2* (-[STSingleLineButtonHeaderView effectiveUserInterfaceLayoutDirection](v6, "effectiveUserInterfaceLayoutDirection") != 1));
  if (v4)
  {
    v15 = [(STSingleLineButtonHeaderView *)v6 contentView];
    [v15 addSubview:v6->_button];
    v16 = v15;
    v17 = [(STTableViewHeaderFooterView *)v6 contentLayoutGuide];
    uint64_t v18 = [v17 trailingAnchor];
  }
  else
  {
    v19 = v6;
    [(STSingleLineButtonHeaderView *)v19 addSubview:v6->_button];
    v16 = v19;
    uint64_t v18 = [(STSingleLineButtonHeaderView *)v16 trailingAnchor];
  }
  v36 = (void *)v18;
  v39 = v16;
  v20 = [v12 trailingAnchor];
  v21 = [v20 constraintEqualToAnchor:v18];

  LODWORD(v22) = 1144750080;
  v41 = v21;
  [v21 setPriority:v22];
  v35 = (void *)MEMORY[0x263F08938];
  v43[0] = v21;
  v38 = [v12 topAnchor];
  v37 = [(STSingleLineButtonHeaderView *)v16 topAnchor];
  v23 = [v38 constraintGreaterThanOrEqualToAnchor:v37];
  v43[1] = v23;
  v24 = [v12 lastBaselineAnchor];
  v25 = [v13 lastBaselineAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v43[2] = v26;
  uint64_t v27 = [v12 leadingAnchor];
  v28 = v13;
  v40 = v13;
  v29 = (void *)v27;
  v30 = [v28 trailingAnchor];
  v31 = [v29 constraintEqualToSystemSpacingAfterAnchor:v30 multiplier:1.0];
  v43[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
  [v35 activateConstraints:v32];

  [(STSingleLineButtonHeaderView *)v6 reloadFromSpecifier];
  v33 = v6;

  return v33;
}

- (void)reloadFromSpecifier
{
  v8.receiver = self;
  v8.super_class = (Class)STSingleLineButtonHeaderView;
  [(STSingleLineHeaderView *)&v8 reloadFromSpecifier];
  v3 = [(STSingleLineButtonHeaderView *)self button];
  BOOL v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__STSingleLineButtonHeaderView_reloadFromSpecifier__block_invoke;
  v6[3] = &unk_264767078;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 transitionWithView:v5 duration:5 options:v6 animations:0 completion:0.3];
}

void __51__STSingleLineButtonHeaderView_reloadFromSpecifier__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) specifier];
  v2 = [v8 objectForKeyedSubscript:@"ButtonHidden"];
  int v3 = [v2 BOOLValue];
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  [*(id *)(a1 + 40) setAlpha:v4];

  id v5 = [v8 objectForKeyedSubscript:@"ButtonTag"];
  objc_msgSend(*(id *)(a1 + 40), "setTag:", objc_msgSend(v5, "integerValue"));

  v6 = *(void **)(a1 + 40);
  id v7 = [v8 objectForKeyedSubscript:@"ButtonTitle"];
  [v6 setTitle:v7 forState:0];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STSingleLineButtonHeaderView *)self button];
  v6 = [(STSingleLineHeaderView *)self specifier];
  id v7 = [v6 target];
  [v5 removeTarget:v7 forEvents:0x2000];

  v10.receiver = self;
  v10.super_class = (Class)STSingleLineButtonHeaderView;
  [(STSingleLineHeaderView *)&v10 setSpecifier:v4];
  id v8 = [v4 target];
  uint64_t v9 = [v4 buttonAction];

  [v5 addTarget:v8 action:v9 forEvents:0x2000];
}

- (double)preferredHeightForWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSingleLineButtonHeaderView;
  [(STSingleLineHeaderView *)&v5 preferredHeightForWidth:a3];
  return v3 + 1.0;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
}

@end