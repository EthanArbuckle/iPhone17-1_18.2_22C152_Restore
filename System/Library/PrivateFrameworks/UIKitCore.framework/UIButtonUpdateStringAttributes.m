@interface UIButtonUpdateStringAttributes
@end

@implementation UIButtonUpdateStringAttributes

void ___UIButtonUpdateStringAttributes_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)off_1E52D2040;
  id v19 = v7;
  id v9 = [v7 objectForKeyedSubscript:*(void *)off_1E52D2040];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
  }
  else
  {
    v11 = 0;
  }
  v12 = _UIButtonCombineDictionaries(*(void **)(a1 + 40), v19);
  v13 = v12;
  if (v10 != v11)
  {
    v14 = (void *)[v12 mutableCopy];
    [v14 setObject:v11 forKeyedSubscript:v8];

    v13 = v14;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    v16 = *(void **)(a1 + 40);
    v17 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
    uint64_t v18 = _UIButtonCombineDictionaries(v16, v17);

    v13 = (void *)v18;
  }
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v13, a3, a4);
}

void ___UIButtonUpdateStringAttributes_block_invoke_0(uint64_t a1, void *a2)
{
  uint64_t v3 = _UIButtonCombineDictionaries(*(void **)(a1 + 32), a2);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    id v10 = (id)v3;
    uint64_t v5 = (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);

    uint64_t v3 = v5;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v11 = (id)v3;
    uint64_t v8 = (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v3);
    uint64_t v9 = _UIButtonCombineDictionaries(v7, v8);

    uint64_t v3 = v9;
  }
  id v12 = (id)v3;
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:");
}

@end