@interface NTKModularLargeColumnTemplateView
- (BOOL)useNoColumnPadding;
- (id)_newBodyLabelSubview;
- (id)_newHeaderLabelSubview;
- (id)_newLabelSubviewWithFont:(id)a3;
- (void)_layoutRowsOfColumnsWithAlignment:(int64_t)a3;
- (void)_positionLeadingAlignedImageView:(id)a3 label:(id)a4 withBaselineOffset:(double)a5;
- (void)setUseNoColumnPadding:(BOOL)a3;
@end

@implementation NTKModularLargeColumnTemplateView

- (void)_positionLeadingAlignedImageView:(id)a3 label:(id)a4 withBaselineOffset:(double)a5
{
  id v27 = a3;
  id v8 = a4;
  if (v27)
  {
    [v27 frame];
    if (v9 > 0.0)
    {
      v10 = [v8 font];
      [v10 capHeight];
      v11 = [(NTKModuleView *)self device];
      CLKRoundForDevice();
      double v13 = a5 - v12;

      objc_msgSend(v27, "setCenter:", 0.0, v13);
    }
  }
  [v8 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v8 font];
  [v20 ascender];
  double v22 = a5 - v21;

  objc_msgSend(v8, "setFrame:", v15, v22, v17, v19);
  v23 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v23, &v30);
  double v24 = *((double *)&v30 + 1);
  v25 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v25, &v28);
  v26 = [(NTKModuleView *)self viewsAndSpacingArrayForSpace:v27 view:v8 space:v24 view:v29];

  [(NTKModuleView *)self naturalHorizontalLayoutForViewsAndSpacing:v26 columnAlignmentSpacing:0];
}

