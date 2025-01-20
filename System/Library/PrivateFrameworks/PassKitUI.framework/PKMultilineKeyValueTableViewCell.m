@interface PKMultilineKeyValueTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKMultilineKeyValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)keyLabel;
- (UILabel)valueLabel;
- (void)layoutSubviews;
- (void)setKeyLabel:(id)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation PKMultilineKeyValueTableViewCell

- (PKMultilineKeyValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)PKMultilineKeyValueTableViewCell;
  v4 = [(PKMultilineKeyValueTableViewCell *)&v19 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    int v6 = [(PKMultilineKeyValueTableViewCell *)v4 _shouldReverseLayoutDirection];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    keyLabel = v5->_keyLabel;
    v5->_keyLabel = v8;

    [(UILabel *)v5->_keyLabel setNumberOfLines:1];
    v10 = v5->_keyLabel;
    v11 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v10 setTextColor:v11];

    if (v6) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v6) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    [(UILabel *)v5->_keyLabel setTextAlignment:v12];
    [(UILabel *)v5->_keyLabel setFont:v7];
    [(PKMultilineKeyValueTableViewCell *)v5 addSubview:v5->_keyLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = v14;

    [(UILabel *)v5->_valueLabel setNumberOfLines:0];
    v16 = v5->_valueLabel;
    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v16 setTextColor:v17];

    [(UILabel *)v5->_valueLabel setTextAlignment:v13];
    [(UILabel *)v5->_valueLabel setFont:v7];
    [(PKMultilineKeyValueTableViewCell *)v5 addSubview:v5->_valueLabel];
  }
  return v5;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKMultilineKeyValueTableViewCell;
  [(PKMultilineKeyValueTableViewCell *)&v24 layoutSubviews];
  v3 = [(PKMultilineKeyValueTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(PKMultilineKeyValueTableViewCell *)self layoutMargins];
  double v13 = v5 + v12;
  double v14 = v7 + 12.0;
  double v16 = v9 - (v12 + v15);
  remainder.origin.x = v13;
  remainder.origin.y = v14;
  double v17 = v11 + -24.0;
  remainder.size.width = v16;
  remainder.size.height = v17;
  if ([(PKMultilineKeyValueTableViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v18 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v18 = CGRectMinXEdge;
  -[UILabel systemLayoutSizeFittingSize:](self->_keyLabel, "systemLayoutSizeFittingSize:", v16, 0.0);
  CGFloat v20 = v19;
  memset(&slice, 0, sizeof(slice));
  v25.origin.x = v13;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v17;
  CGRectDivide(v25, &slice, &remainder, v20, v18);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](self->_keyLabel, "setFrame:");
  memset(&v21, 0, sizeof(v21));
  CGRectDivide(remainder, &v21, &remainder, 10.0, v18);
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKMultilineKeyValueTableViewCell *)self layoutMargins];
  double v7 = width - v5 - v6;
  -[UILabel systemLayoutSizeFittingSize:](self->_keyLabel, "systemLayoutSizeFittingSize:", v7, 0.0);
  double v9 = v8;
  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_valueLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7 + -10.0 - v10, 0.0, v11, v12);
  if (v9 <= v13) {
    double v14 = v13;
  }
  else {
    double v14 = v9;
  }
  double v15 = v14 + 12.0 + 12.0 + 1.0;
  double v16 = width;
  result.height = v15;
  result.double width = v16;
  return result;
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);

  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end