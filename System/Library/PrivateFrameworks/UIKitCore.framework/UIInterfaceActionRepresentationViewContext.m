@interface UIInterfaceActionRepresentationViewContext
@end

@implementation UIInterfaceActionRepresentationViewContext

uint64_t __79___UIInterfaceActionRepresentationViewContext_AppleTV__applyHighlightTransform__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 17) || *(unsigned char *)(v2 + 16))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    [WeakRetained bounds];
    double v5 = v4;
    double v7 = v6;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = *(unsigned __int8 **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v8, "_enlargedTransformForSize:pressed:", v8[17], v5, v7);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v9 = 0;
    }
    long long v30 = v38;
    long long v31 = v39;
    long long v32 = v40;
    long long v33 = v41;
    long long v26 = v34;
    long long v27 = v35;
    long long v28 = v36;
    long long v29 = v37;
    id v10 = objc_loadWeakRetained((id *)(v9 + 24));
    v11 = [v10 layer];
    v25[4] = v30;
    v25[5] = v31;
    v25[6] = v32;
    v25[7] = v33;
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    v25[3] = v29;
    [v11 setTransform:v25];

    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    v13 = [v12 layer];
    [v13 setZPosition:1000.0];

    v14 = *(unsigned char **)(a1 + 32);
    if (!v14[17]) {
      return [v14 _insertMotionEffects];
    }
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)(v2 + 24));
    v17 = [v16 layer];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v24[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v24[5] = v18;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v24[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v24[7] = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v24[0] = *MEMORY[0x1E4F39B10];
    v24[1] = v20;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v24[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v24[3] = v21;
    [v17 setTransform:v24];

    id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    v23 = [v22 layer];
    [v23 setZPosition:0.0];

    v14 = *(unsigned char **)(a1 + 32);
  }
  return [v14 _removeMotionEffects];
}

void __75___UIInterfaceActionRepresentationViewContext_AppleTV__insertMotionEffects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addMotionEffect:v3];
}

void __75___UIInterfaceActionRepresentationViewContext_AppleTV__removeMotionEffects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 24);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained removeMotionEffect:v3];
}

@end