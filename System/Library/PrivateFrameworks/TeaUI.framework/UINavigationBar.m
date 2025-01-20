@interface UINavigationBar
@end

@implementation UINavigationBar

void __46__UINavigationBar_Bridge__syncBarButtonItems___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "ts_fetchCompressibleTitleView");

  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v5) {
      goto LABEL_21;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        if (v10) {
          [v10 transform];
        }
        else {
          memset(&v21, 0, sizeof(v21));
        }
        BOOL IsIdentity = CGAffineTransformIsIdentity(&v21);
        v12 = objc_msgSend(v9, "ts_compressibleBarButtonItemView");
        v13 = v12;
        if (IsIdentity)
        {
          if (v12)
          {
            [v12 setContentAlpha:1.0];
            double v14 = 0.0;
LABEL_15:
            objc_msgSend(v13, "setVerticalOffset:", v14, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
            goto LABEL_19;
          }
          v16 = objc_msgSend(v9, "ts_barButtonItemView");
          v17 = [v16 layer];
          v18 = v17;
          LODWORD(v19) = 1.0;
        }
        else
        {
          [v3 contentAlpha];
          if (v13)
          {
            objc_msgSend(v13, "setContentAlpha:");
            [v3 verticalOffset];
            goto LABEL_15;
          }
          float v20 = v15;
          v16 = objc_msgSend(v9, "ts_barButtonItemView");
          v17 = [v16 layer];
          v18 = v17;
          *(float *)&double v19 = v20;
        }
        objc_msgSend(v17, "setOpacity:", v19, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx, (void)v22);

LABEL_19:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v6)
      {
LABEL_21:

        break;
      }
    }
  }
}

uint64_t __41__UINavigationBar_Bridge__ts_contentView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uinavigationba.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "ts_barButtonItemView");
  if (v3)
  {
    id v9 = v3;
    int v4 = [v3 conformsToProtocol:&unk_1F0F43790];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [TUNavigationBarCompressibleBarButtonItemView alloc];
    if (v4) {
      uint64_t v7 = [(TUNavigationBarCompressibleBarButtonItemView *)v6 initWithCustomItemView:v9];
    }
    else {
      uint64_t v7 = [(TUNavigationBarCompressibleBarButtonItemView *)v6 initWithRegularItemView:v9];
    }
    v8 = (void *)v7;
    [v5 addObject:v7];

    v3 = v9;
  }
}

void __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "ts_barButtonItemView");
  if (v3)
  {
    id v9 = v3;
    int v4 = [v3 conformsToProtocol:&unk_1F0F43790];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [TUNavigationBarCompressibleBarButtonItemView alloc];
    if (v4) {
      uint64_t v7 = [(TUNavigationBarCompressibleBarButtonItemView *)v6 initWithCustomItemView:v9];
    }
    else {
      uint64_t v7 = [(TUNavigationBarCompressibleBarButtonItemView *)v6 initWithRegularItemView:v9];
    }
    v8 = (void *)v7;
    [v5 addObject:v7];

    v3 = v9;
  }
}

@end