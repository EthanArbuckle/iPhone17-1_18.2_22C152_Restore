@interface PKBarcodeTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKBarcodeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPass)pass;
- (int64_t)barcodeStyle;
- (void)_computeMaxBarcodeSize;
- (void)layoutSubviews;
- (void)setBarcodeStyle:(int64_t)a3;
- (void)setPass:(id)a3;
@end

@implementation PKBarcodeTableViewCell

- (PKBarcodeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKBarcodeTableViewCell;
  v5 = [(PKBarcodeTableViewCell *)&v8 initWithStyle:0 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    v5->_barcodeStyle = a3;
    [(PKBarcodeTableViewCell *)v5 setSelectionStyle:0];
    [(PKBarcodeTableViewCell *)v6 _computeMaxBarcodeSize];
  }
  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKBarcodeTableViewCell;
  [(PKBarcodeTableViewCell *)&v3 layoutSubviews];
  -[PKBarcodeStickerView sizeThatFits:](self->_barcodeStickerView, "sizeThatFits:", 290.0, dbl_1A0444630[[(PKPass *)self->_pass style] == 4]);
  [(PKBarcodeTableViewCell *)self frame];
  UIRectCenteredXInRect();
  -[PKBarcodeStickerView setFrame:](self->_barcodeStickerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKBarcodeStickerView sizeThatFits:](self->_barcodeStickerView, "sizeThatFits:", self->_maximumBarcodeSize.width, self->_maximumBarcodeSize.height);
  double v5 = v4 + 8.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setPass:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v11 = v5;
    double v6 = [v5 barcode];

    id v5 = v11;
    if (v6)
    {
      objc_storeStrong((id *)&self->_pass, a3);
      [(PKBarcodeStickerView *)self->_barcodeStickerView removeFromSuperview];
      v7 = [PKBarcodeStickerView alloc];
      objc_super v8 = [v11 barcode];
      v9 = [(PKBarcodeStickerView *)v7 initWithBarcode:v8 validityState:+[PKBarcodeStickerView validityStateForPass:v11]];
      barcodeStickerView = self->_barcodeStickerView;
      self->_barcodeStickerView = v9;

      [(PKBarcodeStickerView *)self->_barcodeStickerView sizeToFit];
      [(PKBarcodeStickerView *)self->_barcodeStickerView layoutIfNeeded];
      [(PKBarcodeTableViewCell *)self addSubview:self->_barcodeStickerView];
      id v5 = v11;
    }
  }
}

- (void)setBarcodeStyle:(int64_t)a3
{
  self->_barcodeStyle = a3;
  [(PKBarcodeTableViewCell *)self _computeMaxBarcodeSize];
  [(PKBarcodeTableViewCell *)self sizeToFit];

  [(PKBarcodeTableViewCell *)self setNeedsLayout];
}

- (void)_computeMaxBarcodeSize
{
  int64_t barcodeStyle = self->_barcodeStyle;
  if (barcodeStyle == 1)
  {
    objc_super v3 = &PKBoardingPassMaxBarcodeSize;
  }
  else
  {
    if (barcodeStyle) {
      return;
    }
    objc_super v3 = &PKMaxBarcodeSize;
  }
  self->_maximumBarcodeSize = (CGSize)*v3;
}

- (PKPass)pass
{
  return self->_pass;
}

- (int64_t)barcodeStyle
{
  return self->_barcodeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_barcodeStickerView, 0);
}

@end