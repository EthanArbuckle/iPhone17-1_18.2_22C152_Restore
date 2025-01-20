@interface WGCAPackageView
@end

@implementation WGCAPackageView

void __92___WGCAPackageView_loadPackageViewWithContentsOfURL_publishedObjectViewClassMap_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v9 = v7;
  if (!v6) {
    [v7 setArchiveURL:*(void *)(a1 + 32)];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);
  }
}

BOOL __65___WGCAPackageView__supportsPushingBottomCornerRadiusToSubviews___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  if (([v5 isHidden] & 1) == 0)
  {
    [v5 alpha];
    BOOL v6 = v7 == 0.0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v6 = 1;
  if (a3) {
LABEL_5:
  }
    *a3 = !v6;
LABEL_6:
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
  }
  else
  {
    v10 = [v5 layer];
    v11 = [v10 contents];
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      char v13 = objc_msgSend(v5, "wg_supportsBottomCornerRadiusGivenRootView:withCornerRadius:supportedCorners:", WeakRetained, 0, *(double *)(a1 + 48));
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v8 = a1 + 32;
      *(unsigned char *)(*(void *)(v14 + 8) + 24) = v13;
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v8 = a1 + 32;
      *(unsigned char *)(*(void *)(v15 + 8) + 24) = 1;
    }
  }
  BOOL v16 = *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) == 0;

  return v16;
}

uint64_t __47___WGCAPackageView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  if ([v5 isHidden])
  {
    BOOL v6 = 1;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v5 alpha];
  BOOL v6 = v7 == 0.0;
  if (a3) {
LABEL_5:
  }
    *a3 = !v6;
LABEL_6:
  if (!v6)
  {
    uint64_t v8 = [v5 layer];
    uint64_t v9 = [v8 contents];

    if (v9)
    {
      uint64_t v13 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v5, "wg_supportsBottomCornerRadiusGivenRootView:withCornerRadius:supportedCorners:", WeakRetained, &v13, *(double *)(a1 + 40));

      if (v13)
      {
        [v5 _setContinuousCornerRadius:*(double *)(a1 + 40)];
        v11 = [v5 layer];
        [v11 setMaskedCorners:v13];
      }
    }
  }

  return 0;
}

@end