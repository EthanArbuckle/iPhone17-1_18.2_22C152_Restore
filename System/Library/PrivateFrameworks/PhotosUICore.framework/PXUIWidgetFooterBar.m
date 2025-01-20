@interface PXUIWidgetFooterBar
- (double)viewHeight;
- (id)createView;
- (void)setDisclosureTitle:(id)a3;
- (void)setSpec:(id)a3;
- (void)updateView;
@end

@implementation PXUIWidgetFooterBar

- (void)setSpec:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self spec];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetFooterBar;
  [(PXWidgetBar *)&v9 setSpec:v4];
  id v6 = v5;
  if (v6 == v4)
  {
  }
  else
  {
    char v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __31__PXUIWidgetFooterBar_setSpec___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __31__PXUIWidgetFooterBar_setSpec___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateView];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateViewHeight];
}

- (void)setDisclosureTitle:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self disclosureTitle];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetFooterBar;
  [(PXWidgetBar *)&v9 setDisclosureTitle:v4];
  id v6 = v5;
  if (v6 == v4)
  {
  }
  else
  {
    char v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __42__PXUIWidgetFooterBar_setDisclosureTitle___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __42__PXUIWidgetFooterBar_setDisclosureTitle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateView];
}

- (double)viewHeight
{
  v3 = [(PXWidgetBar *)self disclosureTitle];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0.0;
  }
  v5 = [(PXWidgetBar *)self spec];
  [v5 distanceBetweenTopAndFirstBaseline];
  double v7 = v6;
  v8 = [(PXWidgetBar *)self spec];
  [v8 distanceBetweenLastBaselineAndBottom];
  double v10 = v7 + v9;

  return v10;
}

- (void)updateView
{
  v23.receiver = self;
  v23.super_class = (Class)PXUIWidgetFooterBar;
  [(PXUIWidgetBar *)&v23 updateView];
  v3 = [(PXWidgetBar *)self spec];
  [v3 contentInsets];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [v3 minimumDistanceBetweenTopAndFirstAscender];
  uint64_t v9 = v8;
  [v3 minimumDistanceBetweenLastDescenderAndBottom];
  uint64_t v11 = v10;
  v12 = [(PXWidgetBar *)self view];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__PXUIWidgetFooterBar_updateView__block_invoke;
  v15[3] = &unk_1E5DD02D0;
  id v16 = v12;
  v17 = self;
  id v18 = v3;
  uint64_t v19 = v9;
  uint64_t v20 = v5;
  uint64_t v21 = v11;
  uint64_t v22 = v7;
  id v13 = v3;
  id v14 = v12;
  [v14 performChanges:v15];
}

uint64_t __33__PXUIWidgetFooterBar_updateView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLayoutStyle:1];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) disclosureTitle];
  [v2 setDisclosureTitle:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 48) primaryFont];
  [v4 setFont:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 72);
  double v10 = *(double *)(a1 + 80);
  return objc_msgSend(v6, "setContentInsets:", v7, v8, v9, v10);
}

- (id)createView
{
  v3 = objc_alloc_init(PXUIWidgetFooterView);
  [(PXUIWidgetFooterView *)v3 setDelegate:self];
  return v3;
}

@end