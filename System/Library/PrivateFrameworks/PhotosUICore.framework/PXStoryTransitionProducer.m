@interface PXStoryTransitionProducer
+ (BOOL)isSupportedTransitionWithKind:(char)a3 betweenSegmentWithClipComposition:(id *)a4 andSegmentWithClipComposition:(id *)a5;
+ (BOOL)isSupportedTransitionWithKind:(char)a3 fromSegmentIdentifier:(int64_t)a4 toSegmentIdentifier:(int64_t)a5 inTimeline:(id)a6;
+ (id)supportedTransitionKinds;
- (NSArray)fallbackTransitionReasons;
- (id)_panTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 transitionInfo:(id *)a6;
- (id)_wipeTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 dividerWidth:(double)a6 transitionInfo:(id *)a7;
- (id)transitionsWithConfiguration:(id)a3;
- (void)_recordFallbackToCutTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4 reason:(id)a5;
- (void)setFallbackTransitionReasons:(id)a3;
@end

@implementation PXStoryTransitionProducer

- (void).cxx_destruct
{
}

- (void)setFallbackTransitionReasons:(id)a3
{
}

- (NSArray)fallbackTransitionReasons
{
  return self->_fallbackTransitionReasons;
}

- (id)_panTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 transitionInfo:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a6->var1)
  {
    int var0 = a6->var0;
    int v11 = SBYTE5(a6->var2.var3);
    char v12 = BYTE5(a6->var2.var3);
    unsigned __int8 v13 = a6->var1 ^ 1;
    if (var0 == 5)
    {
      if (v11 == 1)
      {
        char v12 = 2;
      }
      else if (v11 == 2)
      {
        char v12 = 1;
      }
    }
    a6->int var0 = var0;
    a6->var1 = v13;
    uint64_t v14 = *(void *)((char *)&a6->var2.var1 + 2);
    __int16 v15 = WORD1(a6->var2.var3);
    char v16 = BYTE4(a6->var2.var3);
    *(_OWORD *)(&a6->var1 + 1) = *(_OWORD *)(&a6->var1 + 1);
    BYTE4(a6->var2.var3) = v16;
    WORD1(a6->var2.var3) = v15;
    *(void *)((char *)&a6->var2.var1 + 2) = v14;
    BYTE5(a6->var2.var3) = v12;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = *(_OWORD *)(&a6->var1 + 3);
  uint64_t v28 = *(void *)&a6->var2.var2;
  switch(BYTE5(a6->var2.var3))
  {
    case 0:
      PXAssertGetLog();
    default:
      v18 = [PXStoryPanTransitionConfiguration alloc];
      *(_OWORD *)buf = v27;
      uint64_t v26 = v28;
      v19 = [(PXStoryPanTransitionConfiguration *)v18 initWithDuration:buf];
      memset(v24, 0, sizeof(v24));
      v20 = [v8 clipLayouts];
      if ([v20 countByEnumeratingWithState:v24 objects:v29 count:16])
      {
        [**((id **)&v24[0] + 1) contentSize];
        PXRectWithOriginAndSize();
      }

      v21 = +[PXStoryTransitionFactory panTransitionWithConfiguration:v19];
      [v17 addObject:v21];

      v22 = [PXStoryPanTransitionConfiguration alloc];
      *(_OWORD *)buf = v27;
      uint64_t v26 = v28;
      [(PXStoryPanTransitionConfiguration *)v22 initWithDuration:buf];
      PXPointSubtract();
  }
}

