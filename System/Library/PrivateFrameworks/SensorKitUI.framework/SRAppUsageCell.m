@interface SRAppUsageCell
- (SRAppUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)button;
- (UILabel)label;
- (void)dealloc;
@end

@implementation SRAppUsageCell

- (SRAppUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SRAppUsageCell;
  v4 = [(SRAppUsageCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SRAppUsageCell *)v4 setSelectionStyle:0];
    v6 = (UILabel *)objc_opt_new();
    v5->_label = v6;
    [(UILabel *)v6 setLineBreakMode:0];
    [(UILabel *)v5->_label setNumberOfLines:0];
    uint64_t v7 = *MEMORY[0x263F1D260];
    -[UILabel setFont:](v5->_label, "setFont:", [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]]);
    v8 = (UIButton *)(id)[MEMORY[0x263F1C488] buttonWithType:1];
    v5->_button = v8;
    [(UIButton *)v8 setContentHorizontalAlignment:1];
    [(UIButton *)v5->_button setContentVerticalAlignment:2];
    -[UILabel setFont:](-[UIButton titleLabel](v5->_button, "titleLabel"), "setFont:", [MEMORY[0x263F1C658] preferredFontForTextStyle:v7]);
    id v9 = objc_alloc(MEMORY[0x263F1C9B8]);
    v15[0] = v5->_label;
    v15[1] = v5->_button;
    id v10 = (id)objc_msgSend(v9, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v15, 2));
    [v10 setAxis:1];
    [v10 setSpacing:8.0];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[SRAppUsageCell contentView](v5, "contentView"), "addSubview:", v10);
    v11 = (void *)MEMORY[0x263F08938];
    v14[0] = objc_msgSend((id)objc_msgSend(v10, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAppUsageCell contentView](v5, "contentView"), "layoutMarginsGuide"), "topAnchor"));
    v14[1] = objc_msgSend((id)objc_msgSend(v10, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAppUsageCell contentView](v5, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
    v14[2] = objc_msgSend((id)objc_msgSend(v10, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAppUsageCell contentView](v5, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
    v14[3] = objc_msgSend((id)objc_msgSend(v10, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAppUsageCell contentView](v5, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
    objc_msgSend(v11, "activateConstraints:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 4));
  }
  return v5;
}

- (void)dealloc
{
  self->_label = 0;
  self->_button = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRAppUsageCell;
  [(SRAppUsageCell *)&v3 dealloc];
}

- (UILabel)label
{
  return self->_label;
}

- (UIButton)button
{
  return self->_button;
}

@end