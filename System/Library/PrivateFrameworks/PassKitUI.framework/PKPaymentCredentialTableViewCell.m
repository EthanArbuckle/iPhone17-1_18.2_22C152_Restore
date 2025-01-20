@interface PKPaymentCredentialTableViewCell
+ (CGSize)defaultImageViewSize;
- (BOOL)showingPlaceholder;
- (BOOL)snapshotImageHasBorder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentCredentialTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)snapshotImageView;
- (UILabel)credentialDetailLabel;
- (id)detailTextLabelColor;
- (id)pk_childrenForAppearance;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)setShowingPlaceholder:(BOOL)a3;
- (void)setSnapshotImageHasBorder:(BOOL)a3;
@end

@implementation PKPaymentCredentialTableViewCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentCredentialTableViewCell;
  [(PKTableViewCell *)&v6 pk_applyAppearance:a3];
  v4 = [(PKPaymentCredentialTableViewCell *)self detailTextLabel];
  v5 = [(PKPaymentCredentialTableViewCell *)self detailTextLabelColor];
  [v4 setTextColor:v5];
}

- (PKPaymentCredentialTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCredentialTableViewCell;
  v4 = [(PKPaymentCredentialTableViewCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [(PKPaymentCredentialTableViewCell *)v4 contentView];
    v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B0]);
    v8 = [(PKPaymentCredentialTableViewCell *)v5 textLabel];
    [v8 setNumberOfLines:1];
    [v8 setFont:v7];
    id v9 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    credentialDetailLabel = v5->_credentialDetailLabel;
    v5->_credentialDetailLabel = (UILabel *)v14;

    [(UILabel *)v5->_credentialDetailLabel setFont:v7];
    [(UILabel *)v5->_credentialDetailLabel setNumberOfLines:2];
    [v6 addSubview:v5->_credentialDetailLabel];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v10, v11, v12, v13);
    snapshotImageView = v5->_snapshotImageView;
    v5->_snapshotImageView = (UIImageView *)v16;

    [(UIImageView *)v5->_snapshotImageView setAccessibilityIgnoresInvertColors:1];
    [v6 addSubview:v5->_snapshotImageView];
    v18 = [(UIImageView *)v5->_snapshotImageView layer];
    PKPaymentStyleApplyCorners();
    [v18 setShouldRasterize:1];
    [v18 setRasterizationScale:PKUIScreenScale()];
    [(PKPaymentCredentialTableViewCell *)v5 setSelectionStyle:0];
    v19 = PKProvisioningBackgroundColor();
    [(PKPaymentCredentialTableViewCell *)v5 setBackgroundColor:v19];
  }
  return v5;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentCredentialTableViewCell;
  [(PKPaymentCredentialTableViewCell *)&v31 layoutSubviews];
  int v3 = [(PKPaymentCredentialTableViewCell *)self _shouldReverseLayoutDirection];
  v4 = [(PKPaymentCredentialTableViewCell *)self contentView];
  [v4 frame];
  double Width = CGRectGetWidth(v32);

  objc_super v6 = [(PKPaymentCredentialTableViewCell *)self snapshotImageView];
  v7 = v6;
  if (v3) {
    double v8 = Width + -53.0 + -15.0;
  }
  else {
    double v8 = 15.0;
  }
  objc_msgSend(v6, "setFrame:", v8, 15.0, 53.0, 32.0);
  if ([(PKPaymentCredentialTableViewCell *)self accessoryType]) {
    double v9 = 0.0;
  }
  else {
    double v9 = 40.0;
  }
  v33.origin.y = 15.0;
  v33.origin.x = v8;
  v33.size.width = 53.0;
  v33.size.height = 32.0;
  double v10 = Width - CGRectGetWidth(v33) + -30.0 - v9;
  double v11 = [(PKPaymentCredentialTableViewCell *)self textLabel];
  [v11 sizeToFit];
  [v11 frame];
  double v14 = v13;
  if (v10 >= v12) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  double v16 = 15.0;
  double v17 = v8;
  uint64_t v18 = 0x404A800000000000;
  uint64_t v19 = 0x4040000000000000;
  if (v3) {
    double v20 = CGRectGetMinX(*(CGRect *)&v17) + -15.0 - v15;
  }
  else {
    double v20 = CGRectGetMaxX(*(CGRect *)&v17) + 15.0;
  }
  objc_msgSend(v11, "setFrame:", v20, 10.0, v15, v14);
  objc_super v21 = self->_credentialDetailLabel;
  -[UILabel sizeThatFits:](v21, "sizeThatFits:", v10, 1.79769313e308);
  double v24 = v23;
  if (v10 >= v22) {
    double v10 = v22;
  }
  v34.origin.y = 10.0;
  v34.origin.x = v20;
  v34.size.width = v15;
  v34.size.height = v14;
  double MaxY = CGRectGetMaxY(v34);
  double v26 = 15.0;
  double v27 = v8;
  uint64_t v28 = 0x404A800000000000;
  uint64_t v29 = 0x4040000000000000;
  if (v3) {
    double v30 = CGRectGetMinX(*(CGRect *)&v27) + -15.0 - v10;
  }
  else {
    double v30 = CGRectGetMaxX(*(CGRect *)&v27) + 15.0;
  }
  -[UILabel setFrame:](v21, "setFrame:", v30, MaxY, v10, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(PKPaymentCredentialTableViewCell *)self textLabel];
  objc_super v6 = [v5 font];
  [v6 lineHeight];
  double v8 = v7 + 20.0;

  if ([(PKPaymentCredentialTableViewCell *)self _shouldReverseLayoutDirection])double v9 = width + -53.0 + -15.0; {
  else
  }
    double v9 = 15.0;
  if ([(PKPaymentCredentialTableViewCell *)self accessoryType]) {
    double v10 = 0.0;
  }
  else {
    double v10 = 40.0;
  }
  v16.size.double width = 53.0;
  v16.size.height = 32.0;
  v16.origin.y = 15.0;
  v16.origin.x = v9;
  -[UILabel sizeThatFits:](self->_credentialDetailLabel, "sizeThatFits:", width - CGRectGetWidth(v16) + -30.0 - v10, 1.79769313e308);
  double v12 = v8 + v11;
  double v13 = 60.0;
  if (v12 >= 60.0) {
    double v13 = v12;
  }
  double v14 = width;
  result.height = v13;
  result.double width = v14;
  return result;
}

