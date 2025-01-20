@interface PKBarcodeStickerView
+ (PKBarcodeQuietZone)_quietZoneForBarcode:(id)a3;
+ (int64_t)validityStateForPass:(id)a3;
- (BOOL)shouldMatteCode;
- (CGSize)desiredBarcodeSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4;
- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4 passStyle:(int64_t)a5;
- (UIFont)altTextFont;
- (UIImage)altImage;
- (double)altTextInset;
- (id)barcodeImage;
- (int64_t)validity;
- (void)_generateMatteRect:(CGRect *)a3 barcodeRect:(CGRect *)a4 altContentRect:(CGRect *)a5 boundingSize:(CGSize)a6;
- (void)_setupAltImageView;
- (void)_setupAltTextLabel;
- (void)_updateDrawBarcode;
- (void)_updateMatteViewHiding;
- (void)_updateValidity;
- (void)layoutSubviews;
- (void)setAltImage:(id)a3;
- (void)setAltTextFont:(id)a3;
- (void)setAltTextInset:(double)a3;
- (void)setDesiredBarcodeSize:(CGSize)a3;
- (void)setShouldMatteCode:(BOOL)a3;
- (void)setValidity:(int64_t)a3;
@end

@implementation PKBarcodeStickerView

- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4 passStyle:(int64_t)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKBarcodeStickerView;
  v10 = -[PKBarcodeStickerView initWithFrame:](&v19, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  v11 = v10;
  if (v10)
  {
    v10->_desiredBarcodeSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v10->_shouldMatteCode = 1;
    objc_storeStrong((id *)&v10->_barcode, a3);
    v11->_passStyle = a5;
    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = PKUIImageNamed(@"CardBarCodeSticker");
    v14 = objc_msgSend(v13, "pkui_resizableImageByTilingCenterPixel");
    uint64_t v15 = [v12 initWithImage:v14];
    matteView = v11->_matteView;
    v11->_matteView = (UIImageView *)v15;

    [(UIImageView *)v11->_matteView setUserInteractionEnabled:1];
    [(PKBarcodeStickerView *)v11 addSubview:v11->_matteView];
    v17 = [v9 altText];

    if (v17) {
      [(PKBarcodeStickerView *)v11 _setupAltTextLabel];
    }
    [(PKBarcodeStickerView *)v11 setValidity:a4];
    [(PKBarcodeStickerView *)v11 setAccessibilityIdentifier:*MEMORY[0x1E4F852B8]];
  }

  return v11;
}

- (void)setValidity:(int64_t)a3
{
  self->_validity = a3;
  [(PKBarcodeStickerView *)self _updateValidity];

  [(PKBarcodeStickerView *)self setNeedsLayout];
}

- (void)_updateValidity
{
  if (self->_validity)
  {
    [(PKBarcodeStickerView *)self _updateMatteViewHiding];
    [(UIImageView *)self->_barcodeView setAlpha:0.1];
    altTextLabel = self->_altTextLabel;
    if (self->_validity == 3)
    {
      v4 = [MEMORY[0x1E4FB1618] redColor];
      [(UILabel *)altTextLabel setTextColor:v4];

      v5 = self->_altTextLabel;
      v6 = @"PASS_REVOKED";
    }
    else
    {
      v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
      [(UILabel *)altTextLabel setTextColor:v10];

      v5 = self->_altTextLabel;
      v6 = @"PASS_EXPIRED";
    }
    PKLocalizedString(&v6->isa);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:");
  }
  else
  {
    [(UIImageView *)self->_barcodeView setAlpha:1.0];
    v7 = self->_altTextLabel;
    v8 = [(PKBarcode *)self->_barcode altText];
    [(UILabel *)v7 setText:v8];

    [(PKBarcodeStickerView *)self _updateMatteViewHiding];
    id v9 = self->_altTextLabel;
    id v11 = [MEMORY[0x1E4FB1618] blackColor];
    -[UILabel setTextColor:](v9, "setTextColor:");
  }
}

