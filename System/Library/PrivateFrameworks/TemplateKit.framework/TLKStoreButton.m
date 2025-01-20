@interface TLKStoreButton
- (BOOL)isEmphasized;
- (BOOL)useCompactMode;
- (CGSize)intrinsicContentSize;
- (NSString)title;
- (TLKLabel)label;
- (TLKProminenceView)highlightView;
- (TLKRichText)richTitle;
- (TLKStoreButton)init;
- (UIFont)font;
- (UIView)backgroundView;
- (double)cornerRadius;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFont:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsEmphasized:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setRichTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseCompactMode:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TLKStoreButton

- (TLKStoreButton)init
{
  v6.receiver = self;
  v6.super_class = (Class)TLKStoreButton;
  v2 = [(TLKStoreButton *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setUserInteractionEnabled:0];
    [(TLKStoreButton *)v2 setBackgroundView:v3];
    [(TLKStoreButton *)v2 addSubview:v3];
    v4 = objc_opt_new();
    [v4 setAdjustsFontSizeToFitWidth:1];
    [v4 setBaselineAdjustment:1];
    [v4 setTextAlignment:1];
    [(TLKStoreButton *)v2 setLabel:v4];
    [(TLKStoreButton *)v2 addSubview:v4];
    [(TLKStoreButton *)v2 setUseCompactMode:0];
  }
  return v2;
}

- (void)setUseCompactMode:(BOOL)a3
{
  self->_useCompactMode = a3;
  double v4 = 15.0;
  if (a3) {
    double v4 = 12.0;
  }
  v5 = [MEMORY[0x1E4FB1798] boldSystemFontOfSize:v4];
  [(TLKStoreButton *)self setFont:v5];

  [(TLKStoreButton *)self setCornerRadius:0.0];
}

- (UIFont)font
{
  v2 = [(TLKStoreButton *)self label];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(TLKStoreButton *)self label];
  [v5 setFont:v4];

  [(TLKStoreButton *)self invalidateIntrinsicContentSize];
}

- (double)cornerRadius
{
  v2 = [(TLKStoreButton *)self backgroundView];
  v3 = [v2 layer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  double v5 = a3;
  if (a3 == 0.0)
  {
    -[TLKStoreButton effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v5 = v6 * 0.5;
  }
  v7 = [(TLKStoreButton *)self backgroundView];
  v8 = [v7 layer];
  [v8 setCornerRadius:v5];

  v9 = (uint64_t *)MEMORY[0x1E4F39EA8];
  if (a3 == 0.0) {
    v9 = (uint64_t *)MEMORY[0x1E4F39EA0];
  }
  uint64_t v10 = *v9;
  id v12 = [(TLKStoreButton *)self backgroundView];
  v11 = [v12 layer];
  [v11 setCornerCurve:v10];
}

- (void)setHighlighted:(BOOL)a3
{
  double v5 = [(TLKStoreButton *)self highlightView];

  if (!v5)
  {
    double v6 = +[TLKProminenceView viewWithProminence:2];
    [(TLKStoreButton *)self setHighlightView:v6];

    v7 = [(TLKStoreButton *)self backgroundView];
    v8 = [v7 layer];
    [v8 cornerRadius];
    double v10 = v9;
    v11 = [(TLKStoreButton *)self highlightView];
    id v12 = [v11 layer];
    [v12 setCornerRadius:v10];

    v13 = [(TLKStoreButton *)self backgroundView];
    v14 = [v13 layer];
    v15 = [v14 cornerCurve];
    v16 = [(TLKStoreButton *)self highlightView];
    v17 = [v16 layer];
    [v17 setCornerCurve:v15];

    v18 = [(TLKStoreButton *)self highlightView];
    [v18 setAlpha:0.0];

    v19 = [(TLKStoreButton *)self highlightView];
    [(TLKStoreButton *)self addSubview:v19];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __33__TLKStoreButton_setHighlighted___block_invoke;
  v20[3] = &unk_1E5FD3218;
  v20[4] = self;
  BOOL v21 = a3;
  +[TLKUtilities performAnimatableChanges:v20];
}

void __33__TLKStoreButton_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) highlightView];
  [v3 setAlpha:v2];
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)TLKStoreButton;
  [(TLKStoreButton *)&v48 layoutSubviews];
  [(TLKStoreButton *)self bounds];
  double v3 = CGRectGetWidth(v49) * 0.5;
  if (v3 <= 6.0) {
    double v4 = v3;
  }
  else {
    double v4 = 6.0;
  }
  [(TLKStoreButton *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(TLKStoreButton *)self bounds];
  double Height = CGRectGetHeight(v50);
  v14 = [(TLKStoreButton *)self label];
  [v14 intrinsicContentSize];
  CGFloat v16 = (Height - v15) * 0.5;
  v51.origin.double x = v6;
  v51.origin.double y = v8;
  v51.size.double width = v10;
  v51.size.height = v12;
  CGRect v52 = CGRectInset(v51, v4, v16);
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double v20 = v52.size.height;

  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, x, y, width, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(TLKStoreButton *)self label];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(TLKStoreButton *)self bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(TLKStoreButton *)self backgroundView];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  [(TLKStoreButton *)self bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(TLKStoreButton *)self highlightView];
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(TLKStoreButton *)self label];
  [v3 intrinsicContentSize];
  double v5 = v4;

  CGFloat v6 = [(TLKStoreButton *)self backgroundView];
  double v7 = [v6 layer];
  [v7 cornerRadius];
  double v9 = v5 + v8 * 2.0;

  BOOL v10 = [(TLKStoreButton *)self useCompactMode];
  double v11 = 74.0;
  if (v10) {
    double v11 = 59.0;
  }
  if (v9 < v11) {
    double v9 = v11;
  }
  BOOL v12 = [(TLKStoreButton *)self useCompactMode];
  double v13 = 24.0;
  if (!v12) {
    double v13 = 30.0;
  }
  double v14 = v9;
  result.height = v13;
  result.double width = v14;
  return result;
}

