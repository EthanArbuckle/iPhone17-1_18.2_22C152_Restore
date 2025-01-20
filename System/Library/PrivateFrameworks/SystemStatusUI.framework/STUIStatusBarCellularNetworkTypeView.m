@interface STUIStatusBarCellularNetworkTypeView
- (BOOL)_isAnimatingUpdate;
- (NSLayoutConstraint)widthConstraint;
- (STUIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3;
- (STUIStatusBarStringView)stringView;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIVectorLabel)accessoryLabel;
- (UIVectorLabel)prefixLabel;
- (id)viewForLastBaselineLayout;
- (int64_t)type;
- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7;
- (void)applyStyleAttributes:(id)a3;
- (void)setAccessoryLabel:(id)a3;
- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6;
- (void)setFixedWidth:(double)a3;
- (void)setPrefixLabel:(id)a3;
- (void)setStringView:(id)a3;
- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7;
- (void)setType:(int64_t)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation STUIStatusBarCellularNetworkTypeView

- (STUIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3
{
  v55[12] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)STUIStatusBarCellularNetworkTypeView;
  v3 = -[STUIStatusBarCellularNetworkTypeView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [(STUIStatusBarCellularNetworkTypeView *)v3 addLayoutGuide:"addLayoutGuide:"];
  v5 = [STUIStatusBarStringView alloc];
  [(STUIStatusBarCellularNetworkTypeView *)v3 bounds];
  uint64_t v6 = -[STUIStatusBarStringView initWithFrame:](v5, "initWithFrame:");
  stringView = v3->_stringView;
  v3->_stringView = (STUIStatusBarStringView *)v6;

  [(STUIStatusBarStringView *)v3->_stringView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STUIStatusBarStringView *)v3->_stringView setLineBreakMode:2];
  [(STUIStatusBarCellularNetworkTypeView *)v3 addSubview:v3->_stringView];
  id v8 = objc_alloc(MEMORY[0x1E4FB1E98]);
  [(STUIStatusBarCellularNetworkTypeView *)v3 bounds];
  uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
  prefixLabel = v3->_prefixLabel;
  v3->_prefixLabel = (UIVectorLabel *)v9;

  [(UIVectorLabel *)v3->_prefixLabel setText:&stru_1F2F86950];
  [(UIVectorLabel *)v3->_prefixLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVectorLabel *)v3->_prefixLabel setHidden:1];
  [(STUIStatusBarCellularNetworkTypeView *)v3 addSubview:v3->_prefixLabel];
  id v11 = objc_alloc(MEMORY[0x1E4FB1E98]);
  [(STUIStatusBarCellularNetworkTypeView *)v3 bounds];
  uint64_t v12 = objc_msgSend(v11, "initWithFrame:");
  accessoryLabel = v3->_accessoryLabel;
  v3->_accessoryLabel = (UIVectorLabel *)v12;

  [(UIVectorLabel *)v3->_accessoryLabel setText:&stru_1F2F86950];
  [(UIVectorLabel *)v3->_accessoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVectorLabel *)v3->_accessoryLabel setHidden:1];
  [(STUIStatusBarCellularNetworkTypeView *)v3 addSubview:v3->_accessoryLabel];
  v14 = [(STUIStatusBarCellularNetworkTypeView *)v3 widthAnchor];
  uint64_t v15 = [v14 constraintEqualToConstant:0.0];
  widthConstraint = v3->_widthConstraint;
  v3->_widthConstraint = (NSLayoutConstraint *)v15;

  v53 = [v4 leadingAnchor];
  v52 = [(STUIStatusBarStringView *)v3->_stringView leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v55[0] = v51;
  v50 = [v4 trailingAnchor];
  v49 = [(STUIStatusBarStringView *)v3->_stringView trailingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v55[1] = v48;
  v47 = [v4 topAnchor];
  v46 = [(STUIStatusBarStringView *)v3->_stringView topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v55[2] = v45;
  v44 = [v4 bottomAnchor];
  v43 = [(STUIStatusBarStringView *)v3->_stringView bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v55[3] = v42;
  v41 = [v4 leadingAnchor];
  v39 = [(UIVectorLabel *)v3->_prefixLabel leadingAnchor];
  v38 = [v41 constraintEqualToAnchor:v39];
  v55[4] = v38;
  v37 = [(UIVectorLabel *)v3->_prefixLabel trailingAnchor];
  v36 = [(UIVectorLabel *)v3->_accessoryLabel leadingAnchor];
  v34 = [v37 constraintEqualToAnchor:v36];
  v55[5] = v34;
  v33 = [(STUIStatusBarStringView *)v3->_stringView lastBaselineAnchor];
  v32 = [(UIVectorLabel *)v3->_prefixLabel lastBaselineAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v55[6] = v31;
  v30 = [(STUIStatusBarStringView *)v3->_stringView lastBaselineAnchor];
  v29 = [(UIVectorLabel *)v3->_accessoryLabel lastBaselineAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v55[7] = v28;
  v17 = v4;
  v18 = [v4 centerXAnchor];
  v19 = [(STUIStatusBarCellularNetworkTypeView *)v3 centerXAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v55[8] = v20;
  v21 = [(STUIStatusBarCellularNetworkTypeView *)v3 topAnchor];
  v35 = v17;
  v22 = [v17 topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v55[9] = v23;
  v24 = [(STUIStatusBarCellularNetworkTypeView *)v3 bottomAnchor];
  v25 = [v17 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v55[10] = v26;
  v55[11] = v3->_widthConstraint;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:12];

  [MEMORY[0x1E4F28DC8] activateConstraints:v40];
  return v3;
}

- (void)setFixedWidth:(double)a3
{
  v5 = [(STUIStatusBarCellularNetworkTypeView *)self widthConstraint];
  [v5 constant];
  double v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000011920929)
  {
    if (a3 <= 0.0
      || ([(STUIStatusBarCellularNetworkTypeView *)self widthConstraint],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 constant],
          double v10 = v9,
          v8,
          v10 <= 0.0))
    {
      uint64_t v12 = [(STUIStatusBarCellularNetworkTypeView *)self widthConstraint];
      [v12 setConstant:a3];

      id v13 = [(STUIStatusBarCellularNetworkTypeView *)self superview];
      [v13 layoutSubviews];
    }
    else
    {
      id v11 = (void *)*MEMORY[0x1E4FB2608];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke;
      v14[3] = &unk_1E6AA3F30;
      v14[4] = self;
      *(double *)&v14[5] = a3;
      [v11 _performBlockAfterCATransactionCommits:v14];
    }
  }
}

uint64_t __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) widthConstraint];
  [v3 setConstant:v2];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2;
  v5[3] = &unk_1E6AA37A0;
  v5[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.5];
}

void __54__STUIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) superview];
  [v1 layoutSubviews];
}

- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void *)MEMORY[0x1E4FB1EB0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke;
  v30[3] = &unk_1E6AA4488;
  v30[4] = self;
  BOOL v35 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  id v16 = v12;
  id v31 = v16;
  int64_t v34 = a4;
  id v17 = v14;
  id v32 = v17;
  id v18 = v13;
  id v33 = v18;
  [v15 performWithoutAnimation:v30];
  objc_initWeak(&location, self);
  v19 = (void *)*MEMORY[0x1E4FB2608];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2;
  v23[3] = &unk_1E6AA4500;
  objc_copyWeak(v27, &location);
  id v20 = v17;
  id v24 = v20;
  id v21 = v16;
  id v25 = v21;
  id v22 = v18;
  BOOL v28 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  id v26 = v22;
  v27[1] = (id)a7;
  [v19 _performBlockAfterCATransactionCommits:v23];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 440) setHidden:0];
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
    double v2 = [*(id *)(a1 + 40) substringFromIndex:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 440) setText:v2];

    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      id v7 = [v3 attributesAtIndex:*(void *)(a1 + 64) effectiveRange:0];
      id v4 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      [*(id *)(*(void *)(a1 + 32) + 440) setFont:v4];

      v5 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
      [*(id *)(*(void *)(a1 + 32) + 440) setTextColor:v5];
    }
    else
    {
      double v6 = objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "fontStyle"));
      [*(id *)(*(void *)(a1 + 32) + 440) setFont:v6];

      id v7 = [*(id *)(a1 + 56) textColor];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "setTextColor:");
    }
  }
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3;
  v6[3] = &unk_1E6AA44B0;
  v3 = (id *)(a1 + 56);
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 72);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9;
  v4[3] = &unk_1E6AA44D8;
  objc_copyWeak(v5, v3);
  v5[1] = *(id *)(a1 + 64);
  [v2 animateWithDuration:v6 animations:v4 completion:0.5];
  objc_destroyWeak(v5);

  objc_destroyWeak(&v10);
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained _isAnimatingUpdate])
  {
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[53], "setAttributedText:");
      v3 = [*(id *)(a1 + 32) attributesAtIndex:0 effectiveRange:0];
      uint64_t v4 = *MEMORY[0x1E4FB06F8];
      v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      uint64_t v6 = *MEMORY[0x1E4FB0700];
      id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    }
    else
    {
      [WeakRetained[53] setText:*(void *)(a1 + 40)];
      [WeakRetained[53] applyStyleAttributes:*(void *)(a1 + 48)];
      v5 = objc_msgSend(*(id *)(a1 + 48), "fontForStyle:", objc_msgSend(WeakRetained[53], "fontStyle"));
      id v7 = [*(id *)(a1 + 48) textColor];
      uint64_t v4 = *MEMORY[0x1E4FB06F8];
      uint64_t v6 = *MEMORY[0x1E4FB0700];
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v9 = [WeakRetained[54] text];
    v13[0] = *MEMORY[0x1E4FB0710];
    v13[1] = v4;
    v14[0] = &unk_1F2F9CD80;
    v14[1] = v5;
    v13[2] = v6;
    v14[2] = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    char v11 = (void *)[v8 initWithString:v9 attributes:v10];
    [WeakRetained[54] _setAttributedText:v11];

    double v12 = 1.0;
    if (!*(unsigned char *)(a1 + 64)) {
      double v12 = 0.0;
    }
    [WeakRetained[55] setAlpha:v12];
  }
}

