@interface STSingleLineHeaderView
- (PSSpecifier)specifier;
- (STSingleLineHeaderView)initWithSpecifier:(id)a3;
- (STSingleLineHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4;
- (UILabel)titleLabel;
- (double)preferredHeightForWidth:(double)a3;
- (void)reloadFromSpecifier;
- (void)setSpecifier:(id)a3;
@end

@implementation STSingleLineHeaderView

- (STSingleLineHeaderView)initWithSpecifier:(id)a3
{
  return [(STSingleLineHeaderView *)self initWithSpecifier:a3 useContentLayoutGuide:1];
}

- (STSingleLineHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4
{
  BOOL v4 = a4;
  v41[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)STSingleLineHeaderView;
  v7 = [(STTableViewHeaderFooterView *)&v40 initWithReuseIdentifier:0 useLayoutMarginsGuide:!v4];
  if (v7)
  {
    id obj = v6;
    uint64_t v8 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    v10 = [MEMORY[0x263F82CA0] _defaultFontForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v7->_titleLabel setFont:v10];

    v11 = [MEMORY[0x263F82CA0] _defaultTextColorForTableViewStyle:1 isSectionHeader:1];
    [(UILabel *)v7->_titleLabel setTextColor:v11];

    [(UILabel *)v7->_titleLabel setNumberOfLines:2];
    [(UILabel *)v7->_titleLabel setLineBreakMode:0];
    [(UILabel *)v7->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144750080;
    [(UILabel *)v7->_titleLabel setContentHuggingPriority:0 forAxis:v12];
    v13 = [(STSingleLineHeaderView *)v7 contentView];
    [v13 addSubview:v7->_titleLabel];
    v14 = [(UILabel *)v7->_titleLabel lastBaselineAnchor];
    v15 = [(STSingleLineHeaderView *)v7 textLabel];
    v16 = [v15 lastBaselineAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];

    LODWORD(v18) = 1132068864;
    [v17 setPriority:v18];
    v38 = v13;
    if (v4)
    {
      v19 = v13;
      v20 = [(STTableViewHeaderFooterView *)v7 contentLayoutGuide];
      uint64_t v21 = [v20 leadingAnchor];
    }
    else
    {
      v19 = v7;
      uint64_t v21 = [(STSingleLineHeaderView *)v19 leadingAnchor];
    }
    v34 = (void *)v21;
    v31 = (void *)MEMORY[0x263F08938];
    v41[0] = v17;
    v37 = [(UILabel *)v7->_titleLabel topAnchor];
    v36 = [(STSingleLineHeaderView *)v19 topAnchor];
    v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36];
    v41[1] = v35;
    v32 = [(UILabel *)v7->_titleLabel leadingAnchor];
    v22 = [v32 constraintEqualToAnchor:v21];
    v41[2] = v22;
    v23 = [(UILabel *)v7->_titleLabel bottomAnchor];
    v24 = [(STSingleLineHeaderView *)v19 bottomAnchor];
    v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
    v41[3] = v25;
    v26 = [(UILabel *)v7->_titleLabel trailingAnchor];
    [(STSingleLineHeaderView *)v19 centerXAnchor];
    v27 = v33 = v17;
    v28 = [v26 constraintLessThanOrEqualToAnchor:v27];
    v41[4] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:5];
    [v31 activateConstraints:v29];

    id v6 = obj;
    objc_storeWeak((id *)&v7->_specifier, obj);
    [(STSingleLineHeaderView *)v7 reloadFromSpecifier];
  }
  return v7;
}

- (void)setSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_specifier, a3);

  [(STSingleLineHeaderView *)self reloadFromSpecifier];
}

- (void)reloadFromSpecifier
{
  id v6 = [(STSingleLineHeaderView *)self specifier];
  v3 = [v6 name];
  BOOL v4 = [v3 localizedUppercaseString];
  v5 = [(STSingleLineHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (double)preferredHeightForWidth:(double)a3
{
  -[STSingleLineHeaderView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (PSSpecifier)specifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);

  return (PSSpecifier *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_specifier);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end