- (NSString)title
{
  double v2 = [(TLKStoreButton *)self richTitle];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = +[TLKMultilineText textWithString:a3];
  [v4 setMaxLines:1];
  [(TLKStoreButton *)self setRichTitle:v4];
  [(TLKStoreButton *)self invalidateIntrinsicContentSize];
}

- (void)setRichTitle:(id)a3
{
  objc_storeStrong((id *)&self->_richTitle, a3);
  id v5 = a3;
  id v6 = [(TLKStoreButton *)self label];
  [v6 setRichText:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKStoreButton;
  [(TLKStoreButton *)&v9 traitCollectionDidChange:v4];
  id v5 = [(TLKStoreButton *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  id v6 = [(TLKStoreButton *)self traitCollection];
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
  v3.super_class = (Class)TLKStoreButton;
  [(TLKStoreButton *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TLKStoreButton;
  [(UIView *)&v12 tlk_updateForAppearance:v4];
  if (([v4 isVibrant] & 1) != 0 || -[TLKStoreButton isEmphasized](self, "isEmphasized"))
  {
    int v5 = 0;
    id v6 = 0;
  }
  else
  {
    id v6 = [v4 secondaryButtonColor];
    int v5 = 1;
  }
  uint64_t v7 = [(TLKStoreButton *)self label];
  [v7 setTextColor:v6];

  if (v5) {
  uint64_t v8 = [v4 quaternaryColor];
  }
  if (([v4 isVibrant] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];

    uint64_t v8 = (void *)v9;
  }
  BOOL v10 = [(TLKStoreButton *)self backgroundView];
  [v10 setBackgroundColor:v8];

  double v11 = [(TLKStoreButton *)self backgroundView];
  [v4 enableAppearanceForView:v11];
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (TLKRichText)richTitle
{
  return self->_richTitle;
}

- (TLKLabel)label
{
  return (TLKLabel *)objc_getProperty(self, a2, 760, 1);
}

- (void)setLabel:(id)a3
{
}

- (UIView)backgroundView
{
  return (UIView *)objc_getProperty(self, a2, 768, 1);
}

- (void)setBackgroundView:(id)a3
{
}

- (TLKProminenceView)highlightView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 776, 1);
}

- (void)setHighlightView:(id)a3
{
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (void)setIsEmphasized:(BOOL)a3
{
  self->_isEmphasized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_richTitle, 0);
}

@end