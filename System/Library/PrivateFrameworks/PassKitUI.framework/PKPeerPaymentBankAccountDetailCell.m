@interface PKPeerPaymentBankAccountDetailCell
- (BOOL)shouldDrawFullWidthSeperator;
- (BOOL)shouldDrawSeperator;
- (CGRect)_separatorFrame;
- (CGSize)_layoutSubviewsInBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPeerPaymentBankAccountDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)minimumTextLabelWidth;
- (void)layoutSubviews;
- (void)setMinimumTextLabelWidth:(double)a3;
- (void)setShouldDrawFullWidthSeperator:(BOOL)a3;
- (void)setShouldDrawSeperator:(BOOL)a3;
@end

@implementation PKPeerPaymentBankAccountDetailCell

- (PKPeerPaymentBankAccountDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  v4 = [(PKPeerPaymentBankAccountDetailCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    referenceConfiguration = v4->_referenceConfiguration;
    v4->_referenceConfiguration = (UIListContentConfiguration *)v5;

    [(PKPeerPaymentBankAccountDetailCell *)v4 setPreservesSuperviewLayoutMargins:0];
    -[PKPeerPaymentBankAccountDetailCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(PKPeerPaymentBankAccountDetailCell *)v4 setSelectionStyle:0];
    v7 = PKProvisioningSecondaryBackgroundColor();
    [(PKPeerPaymentBankAccountDetailCell *)v4 setBackgroundColor:v7];

    v8 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    v9 = (NSString *)*MEMORY[0x1E4FB28C8];
    v10 = (NSString *)*MEMORY[0x1E4FB27B0];
    v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27B0], 2, 0);
    [v8 setFont:v11];

    v12 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v12 setMinimumScaleFactor:0.7];

    v13 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v13 setBaselineAdjustment:1];

    v14 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v15 setText:0];

    v16 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v16 setNumberOfLines:0];

    v17 = [(PKPeerPaymentBankAccountDetailCell *)v4 textLabel];
    [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

    v18 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v18 setText:0];

    v19 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v19 setSecureTextEntry:1];

    v20 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v20 setDisplaySecureTextUsingPlainText:1];

    v21 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    v22 = PKFontForDefaultDesign(v9, v10);
    [v21 setFont:v22];

    v23 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v23 setAdjustsFontSizeToFitWidth:0];

    v24 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    v25 = PKLocalizedPaymentString(&cfstr_Required.isa);
    [v24 setPlaceholder:v25];

    v26 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v26 setClearButtonMode:1];

    v27 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v27 setAutocorrectionType:1];

    v28 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v28 setAutocapitalizationType:1];

    v29 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v29 setKeyboardType:11];

    v30 = [(PKPeerPaymentBankAccountDetailCell *)v4 editableTextField];
    [v30 setInputView:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  [(PKPeerPaymentBankAccountDetailCell *)&v12 layoutSubviews];
  v3 = [(PKPeerPaymentBankAccountDetailCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKPeerPaymentBankAccountDetailCell _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 0, v5, v7, v9, v11);
}

- (CGSize)_layoutSubviewsInBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(PKPeerPaymentBankAccountDetailCell *)self textLabel];
  double v11 = [(PKPeerPaymentBankAccountDetailCell *)self editableTextField];
  if (v11)
  {
    int v12 = [(PKPeerPaymentBankAccountDetailCell *)self _shouldReverseLayoutDirection];
    [(UIListContentConfiguration *)self->_referenceConfiguration directionalLayoutMargins];
    if (v12) {
      double v17 = v16;
    }
    else {
      double v17 = v14;
    }
    if (!v12) {
      double v14 = v16;
    }
    double v18 = x + v17;
    double v19 = y + v13;
    double v41 = width;
    double v20 = width - (v17 + v14);
    double v21 = v13 + v15;
    double v22 = height - v21;
    double v40 = v21 + 0.0;
    double minimumTextLabelWidth = self->_minimumTextLabelWidth;
    memset(&slice, 0, sizeof(slice));
    remainder.origin.double x = x + v17;
    remainder.origin.double y = v19;
    remainder.size.double width = v20;
    remainder.size.double height = height - v21;
    if (minimumTextLabelWidth <= v20 + -122.0)
    {
      if (v12) {
        CGRectEdge v31 = CGRectMaxXEdge;
      }
      else {
        CGRectEdge v31 = CGRectMinXEdge;
      }
      objc_msgSend(v10, "sizeThatFits:", v20 + -122.0, 3.40282347e38);
      double v33 = v32;
      CGFloat v35 = fmax(v34, self->_minimumTextLabelWidth);
      v49.origin.double x = v18;
      v49.origin.double y = v19;
      v49.size.double width = v20;
      v49.size.double height = v22;
      CGRectDivide(v49, &slice, &remainder, v35, v31);
      if (a4)
      {
        CGRectDivide(remainder, &slice, &remainder, 22.0, v31);
      }
      else
      {
        objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
        CGRectDivide(remainder, &slice, &remainder, 22.0, v31);
        objc_msgSend(v11, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      }
      double width = v41;
      double v30 = v40 + v33;
    }
    else
    {
      double v39 = height;
      v45.origin.double x = x + v17;
      v45.origin.double y = v19;
      v45.size.double width = v20;
      v45.size.double height = v22;
      objc_msgSend(v10, "sizeThatFits:", CGRectGetWidth(v45), 3.40282347e38);
      double v25 = v24;
      v46.origin.double x = v18;
      v46.origin.double y = v19;
      v46.size.double width = v20;
      v46.size.double height = v22;
      objc_msgSend(v11, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
      CGFloat v27 = v26;
      CGFloat v28 = v25 + v26;
      v47.origin.double x = v18;
      v47.origin.double y = v19;
      v47.size.double width = v20;
      v47.size.double height = v22;
      CGRectDivide(v47, &slice, &remainder, v28, CGRectMinYEdge);
      PKRectCenteredYInRect();
      CGRect remainder = v48;
      CGRectDivide(v48, &slice, &remainder, v25, CGRectMinYEdge);
      if (!a4) {
        objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      }
      double v29 = v40 + v25;
      CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
      double width = v41;
      if (!a4) {
        objc_msgSend(v11, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      }
      double v30 = v29 + v27;
      double height = v39;
    }
  }
  else
  {
    double v30 = 0.0;
  }
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  CGFloat v36 = CGRectGetWidth(v50);

  double v37 = v36;
  double v38 = v30;
  result.double height = v38;
  result.double width = v37;
  return result;
}

- (void)setMinimumTextLabelWidth:(double)a3
{
  if (self->_minimumTextLabelWidth != a3)
  {
    self->_double minimumTextLabelWidth = a3;
    [(PKPeerPaymentBankAccountDetailCell *)self setNeedsLayout];
  }
}

- (CGRect)_separatorFrame
{
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  [(PKPeerPaymentBankAccountDetailCell *)&v15 _separatorFrame];
  if (self->_shouldDrawSeperator)
  {
    double v5 = v3;
    double v6 = v4;
    if (self->_shouldDrawFullWidthSeperator)
    {
      [(PKPeerPaymentBankAccountDetailCell *)self bounds];
      double Width = CGRectGetWidth(v16);
      double v8 = 0.0;
    }
    else
    {
      [(UIListContentConfiguration *)self->_referenceConfiguration directionalLayoutMargins];
      double v10 = v9;
      int v11 = [(PKPeerPaymentBankAccountDetailCell *)self _shouldReverseLayoutDirection];
      [(PKPeerPaymentBankAccountDetailCell *)self bounds];
      CGRectGetWidth(v17);
      if (v11) {
        double v8 = 0.0;
      }
      else {
        double v8 = v10;
      }
      [(PKPeerPaymentBankAccountDetailCell *)self bounds];
      double Width = CGRectGetWidth(v18) - v10;
    }
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double Width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v12 = v8;
  double v13 = v5;
  double v14 = v6;
  result.size.double height = v14;
  result.size.double width = Width;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPeerPaymentBankAccountDetailCell _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)shouldDrawSeperator
{
  return self->_shouldDrawSeperator;
}

- (void)setShouldDrawSeperator:(BOOL)a3
{
  self->_shouldDrawSeperator = a3;
}

- (BOOL)shouldDrawFullWidthSeperator
{
  return self->_shouldDrawFullWidthSeperator;
}

- (void)setShouldDrawFullWidthSeperator:(BOOL)a3
{
  self->_shouldDrawFullWidthSeperator = a3;
}

- (double)minimumTextLabelWidth
{
  return self->_minimumTextLabelWidth;
}

- (void).cxx_destruct
{
}

@end