@interface TVAlertTemplateView
@end

@implementation TVAlertTemplateView

void __38___TVAlertTemplateView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(v5, "tv_margin");
  double v7 = v6;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "tv_margin");
  if (v8 >= v7) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  if (!a3) {
    double v9 = 0.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v9;
  if (*(id *)(*(void *)(a1 + 32) + 432) == v5)
  {
    [v5 contentInset];
    double v11 = v15 + *(double *)(a1 + 56) + v14;
    double v13 = *(double *)(a1 + 72);
  }
  else
  {
    objc_msgSend(v5, "tv_maxWidth");
    objc_msgSend(v5, "tv_sizeThatFits:");
    double v11 = v10;
    double v13 = v12;
  }
  float v16 = (*(double *)(a1 + 96) - v11) * 0.5;
  objc_msgSend(v5, "setFrame:", floorf(v16), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v11, v13);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v5;
}

@end