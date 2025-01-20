@interface UIKBRTTimerBlock
@end

@implementation UIKBRTTimerBlock

void __28___UIKBRTTimerBlock_fireNow__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) fire];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UIKBRTTouchInfo.m" lineNumber:582 description:@"Timer should be nil!"];
  }
}

void __31___UIKBRTTimerBlock_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

void __32___UIKBRTTimerBlock_timerFired___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  if (v1 == *(void **)(v2 + 16))
  {
    *(void *)(v2 + 16) = 0;

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[5] + 24));
    uint64_t v4 = _Block_copy(*(const void **)(a1[5] + 32));
    uint64_t v5 = *(void *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[5] + 40));
    uint64_t v7 = a1[5];
    v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;

    uint64_t v9 = a1[5];
    v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = 0;

    uint64_t v11 = a1[5];
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

uint64_t __32___UIKBRTTimerBlock_timerFired___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

@end