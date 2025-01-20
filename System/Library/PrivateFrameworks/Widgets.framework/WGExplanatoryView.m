@interface WGExplanatoryView
- (WGExplanatoryView)initWithGlyph:(id)a3 andExplanation:(id)a4;
- (void)_configureExplanationLabelWithExplanation:(id)a3;
- (void)_configureGlyphViewWithGlyph:(id)a3;
- (void)_invalidateVisualStyling;
- (void)_updateVisualStylingIfNecessary;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)layoutSubviews;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation WGExplanatoryView

- (WGExplanatoryView)initWithGlyph:(id)a3 andExplanation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WGExplanatoryView;
  v8 = -[WGExplanatoryView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    if (v6) {
      [(WGExplanatoryView *)v8 _configureGlyphViewWithGlyph:v6];
    }
    if (v7) {
      [(WGExplanatoryView *)v9 _configureExplanationLabelWithExplanation:v7];
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  v80.receiver = self;
  v80.super_class = (Class)WGExplanatoryView;
  [(WGExplanatoryView *)&v80 layoutSubviews];
  [(WGExplanatoryView *)self _updateVisualStylingIfNecessary];
  [(WGExplanatoryView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  glyphView = self->_glyphView;
  if (glyphView)
  {
    CGFloat v12 = CGRectGetWidth(*(CGRect *)&v3) + -16.0;
    v81.origin.x = v7;
    v81.origin.y = v8;
    v81.size.width = v9;
    v81.size.height = v10;
    -[UIImageView sizeThatFits:](glyphView, "sizeThatFits:", v12, CGRectGetHeight(v81));
    BSRectWithSize();
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
  }
  else
  {
    CGFloat v14 = *MEMORY[0x263F001A8];
    CGFloat v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  label = self->_label;
  if (label)
  {
    v82.origin.x = v7;
    v82.origin.y = v8;
    v82.size.width = v9;
    v82.size.height = v10;
    CGFloat recta = v18;
    CGFloat v22 = v16;
    CGFloat v23 = v14;
    CGFloat v24 = v20;
    double Width = CGRectGetWidth(v82);
    v83.origin.x = v23;
    v83.origin.y = v22;
    v83.size.width = recta;
    v83.size.height = v24;
    double v26 = Width - CGRectGetWidth(v83) + -8.0 + -16.0;
    v84.origin.x = v7;
    v84.origin.y = v8;
    v84.size.width = v9;
    v84.size.height = v10;
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v26, CGRectGetHeight(v84));
    v85.origin.x = v7;
    v85.origin.y = v8;
    v85.size.width = v9;
    v85.size.height = v10;
    CGRectGetHeight(v85);
    CGFloat v20 = v24;
    CGFloat v14 = v23;
    CGFloat v16 = v22;
    CGFloat v18 = recta;
    BSRectWithSize();
    CGFloat v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    CGFloat v28 = *MEMORY[0x263F001A8];
    double v30 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v32 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v34 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  v86.origin.x = v14;
  v86.origin.y = v16;
  v86.size.width = v18;
  v86.size.height = v20;
  CGFloat v76 = v30;
  CGFloat v77 = v28;
  CGFloat v74 = v34;
  CGFloat v75 = v32;
  CGRectUnion(v86, *(CGRect *)&v28);
  v87.size.width = v18;
  v87.origin.x = v14;
  v87.origin.y = v16;
  v87.size.height = v20;
  CGRectGetWidth(v87);
  v88.origin.y = v76;
  v88.origin.x = v77;
  v88.size.height = v74;
  v88.size.width = v75;
  CGRectGetWidth(v88);
  double v35 = _WGMainScreenScale();
  UIRectCenteredIntegralRectScale();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  if (self->_glyphView)
  {
    UIRectCenteredYInRectScale();
    CGFloat rect = v44;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    int v51 = [(WGExplanatoryView *)self _shouldReverseLayoutDirection];
    uint64_t v52 = v37;
    uint64_t v53 = v39;
    uint64_t v54 = v41;
    uint64_t v55 = v43;
    if (v51)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v52);
      v89.origin.x = rect;
      v89.origin.y = v46;
      v89.size.width = v48;
      v89.size.height = v50;
      double MinX = MaxX - CGRectGetWidth(v89);
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v52);
    }
    -[UIImageView setFrame:](self->_glyphView, "setFrame:", MinX, v46, v48, v50);
  }
  if (self->_label)
  {
    double v72 = v35;
    UIRectCenteredYInRectScale();
    CGFloat v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    int v65 = [(WGExplanatoryView *)self _shouldReverseLayoutDirection];
    uint64_t v66 = v37;
    uint64_t v67 = v39;
    uint64_t v68 = v41;
    uint64_t v69 = v43;
    if (v65)
    {
      double v70 = CGRectGetMinX(*(CGRect *)&v66);
    }
    else
    {
      double v71 = CGRectGetMaxX(*(CGRect *)&v66);
      v90.origin.x = v58;
      v90.origin.y = v60;
      v90.size.width = v62;
      v90.size.height = v64;
      double v70 = v71 - CGRectGetWidth(v90);
    }
    -[UILabel setFrame:](self->_label, "setFrame:", v70, v60, v62, v64);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGExplanatoryView;
  [(WGExplanatoryView *)&v4 willMoveToSuperview:a3];
  [(WGExplanatoryView *)self _invalidateVisualStyling];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapGesture);
  if (!WeakRetained)
  {
    id WeakRetained = objc_alloc_init(MEMORY[0x263F1CA70]);
    [(WGExplanatoryView *)self addGestureRecognizer:WeakRetained];
    objc_storeWeak((id *)&self->_tapGesture, WeakRetained);
  }
  [WeakRetained addTarget:v7 action:a4];
}

- (void)_configureGlyphViewWithGlyph:(id)a3
{
  if (!self->_glyphView)
  {
    objc_super v4 = (objc_class *)MEMORY[0x263F1C6D0];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = [v5 imageWithRenderingMode:2];

    CGFloat v8 = (UIImageView *)[v6 initWithImage:v7];
    glyphView = self->_glyphView;
    self->_glyphView = v8;

    CGFloat v10 = self->_glyphView;
    [(WGExplanatoryView *)self addSubview:v10];
  }
}

- (void)_configureExplanationLabelWithExplanation:(id)a3
{
  if (!self->_label)
  {
    objc_super v4 = (objc_class *)MEMORY[0x263F1C768];
    id v5 = a3;
    id v6 = (UILabel *)objc_alloc_init(v4);
    label = self->_label;
    self->_label = v6;

    CGFloat v8 = self->_label;
    CGFloat v9 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_label setNumberOfLines:0];
    [(UILabel *)self->_label setText:v5];

    CGFloat v10 = self->_label;
    [(WGExplanatoryView *)self addSubview:v10];
  }
}

- (void)_updateVisualStylingIfNecessary
{
  if (!self->_visualStylingProvider)
  {
    CGFloat v3 = [(WGExplanatoryView *)self visualStylingProviderForCategory:1];
    visualStylingProvider = self->_visualStylingProvider;
    self->_visualStylingProvider = v3;

    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_glyphView withStyle:0];
    id v5 = self->_visualStylingProvider;
    label = self->_label;
    [(MTVisualStylingProvider *)v5 automaticallyUpdateView:label withStyle:0];
  }
}

- (void)_invalidateVisualStyling
{
  [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:self->_glyphView];
  [(MTVisualStylingProvider *)self->_visualStylingProvider stopAutomaticallyUpdatingView:self->_label];
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = 0;

  [(WGExplanatoryView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapGesture);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end