- (id)_wipeTransitionsForOrderOutSegment:(id)a3 orderInSegment:(id)a4 viewportSize:(CGSize)a5 dividerWidth:(double)a6 transitionInfo:(id *)a7
{
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    [v8 segmentInfo];
  }
  if (v9) {
    [v9 segmentInfo];
  }
  PXAxisTransposed();
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke(uint64_t a1, char a2, int a3)
{
  if (!a3) {
    PXAssertGetLog();
  }
  if (a2) {
    char v3 = 1;
  }
  else {
    char v3 = 2;
  }
  if (a2) {
    char v4 = 2;
  }
  else {
    char v4 = 1;
  }
  if (a3 == 1) {
    char v5 = v4;
  }
  else {
    char v5 = 1;
  }
  if (a3 == 2) {
    return v3;
  }
  return v5;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8 = a6;
  id v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_4;
  v13[3] = &unk_1E5DB6AB0;
  memcpy(v15, a5, sizeof(v15));
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v16 = *(_OWORD *)(a1 + 40);
  long long v17 = v10;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 80);
  uint64_t v18 = v11;
  id v14 = v8;
  id v12 = v8;
  [v9 addClipLayout:v12 configurationBlock:v13];
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  id v8 = a6;
  id v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_6;
  v13[3] = &unk_1E5DB6AB0;
  memcpy(v15, a5, sizeof(v15));
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v16 = *(_OWORD *)(a1 + 40);
  long long v17 = v10;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 80);
  uint64_t v18 = v11;
  id v14 = v8;
  id v12 = v8;
  [v9 addClipLayout:v12 configurationBlock:v13];
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_35(uint64_t result, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(result + 800);
  switch(v3)
  {
    case 2:
      PXRectWithSizeAlignedToRectEdges();
    case 1:
      PXRectWithSizeAlignedToRectEdgesWithPadding();
    case 0:
      double v4 = *(double *)(result + 832) + *(double *)(result + 840);
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(double *)(a2 + 80) = v4;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(void *)(a2 + 120) = 0;
      a3[6] = 0u;
      a3[7] = 0u;
      a3[4] = 0u;
      a3[5] = 0u;
      a3[2] = 0u;
      a3[3] = 0u;
      PXStoryRectOuterBounds();
  }
  long long v5 = *MEMORY[0x1E4F1DB28];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *a3 = *MEMORY[0x1E4F1DB28];
  a3[1] = v6;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 800);
  if (v3 == 1)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    double v4 = *(double *)(a1 + 824) + *(double *)(a1 + 856);
    *(double *)(a3 + 32) = *(double *)(a1 + 848) * 0.16667;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(double *)(a3 + 104) = v4;
    *(void *)(a3 + 112) = 0;
    *(void *)(a3 + 120) = 0;
    PXStoryRectOuterBounds();
  }
  if (!v3) {
    PXRectWithSizeAlignedToRectEdges();
  }
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB28];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(a3 + 16) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

double __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_31(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 800);
  if (v3 == 1) {
    PXRectWithSizeAlignedToRectEdgesWithPadding();
  }
  if (v3) {
    PXRectWithSizeAlignedToRectEdges();
  }
  double result = *(double *)(a1 + 824) + *(double *)(a1 + 840);
  *(void *)(a2 + 96) = 0;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(double *)(a2 + 104) = result;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 800);
  if (v3 == 1)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    double v4 = *(double *)(a1 + 808) * 0.16667;
    *(double *)(a3 + 32) = *(double *)(a1 + 848) + *(double *)(a1 + 856);
    *(void *)(a3 + 40) = 0;
    *(void *)(a3 + 48) = 0;
    *(double *)(a3 + 56) = v4;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    PXStoryRectOuterBounds();
  }
  if (!v3) {
    PXRectWithSizeAlignedToRectEdges();
  }
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB28];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(a3 + 16) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_27()
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_25()
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_23()
{
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_21()
{
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_19(uint64_t result, _OWORD *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 40);
  uint64_t v4 = *(void *)(result + 88);
  long long v5 = (void *)(a3 + 32);
  BOOL v6 = v3 == 2;
  if (v3 == 2) {
    uint64_t v7 = 64;
  }
  else {
    uint64_t v7 = 72;
  }
  double v8 = *(double *)(result + v7) + *(double *)(result + 80);
  if (v6)
  {
    *long long v5 = 0;
    *(void *)(a3 + 40) = 0;
    *(void *)(a3 + 48) = 0;
    if (v4)
    {
      *(double *)(a3 + 56) = v8;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
    }
    else
    {
      *(_OWORD *)(a3 + 72) = 0u;
      *(_OWORD *)(a3 + 88) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(double *)(a3 + 104) = v8;
      *(void *)(a3 + 112) = 0;
      *(void *)(a3 + 120) = 0;
    }
  }
  else
  {
    if (v4)
    {
      *(double *)(a3 + 32) = v8;
      *(_OWORD *)(a3 + 40) = 0u;
      *(_OWORD *)(a3 + 56) = 0u;
      *(_OWORD *)(a3 + 72) = 0u;
    }
    else
    {
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)long long v5 = 0u;
      *(double *)(a3 + 80) = v8;
    }
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(void *)(a3 + 120) = 0;
  }
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  uint64_t v9 = *(void *)(result + 104);
  if (v9 == 1) {
    PXStoryRectOuterBounds();
  }
  if (v9 == 4)
  {
    long long v10 = *MEMORY[0x1E4F1DB28];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(a3 + 16) = v11;
    *a2 = v10;
    a2[1] = v11;
  }
  return result;
}

