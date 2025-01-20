@interface PKPassValueAddedServiceInfoView
- (CGSize)_snapshotSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPass)pass;
- (PKPassValueAddedServiceInfoView)initWithStyle:(int64_t)a3;
- (double)_baselineDistance;
- (id)_labelAttributedStringForString:(id)a3;
- (id)_labelFont;
- (id)_statusAttributedStringForStyle:(int64_t)a3;
- (id)_statusFont;
- (int64_t)style;
- (void)_calculateViewMetricsForWidth:(double)a3 labelSize:(CGSize *)a4 statusSize:(CGSize *)a5 baselineAdjustment:(double *)a6;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setPass:(id)a3;
- (void)setPass:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation PKPassValueAddedServiceInfoView

- (PKPassValueAddedServiceInfoView)initWithStyle:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKPassValueAddedServiceInfoView;
  v4 = -[PKPassValueAddedServiceInfoView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v5->_snapshotter;
    v5->_snapshotter = v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelView = v5->_labelView;
    v5->_labelView = v8;

    [(UILabel *)v5->_labelView setNumberOfLines:2];
    [(PKPassValueAddedServiceInfoView *)v5 addSubview:v5->_labelView];
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = v10;

    [(UIImageView *)v5->_snapshotView setContentMode:1];
    [(UIImageView *)v5->_snapshotView setAccessibilityIgnoresInvertColors:1];
    [(PKPassValueAddedServiceInfoView *)v5 addSubview:v5->_snapshotView];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    statusView = v5->_statusView;
    v5->_statusView = v12;

    v14 = v5->_statusView;
    v15 = [(PKPassValueAddedServiceInfoView *)v5 _statusAttributedStringForStyle:a3];
    [(UILabel *)v14 setAttributedText:v15];

    [(UILabel *)v5->_statusView setNumberOfLines:1];
    [(PKPassValueAddedServiceInfoView *)v5 addSubview:v5->_statusView];
    [(UIView *)v5 pkui_setMaskType:3];
    v16 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKPassValueAddedServiceInfoView *)v5 setBackgroundColor:v16];
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassValueAddedServiceInfoView;
  [(PKPassValueAddedServiceInfoView *)&v2 dealloc];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKPassValueAddedServiceInfoView;
  [(PKPassValueAddedServiceInfoView *)&v28 layoutSubviews];
  [(PKPassValueAddedServiceInfoView *)self bounds];
  double v4 = v3;
  double v6 = v5 + 13.0;
  double v8 = v7 + -28.0;
  [(PKPassValueAddedServiceInfoView *)self _snapshotSize];
  double v10 = v9;
  double v12 = v11;
  double v26 = 0.0;
  double v27 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v23 = 0.0;
  [(PKPassValueAddedServiceInfoView *)self _calculateViewMetricsForWidth:&v25 labelSize:&v23 statusSize:&v27 baselineAdjustment:v8 - (v9 + 13.0)];
  v13.n128_f64[0] = v27 + v26 + v24 + 1.0;
  v14.n128_u64[0] = 0.5;
  if (v12 <= v13.n128_f64[0])
  {
    v13.n128_f64[0] = (v13.n128_f64[0] - v12) * 0.5;
    PKFloatFloorToPixel(v13, v14);
    double v21 = v6 + v16;
  }
  else
  {
    v13.n128_f64[0] = (v12 - v13.n128_f64[0]) * 0.5;
    PKFloatFloorToPixel(v13, v14);
    double v21 = v6;
    double v6 = v6 + v15;
  }
  double v17 = v4 + 14.0;
  double v18 = v27 + v6 + v26 + 1.0;
  double v20 = v23;
  double v19 = v24;
  -[UILabel setFrame:](self->_labelView, "setFrame:", v10 + v17 + 13.0, v6, v25, *(void *)&v21);
  -[UILabel setFrame:](self->_statusView, "setFrame:", v10 + v17 + 13.0, v18, v20, v19);
  -[UIImageView setFrame:](self->_snapshotView, "setFrame:", v17, v22, v10, v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKPassValueAddedServiceInfoView *)self _snapshotSize];
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  [(PKPassValueAddedServiceInfoView *)self _calculateViewMetricsForWidth:&v12 labelSize:&v10 statusSize:&v14 baselineAdjustment:fmax(width - (v5 + 14.0 + 13.0 + 14.0), 0.0)];
  double v6 = v14 + v13 + v11 + 1.0;
  [(PKPassValueAddedServiceInfoView *)self _snapshotSize];
  double v8 = fmax(v7, v6) + 13.0 + 13.0;
  double v9 = width;
  result.height = v8;
  result.double width = v9;
  return result;
}