- (void)_layoutRowsOfColumnsWithAlignment:(int64_t)a3
{
  v5 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v5, &v40);
  uint64_t v6 = v41;

  v7 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v7, &v39);
  double v8 = *((double *)&v39 + 1);

  double v9 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v9, &v37);
  uint64_t v10 = v38;

  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  long long v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke;
  v24[3] = &unk_1E62C8300;
  v24[8] = v10;
  v24[9] = v6;
  v24[4] = self;
  v24[5] = &v33;
  v24[6] = &v29;
  v24[7] = &v25;
  [(NTKModularLargeColumnTemplateView *)self _enumerateColumnRowsWithBlock:v24];
  v11 = [(NTKModuleView *)self contentView];
  [v11 bounds];
  double v13 = v12;

  double v14 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v14, &v22);
  double v15 = v23;

  double v16 = 0.0;
  if (!self->_useNoColumnPadding)
  {
    double v17 = [(NTKModuleView *)self device];
    _LayoutConstants_38(v17, &v20);
    double v16 = v21;
  }
  double v18 = v34[3];
  if (v15 + v16 + v8 + v18 + v26[3] > v13) {
    double v18 = v30[3];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke_2;
  v19[3] = &unk_1E62C8328;
  v19[5] = v10;
  *(double *)&v19[6] = v18;
  v19[4] = self;
  *(double *)&v19[7] = v13 - v8 - v18 - v16 - v15;
  v19[8] = a3;
  *(double *)&v19[9] = v8;
  *(double *)&v19[10] = v16;
  *(double *)&v19[11] = v13;
  *(double *)&v19[12] = v15;
  [(NTKModularLargeColumnTemplateView *)self _enumerateColumnRowsWithBlock:v19];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

void __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v28 = a2;
  id v7 = a3;
  id v8 = a4;
  double v9 = 0.0;
  if (v28)
  {
    objc_msgSend(v28, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    if (v10 > 0.0) {
      double v9 = v10 + *(double *)(a1 + 64);
    }
  }
  [v7 widthForMaxWidth:*(double *)(a1 + 72) - v9];
  v11 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  double v13 = v12;

  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  double v15 = *(double *)(v14 + 24);
  double v16 = *(double *)(a1 + 72);
  if (v13 <= v16) {
    double v16 = v13;
  }
  if (v15 < v16) {
    double v15 = v16;
  }
  *(double *)(v14 + 24) = v15;
  [v7 minimumWidth];
  double v17 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  double v19 = v18;

  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  double v21 = *(double *)(v20 + 24);
  double v22 = *(double *)(a1 + 72);
  if (v19 <= v22) {
    double v22 = v19;
  }
  if (v21 < v22) {
    double v21 = v22;
  }
  *(double *)(v20 + 24) = v21;
  [v8 minimumWidth];
  double v23 = [*(id *)(a1 + 32) device];
  CLKCeilForDevice();
  double v25 = v24;

  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  double v27 = *(double *)(v26 + 24);
  if (v27 < v25) {
    double v27 = v25;
  }
  *(double *)(v26 + 24) = v27;
}

void __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v23 = a2;
  id v9 = a4;
  id v10 = a3;
  [v23 sizeToFit];
  double v11 = 0.0;
  if (v23)
  {
    [v23 frame];
    if (v12 > 0.0) {
      double v11 = v12 + *(double *)(a1 + 40);
    }
  }
  [v10 setMaxWidth:*(double *)(a1 + 48) - v11];
  [v10 sizeToFit];
  [v10 frame];
  objc_msgSend(v10, "setFrame:");
  [*(id *)(a1 + 32) _positionLeadingAlignedImageView:v23 label:v10 withBaselineOffset:a5];

  [v9 setMaxWidth:*(double *)(a1 + 56)];
  [v9 sizeToFit];
  [v9 frame];
  double x = v25.origin.x;
  double height = v25.size.height;
  double Width = CGRectGetWidth(v25);
  if (Width <= *(double *)(a1 + 56)) {
    double v16 = Width;
  }
  else {
    double v16 = *(double *)(a1 + 56);
  }
  double v17 = [v9 font];
  [v17 ascender];
  double v19 = a5 - v18;

  objc_msgSend(v9, "setFrame:", x, v19, v16, height);
  if (*(void *)(a1 + 64))
  {
    double v20 = *(double *)(a1 + 88) - *(double *)(a1 + 96);
    v26.origin.double x = x;
    v26.origin.y = v19;
    v26.size.width = v16;
    v26.size.double height = height;
    double v21 = v20 - CGRectGetWidth(v26);
  }
  else
  {
    double v21 = *(double *)(a1 + 72) + *(double *)(a1 + 48) + *(double *)(a1 + 80);
  }
  double v22 = [*(id *)(a1 + 32) viewsAndSpacingArrayForSpace:v9 view:v21];
  [*(id *)(a1 + 32) naturalHorizontalLayoutForViewsAndSpacing:v22 columnAlignmentSpacing:1];
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)off_1E62BDB58);
  [v5 setFont:v4];
  [v5 setUppercase:0];
  uint64_t v6 = [(NTKModularTemplateView *)self timeTravelDate];
  [v5 setInTimeTravel:v6 != 0];

  [v5 setNowProvider:&__block_literal_global_137];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke_2;
  double v12 = &unk_1E62C0068;
  objc_copyWeak(&v13, &location);
  [v5 setNeedsResizeHandler:&v9];
  id v7 = [(NTKModuleView *)self contentView];
  [v7 addSubview:v5];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke()
{
  return [MEMORY[0x1E4F19A20] complicationDate];
}

void __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (id)_newHeaderLabelSubview
{
  v3 = (void *)MEMORY[0x1E4F19A50];
  id v4 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v4, v8);
  id v5 = [v3 systemFontOfSize:v8[0] weight:*MEMORY[0x1E4FB09D0]];

  id v6 = [(NTKModularLargeColumnTemplateView *)self _newLabelSubviewWithFont:v5];
  return v6;
}

- (id)_newBodyLabelSubview
{
  v3 = (void *)MEMORY[0x1E4F19A50];
  id v4 = [(NTKModuleView *)self device];
  _LayoutConstants_38(v4, v8);
  id v5 = [v3 systemFontOfSize:v8[0]];

  id v6 = [(NTKModularLargeColumnTemplateView *)self _newLabelSubviewWithFont:v5];
  return v6;
}

- (BOOL)useNoColumnPadding
{
  return self->_useNoColumnPadding;
}

- (void)setUseNoColumnPadding:(BOOL)a3
{
  self->_useNoColumnPadding = a3;
}

@end