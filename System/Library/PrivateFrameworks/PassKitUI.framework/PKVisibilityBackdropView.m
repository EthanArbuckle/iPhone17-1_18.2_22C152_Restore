@interface PKVisibilityBackdropView
@end

@implementation PKVisibilityBackdropView

uint64_t __56___PKVisibilityBackdropView_pkui_commitBackdropSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionIncrementallyToPrivateStyle:*(void *)(*(void *)(a1 + 32) + 864) weighting:0.0];
}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionIncrementallyToPrivateStyle:*(void *)(*(void *)(a1 + 32) + 864) weighting:*(double *)(*(void *)(a1 + 32) + 832)];
}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionIncrementallyToPrivateStyle:*(void *)(*(void *)(a1 + 32) + 864) weighting:*(double *)(*(void *)(a1 + 32) + 840)];
}

void __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_DWORD *)WeakRetained + 213) == *(_DWORD *)(a1 + 40))
    {
      int v5 = *((_DWORD *)WeakRetained + 212) - 1;
      *((_DWORD *)WeakRetained + 212) = v5;
      if (!v5)
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_3;
        v6[3] = &unk_1E59D1888;
        objc_copyWeak(&v7, v2);
        int v8 = *(_DWORD *)(a1 + 40);
        dispatch_async(MEMORY[0x1E4F14428], v6);
        objc_destroyWeak(&v7);
      }
    }
  }
}

void __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_DWORD *)WeakRetained + 213) == *(_DWORD *)(a1 + 40) && !*((_DWORD *)WeakRetained + 212))
    {
      double v4 = WeakRetained[104];
      if (WeakRetained[105] != v4)
      {
        WeakRetained[105] = v4;
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_4;
        v5[3] = &unk_1E59CA7D0;
        v5[4] = WeakRetained;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
      }
    }
  }
}

uint64_t __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionIncrementallyToPrivateStyle:*(void *)(*(void *)(a1 + 32) + 864) weighting:*(double *)(*(void *)(a1 + 32) + 832)];
}

@end