- (void)_setupAltTextLabel
{
  if (!self->_altTextLabel && !self->_altImage)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    altTextLabel = self->_altTextLabel;
    self->_altTextLabel = v3;

    v5 = self->_altTextLabel;
    v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UILabel *)v5 setFont:v6];

    self->_altContentInset = 11.0;
    [(UILabel *)self->_altTextLabel setTextAlignment:1];
    v7 = self->_altTextLabel;
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v7 setBackgroundColor:v8];

    [(UILabel *)self->_altTextLabel sizeToFit];
    [(UILabel *)self->_altTextLabel setUserInteractionEnabled:1];
    [(UILabel *)self->_altTextLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85220]];
    matteView = self->_matteView;
    v10 = self->_altTextLabel;
    [(UIImageView *)matteView addSubview:v10];
  }
}

- (void)layoutSubviews
{
  [(PKBarcodeStickerView *)self _updateDrawBarcode];
  if (self->_drawBarcode
    && ([(PKBarcodeStickerView *)self _updateMatteViewHiding], self->_drawBarcode))
  {
    [(PKBarcodeStickerView *)self bounds];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v4 = self->_altContentInset * 2.0 + 240.0;
    double v6 = 100.0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  -[PKBarcodeStickerView _generateMatteRect:barcodeRect:altContentRect:boundingSize:](self, "_generateMatteRect:barcodeRect:altContentRect:boundingSize:", &v12, &v10, &v8, v4, v6);
  -[UILabel setFrame:](self->_altTextLabel, "setFrame:", v8, v9);
  -[UIImageView setFrame:](self->_altImageView, "setFrame:", v8, v9);
  -[UIImageView setFrame:](self->_matteView, "setFrame:", v12, v13);
  [(PKBarcodeStickerView *)self _updateMatteViewHiding];
  -[UIImageView setFrame:](self->_barcodeView, "setFrame:", v10, v11);
  [(PKBarcodeStickerView *)self _updateValidity];
  v7.receiver = self;
  v7.super_class = (Class)PKBarcodeStickerView;
  [(PKBarcodeStickerView *)&v7 layoutSubviews];
}

- (void)_updateMatteViewHiding
{
  matteView = self->_matteView;
  BOOL v4 = !self->_shouldMatteCode && !self->_drawBarcode;
  [(UIImageView *)matteView setHidden:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKBarcodeStickerView *)self _updateDrawBarcode];
  long long v8 = 0u;
  long long v9 = 0u;
  -[PKBarcodeStickerView _generateMatteRect:barcodeRect:altContentRect:boundingSize:](self, "_generateMatteRect:barcodeRect:altContentRect:boundingSize:", &v8, 0, 0, width, height);
  double v7 = *((double *)&v9 + 1);
  double v6 = *(double *)&v9;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)_updateDrawBarcode
{
  if ([(PKBarcode *)self->_barcode format])
  {
    double v3 = [(PKBarcodeStickerView *)self barcodeImage];
    self->_drawBarcode = v3 != 0;
  }
  else
  {
    self->_drawBarcode = 0;
  }
}

- (id)barcodeImage
{
  barcodeImage = self->_barcodeImage;
  if (!barcodeImage)
  {
    BOOL v4 = [(PKBarcode *)self->_barcode image];
    double v5 = self->_barcodeImage;
    self->_barcodeImage = v4;

    barcodeImage = self->_barcodeImage;
  }

  return barcodeImage;
}