- (void)_calculateViewMetricsForWidth:(double)a3 labelSize:(CGSize *)a4 statusSize:(CGSize *)a5 baselineAdjustment:(double *)a6
{
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_labelView, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  a4->double width = v11;
  a4->double height = v12;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_statusView, "pkui_sizeThatFits:forceWordWrap:", 0, a3, 1.79769313e308);
  a5->double width = v13;
  a5->double height = v14;
  double height = a4->height;
  double v16 = [(UILabel *)self->_labelView font];
  [v16 descender];
  double v18 = height + v17;

  CGFloat v19 = a5->height + a4->height;
  double v20 = [(UILabel *)self->_statusView font];
  [v20 descender];
  CGFloat v22 = v19 + v21;

  [(PKPassValueAddedServiceInfoView *)self _baselineDistance];
  *a6 = fmax(v23 - (v22 - v18), 0.0);
}

- (void)setStyle:(int64_t)a3
{
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = (void (**)(void, void))v8;
  if (self->_style == a3)
  {
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
  else
  {
    self->_style = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke;
    aBlock[3] = &unk_1E59CB460;
    aBlock[4] = self;
    aBlock[5] = a3;
    uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
    CGFloat v11 = v10;
    if (v5)
    {
      CGFloat v12 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_2;
      v16[3] = &unk_1E59CA7D0;
      v16[4] = self;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_3;
      v13[3] = &unk_1E59DC868;
      v13[4] = self;
      CGFloat v14 = v10;
      double v15 = v9;
      [v12 animateWithDuration:v16 animations:v13 completion:0.2];
    }
    else
    {
      v10[2](v10);
      if (v9) {
        v9[2](v9, 1);
      }
    }
  }
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[56];
  double v4 = [v2 _statusAttributedStringForStyle:*(void *)(a1 + 40)];
  [v3 setAttributedText:v4];

  BOOL v5 = *(void **)(a1 + 32);

  return [v5 setNeedsLayout];
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_4;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = a1[4];
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:a1[6] completion:0.2];
}

uint64_t __64__PKPassValueAddedServiceInfoView_setStyle_animated_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:1.0];
}

- (void)setPass:(id)a3
{
}

- (void)setPass:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke;
  CGFloat v19 = &unk_1E59DC890;
  id v11 = v9;
  id v20 = v11;
  double v21 = self;
  BOOL v23 = a4;
  id v12 = v10;
  id v22 = v12;
  CGFloat v13 = (void (**)(void *, void))_Block_copy(&v16);
  objc_storeStrong((id *)&self->_pass, a3);
  pass = self->_pass;
  if (pass)
  {
    snapshotter = self->_snapshotter;
    [(PKPassValueAddedServiceInfoView *)self _snapshotSize];
    -[PKPassSnapshotter snapshotWithPass:size:suppressedContent:completion:](snapshotter, "snapshotWithPass:size:suppressedContent:completion:", pass, 4087, v13);
  }
  else
  {
    v13[2](v13, 0);
  }
}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_2;
  block[3] = &unk_1E59D4298;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  char v13 = *(unsigned char *)(a1 + 56);
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_2(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_3;
  aBlock[3] = &unk_1E59CA8E8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v15 = v2;
  uint64_t v16 = v3;
  id v17 = v4;
  uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  double v6 = v5;
  if (*(unsigned char *)(a1 + 64))
  {
    id v7 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_4;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_5;
    v10[3] = &unk_1E59DC868;
    id v8 = v5;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v8;
    id v12 = *(id *)(a1 + 56);
    [v7 animateWithDuration:v13 animations:v10 completion:0.2];
  }
  else
  {
    v5[2](v5);
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
    }
  }
}

