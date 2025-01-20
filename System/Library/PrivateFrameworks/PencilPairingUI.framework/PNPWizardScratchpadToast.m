@interface PNPWizardScratchpadToast
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (PNPWizardScratchpadToast)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PNPWizardScratchpadToast

- (void)layoutSubviews
{
  [(PNPWizardScratchpadToast *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIVisualEffectView setFrame:](self->_background, "setFrame:");
  id v31 = [MEMORY[0x263F1C480] effectWithStyle:1];
  background = self->_background;
  v8 = [(PNPWizardScratchpadToast *)self traitCollection];
  v9 = objc_msgSend(v31, "effectForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  [(UIVisualEffectView *)background setEffect:v9];

  if (v4 >= v6) {
    double v10 = v6;
  }
  else {
    double v10 = v4;
  }
  [(UIVisualEffectView *)self->_background _setContinuousCornerRadius:v10 * 0.5];
  UIRectInset();
  v11 = [(PNPWizardScratchpadToast *)self traitCollection];
  [v11 displayScale];
  UIRectIntegralWithScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  -[UILabel setFrame:](self->_label, "setFrame:", v13, v15, v17, v19);
  v20 = (void *)MEMORY[0x263F81708];
  uint64_t v21 = *MEMORY[0x263F1D280];
  uint64_t v22 = *MEMORY[0x263F1D140];
  v23 = [(PNPWizardScratchpadToast *)self traitCollection];
  v24 = [v20 _preferredFontForTextStyle:v21 maximumContentSizeCategory:v22 compatibleWithTraitCollection:v23];

  v25 = (void *)MEMORY[0x263F81708];
  [v24 pointSize];
  v26 = objc_msgSend(v25, "systemFontOfSize:weight:");

  [(UILabel *)self->_label setFont:v26];
  label = self->_label;
  v28 = [(PNPWizardScratchpadToast *)self text];
  [(UILabel *)label setText:v28];

  v29 = self->_label;
  v30 = [MEMORY[0x263F1C550] toastLabelTextColor];
  [(UILabel *)v29 setTextColor:v30];
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_label intrinsicContentSize];
  double v4 = v2 + 20.0;
  if (v3 < 25.0) {
    double v3 = 25.0;
  }
  BOOL v5 = v2 < 160.0;
  double v6 = 180.0;
  if (!v5) {
    double v6 = v4;
  }
  result.height = v3;
  result.width = v6;
  return result;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);

  [(PNPWizardScratchpadToast *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PNPWizardScratchpadToast;
  id v4 = a3;
  [(PNPWizardScratchpadToast *)&v8 traitCollectionDidChange:v4];
  BOOL v5 = [(PNPWizardScratchpadToast *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];

  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(PNPWizardScratchpadToast *)self setNeedsLayout];
    [(PNPWizardScratchpadToast *)self layoutIfNeeded];
  }
}

- (PNPWizardScratchpadToast)initWithFrame:(CGRect)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)PNPWizardScratchpadToast;
  double v3 = -[PNPWizardScratchpadToast initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc(MEMORY[0x263F1CB98]);
  BOOL v5 = [MEMORY[0x263F1C480] effectWithStyle:1];
  uint64_t v6 = [v4 initWithEffect:v5];
  background = v3->_background;
  v3->_background = (UIVisualEffectView *)v6;

  objc_super v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  label = v3->_label;
  v3->_label = v8;

  [(UILabel *)v3->_label setNumberOfLines:1];
  [(UILabel *)v3->_label setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)v3->_label setTextAlignment:1];
  double v10 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
  v11 = [(UILabel *)v3->_label layer];
  v15[0] = v10;
  double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v11 setFilters:v12];

  [(PNPWizardScratchpadToast *)v3 addSubview:v3->_background];
  [(PNPWizardScratchpadToast *)v3 addSubview:v3->_label];

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end