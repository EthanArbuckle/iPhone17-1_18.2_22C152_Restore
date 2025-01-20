@interface PKTransactionReceiptLineItemTableViewCell
- (BOOL)hasTrailingLineSeparator;
- (BOOL)suppressImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)amountText;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSString)tertiaryText;
- (PKTransactionReceiptLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)image;
- (int64_t)separatorStyleForTrailingLineSeparator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAmountText:(id)a3;
- (void)setHasTrailingLineSeparator:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setSuppressImage:(BOOL)a3;
- (void)setTertiaryText:(id)a3;
@end

@implementation PKTransactionReceiptLineItemTableViewCell

- (PKTransactionReceiptLineItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v43.receiver = self;
  v43.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  v4 = [(PKTransactionReceiptLineItemTableViewCell *)&v43 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PKTransactionReceiptLineItemTableViewCell *)v4 contentView];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v12;

    [(UIImageView *)v5->_imageView setContentMode:1];
    v14 = [(UIImageView *)v5->_imageView layer];
    [v14 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v14 setCornerRadius:6.0];
    [v14 setMasksToBounds:1];
    id v15 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    [v14 setBorderWidth:PKUIPixelLength()];
    [v6 addSubview:v5->_imageView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    amountLabel = v5->_amountLabel;
    v5->_amountLabel = (UILabel *)v16;

    v18 = v5->_amountLabel;
    v19 = (void *)*MEMORY[0x1E4FB28C8];
    v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    [(UILabel *)v18 setFont:v20];

    v21 = v5->_amountLabel;
    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v21 setTextColor:v22];

    [(UILabel *)v5->_amountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
    [v6 addSubview:v5->_amountLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    primaryLabel = v5->_primaryLabel;
    v5->_primaryLabel = (UILabel *)v23;

    v25 = v5->_primaryLabel;
    v26 = PKFontForDefaultDesign(v19, 0, 2, 0);
    [(UILabel *)v25 setFont:v26];

    v27 = v5->_primaryLabel;
    v28 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)v5->_primaryLabel setNumberOfLines:0];
    [(UILabel *)v5->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v6 addSubview:v5->_primaryLabel];
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    secondaryLabel = v5->_secondaryLabel;
    v5->_secondaryLabel = (UILabel *)v29;

    v31 = v5->_secondaryLabel;
    v32 = (NSString *)*MEMORY[0x1E4FB2950];
    v33 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [(UILabel *)v31 setFont:v33];

    v34 = v5->_secondaryLabel;
    v35 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v34 setTextColor:v35];

    [(UILabel *)v5->_secondaryLabel setNumberOfLines:0];
    [(UILabel *)v5->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
    [v6 addSubview:v5->_secondaryLabel];
    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    tertiaryLabel = v5->_tertiaryLabel;
    v5->_tertiaryLabel = (UILabel *)v36;

    v38 = v5->_tertiaryLabel;
    v39 = PKFontForDefaultDesign(v32, 0);
    [(UILabel *)v38 setFont:v39];

    v40 = v5->_tertiaryLabel;
    v41 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v40 setTextColor:v41];

    [(UILabel *)v5->_tertiaryLabel setNumberOfLines:0];
    [(UILabel *)v5->_tertiaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AA8]];
    [v6 addSubview:v5->_tertiaryLabel];
    [(PKTransactionReceiptLineItemTableViewCell *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85678]];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  [(PKTransactionReceiptLineItemTableViewCell *)&v3 prepareForReuse];
  [(PKTransactionReceiptLineItemTableViewCell *)self setImage:0];
  [(PKTransactionReceiptLineItemTableViewCell *)self setPrimaryText:0];
  [(PKTransactionReceiptLineItemTableViewCell *)self setSecondaryText:0];
  [(PKTransactionReceiptLineItemTableViewCell *)self setTertiaryText:0];
  [(PKTransactionReceiptLineItemTableViewCell *)self setAmountText:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  image = self->_image;
  if (image)
  {
    [(UIImage *)image size];
    PKSizeAspectFit();
    double v11 = v10;
    double v12 = 61.0;
  }
  else
  {
    double v11 = 0.0;
    if (self->_suppressImage) {
      double v12 = 0.0;
    }
    else {
      double v12 = 61.0;
    }
  }
  if (self->_amountText)
  {
    -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", width, 1.79769313e308);
    double v15 = v14;
    if (v13 > 0.0) {
      double v13 = v13 + 16.0;
    }
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v16 = width - v12 - v13 - v6;
  double v17 = v16 - v8;
  if (self->_primaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v16 - v8, 1.79769313e308);
    double v19 = v18 + 0.0 + 2.0;
  }
  else
  {
    double v19 = 0.0;
  }
  if (self->_secondaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v17, 1.79769313e308);
    double v19 = v19 + v20 + 2.0;
  }
  if (self->_tertiaryText)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v17, 1.79769313e308);
    double v19 = v19 + v21;
  }
  double v22 = 16.0;
  double v23 = fmax(v15, fmax(v11, v19)) + 16.0;
  if (!self->_hasTrailingLineSeparator) {
    double v22 = 0.0;
  }
  double v24 = v23 + v22;
  double v25 = width;
  result.height = v24;
  result.double width = v25;
  return result;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
  [(PKTransactionReceiptLineItemTableViewCell *)&v32 layoutSubviews];
  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(PKTransactionReceiptLineItemTableViewCell *)self contentView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v4 + v9;
  double v17 = 16.0;
  double v18 = v11 + 16.0;
  double v19 = v13 - (v4 + v6);
  if (self->_hasTrailingLineSeparator) {
    double v17 = 32.0;
  }
  double v20 = v15 - v17;
  remainder.origin.x = v16;
  remainder.origin.y = v18;
  remainder.size.double width = v19;
  remainder.size.height = v15 - v17;
  int v21 = [(PKTransactionReceiptLineItemTableViewCell *)self _shouldReverseLayoutDirection];
  if (v21) {
    CGRectEdge v22 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v22 = CGRectMinXEdge;
  }
  if (self->_image || !self->_suppressImage)
  {
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.double width = v19;
    v33.size.height = v20;
    CGRectDivide(v33, &v30, &remainder, 45.0, v22);
    [(UIImage *)self->_image size];
    imageView = self->_imageView;
    PKSizeAspectFit();
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](imageView, "setFrame:");
    CGRectDivide(remainder, &v30, &remainder, 16.0, v22);
  }
  else
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  if (v21) {
    CGRectEdge v24 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v24 = CGRectMaxXEdge;
  }
  -[UILabel pkui_sizeThatFits:](self->_amountLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v25, v24);
  amountLabel = self->_amountLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](amountLabel, "setFrame:");
  CGRectDivide(remainder, &v30, &remainder, 16.0, v24);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v27, CGRectMinYEdge);
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
  CGRectDivide(remainder, &v30, &remainder, 2.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v28, CGRectMinYEdge);
  -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
  CGRectDivide(remainder, &v30, &remainder, 2.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v30, &remainder, v29, CGRectMinYEdge);
  -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", *(_OWORD *)&v30.origin, *(_OWORD *)&v30.size);
}

