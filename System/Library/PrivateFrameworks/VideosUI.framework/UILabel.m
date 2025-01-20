@interface UILabel
@end

@implementation UILabel

uint64_t __41__UILabel_VideosUI__vui_textSizeForSize___block_invoke(uint64_t a1, double a2, double a3)
{
  if ([*(id *)(a1 + 32) numberOfLines] >= 2) {
    return objc_msgSend(*(id *)(a1 + 32), "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "numberOfLines"), 0.0, 0.0, a2, 3.40282347e38);
  }
  v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "sizeThatFits:", a2, a3);
}

void __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v13 = v3;
  [v3 capHeight];
  if (v4 < v5)
  {
    [v13 ascender];
    double v7 = v6;
    [v13 capHeight];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v7 - v8;
    [v13 capHeight];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  }
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  [v13 descender];
  if (v10 < -v11)
  {
    [v13 descender];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = -v12;
  }
}

uint64_t __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end