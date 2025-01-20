@interface WFTableViewHeaderFooterTextView
- (NSArray)horizontalConstraints;
- (NSString)text;
- (UILabel)label;
- (WFTableViewHeaderFooterTextView)init;
- (WFTableViewHeaderFooterTextView)initWithReuseIdentifier:(id)a3;
- (double)horizontalPadding;
- (void)setHorizontalPadding:(double)a3;
- (void)setText:(id)a3;
@end

@implementation WFTableViewHeaderFooterTextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (UILabel)label
{
  return self->_label;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  if (self->_horizontalPadding != a3)
  {
    v22 = [(WFTableViewHeaderFooterTextView *)self label];
    v19 = [v22 leadingAnchor];
    v21 = [(WFTableViewHeaderFooterTextView *)self contentView];
    v5 = [v21 layoutMarginsGuide];
    v6 = [v5 leadingAnchor];
    v7 = [v19 constraintEqualToAnchor:v6 constant:a3];
    v23[0] = v7;
    v8 = [(WFTableViewHeaderFooterTextView *)self label];
    v9 = [v8 trailingAnchor];
    v10 = [(WFTableViewHeaderFooterTextView *)self contentView];
    v11 = [v10 layoutMarginsGuide];
    v12 = [v11 trailingAnchor];
    v13 = [v9 constraintEqualToAnchor:v12 constant:-a3];
    v23[1] = v13;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];

    v14 = [(WFTableViewHeaderFooterTextView *)self horizontalConstraints];

    if (v14)
    {
      v15 = (void *)MEMORY[0x263F08938];
      v16 = [(WFTableViewHeaderFooterTextView *)self horizontalConstraints];
      [v15 deactivateConstraints:v16];
    }
    [MEMORY[0x263F08938] activateConstraints:v20];
    v17 = [(WFTableViewHeaderFooterTextView *)self horizontalConstraints];
    horizontalConstraints = self->_horizontalConstraints;
    self->_horizontalConstraints = v17;

    self->_horizontalPadding = a3;
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(WFTableViewHeaderFooterTextView *)self label];
  [v5 setText:v4];
}

- (NSString)text
{
  v2 = [(WFTableViewHeaderFooterTextView *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (WFTableViewHeaderFooterTextView)initWithReuseIdentifier:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFTableViewHeaderFooterTextView;
  v3 = [(WFTableViewHeaderFooterTextView *)&v21 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v4 setTextColor:v5];

    v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [(UILabel *)v4 setFont:v6];

    label = v3->_label;
    v3->_label = v4;
    v8 = v4;

    v9 = [(WFTableViewHeaderFooterTextView *)v3 contentView];
    [v9 addSubview:v8];
    v20 = (void *)MEMORY[0x263F08938];
    v10 = [(UILabel *)v8 topAnchor];
    v11 = [v9 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:8.0];
    v22[0] = v12;
    v13 = [(UILabel *)v8 bottomAnchor];
    v14 = [v9 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v22[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    [v20 activateConstraints:v16];

    [(WFTableViewHeaderFooterTextView *)v3 setHorizontalPadding:10.0];
    LODWORD(v17) = 1144750080;
    [(UILabel *)v8 setContentCompressionResistancePriority:1 forAxis:v17];

    v18 = v3;
  }

  return v3;
}

- (WFTableViewHeaderFooterTextView)init
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(WFTableViewHeaderFooterTextView *)self initWithReuseIdentifier:v4];

  return v5;
}

@end