void __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localizedDescription];
  id v9 = v2;
  if (!v2 || (uint64_t v3 = [v2 length], v4 = v9, !v3))
  {
    uint64_t v5 = [*(id *)(a1 + 32) organizationName];

    id v4 = (id)v5;
  }
  double v6 = *(void **)(a1 + 40);
  id v7 = (void *)v6[54];
  id v10 = v4;
  id v8 = [v6 _labelAttributedStringForString:v4];
  [v7 setAttributedText:v8];

  [*(id *)(*(void *)(a1 + 40) + 440) setImage:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setNeedsLayout];
}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 440);

  return [v2 setAlpha:0.0];
}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_5(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_6;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = a1[4];
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:a1[6] completion:0.2];
}

uint64_t __63__PKPassValueAddedServiceInfoView_setPass_animated_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 448);

  return [v2 setAlpha:1.0];
}

- (CGSize)_snapshotSize
{
  [(PKPass *)self->_pass style];
  PKPassFrontFaceContentSize();
  double v3 = v2;
  double v5 = v4 * 0.15;
  PKPassHeightAdjustmentForStyle();
  v7.n128_f64[0] = (v3 - v8.n128_f64[0]) * 0.15;
  v8.n128_f64[0] = v5;

  PKSizeRoundToPixel(v8, v7, v6);
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)_labelAttributedStringForString:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v4 = (void *)MEMORY[0x1E4FB0848];
    id v5 = a3;
    __n128 v6 = [v4 defaultParagraphStyle];
    __n128 v7 = (void *)[v6 mutableCopy];

    [v7 setAlignment:4];
    [v7 setLineBreakMode:4];
    v15[0] = *MEMORY[0x1E4FB0700];
    __n128 v8 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v9 = *MEMORY[0x1E4FB0738];
    v16[0] = v8;
    v16[1] = v7;
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v15[2] = v10;
    id v11 = [(PKPassValueAddedServiceInfoView *)self _labelFont];
    v16[2] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    char v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_statusAttributedStringForStyle:(int64_t)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 != 1)
    {
      id v5 = 0;
      goto LABEL_8;
    }
    double v4 = @"VAS_PASS_DID_SEND";
  }
  else
  {
    double v4 = @"VAS_PASS_WILL_SEND";
  }
  id v5 = PKLocalizedString(&v4->isa);
  if (v5)
  {
    __n128 v6 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
    __n128 v7 = (void *)[v6 mutableCopy];

    [v7 setAlignment:4];
    [v7 setLineBreakMode:4];
    v15[0] = *MEMORY[0x1E4FB0700];
    __n128 v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v9 = *MEMORY[0x1E4FB0738];
    v16[0] = v8;
    v16[1] = v7;
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v15[2] = v10;
    id v11 = [(PKPassValueAddedServiceInfoView *)self _statusFont];
    v16[2] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

    char v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v12];
    goto LABEL_9;
  }
LABEL_8:
  char v13 = 0;
LABEL_9:

  return v13;
}

- (id)_labelFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
}

- (id)_statusFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

- (double)_baselineDistance
{
  double v2 = [(PKPassValueAddedServiceInfoView *)self _labelFont];
  [v2 _bodyLeading];
  PKFloatRoundToPixel();
  double v4 = v3;

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end