__n128 __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  _ZF = v3 == 2;
  if (v3 == 2) {
    uint64_t v5 = 56;
  }
  else {
    uint64_t v5 = 64;
  }
  double v6 = *(double *)(a1 + v5);
  double v7 = v6 * *(double *)(a1 + 72);
  double v8 = v6 - v7;
  if (_ZF)
  {
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = 0;
    *(void *)(a2 + 48) = 0;
    *(double *)(a2 + 56) = v7;
    double v9 = 0.0;
  }
  else
  {
    *(double *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = 0;
    *(void *)(a2 + 56) = 0;
    double v9 = v8;
    double v8 = 0.0;
    *(void *)(a2 + 40) = 0;
  }
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(double *)(a2 + 80) = v9;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  *(double *)(a2 + 104) = v8;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(int64x2_t *)(a2 + 144) = vdupq_n_s64(0x3FF199999999999AuLL);
  __asm { FMOV            V0.2D, #1.0 }
  *(__n128 *)(a3 + 144) = result;
  return result;
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_15(uint64_t a1, CGRect *a2)
{
  if (*(void *)(a1 + 40) == 1) {
    PXStoryRectOuterBounds();
  }
  uint64_t v2 = *(void *)(a1 + 800);
  BOOL v3 = v2 == 2;
  if (v2 == 2) {
    uint64_t v4 = 824;
  }
  else {
    uint64_t v4 = 832;
  }
  double v5 = *(double *)(a1 + v4) + *(double *)(a1 + 840);
  double v6 = -v5;
  if (v3)
  {
    CGFloat v8 = 0.0;
    double v7 = -v5;
  }
  else
  {
    double v7 = 0.0;
    CGFloat v8 = v6;
  }
  *a2 = CGRectOffset(*(CGRect *)(a1 + 848), v7, v8);
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_12(uint64_t a1, CGRect *a2)
{
  if (*(void *)(a1 + 40) == 1) {
    PXStoryRectOuterBounds();
  }
  uint64_t v2 = *(void *)(a1 + 816);
  BOOL v3 = v2 == 2;
  if (v2 == 2) {
    uint64_t v4 = 856;
  }
  else {
    uint64_t v4 = 864;
  }
  double v5 = *(double *)(a1 + v4) + *(double *)(a1 + 872);
  double v6 = -v5;
  if (v3)
  {
    CGFloat v8 = 0.0;
    double v7 = -v5;
  }
  else
  {
    double v7 = 0.0;
    CGFloat v8 = v6;
  }
  *a2 = CGRectOffset(*(CGRect *)(a1 + 824), v7, v8);
}

void __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_13()
{
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_10(uint64_t result, _OWORD *a2, uint64_t a3)
{
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  uint64_t v3 = 64;
  if (*(void *)(result + 32) == 2) {
    uint64_t v3 = 56;
  }
  double v4 = (*(double *)(result + v3) + *(double *)(result + 72)) * 0.5;
  if (*(void *)(result + 32) == 2) {
    double v5 = 0.0;
  }
  else {
    double v5 = (*(double *)(result + v3) + *(double *)(result + 72)) * 0.5;
  }
  if (*(void *)(result + 32) != 2) {
    double v4 = 0.0;
  }
  *(double *)(a3 + 32) = v5;
  *(void *)(a3 + 40) = 0;
  *(double *)(a3 + 48) = v5;
  *(double *)(a3 + 56) = v4;
  *(void *)(a3 + 64) = 0;
  *(double *)(a3 + 72) = v4;
  *(_OWORD *)(a3 + 80) = 0uLL;
  *(_OWORD *)(a3 + 96) = 0uLL;
  *(_OWORD *)(a3 + 112) = 0uLL;
  if (*(void *)(result + 88) == 1) {
    PXStoryRectOuterBounds();
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_8(uint64_t result, _OWORD *a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(result + 48);
  if (v3 == 1)
  {
    uint64_t v4 = result;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    if (*(void *)(v4 + 808) == 2) {
      PXStoryRectOuterBounds();
    }
    PXStoryRectOuterBounds();
  }
  if (v3 == 4)
  {
    long long v5 = *MEMORY[0x1E4F1DB28];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *a3 = *MEMORY[0x1E4F1DB28];
    a3[1] = v6;
    *a2 = v5;
    a2[1] = v6;
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_6(uint64_t result)
{
  if (*(void *)(result + 48) == 1)
  {
    if (*(void *)(result + 848) == 2) {
      PXStoryRectOuterBounds();
    }
    PXStoryRectOuterBounds();
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 48) == 1)
  {
    if (*(void *)(result + 848) == 2) {
      PXStoryRectOuterBounds();
    }
    PXStoryRectOuterBounds();
  }
  return result;
}

uint64_t __120__PXStoryTransitionProducer__wipeTransitionsForOrderOutSegment_orderInSegment_viewportSize_dividerWidth_transitionInfo___block_invoke_2(uint64_t result, _OWORD *a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(result + 48);
  if (v3 == 1)
  {
    uint64_t v4 = result;
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    if (*(void *)(v4 + 808) == 2) {
      PXStoryRectOuterBounds();
    }
    PXStoryRectOuterBounds();
  }
  if (v3 == 4)
  {
    long long v5 = *MEMORY[0x1E4F1DB28];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *a3 = *MEMORY[0x1E4F1DB28];
    a3[1] = v6;
    *a2 = v5;
    a2[1] = v6;
  }
  return result;
}

- (void)_recordFallbackToCutTransitionBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4 reason:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(PXStoryTransitionProducer *)self fallbackTransitionReasons];
  long long v10 = (void *)v9;
  long long v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    long long v11 = (void *)v9;
  }
  id v12 = v11;

  id v14 = [NSString stringWithFormat:@"%ld → %ld: %@", a3, a4, v8];

  unsigned __int8 v13 = [v12 arrayByAddingObject:v14];

  [(PXStoryTransitionProducer *)self setFallbackTransitionReasons:v13];
}

- (id)transitionsWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v5 = [v3 timeline];
  v52 = [v3 transitionModel];
  uint64_t v6 = [v52 segmentTransitionInfo];
  uint64_t v8 = v7;
  v51 = [v3 entityManager];
  uint64_t v9 = [v3 source];
  uint64_t v100 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  memset(v93, 0, sizeof(v93));
  long long v90 = 0u;
  long long v91 = 0u;
  v46 = v4;
  v48 = v5;
  if (v5)
  {
    [v5 infoForSegmentWithIdentifier:v6];
    uint64_t v89 = 0;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    [v5 infoForSegmentWithIdentifier:v8];
    char v10 = v93[0];
  }
  else
  {
    char v10 = 0;
    uint64_t v89 = 0;
    long long v87 = 0uLL;
    long long v88 = 0uLL;
    long long v85 = 0uLL;
    long long v86 = 0uLL;
    long long v83 = 0uLL;
    long long v84 = 0uLL;
    long long v81 = 0uLL;
    long long v82 = 0uLL;
    long long v79 = 0uLL;
    long long v80 = 0uLL;
    long long v77 = 0uLL;
    long long v78 = 0uLL;
  }
  long long v75 = *(_OWORD *)((char *)v93 + 1);
  v76[0] = *(_OWORD *)((char *)&v93[1] + 1);
  *(void *)((char *)v76 + 15) = *(void *)&v93[2];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = [PXStoryTransitionProducerSegment alloc];
  long long v72 = v87;
  long long v73 = v88;
  uint64_t v74 = v89;
  long long v68 = v83;
  long long v69 = v84;
  long long v70 = v85;
  long long v71 = v86;
  *(_OWORD *)&buf[32] = v79;
  long long v65 = v80;
  long long v66 = v81;
  long long v67 = v82;
  *(_OWORD *)buf = v77;
  *(_OWORD *)&uint8_t buf[16] = v78;
  unsigned __int8 v13 = [(PXStoryTransitionProducerSegment *)v12 initWithSegmentInfo:buf];
  id v14 = [PXStoryTransitionProducerSegment alloc];
  long long v72 = v98;
  long long v73 = v99;
  uint64_t v74 = v100;
  long long v68 = v94;
  long long v69 = v95;
  long long v70 = v96;
  long long v71 = v97;
  *(_OWORD *)&buf[32] = v92;
  long long v65 = v93[0];
  long long v66 = v93[1];
  long long v67 = v93[2];
  *(_OWORD *)buf = v90;
  *(_OWORD *)&uint8_t buf[16] = v91;
  __int16 v15 = [(PXStoryTransitionProducerSegment *)v14 initWithSegmentInfo:buf];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke;
  v59[3] = &unk_1E5DB69E8;
  id v16 = v9;
  id v60 = v16;
  v50 = v13;
  v61 = v50;
  v49 = v15;
  v62 = v49;
  id v17 = v11;
  id v63 = v17;
  [v52 enumerateClipIdentifiersUsingBlock:v59];
  uint64_t v18 = [v3 timelineSpec];
  uint64_t v19 = [v18 allowedTransitionKinds];
  if ([v19 count])
  {
    v20 = [v18 allowedTransitionKinds];
    int v21 = [v20 containsIndex:1];

    if (!v21) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (!+[PXStoryTransitionProducer isSupportedTransitionWithKind:v10 fromSegmentIdentifier:v6 toSegmentIdentifier:v8 inTimeline:v48])PXAssertGetLog(); {
LABEL_10:
  }
  if ([v17 count])
  {
    v22 = NSString;
    v23 = [v17 componentsJoinedByString:@", "];
    v24 = [v22 stringWithFormat:@"Transition source failed to provide layouts for clips: %@. Falling back to cut.", v23];

    [(PXStoryTransitionProducer *)self _recordFallbackToCutTransitionBetweenSegmentWithIdentifier:v6 andSegmentWithIdentifier:v8 reason:v24];
    v25 = [v3 timelineSpec];
    char v10 = [v25 fallbackTransitionKind];
  }
  [v18 viewportSize];
  double v27 = v26;
  [v16 transitionViewport];
  double v29 = v28;
  double v31 = v30;
  [v18 nUpDividerWidth];
  if (v10 == 5)
  {
    buf[0] = v10;
    *(_OWORD *)&buf[1] = v75;
    *(_OWORD *)&buf[17] = v76[0];
    *(void *)&buf[32] = *(void *)((char *)v76 + 15);
    uint64_t v33 = -[PXStoryTransitionProducer _panTransitionsForOrderOutSegment:orderInSegment:viewportSize:transitionInfo:](self, "_panTransitionsForOrderOutSegment:orderInSegment:viewportSize:transitionInfo:", v49, v50, buf, v29, v31);
    goto LABEL_16;
  }
  if (v10 == 8)
  {
    buf[0] = v10;
    *(_OWORD *)&buf[1] = v75;
    *(_OWORD *)&buf[17] = v76[0];
    *(void *)&buf[32] = *(void *)((char *)v76 + 15);
    uint64_t v33 = -[PXStoryTransitionProducer _wipeTransitionsForOrderOutSegment:orderInSegment:viewportSize:dividerWidth:transitionInfo:](self, "_wipeTransitionsForOrderOutSegment:orderInSegment:viewportSize:dividerWidth:transitionInfo:", v49, v50, buf, v29, v31, v32 * (v29 / v27));
LABEL_16:
    v34 = (void *)v33;
    [v46 addObjectsFromArray:v33];
    goto LABEL_18;
  }
  v35 = [(PXStoryTransitionProducerSegment *)v49 clipLayouts];
  uint64_t v36 = [v18 storyTransitionCurveType];
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v75;
  *(_OWORD *)&buf[17] = v76[0];
  *(void *)&buf[32] = *(void *)((char *)v76 + 15);
  v37 = +[PXStoryTransitionFactory segmentTransitionWithInfo:buf event:2 clipLayouts:v35 storyTransitionCurveType:v36];
  [v46 addObject:v37];

  v34 = [(PXStoryTransitionProducerSegment *)v50 clipLayouts];
  uint64_t v38 = [v18 storyTransitionCurveType];
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v75;
  *(_OWORD *)&buf[17] = v76[0];
  *(void *)&buf[32] = *(void *)((char *)v76 + 15);
  v39 = +[PXStoryTransitionFactory segmentTransitionWithInfo:buf event:1 clipLayouts:v34 storyTransitionCurveType:v38];
  [v46 addObject:v39];

LABEL_18:
  buf[0] = v10;
  *(_OWORD *)&buf[1] = v75;
  *(_OWORD *)&buf[17] = v76[0];
  *(void *)&buf[32] = *(void *)((char *)v76 + 15);
  v40 = +[PXStoryTransitionFactory effectTransitionWithInfo:buf entityManager:v51];
  v41 = [v40 effect];
  v42 = [v40 auxiliaryEffect];
  if (v40)
  {
    [v16 didBeginTransitionWithEffect:v41 auxiliaryEffect:v42];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_43;
    v57[3] = &unk_1E5DB6A10;
    id v43 = v16;
    id v58 = v43;
    [v40 setEffectAlphaHandler:v57];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_2;
    v53[3] = &unk_1E5DCE438;
    id v54 = v43;
    id v55 = v41;
    id v56 = v42;
    [v40 setCompletionHandler:v53];
    [v46 addObject:v40];
  }
  v44 = (void *)[v46 copy];

  return v44;
}

void __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) layoutForClipWithIdentifier:a2];
  if (v8)
  {
    uint64_t v9 = 48;
    if (a4 == 1) {
      uint64_t v9 = 40;
    }
    char v10 = *(void **)(a1 + v9);
    memcpy(v13, a3, sizeof(v13));
    [v10 addClipWithIdentifier:a2 layout:v8 info:v13];
  }
  else
  {
    id v11 = *(void **)(a1 + 56);
    id v12 = [NSNumber numberWithInteger:a2];
    [v11 addObject:v12];
  }
}

uint64_t __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyTransitionEffectAlpha:auxiliaryEffectAlpha:");
}

