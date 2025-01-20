@interface PXUIWidgetHeaderBar
- (double)viewHeight;
- (id)createView;
- (void)setCaption:(id)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateView;
@end

@implementation PXUIWidgetHeaderBar

- (void)setSpec:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self spec];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
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
      v8[2] = __31__PXUIWidgetHeaderBar_setSpec___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __31__PXUIWidgetHeaderBar_setSpec___block_invoke(uint64_t a1)
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
  v9.super_class = (Class)PXUIWidgetHeaderBar;
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
      v8[2] = __42__PXUIWidgetHeaderBar_setDisclosureTitle___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __42__PXUIWidgetHeaderBar_setDisclosureTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateView];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateViewHeight];
}

- (void)setCaption:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self caption];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  [(PXWidgetBar *)&v9 setCaption:v4];
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
      v8[2] = __34__PXUIWidgetHeaderBar_setCaption___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __34__PXUIWidgetHeaderBar_setCaption___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateView];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateViewHeight];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self subtitle];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  [(PXWidgetBar *)&v9 setSubtitle:v4];
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
      v8[2] = __35__PXUIWidgetHeaderBar_setSubtitle___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __35__PXUIWidgetHeaderBar_setSubtitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateView];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateViewHeight];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetBar *)self title];
  v9.receiver = self;
  v9.super_class = (Class)PXUIWidgetHeaderBar;
  [(PXWidgetBar *)&v9 setTitle:v4];
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
      v8[2] = __32__PXUIWidgetHeaderBar_setTitle___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      v8[4] = self;
      [(PXWidgetBar *)self performChanges:v8];
    }
  }
}

uint64_t __32__PXUIWidgetHeaderBar_setTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateView];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateViewHeight];
}

- (double)viewHeight
{
  v2 = [(PXWidgetBar *)self view];
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;

  return v4;
}

- (void)updateView
{
  v31.receiver = self;
  v31.super_class = (Class)PXUIWidgetHeaderBar;
  [(PXUIWidgetBar *)&v31 updateView];
  double v3 = [(PXWidgetBar *)self spec];
  [v3 contentInsets];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [v3 minimumDistanceBetweenTopAndFirstAscender];
  uint64_t v9 = v8;
  [v3 minimumDistanceBetweenLastDescenderAndBottom];
  uint64_t v11 = v10;
  v12 = [(PXWidgetBar *)self caption];
  v13 = [(PXWidgetBar *)self disclosureTitle];
  uint64_t v14 = [v13 length];
  if (v14)
  {
    id v15 = v13;

    v12 = v15;
  }
  BOOL v16 = v14 != 0;
  v17 = [(PXWidgetBar *)self view];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __33__PXUIWidgetHeaderBar_updateView__block_invoke;
  v21[3] = &unk_1E5DAE0A8;
  id v22 = v17;
  v23 = self;
  id v24 = v12;
  id v25 = v3;
  BOOL v30 = v16;
  uint64_t v26 = v9;
  uint64_t v27 = v5;
  uint64_t v28 = v11;
  uint64_t v29 = v7;
  id v18 = v3;
  id v19 = v12;
  id v20 = v17;
  [v20 performChanges:v21];
}

uint64_t __33__PXUIWidgetHeaderBar_updateView__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) title];
  [v2 setTitle:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) subtitle];
  [v4 setSubtitle:v5];

  [*(id *)(a1 + 32) setCaption:*(void *)(a1 + 48)];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 56) textColor];
  [v6 setTextColor:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 56) primaryFont];
  [v8 setPrimaryFont:v9];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 56) secondaryFont];
  [v10 setSecondaryFont:v11];

  [*(id *)(a1 + 32) setAllowUserInteractionWithCaption:*(unsigned __int8 *)(a1 + 96)];
  objc_msgSend(*(id *)(a1 + 32), "setAllowUserInteractionWithSubtitle:", objc_msgSend(*(id *)(a1 + 40), "allowUserInteractionWithSubtitle"));
  objc_msgSend(*(id *)(a1 + 32), "setContentInsets:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v12 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 56) shouldUseSingleLine]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v12 setLayoutStyle:v13];
  uint64_t v14 = *(void **)(a1 + 32);
  [*(id *)(a1 + 56) distanceBetweenTopAndFirstBaseline];
  objc_msgSend(v14, "setMinimumDistanceBetweenTopAndFirstBaseline:");
  id v15 = *(void **)(a1 + 32);
  [*(id *)(a1 + 56) distanceBetweenLastBaselineAndBottom];
  objc_msgSend(v15, "setMinimumDistanceBetweenLastBaselineAndBottom:");
  BOOL v16 = *(void **)(a1 + 32);
  [*(id *)(a1 + 56) distanceBetweenTitleBaselineAndSubtitleBaseline];
  objc_msgSend(v16, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");
  v17 = *(void **)(a1 + 32);
  [*(id *)(a1 + 56) horizontalSpacingBetweenTitleAndSubtitle];
  return objc_msgSend(v17, "setHorizontalSpacingBetweenTitleAndSubtitle:");
}

- (id)createView
{
  double v3 = objc_alloc_init(PXUIWidgetHeaderView);
  [(PXUIWidgetHeaderView *)v3 setDelegate:self];
  return v3;
}

@end