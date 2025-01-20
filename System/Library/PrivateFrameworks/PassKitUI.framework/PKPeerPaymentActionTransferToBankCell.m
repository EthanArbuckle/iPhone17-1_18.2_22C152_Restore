@interface PKPeerPaymentActionTransferToBankCell
- (BOOL)showCheckmark;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)feeText;
- (NSString)subtitleText;
- (NSString)titleText;
- (PKPeerPaymentActionTransferToBankCell)initWithReuseIdentifier:(id)a3;
- (PKPeerPaymentActionTransferToBankCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setFeeText:(id)a3;
- (void)setShowCheckmark:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation PKPeerPaymentActionTransferToBankCell

- (PKPeerPaymentActionTransferToBankCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(PKPeerPaymentActionTransferToBankCell *)self initWithReuseIdentifier:a4];
}

- (PKPeerPaymentActionTransferToBankCell)initWithReuseIdentifier:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentActionTransferToBankCell;
  v3 = [(PKPeerPaymentActionTransferToBankCell *)&v35 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v3->_isRTL = [(PKPeerPaymentActionTransferToBankCell *)v3 _shouldReverseLayoutDirection];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v5;

    v7 = v4->_textLabel;
    v8 = (NSString *)*MEMORY[0x1E4FB28C8];
    v9 = (NSString *)*MEMORY[0x1E4FB2790];
    v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)v7 setFont:v10];

    [(UILabel *)v4->_textLabel setTextAlignment:4];
    v11 = v4->_textLabel;
    v12 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)v4->_textLabel setNumberOfLines:1];
    [(UILabel *)v4->_textLabel setLineBreakMode:4];
    [(UILabel *)v4->_textLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v13;

    v15 = v4->_detailTextLabel;
    v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], v9);
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v4->_detailTextLabel setTextAlignment:4];
    v17 = v4->_detailTextLabel;
    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v4->_detailTextLabel setNumberOfLines:3];
    [(UILabel *)v4->_detailTextLabel setLineBreakMode:4];
    [(UILabel *)v4->_detailTextLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    feeLabel = v4->_feeLabel;
    v4->_feeLabel = v19;

    v21 = v4->_feeLabel;
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v21 setTextColor:v22];

    v23 = v4->_feeLabel;
    v24 = PKFontForDefaultDesign(v8, v9);
    [(UILabel *)v23 setFont:v24];

    [(UILabel *)v4->_feeLabel setTextAlignment:2 * !v4->_isRTL];
    [(UILabel *)v4->_feeLabel setLineBreakMode:4];
    [(UILabel *)v4->_feeLabel setNumberOfLines:2];
    [(UILabel *)v4->_feeLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [(PKPeerPaymentActionTransferToBankCell *)v4 addSubview:v4->_textLabel];
    [(PKPeerPaymentActionTransferToBankCell *)v4 addSubview:v4->_detailTextLabel];
    [(PKPeerPaymentActionTransferToBankCell *)v4 addSubview:v4->_feeLabel];
    v25 = PKPassKitUIBundle();
    v26 = [v25 URLForResource:@"Cell_Checkmark" withExtension:@"pdf"];

    double v27 = PKUIScreenScale();
    v28 = PKUIImageFromPDF(v26, 15.0, 19.5, v27);
    v29 = [v28 imageWithRenderingMode:2];

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v29];
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = (UIImageView *)v30;

    v32 = v4->_checkmarkImageView;
    v33 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIImageView *)v32 setTintColor:v33];

    [(PKPeerPaymentActionTransferToBankCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85B00]];
  }
  return v4;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)PKPeerPaymentActionTransferToBankCell;
  [(PKPeerPaymentActionTransferToBankCell *)&v46 layoutSubviews];
  [(PKPeerPaymentActionTransferToBankCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = v9 + -22.0;
  double v12 = (v7 - PKTableViewCellTextInset() * 2.0) * 0.3;
  [(UIImageView *)self->_checkmarkImageView frame];
  CGFloat v14 = v13;
  [(UILabel *)self->_feeLabel frame];
  -[UILabel sizeThatFits:](self->_feeLabel, "sizeThatFits:", v12, v11);
  if (v12 >= v15) {
    double v12 = v15;
  }
  [(UILabel *)self->_textLabel frame];
  [(UILabel *)self->_detailTextLabel frame];
  CGRectEdge v16 = 2 * !self->_isRTL;
  CGRectEdge v17 = 2 * self->_isRTL;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.double x = v4;
  remainder.origin.y = v6;
  remainder.size.double width = v8;
  remainder.size.height = v10;
  v47.origin.double x = v4;
  v47.origin.y = v6;
  v47.size.double width = v8;
  v47.size.height = v10;
  CGRectDivide(v47, &slice, &remainder, 16.0, v16);
  double v18 = PKTableViewCellTextInset();
  CGRectDivide(remainder, &slice, &remainder, v18, v17);
  CGRectDivide(remainder, &slice, &remainder, v14, v16);
  PKRectCenteredYInRect();
  double v42 = v20;
  double v43 = v19;
  double v40 = v22;
  double v41 = v21;
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 16.0, v16);
  CGRectDivide(remainder, &slice, &remainder, v12, v16);
  PKRectCenteredYInRect();
  double v38 = v24;
  double v39 = v23;
  double v37 = v25;
  double v27 = v26;
  -[UILabel setFrame:](self->_feeLabel, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 16.0, v16);
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", remainder.size.width, v11);
  double v29 = v28;
  double x = remainder.origin.x;
  double width = remainder.size.width;
  -[UILabel setFrame:](self->_textLabel, "setFrame:", remainder.origin.x, 11.0, remainder.size.width, v28);
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", remainder.size.width, v11);
  double v33 = v32;
  double v34 = remainder.origin.x;
  v48.origin.y = 11.0;
  v48.origin.double x = x;
  v48.size.double width = width;
  v48.size.height = v29;
  CGFloat v35 = CGRectGetMaxY(v48) + 2.0;
  double v36 = remainder.size.width;
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v34, v35, remainder.size.width, v33);
  -[UILabel setFrame:](self->_feeLabel, "setFrame:", v39, v38, v37, v27);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", x, 11.0, width, v29);
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v34, v35, v36, v33);
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:", v43, v42, v41, v40);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = a3.width - PKTableViewCellTextInset() * 2.0;
  -[UILabel sizeThatFits:](self->_feeLabel, "sizeThatFits:", v5 * 0.3, 3.40282347e38);
  double v8 = v7;
  if (v6 >= v5 * 0.3) {
    double v6 = v5 * 0.3;
  }
  double v9 = v5 + -48.0 - v6;
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v9, 3.40282347e38);
  double v11 = v10;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v9, 3.40282347e38);
  double v13 = v11 + v12 + 2.0;
  if (v8 > v13) {
    double v13 = v8;
  }
  double v14 = v13 + 22.0;
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)setFeeText:(id)a3
{
  id v5 = a3;
  double v6 = self->_feeText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_feeText, a3);
    [(UILabel *)self->_feeLabel setText:self->_feeText];
    [(UILabel *)self->_feeLabel sizeToFit];
    [(PKPeerPaymentActionTransferToBankCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  double v6 = self->_titleText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    [(UILabel *)self->_textLabel setText:self->_titleText];
    [(UILabel *)self->_textLabel sizeToFit];
    [(PKPeerPaymentActionTransferToBankCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitleText:(id)a3
{
  id v5 = a3;
  double v6 = self->_subtitleText;
  double v7 = (NSString *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_subtitleText, a3);
    [(UILabel *)self->_detailTextLabel setText:self->_subtitleText];
    [(UILabel *)self->_detailTextLabel sizeToFit];
    [(PKPeerPaymentActionTransferToBankCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setShowCheckmark:(BOOL)a3
{
  if (self->_showCheckmark != a3)
  {
    self->_showCheckmark = a3;
    if (a3) {
      [(PKPeerPaymentActionTransferToBankCell *)self addSubview:self->_checkmarkImageView];
    }
    else {
      [(UIImageView *)self->_checkmarkImageView removeFromSuperview];
    }
    [(PKPeerPaymentActionTransferToBankCell *)self setNeedsLayout];
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)feeText
{
  return self->_feeText;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_feeLabel, 0);
}

@end