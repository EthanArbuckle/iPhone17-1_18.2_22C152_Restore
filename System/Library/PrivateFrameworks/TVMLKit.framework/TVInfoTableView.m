@interface TVInfoTableView
@end

@implementation TVInfoTableView

void __33___TVInfoTableView_sizeThatFits___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v9 = a2;
  double v5 = *(double *)(a1 + 56);
  double v6 = 0.0;
  if (v5 > 0.0) {
    double v6 = v5 - *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v7 = *(double *)(a1 + 48);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(double *)(a1 + 64) > 0.0) {
    [v9 sizeThatFits:v7 withHeaderWidth:v6];
  }
  else {
    objc_msgSend(v9, "sizeThatFits:", v7, v6);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if ([*(id *)(*(void *)(a1 + 32) + 432) count] - 1 > a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 72)
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
}

@end