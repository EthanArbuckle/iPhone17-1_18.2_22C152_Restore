@interface SUUIFilterBarViewElement
- (SUUIDividerViewElement)bottomDivider;
- (id)childViewElementsForAlignment:(unint64_t)a3;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUIFilterBarViewElement

- (SUUIDividerViewElement)bottomDivider
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SUUIFilterBarViewElement_bottomDivider__block_invoke;
  v5[3] = &unk_265400D50;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SUUIFilterBarViewElement;
  [(SUUIViewElement *)&v4 enumerateChildrenUsingBlock:v5];
  id v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIDividerViewElement *)v2;
}

void __41__SUUIFilterBarViewElement_bottomDivider__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  if (a3 - 1 <= 2)
  {
    [(SUUIViewElement *)self flattenedChildren];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) elementType] == 127) {
            ++v7;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    uint64_t v11 = [v6 count];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__SUUIFilterBarViewElement_childViewElementsForAlignment___block_invoke;
    v13[3] = &unk_265403EC8;
    v15 = v19;
    uint64_t v16 = v7;
    uint64_t v17 = v11;
    unint64_t v18 = a3;
    id v14 = v5;
    [v6 enumerateObjectsUsingBlock:v13];

    _Block_object_dispose(v19, 8);
  }
  return v5;
}

void __58__SUUIFilterBarViewElement_childViewElementsForAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  v5 = [v11 style];
  uint64_t v6 = [v5 elementAlignment];

  if (v6) {
    goto LABEL_2;
  }
  if (*(uint64_t *)(a1 + 48) < 1)
  {
    if (*(void *)(a1 + 56) == 3)
    {
      uint64_t v6 = qword_2568A1038[a3];
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
    uint64_t v6 = qword_2568A1038[*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SUUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUIFilterBarViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __56__SUUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
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
  return 24;
}

@end