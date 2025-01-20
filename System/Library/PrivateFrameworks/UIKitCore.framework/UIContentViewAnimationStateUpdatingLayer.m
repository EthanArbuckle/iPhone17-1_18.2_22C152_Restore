@interface UIContentViewAnimationStateUpdatingLayer
@end

@implementation UIContentViewAnimationStateUpdatingLayer

void __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke(uint64_t a1, int a2, double a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 <= 0.5;
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (*(void *)(v3 + 24) != v4 || a2 != 0)
  {
    char v6 = a2;
    *(void *)(v3 + 24) = v4;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E530EBE0;
    id v11 = *(id *)(a1 + 32);
    char v13 = v6;
    long long v9 = *(_OWORD *)(a1 + 40);
    id v8 = (id)v9;
    long long v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

@end