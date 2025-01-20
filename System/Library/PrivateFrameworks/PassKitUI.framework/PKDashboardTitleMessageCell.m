@interface PKDashboardTitleMessageCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDashboardTitleMessageCell)initWithFrame:(CGRect)a3;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)layoutSubviews;
@end

@implementation PKDashboardTitleMessageCell

- (PKDashboardTitleMessageCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PKDashboardTitleMessageCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKDashboardTitleMessageCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    v14 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 2, 0);
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    v15 = v4->_titleLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [v5 addSubview:v4->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    messageLabel = v4->_messageLabel;
    v4->_messageLabel = (UILabel *)v17;

    v19 = v4->_messageLabel;
    v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v4->_messageLabel setNumberOfLines:0];
    v21 = v4->_messageLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    [v5 addSubview:v4->_messageLabel];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  double v6 = width + v5 * -2.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v6 + -24.0, 1.79769313e308);
  double v8 = v7;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_messageLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v6 + -24.0, 1.79769313e308);
  double v10 = v8 + 24.0 + 5.0 + v9;
  double v11 = v6;
  result.height = v10;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PKDashboardTitleMessageCell;
  [(PKDashboardCollectionViewCell *)&v18 layoutSubviews];
  v3 = [(PKDashboardTitleMessageCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  remainder.origin.x = v5 + 12.0;
  remainder.origin.y = v7 + 12.0;
  remainder.size.double width = v9 + -24.0;
  remainder.size.height = v11 + -24.0;
  CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v16.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v16.size = v12;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v9 + -24.0, v11 + -24.0);
  CGFloat v14 = v13;
  v19.origin.x = v5 + 12.0;
  v19.origin.y = v7 + 12.0;
  v19.size.double width = v9 + -24.0;
  v19.size.height = v11 + -24.0;
  CGRectDivide(v19, &v16, &remainder, v14, CGRectMinYEdge);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
  CGRectDivide(remainder, &v16, &remainder, 5.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_messageLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v16, &remainder, v15, CGRectMinYEdge);
  -[UILabel setFrame:](self->_messageLabel, "setFrame:", *(_OWORD *)&v16.origin, *(_OWORD *)&v16.size);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end