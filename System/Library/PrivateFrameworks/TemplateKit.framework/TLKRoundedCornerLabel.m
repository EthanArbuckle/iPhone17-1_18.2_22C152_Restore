@interface TLKRoundedCornerLabel
- (BOOL)allowsVibrancy;
- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3;
- (TLKLabel)label;
- (TLKRoundedCornerLabel)initWithProminence:(unint64_t)a3;
- (UIView)borderView;
- (double)effectiveBaselineOffsetFromBottom;
- (unint64_t)sizeConfiguration;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBorderView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSizeConfiguration:(unint64_t)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFont;
@end

@implementation TLKRoundedCornerLabel

- (TLKRoundedCornerLabel)initWithProminence:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TLKRoundedCornerLabel;
  v4 = [(TLKView *)&v14 init];
  if (v4)
  {
    v5 = [[TLKLabel alloc] initWithProminence:a3];
    [(TLKRoundedCornerLabel *)v4 setLabel:v5];

    v6 = [(TLKRoundedCornerLabel *)v4 label];
    [v6 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

    v7 = [(TLKRoundedCornerLabel *)v4 label];
    [(TLKRoundedCornerLabel *)v4 addSubview:v7];

    v8 = [(TLKRoundedCornerLabel *)v4 label];
    +[TLKLayoutUtilities requireIntrinsicSizeForView:v8];

    -[TLKRoundedCornerLabel setCustomAlignmentRectInsets:](v4, "setCustomAlignmentRectInsets:", 0.0, -2.0, 0.0, -2.0);
    v9 = [(TLKRoundedCornerLabel *)v4 label];
    [v9 setTextAlignment:1];

    v10 = objc_opt_new();
    [(TLKRoundedCornerLabel *)v4 setBorderView:v10];
    v11 = [v10 layer];
    [v11 setBorderWidth:1.0];

    v12 = [v10 layer];
    [v12 setCornerRadius:2.0];

    [(TLKRoundedCornerLabel *)v4 addSubview:v10];
    [(TLKRoundedCornerLabel *)v4 updateFont];
  }
  return v4;
}

- (void)setSizeConfiguration:(unint64_t)a3
{
  if (self->_sizeConfiguration != a3)
  {
    self->_sizeConfiguration = a3;
    [(TLKRoundedCornerLabel *)self updateFont];
  }
}

- (void)updateFont
{
  unint64_t v3 = [(TLKRoundedCornerLabel *)self sizeConfiguration];
  double v4 = 0.0;
  if (v3 <= 2) {
    double v4 = dbl_1B08D3980[v3];
  }
  v5 = (void *)MEMORY[0x1E4FB1798];
  unint64_t v6 = [(TLKRoundedCornerLabel *)self sizeConfiguration];
  v7 = (double *)MEMORY[0x1E4FB29A8];
  if (v6 != 2) {
    v7 = (double *)MEMORY[0x1E4FB29C0];
  }
  id v9 = [v5 systemFontOfSize:v4 weight:*v7];
  v8 = [(TLKRoundedCornerLabel *)self label];
  [v8 setFont:v9];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)TLKRoundedCornerLabel;
  [(TLKView *)&v17 layoutSubviews];
  [(TLKRoundedCornerLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TLKRoundedCornerLabel *)self label];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(TLKRoundedCornerLabel *)self bounds];
  if (!CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28]))
  {
    [(TLKRoundedCornerLabel *)self bounds];
    CGRect v20 = CGRectInset(v19, -2.0, 0.0);
    double x = v20.origin.x;
    double y = v20.origin.y;
    double width = v20.size.width;
    double height = v20.size.height;
    v16 = [(TLKRoundedCornerLabel *)self borderView];
    objc_msgSend(v16, "setFrame:", x, y, width, height);
  }
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(TLKRoundedCornerLabel *)self label];
  objc_msgSend(v5, "effectiveLayoutSizeFittingSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKRoundedCornerLabel;
  [(TLKRoundedCornerLabel *)&v9 traitCollectionDidChange:v4];
  double v5 = [(TLKRoundedCornerLabel *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(TLKRoundedCornerLabel *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKRoundedCornerLabel;
  [(TLKRoundedCornerLabel *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TLKRoundedCornerLabel;
  id v4 = a3;
  [(UIView *)&v11 tlk_updateForAppearance:v4];
  double v5 = [(TLKRoundedCornerLabel *)self label];
  objc_msgSend(v4, "colorForProminence:", objc_msgSend(v5, "prominence"));
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 CGColor];
  uint64_t v8 = [(TLKRoundedCornerLabel *)self borderView];
  objc_super v9 = [v8 layer];
  [v9 setBorderColor:v7];

  double v10 = [(TLKRoundedCornerLabel *)self borderView];
  [v4 enableAppearanceForView:v10];
}

- (BOOL)allowsVibrancy
{
  return 1;
}

- (double)effectiveBaselineOffsetFromBottom
{
  return 0.1;
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)sizeConfiguration
{
  return self->_sizeConfiguration;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end