uint64_t __58__PXStoryTransitionProducer_transitionsWithConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionWithEffect:*(void *)(a1 + 40) auxiliaryEffect:*(void *)(a1 + 48)];
}

+ (BOOL)isSupportedTransitionWithKind:(char)a3 fromSegmentIdentifier:(int64_t)a4 toSegmentIdentifier:(int64_t)a5 inTimeline:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  char v10 = v9;
  if (v8 >= 2)
  {
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    if (v9)
    {
      [v9 infoForSegmentWithIdentifier:a4];
      uint64_t v37 = 0;
      long long v36 = 0u;
      long long v35 = 0u;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v32 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      long long v26 = 0u;
      long long v25 = 0u;
      [v10 infoForSegmentWithIdentifier:a5];
      uint64_t v12 = *((void *)&v38 + 1);
      uint64_t v13 = *((void *)&v40 + 1);
      uint64_t v14 = v40;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      long long v36 = 0uLL;
      long long v35 = 0uLL;
      long long v34 = 0uLL;
      long long v33 = 0uLL;
      long long v32 = 0uLL;
      long long v31 = 0uLL;
      long long v30 = 0uLL;
      long long v29 = 0uLL;
      long long v28 = 0uLL;
      long long v27 = 0uLL;
      long long v26 = 0uLL;
      long long v25 = 0uLL;
      uint64_t v14 = 0;
      uint64_t v37 = 0;
    }
    long long v24 = v39;
    long long v17 = v26;
    uint64_t v19 = 0;
    uint64_t v20 = v12;
    long long v21 = v39;
    uint64_t v22 = v14;
    uint64_t v23 = v13;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    BOOL v11 = +[PXStoryTransitionProducer isSupportedTransitionWithKind:v8 betweenSegmentWithClipComposition:&v20 andSegmentWithClipComposition:&v16];
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

void __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 timeRangeForSegmentWithIdentifier:a2];
  }
  PXAxisTransposed();
}

