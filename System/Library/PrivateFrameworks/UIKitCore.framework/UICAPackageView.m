@interface UICAPackageView
@end

@implementation UICAPackageView

void __50___UICAPackageView__shouldCatchDecodingExceptions__block_invoke()
{
  _UIKitUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 objectForKey:@"UICatchCAPackageDecodingExceptions"];
  v1 = v0;
  if (v0) {
    _shouldCatchDecodingExceptions___shouldCatchDecodingExceptions = [v0 BOOLValue];
  }
}

void __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke(uint64_t a1)
{
  v30[3] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_2;
  aBlock[3] = &unk_1E5310600;
  id v26 = *(id *)(a1 + 32);
  id v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] activateBackground:1];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v24 = 0;
    v3 = (id *)&v24;
    v4 = v2[2](v2, &v24);
  }
  else
  {
    uint64_t v23 = 0;
    v4 = v2[2](v2, &v23);
    v3 = (id *)&v23;
  }
  id v5 = *v3;
  [MEMORY[0x1E4F39CF8] commit];
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_3;
    block[3] = &unk_1E52FE2B8;
    uint64_t v22 = *(void *)(a1 + 56);
    id v6 = v4;
    id v19 = v6;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v7 = v19;
  }
  else
  {
    v8 = [v5 domain];
    int v9 = [v8 isEqual:@"CAARFileLoadingDomain"];

    if (v9)
    {
      id v10 = v5;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      if (v5)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v30[0] = v5;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        id v10 = [v11 errorWithDomain:@"CAARFileLoadingDomain" code:950000 userInfo:v12];
      }
      else
      {
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v12 = [NSString stringWithFormat:@"'NSData' and 'NSURL' are the only valid input types (the argument was '%@')", objc_opt_class()];
        v28 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v10 = [v11 errorWithDomain:@"CAARFileLoadingDomain" code:950002 userInfo:v13];
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_4;
    v15[3] = &unk_1E52DB330;
    id v14 = *(id *)(a1 + 48);
    id v16 = v10;
    id v17 = v14;
    id v7 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v15);

    id v6 = 0;
  }
}

id __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [MEMORY[0x1E4F39C38] packageWithData:*(void *)(a1 + 32) type:*MEMORY[0x1E4F3A4B8] options:0 error:a2];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [*(id *)(a1 + 32) path];
      id v6 = v5;
      if (v5)
      {
        id v7 = [v5 pathExtension];
        id v8 = (id)*MEMORY[0x1E4F3A4B8];
        if (v7 && [v7 isEqualToString:@"ca"])
        {
          id v9 = (id)*MEMORY[0x1E4F3A4C0];

          id v8 = v9;
        }
      }
      else
      {
        id v8 = (id)*MEMORY[0x1E4F3A4B8];
        id v7 = 0;
      }
      v4 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:*(void *)(a1 + 32) type:v8 options:0 error:a2];
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

void __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 56));
  id v5 = (id *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_storeStrong(v5 + 51, *(id *)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 56) _newViewHierarchyFrom:*(void *)(a1 + 32) publishedObjectViewClassMap:*(void *)(a1 + 40) into:v5];
  id v4 = v5[52];
  v5[52] = (id)v3;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __75___UICAPackageView__newViewHierarchyFrom_publishedObjectViewClassMap_into___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = CALayerGetSuperlayer();
  if (v3) {
    goto LABEL_2;
  }
  id v4 = CALayerGetDelegate();

  if (!v4)
  {
    uint64_t v3 = _CreateViewForLayer(v5, *(void **)(a1 + 32));
    [*(id *)(a1 + 40) addObject:v3];
LABEL_2:
  }
}

@end