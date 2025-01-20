@interface SRDetailedTableCell
- (SRDetailedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)dealloc;
@end

@implementation SRDetailedTableCell

- (SRDetailedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11[6] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)SRDetailedTableCell;
  v4 = [(SRDetailedTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v4->_titleLabel = (UILabel *)objc_opt_new();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", [MEMORY[0x263F1C550] labelColor]);
    uint64_t v5 = *MEMORY[0x263F1D260];
    -[UILabel setFont:](v4->_titleLabel, "setFont:", [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]]);
    LODWORD(v6) = 1132068864;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:0 forAxis:v6];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "addSubview:", v4->_titleLabel);
    v4->_detailLabel = (UILabel *)objc_opt_new();
    -[UILabel setTextColor:](v4->_detailLabel, "setTextColor:", [MEMORY[0x263F1C550] secondaryLabelColor]);
    -[UILabel setFont:](v4->_detailLabel, "setFont:", [MEMORY[0x263F1C658] preferredFontForTextStyle:v5]);
    LODWORD(v7) = 1144750080;
    [(UILabel *)v4->_detailLabel setContentCompressionResistancePriority:0 forAxis:v7];
    [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "addSubview:", v4->_detailLabel);
    v8 = (void *)MEMORY[0x263F08938];
    v11[0] = objc_msgSend((id)-[UILabel topAnchor](v4->_titleLabel, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "layoutMarginsGuide"), "topAnchor"));
    v11[1] = objc_msgSend((id)-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
    v11[2] = objc_msgSend((id)-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
    v11[3] = objc_msgSend((id)-[UILabel leadingAnchor](v4->_detailLabel, "leadingAnchor"), "constraintEqualToAnchor:", -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v11[4] = objc_msgSend((id)-[UILabel trailingAnchor](v4->_detailLabel, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRDetailedTableCell contentView](v4, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
    v11[5] = objc_msgSend((id)-[UILabel centerYAnchor](v4->_detailLabel, "centerYAnchor"), "constraintEqualToAnchor:", -[UILabel centerYAnchor](v4->_titleLabel, "centerYAnchor"));
    objc_msgSend(v8, "activateConstraints:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v11, 6));
  }
  return v4;
}

- (void)dealloc
{
  self->_titleLabel = 0;
  self->_detailLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDetailedTableCell;
  [(SRDetailedTableCell *)&v3 dealloc];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

@end