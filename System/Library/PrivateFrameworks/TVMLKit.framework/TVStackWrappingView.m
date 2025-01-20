@interface TVStackWrappingView
@end

@implementation TVStackWrappingView

void __38___TVStackWrappingView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v4 = [v6 layer];
  [v4 setShouldRasterize:a3];

  [v6 setOpaque:a3];
  if (a3)
  {
    v5 = [MEMORY[0x263F1C550] blackColor];
    [v6 setBackgroundColor:v5];
  }
  else
  {
    [v6 setBackgroundColor:0];
  }
}

void __99___TVStackWrappingView_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(v5, "tv_margin");
  double v9 = v8;
  uint64_t v11 = v10;
  double v12 = *(double *)(a1 + 72);
  double v13 = v12 - (v6 + v7);
  if (v13 >= 2.22044605e-16) {
    double v14 = v12 - (v6 + v7);
  }
  else {
    double v14 = *(double *)(a1 + 72);
  }
  if (v13 >= 2.22044605e-16) {
    double v15 = v7;
  }
  else {
    double v15 = 0.0;
  }
  if (v13 >= 2.22044605e-16) {
    double v16 = v6;
  }
  else {
    double v16 = 0.0;
  }
  double v17 = fmax(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v9);
  objc_msgSend(v5, "tv_sizeThatFits:", v14, 0.0);
  double v19 = v18;

  v20 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:*(void *)(a1 + 88)];
  id v22 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v20];

  objc_msgSend(v22, "setFrame:", v16, v17 + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v14, v19);
  [*(id *)(a1 + 32) addObject:v22];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17
                                                              + v19
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v21 + 32) = v9;
  *(double *)(v21 + 40) = v16;
  *(void *)(v21 + 48) = v11;
  *(double *)(v21 + 56) = v15;
}

@end