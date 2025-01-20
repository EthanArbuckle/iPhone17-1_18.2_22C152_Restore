@interface SKUIFilterBarViewElement
- (SKUIDividerViewElement)bottomDivider;
- (id)childViewElementsForAlignment:(unint64_t)a3;
- (int64_t)pageComponentType;
- (void)bottomDivider;
- (void)enumerateChildrenUsingBlock:(id)a3;
- (void)pageComponentType;
@end

@implementation SKUIFilterBarViewElement

- (SKUIDividerViewElement)bottomDivider
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIFilterBarViewElement *)v3 bottomDivider];
      }
    }
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__38;
  v19 = __Block_byref_object_dispose__38;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__SKUIFilterBarViewElement_bottomDivider__block_invoke;
  v14[3] = &unk_1E6422498;
  v14[4] = &v15;
  v13.receiver = self;
  v13.super_class = (Class)SKUIFilterBarViewElement;
  [(SKUIViewElement *)&v13 enumerateChildrenUsingBlock:v14];
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SKUIDividerViewElement *)v11;
}

void __41__SKUIFilterBarViewElement_bottomDivider__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 32)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)childViewElementsForAlignment:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIFilterBarViewElement childViewElementsForAlignment:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_super v13 = [MEMORY[0x1E4F1CA48] array];
  if (a3 - 1 <= 2)
  {
    [(SKUIViewElement *)self flattenedChildren];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0;
    uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * i) elementType] == 127) {
            ++v15;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    uint64_t v19 = [v14 count];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__SKUIFilterBarViewElement_childViewElementsForAlignment___block_invoke;
    v21[3] = &unk_1E6426AD8;
    v23 = v27;
    uint64_t v24 = v15;
    uint64_t v25 = v19;
    unint64_t v26 = a3;
    id v22 = v13;
    [v14 enumerateObjectsUsingBlock:v21];

    _Block_object_dispose(v27, 8);
  }

  return v13;
}

void __58__SKUIFilterBarViewElement_childViewElementsForAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  BOOL v5 = [v11 style];
  uint64_t v6 = [v5 elementAlignment];

  if (v6) {
    goto LABEL_2;
  }
  if (*(uint64_t *)(a1 + 48) < 1)
  {
    if (*(void *)(a1 + 56) == 3)
    {
      uint64_t v6 = qword_1C1CCBBD8[a3];
      goto LABEL_2;
    }
    uint64_t v9 = [v11 elementType];
    if (v9 == 109)
    {
      uint64_t v6 = 2;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
      goto LABEL_2;
    }
    if (v9 == 69)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
      uint64_t v6 = 3;
      goto LABEL_2;
    }
LABEL_16:
    uint64_t v6 = qword_1C1CCBBD8[*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    goto LABEL_2;
  }
  if ([v11 elementType] != 127) {
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(a1 + 48) == 1)
  {
    uint64_t v6 = 0;
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v10 = *(void *)(v7 + 24);
    if (v10 >= 1) {
      uint64_t v10 = 1;
    }
    uint64_t v8 = v10 + 1;
  }
  *(void *)(v7 + 24) = v8;
LABEL_2:
  if (v6 == *(void *)(a1 + 64)) {
    [*(id *)(a1 + 32) addObject:v11];
  }
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIFilterBarViewElement enumerateChildrenUsingBlock:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__SKUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v15[3] = &unk_1E64241C8;
  id v16 = v4;
  v14.receiver = self;
  v14.super_class = (Class)SKUIFilterBarViewElement;
  id v13 = v4;
  [(SKUIViewElement *)&v14 enumerateChildrenUsingBlock:v15];
}

void __56__SKUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 elementType];
  BOOL v4 = (unint64_t)(v3 - 8) > 0x3D || ((1 << (v3 - 8)) & 0x2000060000000031) == 0;
  if (!v4 || (unint64_t)(v3 - 106) <= 0x2E && ((1 << (v3 - 106)) & 0x400900200009) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIFilterBarViewElement *)v2 pageComponentType];
      }
    }
  }
  return 24;
}

- (void)bottomDivider
{
}

- (void)childViewElementsForAlignment:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enumerateChildrenUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pageComponentType
{
}

@end