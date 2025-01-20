@interface NUErrorView
- (BOOL)isAccessibilityElement;
- (NUErrorMessage)errorMessage;
- (NUErrorView)initWithErrorMessage:(id)a3;
- (NUTrait)labelMaxWidthTrait;
- (UILabel)label;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)attributedStringForErrorMessage:(id)a3;
- (int64_t)textAlignment;
- (unint64_t)verticalAlignment;
- (void)errorMessage:(id)a3;
- (void)layoutSubviews;
- (void)setErrorMessage:(id)a3;
- (void)setLabelMaxWidthTrait:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setVerticalAlignment:(unint64_t)a3;
@end

@implementation NUErrorView

- (NUErrorView)initWithErrorMessage:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NUErrorView;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = -[NUErrorView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_errorMessage, a3);
    v11->_verticalAlignment = 0;
    v11->_textAlignment = 1;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v6, v7, v8, v9);
    label = v11->_label;
    v11->_label = (UILabel *)v12;

    v14 = [MEMORY[0x263F1C550] colorWithRed:0.490196078 green:0.498039216 blue:0.498039216 alpha:1.0];
    [(UILabel *)v11->_label setTextColor:v14];

    [(UILabel *)v11->_label setNumberOfLines:0];
    [(UILabel *)v11->_label setAutoresizingMask:2];
    v15 = [(NUErrorView *)v11 attributedStringForErrorMessage:v5];
    [(UILabel *)v11->_label setAttributedText:v15];

    [(NUErrorView *)v11 addSubview:v11->_label];
    [(UILabel *)v11->_label sizeToFit];
  }

  return v11;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)NUErrorView;
  [(NUErrorView *)&v32 layoutSubviews];
  v3 = [(NUErrorView *)self labelMaxWidthTrait];
  v4 = [(NUErrorView *)self traitCollection];
  [(NUErrorView *)self bounds];
  objc_msgSend(v3, "valueForTraitCollection:size:", v4, v5, v6);
  double v8 = v7;
  double v9 = [(NUErrorView *)self label];
  [v9 setPreferredMaxLayoutWidth:v8];

  v10 = [(NUErrorView *)self label];
  [v10 frame];
  double v12 = v11;

  v13 = [(NUErrorView *)self label];
  [v13 preferredMaxLayoutWidth];
  CGFloat v15 = v14;

  v16 = [(NUErrorView *)self label];
  [v16 intrinsicContentSize];
  double v18 = v17;

  [(NUErrorView *)self bounds];
  double v20 = v19;
  v21 = [(NUErrorView *)self label];
  [v21 preferredMaxLayoutWidth];
  double v23 = v22;

  unint64_t v24 = [(NUErrorView *)self verticalAlignment];
  if (v24)
  {
    if (v24 == 1)
    {
      [(NUErrorView *)self center];
      double v12 = v25 + v18 * -0.5;
    }
  }
  else
  {
    [(NUErrorView *)self bounds];
    double v12 = v26 / 3.0 + v18 * -0.5;
  }
  v33.origin.double x = (v20 - v23) * 0.5;
  v33.origin.double y = v12;
  v33.size.double width = v15;
  v33.size.double height = v18;
  CGRect v34 = CGRectIntegral(v33);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  v31 = [(NUErrorView *)self label];
  objc_msgSend(v31, "setFrame:", x, y, width, height);
}

- (void)errorMessage:(id)a3
{
  id v4 = a3;
  errorMessage = self->_errorMessage;
  id v9 = v4;
  if (!errorMessage || ![(NUErrorMessage *)errorMessage isEqual:v4])
  {
    double v6 = [(NUErrorView *)self attributedStringForErrorMessage:v9];
    double v7 = [(NUErrorView *)self label];
    [v7 setAttributedText:v6];

    double v8 = [(NUErrorView *)self label];
    [v8 sizeToFit];

    [(NUErrorView *)self setNeedsLayout];
    [(NUErrorView *)self layoutIfNeeded];
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = [(NUErrorView *)self label];
  v3 = [v2 text];

  return v3;
}

- (id)attributedStringForErrorMessage:(id)a3
{
  id v4 = a3;
  double v5 = [v4 title];
  double v6 = [v4 subtitle];

  double v7 = &stru_26D495918;
  if (v5 && v6)
  {
    double v8 = [NSString stringWithFormat:@"%@\n%@", v5, v6];
    id v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];
    v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    double v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    uint64_t v12 = *MEMORY[0x263F1C238];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F1C238], v10, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v9, "addAttribute:value:range:", v12, v11, objc_msgSend(v5, "length"), objc_msgSend(v6, "length"));
    id v13 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v13 setLineSpacing:2.0];
    objc_msgSend(v13, "setAlignment:", -[NUErrorView textAlignment](self, "textAlignment"));
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F1C268], v13, 0, objc_msgSend(v9, "length"));
    double v7 = (__CFString *)[v9 copy];
  }

  return v7;
}

- (NUTrait)labelMaxWidthTrait
{
  labelMaxWidthTrait = self->_labelMaxWidthTrait;
  if (!labelMaxWidthTrait)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc_init(NUTrait);
    double v5 = [(NUTrait *)v4 when:3 block:&__block_literal_global_18];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__NUErrorView_labelMaxWidthTrait__block_invoke_2;
    v9[3] = &unk_2645FE108;
    objc_copyWeak(&v10, &location);
    double v6 = [v5 when:12 block:v9];
    double v7 = self->_labelMaxWidthTrait;
    self->_labelMaxWidthTrait = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    labelMaxWidthTrait = self->_labelMaxWidthTrait;
  }

  return labelMaxWidthTrait;
}

double __33__NUErrorView_labelMaxWidthTrait__block_invoke(double a1, uint64_t a2, void *a3)
{
  int v4 = [a3 isLandscape];
  double v5 = 0.7;
  if (!v4) {
    double v5 = 0.75;
  }
  return a1 * v5;
}

double __33__NUErrorView_labelMaxWidthTrait__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  if ([a2 isLandscape])
  {
    if (a3 > 540.0)
    {
      double v5 = 0.4;
      goto LABEL_7;
    }
LABEL_5:
    double v6 = 0.7;
    return a3 * v6;
  }
  if (a3 < 768.0) {
    goto LABEL_5;
  }
  double v5 = 0.3;
LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = [WeakRetained textAlignment];

  double v6 = 0.7;
  if (v8) {
    double v6 = v5;
  }
  return a3 * v6;
}

- (NUErrorMessage)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  self->_verticalAlignment = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabelMaxWidthTrait:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMaxWidthTrait, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end