- (void)_generateMatteRect:(CGRect *)a3 barcodeRect:(CGRect *)a4 altContentRect:(CGRect *)a5 boundingSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  [(PKBarcode *)self->_barcode sizeForPassStyle:self->_passStyle];
  double v13 = v12;
  double v15 = v14;
  if (*MEMORY[0x1E4F1DB30] != self->_desiredBarcodeSize.width
    || *(double *)(MEMORY[0x1E4F1DB30] + 8) != self->_desiredBarcodeSize.height)
  {
    PKSizeScaleAspectFit();
    double v13 = v17;
    double v15 = v18;
  }
  if (self->_drawBarcode)
  {
    if (self->_barcodeViewInvalidated)
    {
      barcodeView = self->_barcodeView;
      if (barcodeView)
      {
        [(UIImageView *)barcodeView removeFromSuperview];
        v20 = self->_barcodeView;
        self->_barcodeView = 0;
      }
      self->_barcodeViewInvalidated = 0;
    }
    if (!self->_barcodeView)
    {
      v21 = -[PKBarcode imageWithSize:](self->_barcode, "imageWithSize:", v13, v15);
      v22 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v21];
      v23 = self->_barcodeView;
      self->_barcodeView = v22;

      [(UIImageView *)self->_barcodeView setUserInteractionEnabled:1];
      [(UIImageView *)self->_matteView addSubview:self->_barcodeView];
    }
    double v24 = v15;
    [(PKBarcode *)self->_barcode variance];
    double v27 = v26;
    if (v25 <= 0.0
      || (double v28 = v25,
          [(UIImageView *)self->_barcodeView image],
          v29 = objc_claimAutoreleasedReturnValue(),
          [v29 size],
          double v31 = vabdd_f64(v13, v30),
          v29,
          v31 >= v28))
    {
      if (v27 <= 0.0)
      {
        double v15 = v24;
        goto LABEL_20;
      }
      v32 = [(UIImageView *)self->_barcodeView image];
      [v32 size];
      double v34 = vabdd_f64(v24, v33);

      BOOL v35 = v34 < v27;
      double v15 = v24;
      if (!v35) {
        goto LABEL_20;
      }
    }
    [(UIImageView *)self->_barcodeView frame];
    double v13 = v36;
    double v15 = v37;
  }
LABEL_20:
  if ([(PKBarcode *)self->_barcode format] == 4 && v15 <= self->_desiredBarcodeSize.height) {
    double v15 = self->_desiredBarcodeSize.height;
  }
  if (self->_shouldMatteCode)
  {
    +[PKBarcodeStickerView _quietZoneForBarcode:self->_barcode];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
  }
  else
  {
    double v40 = 0.0;
    double v42 = 0.0;
    double v44 = 0.0;
    double v38 = 0.0;
  }
  altImageView = self->_altImageView;
  double v70 = v38;
  if (altImageView)
  {
    -[UIImageView sizeThatFits:](altImageView, "sizeThatFits:", width, height);
    double v48 = v47;
    double v68 = 3.0;
  }
  else
  {
    altTextLabel = self->_altTextLabel;
    double v68 = 0.0;
    if (altTextLabel)
    {
      -[UILabel sizeThatFits:](altTextLabel, "sizeThatFits:", width, height);
      double v48 = v50;
    }
    else
    {
      double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double altContentInset = self->_altContentInset;
  if (v46 >= width + altContentInset * -2.0) {
    double v52 = width + altContentInset * -2.0;
  }
  else {
    double v52 = v46;
  }
  if (v52 + altContentInset * 2.0 <= v13 + v42 * 2.0) {
    double v53 = v13 + v42 * 2.0;
  }
  else {
    double v53 = v52 + altContentInset * 2.0;
  }
  double v54 = v44 + v15 + v40;
  double v55 = -0.0;
  if (v48 > 0.0) {
    double v55 = v48 + -2.0;
  }
  CGFloat v56 = v40;
  CGFloat v57 = v15;
  double v58 = v13;
  double v59 = v54 + v55;
  v60 = [(UIImageView *)self->_matteView image];
  [v60 size];
  double v62 = v61;

  if (v62 > v59) {
    double v59 = v62;
  }
  double v63 = 0.5;
  double v64 = floor((v53 - v58) * 0.5);
  CGFloat v69 = v56;
  if (self->_drawBarcode)
  {
    v71.origin.x = v64;
    v71.origin.y = v56;
    CGFloat v65 = v58;
    v71.size.double width = v58;
    v71.size.double height = v57;
    CGFloat MaxY = CGRectGetMaxY(v71);
    double v63 = 0.5;
    double v67 = v70 + v68 + MaxY + -2.0;
    if (!a3) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  CGFloat v65 = v58;
  double v67 = floor((v59 - v48) * 0.5);
  if (a3)
  {
LABEL_43:
    a3->origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
    a3->size.double width = v53;
    a3->size.double height = v59;
  }
LABEL_44:
  if (a4)
  {
    a4->origin.x = v64;
    a4->origin.y = v69;
    a4->size.double width = v65;
    a4->size.double height = v57;
  }
  if (a5)
  {
    a5->origin.x = floor((v53 - v52) * v63);
    a5->origin.y = v67;
    a5->size.double width = v52;
    a5->size.double height = v48;
  }
}

+ (PKBarcodeQuietZone)_quietZoneForBarcode:(id)a3
{
  uint64_t v3 = [a3 format];
  double v4 = 5.0;
  double v5 = 9.0;
  if (v3 == 2) {
    double v4 = 9.0;
  }
  double v6 = 6.0;
  if (v3 == 2) {
    double v6 = 9.0;
  }
  double v7 = 7.0;
  if (v3 == 2) {
    double v7 = 9.0;
  }
  else {
    double v5 = 0.0;
  }
  result.var3 = v5;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

+ (int64_t)validityStateForPass:(id)a3
{
  id v3 = a3;
  if ([v3 isRevoked])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isVoided])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = [v3 isExpired];
  }

  return v4;
}