void __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[1];
  *(_OWORD *)&v3.a = *a2;
  *(_OWORD *)&v3.c = v2;
  *(_OWORD *)&v3.tx = a2[2];
  PXStoryRectOuterBounds();
}

uint64_t __112__PXStoryTransitionProducer_isSupportedTransitionWithKind_fromSegmentIdentifier_toSegmentIdentifier_inTimeline___block_invoke_3(uint64_t result, uint64_t a2, int a3, int a4, char *__src, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v17 = v6;
    uint64_t v18 = v7;
    uint64_t v11 = result;
    uint64_t v12 = 0;
    while (1)
    {
      if (v12 == *(void *)(v11 + 48))
      {
        memcpy(__dst, __src, sizeof(__dst));
        uint64_t v13 = *(void *)(*(void *)(v11 + 40) + 8);
        if (*(unsigned char *)(v13 + 24))
        {
          char v14 = (*(uint64_t (**)(double))(*(void *)(v11 + 32) + 16))(*(double *)(v11 + 56));
          uint64_t v13 = *(void *)(*(void *)(v11 + 40) + 8);
        }
        else
        {
          char v14 = 0;
        }
        *(unsigned char *)(v13 + 24) = v14;
        uint64_t v15 = *(void *)(*(void *)(v11 + 40) + 8);
        if (*(unsigned char *)(v15 + 24))
        {
          __n128 result = (*(uint64_t (**)(double))(*(void *)(v11 + 32) + 16))(*(double *)(v11 + 56));
          uint64_t v15 = *(void *)(*(void *)(v11 + 40) + 8);
        }
        else
        {
          __n128 result = 0;
        }
        *(unsigned char *)(v15 + 24) = result;
        if (!*(unsigned char *)(*(void *)(*(void *)(v11 + 40) + 8) + 24)) {
          break;
        }
      }
      ++v12;
      __src += 768;
      if (a2 == v12) {
        return result;
      }
    }
    *a6 = 1;
  }
  return result;
}

