@interface _UIPrototypingMenuCell
+ (int64_t)_layoutAxis;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (_UIPrototypingMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_UIPrototypingValue)prototypingSetting;
- (void)_prototypingSettingDidChange;
- (void)setPrototypingSetting:(id)a3;
@end

@implementation _UIPrototypingMenuCell

- (_UIPrototypingMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)_UIPrototypingMenuCell;
  v4 = [(UITableViewCell *)&v36 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [UIStackView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[UIStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v10;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", [(id)objc_opt_class() _layoutAxis]);
    uint64_t v12 = [(UIStackView *)v4->_stackView axis];
    v13 = v4->_stackView;
    if (v12 == 1)
    {
      [(UIStackView *)v13 setAlignment:0];
    }
    else
    {
      [(UIStackView *)v13 setDistribution:0];
      [(UIStackView *)v4->_stackView setSpacing:1.17549435e-38];
      [(UIStackView *)v4->_stackView setLayoutMarginsRelativeArrangement:1];
    }
    v14 = [(UITableViewCell *)v4 contentView];
    [v14 addSubview:v4->_stackView];

    v15 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v15;

    [(UILabel *)v4->_titleLabel setText:@"Setting"];
    v17 = [off_1E52D39B8 boldSystemFontOfSize:17.0];
    [(UILabel *)v4->_titleLabel setFont:v17];

    [(UIStackView *)v4->_stackView addArrangedSubview:v4->_titleLabel];
    v18 = [(UITableViewCell *)v4 contentView];
    v19 = [v18 layoutMarginsGuide];

    v30 = (void *)MEMORY[0x1E4F1CA48];
    v35 = [(UIView *)v4->_stackView topAnchor];
    v34 = [v19 topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v37[0] = v33;
    v32 = [(UIView *)v4->_stackView leadingAnchor];
    v31 = [v19 leadingAnchor];
    v29 = [v32 constraintEqualToAnchor:v31];
    v37[1] = v29;
    v20 = [(UIView *)v4->_stackView trailingAnchor];
    v21 = [v19 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v37[2] = v22;
    v23 = [(UIView *)v4->_stackView bottomAnchor];
    v24 = [v19 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v37[3] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    v27 = [v30 arrayWithArray:v26];

    [MEMORY[0x1E4F5B268] activateConstraints:v27];
  }
  return v4;
}

+ (int64_t)_layoutAxis
{
  return 1;
}

- (void)setPrototypingSetting:(id)a3
{
  v5 = (_UIPrototypingValue *)a3;
  if (self->_prototypingSetting != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_prototypingSetting, a3);
    [(_UIPrototypingMenuCell *)self _prototypingSettingDidChange];
    v5 = v6;
  }
}

- (void)_prototypingSettingDidChange
{
  id v4 = [(_UIPrototypingValue *)self->_prototypingSetting name];
  v3 = [(_UIPrototypingMenuCell *)self titleLabel];
  [v3 setText:v4];
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (_UIPrototypingValue)prototypingSetting
{
  return self->_prototypingSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypingSetting, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end