void __110__STUIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isAnimatingUpdate])
  {
    [WeakRetained[54] setHidden:1];
    [WeakRetained[55] setHidden:1];
    [WeakRetained[53] setAlpha:1.0];
    WeakRetained[52] = *(id *)(a1 + 40);
    *((unsigned char *)WeakRetained + 408) = 0;
  }
}

- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v33[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = v10;
  if (v6 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    BOOL v28 = [v10 string];
    [(STUIStatusBarCellularNetworkTypeView *)self _animateUpdateToText:v28 prefixLength:a4 styleAttributes:0 attributedText:v11 type:a5];
  }
  else
  {
    int64_t v31 = a5;
    [(STUIStatusBarStringView *)self->_stringView setAttributedText:v10];
    [(UIVectorLabel *)self->_prefixLabel setHidden:1];
    [(UIVectorLabel *)self->_accessoryLabel setHidden:1];
    [(STUIStatusBarStringView *)self->_stringView setAlpha:1.0];
    double v12 = [v11 string];
    id v13 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v12 substringToIndex:a4];
    }
    uint64_t v15 = [v11 attributesAtIndex:0 effectiveRange:0];
    uint64_t v16 = *MEMORY[0x1E4FB06F8];
    uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    uint64_t v18 = *MEMORY[0x1E4FB0700];
    v29 = v15;
    v19 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    v32[0] = *MEMORY[0x1E4FB0710];
    v32[1] = v16;
    v33[0] = &unk_1F2F9CD80;
    v33[1] = v17;
    v30 = (void *)v17;
    v32[2] = v18;
    v33[2] = v19;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
    id v22 = (void *)[v20 initWithString:v14 attributes:v21];
    [(UIVectorLabel *)self->_prefixLabel _setAttributedText:v22];

    [(UIVectorLabel *)self->_prefixLabel setNeedsLayout];
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = [v11 string];
      id v24 = [v23 substringFromIndex:a4];
      [(UIVectorLabel *)self->_accessoryLabel setText:v24];

      id v25 = [v11 attributesAtIndex:a4 effectiveRange:0];
      id v26 = [v25 objectForKeyedSubscript:v16];
      [(UIVectorLabel *)self->_accessoryLabel setFont:v26];

      v27 = [v25 objectForKeyedSubscript:v18];
      [(UIVectorLabel *)self->_accessoryLabel setTextColor:v27];

      [(UIVectorLabel *)self->_accessoryLabel setNeedsLayout];
    }
    self->_type = v31;
    self->_animatingUpdate = 0;
  }
}

- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v7 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    [(STUIStatusBarCellularNetworkTypeView *)self _animateUpdateToText:v12 prefixLength:a4 styleAttributes:v13 attributedText:0 type:a6];
  }
  else
  {
    [(STUIStatusBarStringView *)self->_stringView setText:v12];
    [(STUIStatusBarStringView *)self->_stringView applyStyleAttributes:v13];
    [(UIVectorLabel *)self->_prefixLabel setHidden:1];
    [(UIVectorLabel *)self->_accessoryLabel setHidden:1];
    [(STUIStatusBarStringView *)self->_stringView setAlpha:1.0];
    id v23 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v12 substringToIndex:a4];
    }
    id v15 = v14;
    uint64_t v16 = objc_msgSend(v13, "fontForStyle:", -[STUIStatusBarStringView fontStyle](self->_stringView, "fontStyle", v23));
    uint64_t v17 = [v13 textColor];
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = *MEMORY[0x1E4FB06F8];
    v26[0] = *MEMORY[0x1E4FB0710];
    v26[1] = v19;
    v27[0] = &unk_1F2F9CD80;
    v27[1] = v16;
    v26[2] = *MEMORY[0x1E4FB0700];
    id v27[2] = v17;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    id v25 = v15;
    id v21 = (void *)[v18 initWithString:v15 attributes:v20];
    [(UIVectorLabel *)self->_prefixLabel _setAttributedText:v21];

    [(UIVectorLabel *)self->_prefixLabel setNeedsLayout];
    id v12 = v24;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = [v24 substringFromIndex:a4];
      [(UIVectorLabel *)self->_accessoryLabel setText:v22];

      [(UIVectorLabel *)self->_accessoryLabel setFont:v16];
      [(UIVectorLabel *)self->_accessoryLabel setTextColor:v17];
      [(UIVectorLabel *)self->_accessoryLabel setNeedsLayout];
    }
    self->_type = a6;
    self->_animatingUpdate = 0;
  }
}

- (void)applyStyleAttributes:(id)a3
{
}

- (id)viewForLastBaselineLayout
{
  return self->_stringView;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4FB13E0]);
  uint64_t v4 = [(STUIStatusBarStringView *)self->_stringView text];
  v5 = objc_msgSend(v3, "initWithTitle:image:imageInsets:", v4, 0, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return (UIAccessibilityHUDItem *)v5;
}

- (BOOL)_isAnimatingUpdate
{
  return self->_animatingUpdate;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (STUIStatusBarStringView)stringView
{
  return self->_stringView;
}

- (void)setStringView:(id)a3
{
}

- (UIVectorLabel)prefixLabel
{
  return self->_prefixLabel;
}

- (void)setPrefixLabel:(id)a3
{
}

- (UIVectorLabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
}

@end