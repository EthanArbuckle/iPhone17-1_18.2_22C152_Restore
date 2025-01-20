@interface UICalendarDateViewCell
@end

@implementation UICalendarDateViewCell

id __41___UICalendarDateViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _decorationView];
  objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, v5);
  return v3;
}

void __42___UICalendarDateViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) highlightedCellBackgroundEffect];
  [*(id *)(*(void *)(a1 + 32) + 688) setEffect:v2];

  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 highlightedContentTransform];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  double v4 = [*(id *)(a1 + 32) contentView];
  double v5 = [v4 layer];
  v6[4] = v11;
  v6[5] = v12;
  v6[6] = v13;
  v6[7] = v14;
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v6[3] = v10;
  [v5 setSublayerTransform:v6];
}

void __42___UICalendarDateViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) defaultCellBackgroundEffect];
  [*(id *)(*(void *)(a1 + 32) + 688) setEffect:v2];

  v3 = [*(id *)(a1 + 32) contentView];
  double v4 = [v3 layer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v9[5] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v9[7] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v9[0] = *MEMORY[0x1E4F39B10];
  v9[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v9[3] = v8;
  [v4 setSublayerTransform:v9];
}

@end