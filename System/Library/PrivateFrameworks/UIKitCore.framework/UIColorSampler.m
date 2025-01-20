@interface UIColorSampler
@end

@implementation UIColorSampler

void __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke_2;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __45___UIColorSampler__createServerProxyIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    id v4 = WeakRetained;

    id v3 = (void *)v4[1];
    v4[1] = 0;

    WeakRetained = v4;
  }
}

void __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (qword_1EB2634F0 != -1) {
    dispatch_once(&qword_1EB2634F0, &__block_literal_global_524);
  }
  id v3 = (id)_MergedGlobals_1241;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Error creating a remoteObjectProxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

@end