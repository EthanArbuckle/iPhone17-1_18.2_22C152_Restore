@interface UILabel
@end

@implementation UILabel

uint64_t __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke(uint64_t a1, double a2, double a3)
{
  if ([*(id *)(a1 + 32) numberOfLines] >= 2) {
    return objc_msgSend(*(id *)(a1 + 32), "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "numberOfLines"), 0.0, 0.0, a2, 3.40282347e38);
  }
  v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "sizeThatFits:", a2, a3);
}

double __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke_2(uint64_t a1, double a2)
{
  v4 = [*(id *)(a1 + 32) attributedText];
  uint64_t v5 = [v4 length];
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = [v6 attributedText];
    [v7 attribute:*MEMORY[0x263F1C238] atIndex:0 effectiveRange:0];
  }
  else
  {
    v7 = [v6 _defaultAttributes];
    [v7 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  v8 = };

  [*(id *)(a1 + 32) numberOfLines];
  [v8 lineHeight];
  [v8 leading];

  return a2;
}

void __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke(uint64_t a1, void *a2)
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

uint64_t __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end