- (void)setImage:(id)a3
{
  p_image = &self->_image;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImageView *)self->_imageView setImage:*p_image];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_primaryText;
  id v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    primaryText = self->_primaryText;
    self->_primaryText = v8;

    [(UILabel *)self->_primaryLabel setText:self->_primaryText];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_secondaryText;
  id v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    secondaryText = self->_secondaryText;
    self->_secondaryText = v8;

    [(UILabel *)self->_secondaryLabel setText:self->_secondaryText];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTertiaryText:(id)a3
{
  id v4 = a3;
  double v5 = self->_tertiaryText;
  id v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    tertiaryText = self->_tertiaryText;
    self->_tertiaryText = v8;

    [(UILabel *)self->_tertiaryLabel setText:self->_tertiaryText];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setAmountText:(id)a3
{
  id v4 = a3;
  double v5 = self->_amountText;
  id v6 = (NSString *)v4;
  double v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    double v8 = (NSString *)[(NSString *)v10 copy];
    amountText = self->_amountText;
    self->_amountText = v8;

    [(UILabel *)self->_amountLabel setText:self->_amountText];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setHasTrailingLineSeparator:(BOOL)a3
{
  if (((!self->_hasTrailingLineSeparator ^ a3) & 1) == 0)
  {
    self->_hasTrailingLineSeparator = a3;
    [(PKTransactionReceiptLineItemTableViewCell *)self setSeparatorStyle:[(PKTransactionReceiptLineItemTableViewCell *)self separatorStyleForTrailingLineSeparator]];
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (int64_t)separatorStyleForTrailingLineSeparator
{
  return self->_hasTrailingLineSeparator;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if ([(PKTransactionReceiptLineItemTableViewCell *)self separatorStyleForTrailingLineSeparator] == a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTransactionReceiptLineItemTableViewCell;
    [(PKTransactionReceiptLineItemTableViewCell *)&v5 setSeparatorStyle:a3];
  }
}

- (void)setSuppressImage:(BOOL)a3
{
  if (((!self->_suppressImage ^ a3) & 1) == 0)
  {
    self->_suppressImage = a3;
    [(PKTransactionReceiptLineItemTableViewCell *)self setNeedsLayout];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSString)amountText
{
  return self->_amountText;
}

- (BOOL)hasTrailingLineSeparator
{
  return self->_hasTrailingLineSeparator;
}

- (BOOL)suppressImage
{
  return self->_suppressImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end