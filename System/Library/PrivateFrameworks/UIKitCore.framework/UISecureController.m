@interface UISecureController
@end

@implementation UISecureController

void __65___UISecureController__synchronousRemoteObjectProxyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 conformsToProtocol:&unk_1ED7007C0])
  {
    uint64_t v3 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_121];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v8;
    v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [(_UISecureController *)(uint64_t)WeakRetained _updateSizeSpec:a2 intrinsicContentSize:a3];
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_3;
  v4[3] = &unk_1E52E68F8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  [v2 getIntrinsicContentSizeForSpec:v3 reply:v4];

  objc_destroyWeak(&v6);
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_3(uint64_t a1, double a2, double a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_4;
  v6[3] = &unk_1E52E6920;
  objc_copyWeak(v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)&a2;
  v8[2] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v8);
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [(_UISecureController *)(uint64_t)WeakRetained _updateSizeSpec:*(double *)(a1 + 48) intrinsicContentSize:*(double *)(a1 + 56)];
}

@end