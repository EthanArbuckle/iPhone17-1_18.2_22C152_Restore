@interface UIKBRTTouchInfo
@end

@implementation UIKBRTTouchInfo

void __29___UIKBRTTouchInfo_touchDict__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
  v1 = (void *)_MergedGlobals_9_1;
  _MergedGlobals_9_1 = v0;
}

void __56___UIKBRTTouchInfo_setTimerWithTimeInterval_onQueue_do___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  v2 = [[_UIKBRTTimerBlock alloc] initWithTimeInterval:*(void *)(a1 + 40) onQueue:*(void *)(a1 + 48) do:*(void *)(a1 + 32) owner:*(double *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

void __35___UIKBRTTouchInfo_invalidateTimer__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;
}

@end