+ (id)supportedTransitionKinds
{
  if (supportedTransitionKinds_onceToken != -1) {
    dispatch_once(&supportedTransitionKinds_onceToken, &__block_literal_global_66);
  }
  long long v2 = (void *)supportedTransitionKinds_indexSet;
  return v2;
}

void __53__PXStoryTransitionProducer_supportedTransitionKinds__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:1];
  [v2 addIndex:2];
  [v2 addIndex:3];
  [v2 addIndex:4];
  [v2 addIndex:8];
  [v2 addIndex:5];
  [v2 addIndex:6];
  [v2 addIndex:7];
  [v2 addIndex:9];
  uint64_t v0 = [v2 copy];
  v1 = (void *)supportedTransitionKinds_indexSet;
  supportedTransitionKinds_indexSet = v0;
}

+ (BOOL)isSupportedTransitionWithKind:(char)a3 betweenSegmentWithClipComposition:(id *)a4 andSegmentWithClipComposition:(id *)a5
{
  int v7 = a3;
  uint64_t v8 = [a1 supportedTransitionKinds];
  int v9 = [v8 containsIndex:v7];

  if (!v9) {
    return 0;
  }
  if (v7 == 8) {
    PXFloatApproximatelyEqualToFloat();
  }
  if (v7 == 2) {
    return a4->var0 < 2;
  }
  if ((v7 & 0xFFFFFFFE) != 6) {
    return 1;
  }
  if (a4->var0 != 1 || !a4->var1) {
    return 0;
  }
  return a5->var0 == 1 && a5->var1;
}

@end