@interface PKDataReleaseHeader
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDataReleaseHeader)initWithDelegate:(id)a3;
- (double)backgroundViewAlpha;
- (void)_dismiss;
- (void)layoutSubviews;
- (void)setBackgroundViewAlpha:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDataReleaseHeader

- (double)backgroundViewAlpha
{
  [(UIVisualEffectView *)self->_headerMaterial alpha];
  return result;
}

- (void)setBackgroundViewAlpha:(double)a3
{
  -[UIVisualEffectView setAlpha:](self->_headerMaterial, "setAlpha:");
  separator = self->_separator;

  [(UIView *)separator setAlpha:a3];
}

- (PKDataReleaseHeader)initWithDelegate:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKDataReleaseHeader;
  v5 = [(PKDataReleaseHeader *)&v33 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
    headerMaterial = v6->_headerMaterial;
    v6->_headerMaterial = (UIVisualEffectView *)v8;

    [(PKDataReleaseHeader *)v6 addSubview:v6->_headerMaterial];
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    logo = v6->_logo;
    v6->_logo = v10;

    [(UIImageView *)v6->_logo setContentMode:1];
    [(UIImageView *)v6->_logo _setContinuousCornerRadius:4.0];
    v12 = [(UIImageView *)v6->_logo layer];
    id v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    v14 = [(UIImageView *)v6->_logo layer];
    [v14 setBorderWidth:PKUIPixelLength()];

    v15 = [(UIImageView *)v6->_logo layer];
    [v15 setMasksToBounds:1];

    v16 = v6->_logo;
    v17 = PKUIImageNamed(@"IdentityPhysicalPresentmentLogo");
    [(UIImageView *)v16 setImage:v17];

    [(PKDataReleaseHeader *)v6 addSubview:v6->_logo];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v6->_label;
    v6->_label = v18;

    v20 = v6->_label;
    v21 = PKLocalizedString(&cfstr_Wallet_0.isa);
    [(UILabel *)v20 setText:v21];

    v22 = v6->_label;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v22 setTextColor:v23];

    v24 = v6->_label;
    v25 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [(UILabel *)v24 setFont:v25];

    [(PKDataReleaseHeader *)v6 addSubview:v6->_label];
    uint64_t v26 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
    dismissButton = v6->_dismissButton;
    v6->_dismissButton = (UIButton *)v26;

    [(UIButton *)v6->_dismissButton addTarget:v6 action:sel__dismiss forControlEvents:0x2000];
    [(PKDataReleaseHeader *)v6 addSubview:v6->_dismissButton];
    v28 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separator = v6->_separator;
    v6->_separator = v28;

    v30 = v6->_separator;
    v31 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
    [(UIView *)v30 setBackgroundColor:v31];

    [(UIView *)v6->_separator setClipsToBounds:0];
    [(PKDataReleaseHeader *)v6 addSubview:v6->_separator];
  }
  return v6;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PKDataReleaseHeader;
  [(PKDataReleaseHeader *)&v25 layoutSubviews];
  memset(&slice, 0, sizeof(slice));
  [(PKDataReleaseHeader *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v23.origin.x = v3;
  v23.origin.y = v5;
  v23.size.width = v7;
  v23.size.height = v9;
  -[UIVisualEffectView setFrame:](self->_headerMaterial, "setFrame:");
  double v11 = PKUIPixelLength();
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGRectDivide(v26, &slice, &v23, v11, CGRectMaxYEdge);
  -[UIView setFrame:](self->_separator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  if ([(PKDataReleaseHeader *)self _shouldReverseLayoutDirection]) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0x200000000;
  }
  CGRectDivide(v23, &slice, &v23, 20.0, (CGRectEdge)v12);
  CGRectDivide(v23, &slice, &v23, 20.0, HIDWORD(v12));
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v23.size.width, v23.size.height);
  CGFloat v14 = v13;
  CGRectDivide(v23, &slice, &v23, v15, (CGRectEdge)v12);
  logo = self->_logo;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](logo, "setFrame:");
  CGRectDivide(v23, &slice, &v23, 5.0, (CGRectEdge)v12);
  CGRectDivide(v23, &slice, &v23, v14, (CGRectEdge)v12);
  label = self->_label;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](label, "setFrame:");
  [(UIButton *)self->_dismissButton sizeToFit];
  [(UIButton *)self->_dismissButton bounds];
  double v19 = v18;
  v20 = [(UIButton *)self->_dismissButton configuration];
  v21 = [v20 background];
  [v21 setCornerRadius:v19 * 0.5];

  CGRectDivide(v23, &slice, &v23, v19, HIDWORD(v12));
  dismissButton = self->_dismissButton;
  PKSizeAlignedInRect();
  -[UIButton setFrame:](dismissButton, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIButton sizeThatFits:](self->_dismissButton, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5;
  CGFloat v7 = [(UILabel *)self->_label font];
  [v7 lineHeight];
  if (v8 > v6)
  {
    CGFloat v9 = [(UILabel *)self->_label font];
    [v9 lineHeight];
    double v6 = v10;
  }
  double v11 = width;
  double v12 = v6 + 40.0;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)_dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataReleaseHeaderDidTapDismiss];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseHeader;
  id v4 = a3;
  [(PKDataReleaseHeader *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PKDataReleaseHeader *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    CGFloat v7 = [(UIImageView *)self->_logo layer];
    id v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_headerMaterial, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end