- (id)detailTextLabelColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (void)setSnapshotImageHasBorder:(BOOL)a3
{
  if (self->_snapshotImageHasBorder != a3)
  {
    self->_snapshotImageHasBorder = a3;
    id v6 = [(UIImageView *)self->_snapshotImageView layer];
    if (self->_snapshotImageHasBorder)
    {
      +[PKTransactionDataOverlayCardFaceView borderWidth];
      if (v4 > 0.0) {
        double v4 = PKUIPixelLength();
      }
      id v5 = +[PKTransactionDataOverlayCardFaceView borderColor];
      [v5 CGColor];
      PKPaymentStyleApplyCorners();
    }
    else
    {
      PKPaymentStyleApplyCorners();
    }
  }
}

+ (CGSize)defaultImageViewSize
{
  double v2 = 53.0;
  double v3 = 32.0;
  result.height = v3;
  result.double width = v2;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentCredentialTableViewCell;
  [(PKTableViewCell *)&v4 prepareForReuse];
  double v3 = [(PKPaymentCredentialTableViewCell *)self textLabel];
  [v3 setText:0];

  [(UILabel *)self->_credentialDetailLabel setText:0];
  [(PKPaymentCredentialTableViewCell *)self setAccessoryType:0];
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (UILabel)credentialDetailLabel
{
  return self->_credentialDetailLabel;
}

- (BOOL)showingPlaceholder
{
  return self->_showingPlaceholder;
}

- (void)setShowingPlaceholder:(BOOL)a3
{
  self->_showingPlaceholder = a3;
}

- (BOOL)snapshotImageHasBorder
{
  return self->_snapshotImageHasBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialDetailLabel, 0);

  objc_storeStrong((id *)&self->_snapshotImageView, 0);
}

@end