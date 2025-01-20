@interface TVInfoCellView
@end

@implementation TVInfoCellView

double __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(v5, "tv_margin");
  double v7 = v6;
  uint64_t v9 = v8;
  objc_msgSend(v5, "tv_sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v11 = v10;

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  if (a3) {
    double v7 = fmax(fmax(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v7), *(double *)(a1 + 64));
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v7 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  return result;
}

double __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(v5, "tv_margin");
  double v7 = v6;
  uint64_t v9 = v8;
  objc_msgSend(v5, "tv_sizeThatFits:", *(double *)(a1 + 56), 0.0);
  double v11 = v10;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (a3)
  {
    double v12 = fmax(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v7);
    double v7 = *(double *)(a1 + 72);
  }
  else
  {
    double v12 = *(double *)(*(void *)(a1 + 32) + 480);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = fmax(v12, v7) + *(double *)(v13 + 24);
  *(double *)(v13 + 24) = result;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  return result;
}

void __33___TVInfoCellView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  objc_msgSend(v20, "tv_margin");
  uint64_t v9 = v8;
  if (*(unsigned char *)(a1 + 104)) {
    double v10 = v7;
  }
  else {
    double v10 = v6;
  }
  if (a3)
  {
    double v11 = fmax(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v5);
    double v5 = *(double *)(a1 + 64);
  }
  else
  {
    double v11 = *(double *)(a1 + 56);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fmax(v11, v5)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  objc_msgSend(v20, "tv_itemWidth");
  double v13 = v12;
  if (v12 == 0.0) {
    double v13 = *(double *)(a1 + 72);
  }
  objc_msgSend(v20, "tv_sizeThatFits:", v13, 0.0);
  double v15 = v14;
  double v17 = v16;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 408)) {
    double v10 = *(double *)(a1 + 88);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & (v15 < v13)) != 0) {
    double v13 = v15;
  }
  double v18 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CGFloat v19 = v17;
  if (v17 + v18 - *(double *)(a1 + 96) > 2.22044605e-16)
  {
    double v10 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    [v20 setHidden:1];
  }
  v22.origin.x = v10;
  v22.origin.y = v18;
  v22.size.width = v13;
  v22.size.height = v19;
  CGRect v23 = CGRectIntegral(v22);
  objc_msgSend(v20, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
}

@end