@interface NSTextHighlightCluster
@end

@implementation NSTextHighlightCluster

void __53___NSTextHighlightCluster_addRunsWithTextRangeArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[_NSTextHighlightRun initWithTextRange:withCluster:]([_NSTextHighlightRun alloc], v3, *(void **)(a1 + 32));

  [*(id *)(a1 + 32) registerMinYOfRun:v4];
  [*(id *)(a1 + 32) registerMaxYOfRun:v4];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v4];
}

uint64_t __62___NSTextHighlightCluster_accessBorderDict_forKey_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  [a2 rectValue];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void __132___NSTextHighlightCluster_topNeighborExistsAtPoint_withinDistance_withLeftCornerExtensionDistance_withRightCornerExtensionDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 rectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  char v16 = objc_msgSend(WeakRetained, "isPoint:withinHorizontalDistance:onRect:leftDistance:rightDistance:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v7, v9, v11, v13);

  *a4 = v16;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
}

void __135___NSTextHighlightCluster_bottomNeighborExistsAtPoint_withinDistance_withLeftCornerExtensionDistance_withRightCornerExtensionDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 rectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  char v16 = objc_msgSend(WeakRetained, "isPoint:withinHorizontalDistance:onRect:leftDistance:rightDistance:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v7, v9, v11, v13);

  *a4 = v16;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
}

int64_t __46___NSTextHighlightCluster_drawRunsUsingBlock___block_invoke(uint64_t a1, int64_t a2)
{
  return -[_NSTextHighlightRun drawRunUsingBlock:](a2, *(void **)(a1 + 32));
}

@end