- (PKBarcodeStickerView)initWithBarcode:(id)a3 validityState:(int64_t)a4
{
  return [(PKBarcodeStickerView *)self initWithBarcode:a3 validityState:a4 passStyle:5];
}

- (void)setAltTextFont:(id)a3
{
  [(UILabel *)self->_altTextLabel setFont:a3];
  self->_barcodeViewInvalidated = 1;

  [(PKBarcodeStickerView *)self setNeedsLayout];
}

- (UIFont)altTextFont
{
  return [(UILabel *)self->_altTextLabel font];
}

- (void)setAltTextInset:(double)a3
{
  self->_double altContentInset = a3;
  self->_barcodeViewInvalidated = 1;
  [(PKBarcodeStickerView *)self setNeedsLayout];
}

- (void)setAltImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_altImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_altImage, a3);
    [(PKBarcodeStickerView *)self _setupAltImageView];
    [(PKBarcodeStickerView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)_setupAltImageView
{
  altImage = self->_altImage;
  altImageView = self->_altImageView;
  if (altImage)
  {
    if (!altImageView)
    {
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v6 = self->_altImageView;
      self->_altImageView = v5;

      [(UIImageView *)self->_altImageView setContentMode:1];
      [(UIImageView *)self->_altImageView setClipsToBounds:1];
      [(UIImageView *)self->_matteView addSubview:self->_altImageView];
    }
    self->_double altContentInset = 11.0;
    [(UIImageView *)self->_altImageView setImage:self->_altImage];
    [(UILabel *)self->_altTextLabel removeFromSuperview];
  }
  else
  {
    [(UIImageView *)altImageView removeFromSuperview];
    [(PKBarcodeStickerView *)self _setupAltTextLabel];
  }

  [(PKBarcodeStickerView *)self setNeedsLayout];
}

- (void)setDesiredBarcodeSize:(CGSize)a3
{
  self->_desiredBarcodeSize = a3;
  self->_barcodeViewInvalidated = 1;
  [(PKBarcodeStickerView *)self setNeedsLayout];
}

- (int64_t)validity
{
  return self->_validity;
}

- (CGSize)desiredBarcodeSize
{
  double width = self->_desiredBarcodeSize.width;
  double height = self->_desiredBarcodeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldMatteCode
{
  return self->_shouldMatteCode;
}

- (void)setShouldMatteCode:(BOOL)a3
{
  self->_shouldMatteCode = a3;
}

- (double)altTextInset
{
  return self->_altTextInset;
}

- (UIImage)altImage
{
  return self->_altImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altImageView, 0);
  objc_storeStrong((id *)&self->_altImage, 0);
  objc_storeStrong((id *)&self->_altTextLabel, 0);
  objc_storeStrong((id *)&self->_matteConstraints, 0);
  objc_storeStrong((id *)&self->_stickerConstraints, 0);
  objc_storeStrong((id *)&self->_barcodeView, 0);
  objc_storeStrong((id *)&self->_matteView, 0);
  objc_storeStrong((id *)&self->_barcodeImage, 0);

  objc_storeStrong((id *)&self->_barcode, 0);
}

@end