@interface PKEditTableNoPassesView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKEditTableNoPassesView)initWithFrame:(CGRect)a3;
- (PKEditTableNoPassesViewDelegate)delegate;
- (void)findAppsForWalletTapped;
- (void)layoutSubviews;
- (void)scanCodeButtonTapped;
- (void)setDelegate:(id)a3;
@end

@implementation PKEditTableNoPassesView

- (PKEditTableNoPassesView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)PKEditTableNoPassesView;
  v3 = -[PKEditTableNoPassesView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v11 = v3->_titleLabel;
    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    v13 = v3->_titleLabel;
    v14 = PKLocalizedString(&cfstr_PassEditingNoP.isa);
    [(UILabel *)v13 setText:v14];

    [(PKEditTableNoPassesView *)v3 addSubview:v3->_titleLabel];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v15;

    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    v17 = v3->_descriptionLabel;
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    v19 = v3->_descriptionLabel;
    v20 = PKLocalizedString(&cfstr_PassEditingNoP_0.isa);
    [(UILabel *)v19 setText:v20];

    [(PKEditTableNoPassesView *)v3 addSubview:v3->_descriptionLabel];
    objc_initWeak(&location, v3);
    if (PKRearCameraIsAllowed())
    {
      v21 = (void *)MEMORY[0x1E4FB13F0];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __41__PKEditTableNoPassesView_initWithFrame___block_invoke;
      v34[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v35, &location);
      v22 = [v21 actionWithHandler:v34];
      v23 = PKLocalizedString(&cfstr_ScanCode.isa);
      uint64_t v24 = ButtonWithTitle(v23, v22);
      buttonScanCode = v3->_buttonScanCode;
      v3->_buttonScanCode = (UIButton *)v24;

      [(PKEditTableNoPassesView *)v3 addSubview:v3->_buttonScanCode];
      objc_destroyWeak(&v35);
    }
    v26 = (void *)MEMORY[0x1E4FB13F0];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__PKEditTableNoPassesView_initWithFrame___block_invoke_2;
    v32[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v33, &location);
    v27 = [v26 actionWithHandler:v32];
    v28 = PKLocalizedString(&cfstr_AppStore.isa);
    uint64_t v29 = ButtonWithTitle(v28, v27);
    buttonFindApps = v3->_buttonFindApps;
    v3->_buttonFindApps = (UIButton *)v29;

    [(PKEditTableNoPassesView *)v3 addSubview:v3->_buttonFindApps];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__PKEditTableNoPassesView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scanCodeButtonTapped];
}

void __41__PKEditTableNoPassesView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained findAppsForWalletTapped];
}

- (void)layoutSubviews
{
  [(PKEditTableNoPassesView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  memset(&slice, 0, sizeof(slice));
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, v9);
  CGFloat v12 = v11;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectDivide(v24, &slice, &v22, v12, CGRectMinYEdge);
  -[UILabel pkui_setFrame:animated:](self->_titleLabel, "pkui_setFrame:animated:", 0, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v8 + -80.0, v22.size.height);
  double v14 = v13;
  CGRectDivide(v22, &slice, &v22, v13, CGRectMinYEdge);
  -[UILabel pkui_setFrame:animated:](self->_descriptionLabel, "pkui_setFrame:animated:", 0, 40.0, slice.origin.y, v8 + -80.0, v14);
  CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  buttonScanCode = self->_buttonScanCode;
  if (buttonScanCode)
  {
    v16 = [(UIButton *)buttonScanCode titleLabel];
    objc_msgSend(v16, "sizeThatFits:", v8, v22.size.height);
    CGFloat v18 = v17;

    CGRectDivide(v22, &slice, &v22, v18, CGRectMinYEdge);
    [(UIButton *)self->_buttonScanCode frame];
    PKSizeAlignedInRect();
    -[UIButton setFrame:](self->_buttonScanCode, "setFrame:");
    CGRectDivide(v22, &slice, &v22, 16.0, CGRectMinYEdge);
  }
  v19 = [(UIButton *)self->_buttonFindApps titleLabel];
  objc_msgSend(v19, "sizeThatFits:", v8, v22.size.height);
  double v21 = v20;

  CGRectDivide(v22, &slice, &v22, v21 + 5.0, CGRectMinYEdge);
  [(UIButton *)self->_buttonFindApps frame];
  PKSizeAlignedInRect();
  -[UIButton setFrame:](self->_buttonFindApps, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  uint64_t v7 = (uint64_t)(v6 + 0.0) + 16;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width + -80.0, height);
  uint64_t v9 = (uint64_t)(v8 + (double)v7) + 16;
  buttonScanCode = self->_buttonScanCode;
  if (buttonScanCode)
  {
    double v11 = [(UIButton *)buttonScanCode titleLabel];
    objc_msgSend(v11, "sizeThatFits:", width, height);
    double v13 = v12;

    uint64_t v9 = (uint64_t)(v13 + 5.0 + (double)v9) + 16;
  }
  double v14 = [(UIButton *)self->_buttonFindApps titleLabel];
  objc_msgSend(v14, "sizeThatFits:", width, height);
  double v16 = v15;

  double v17 = fmin(height, (double)(uint64_t)(v16 + 5.0 + (double)v9));
  double v18 = width;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (void)scanCodeButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGFloat v4 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    CGFloat v4 = v6;
    if (v5)
    {
      [v6 noPassesViewScanCodeButtonTapped:self];
      CGFloat v4 = v6;
    }
  }
}

- (void)findAppsForWalletTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGFloat v4 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    CGFloat v4 = v6;
    if (v5)
    {
      [v6 noPassesViewFindAppsForWalletTapped:self];
      CGFloat v4 = v6;
    }
  }
}

- (PKEditTableNoPassesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKEditTableNoPassesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonFindApps, 0);
  objc_storeStrong((id *)&self->_buttonScanCode, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end