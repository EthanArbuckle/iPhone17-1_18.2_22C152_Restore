@interface PKAccountSupportTopicExplanationCollectionViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setExplanationContent:(id)a3;
@end

@implementation PKAccountSupportTopicExplanationCollectionViewCell

- (void)setExplanationContent:(id)a3
{
  id v4 = a3;
  id v30 = [(PKAccountSupportTopicExplanationCollectionViewCell *)self contentView];
  if (!self->_primaryLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v5;

    [(UILabel *)self->_primaryLabel setNumberOfLines:0];
    v7 = self->_primaryLabel;
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v7 setFont:v8];

    v9 = self->_primaryLabel;
    v10 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v9 setTextColor:v10];

    [v30 addSubview:self->_primaryLabel];
  }
  if (!self->_secondaryLabel)
  {
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v11;

    [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
    v13 = self->_secondaryLabel;
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [(UILabel *)v13 setFont:v14];

    v15 = self->_secondaryLabel;
    v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v15 setTextColor:v16];

    [v30 addSubview:self->_secondaryLabel];
  }
  if (!self->_iconImageView)
  {
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v17;

    [(UIImageView *)self->_iconImageView setContentMode:1];
    v19 = self->_iconImageView;
    v20 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v19 setTintColor:v20];

    [v30 addSubview:self->_iconImageView];
  }
  v21 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [v30 setBackgroundColor:v21];

  v22 = self->_primaryLabel;
  v23 = [v4 title];
  [(UILabel *)v22 setText:v23];

  v24 = self->_secondaryLabel;
  v25 = [v4 subtitle];
  [(UILabel *)v24 setText:v25];

  v26 = self->_iconImageView;
  v27 = (void *)MEMORY[0x1E4FB1818];
  v28 = [v4 systemImageName];

  v29 = [v27 systemImageNamed:v28];
  [(UIImageView *)v26 setImage:v29];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKAccountSupportTopicExplanationCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountSupportTopicExplanationCollectionViewCell;
  [(PKAccountSupportTopicExplanationCollectionViewCell *)&v4 layoutSubviews];
  double v3 = [(PKAccountSupportTopicExplanationCollectionViewCell *)self contentView];
  [v3 bounds];
  [(PKAccountSupportTopicExplanationCollectionViewCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountSupportTopicExplanationCollectionViewCell;
  [(PKAccountSupportTopicExplanationCollectionViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_primaryLabel setText:0];
  [(UILabel *)self->_secondaryLabel setText:0];
  [(UIImageView *)self->_iconImageView setImage:0];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKAccountSupportTopicExplanationCollectionViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v8 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v8 = CGRectMinXEdge;
  memset(&slice, 0, sizeof(slice));
  double v9 = x + 16.0;
  double v10 = y + 20.0;
  double v11 = height + -40.0;
  remainder.origin.double x = v9;
  remainder.origin.double y = v10;
  remainder.size.double width = width + -32.0;
  remainder.size.double height = height + -40.0;
  v12 = [(UIImageView *)self->_iconImageView image];

  if (v12)
  {
    PKContentAlignmentMake();
    v13 = [(UILabel *)self->_primaryLabel font];
    [v13 lineHeight];
    CGFloat v15 = v14;

    v37.origin.double x = v9;
    v37.origin.double y = v10;
    v37.size.double width = width + -32.0;
    v37.size.double height = v11;
    CGRectDivide(v37, &v33, &remainder, v15, v8);
    CGRectDivide(remainder, &slice, &remainder, 4.0, v8);
    iconImageView = self->_iconImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](iconImageView, "setFrame:");
  }
  else
  {
    CGFloat v15 = 0.0;
  }
  v17 = [(UILabel *)self->_primaryLabel text];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    memset(&v33, 0, sizeof(v33));
    -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, 0, 0, 0, 0);
    double v20 = v19;
    CGRectDivide(remainder, &v33, &remainder, v19, CGRectMinYEdge);
    primaryLabel = self->_primaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](primaryLabel, "setFrame:");
    CGFloat v15 = fmax(v20, v15);
  }
  v22 = [(UILabel *)self->_secondaryLabel text];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    if (v15 > 0.0)
    {
      remainder.origin.double x = v9;
      remainder.origin.double y = v10;
      remainder.size.double width = width + -32.0;
      remainder.size.double height = v11;
      v38.origin.double x = v9;
      v38.origin.double y = v10;
      v38.size.double width = width + -32.0;
      v38.size.double height = v11;
      CGRectDivide(v38, &slice, &remainder, v15, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 14.0, CGRectMinYEdge);
    }
    memset(&v33, 0, sizeof(v33));
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, 0, 0, 0, 0);
    CGRectDivide(remainder, &v33, &remainder, v24, CGRectMinYEdge);
    secondaryLabel = self->_secondaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryLabel, "setFrame:");
  }
  double v26 = 20.0;
  if (v15 > 0.0)
  {
    double v27 = v15 + 20.0;
    v28 = [(UILabel *)self->_secondaryLabel text];
    uint64_t v29 = [v28 length];

    if (v29) {
      double v26 = v27 + 14.0;
    }
    else {
      double v26 = v27;
    }
  }
  [(UILabel *)self->_secondaryLabel frame];
  double v31 = v26 + v30 + 20.0;
  double v32 = width;
  result.double height = v31;
  result.double width = v32;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end