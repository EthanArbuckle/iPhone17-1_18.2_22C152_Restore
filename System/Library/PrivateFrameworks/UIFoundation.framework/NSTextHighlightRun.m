@interface NSTextHighlightRun
@end

@implementation NSTextHighlightRun

void __53___NSTextHighlightRun_initWithTextRange_withCluster___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, char a8)
{
  id v14 = a2;
  v15 = [_NSTextHighlightRunSegment alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v17 = (unsigned char *)-[_NSTextHighlightRunSegment initWithTextSegmentFrame:withRun:]((uint64_t)v15, WeakRetained, a3, a4, a5, a6);

  -[_NSTextHighlightRunSegment setTextRange:]((uint64_t)v17, v14);
  if (v17) {
    v17[8] = a8;
  }
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:v17];
}

uint64_t __54___NSTextHighlightRun_enumerateRunSegmentsUsingBlock___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    v13 = *(void **)(v12 + 56);
  }
  else {
    v13 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSegmentFrameRenderable:forIndex:", objc_msgSend(v13, "count"), a3, a4, a5, a6))(*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a3, a4, a5, a6); {
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) textRangeIsInSameLine:v11] ^ 1;
  }

  return 1;
}

uint64_t __45___NSTextHighlightRun_textRangeIsInSameLine___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  if (*(id *)(a1 + 32) == v4) {
    goto LABEL_6;
  }
  v6 = [v4 rangeInElement];
  v7 = [v6 endLocation];
  v8 = [*(id *)(a1 + 40) endLocation];
  if ([v7 isEqual:v8])
  {

LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v13 = 0;
    goto LABEL_7;
  }
  v9 = [v5 rangeInElement];
  v10 = [v9 location];
  id v11 = [*(id *)(a1 + 40) endLocation];
  uint64_t v12 = [v10 compare:v11];

  if (v12 == -1) {
    goto LABEL_6;
  }
  uint64_t v13 = 1;
LABEL_7:

  return v13;
}

__CFString *__35___NSTextHighlightRun_cornerRadius__block_invoke()
{
  return @"Corner Radius is a negative number";
}

uint64_t __41___NSTextHighlightRun_drawRunUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = -[_NSTextHighlightRunSegment calculateCGPath](a2);

  return [v2 addObject:v3];
}

uint64_t __41___NSTextHighlightRun_drawRunUsingBlock___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[4];
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 16);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a2, v8, *(void *)(a1[6] + 8) + 24);
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
  return result;
}

void __71___NSTextHighlightRun_getMetricsForTextSize_cornerRadius_cornerOutset___block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v1 doubleForKey:@"_NSTextHighlightShapeProviderOutsetIncrement"];
  getMetricsForTextSize_cornerRadius_cornerOutset__outsetIncrement = v0;
}

@end