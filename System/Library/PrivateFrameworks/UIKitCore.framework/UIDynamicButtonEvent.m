@interface UIDynamicButtonEvent
@end

@implementation UIDynamicButtonEvent

id __61___UIDynamicButtonEvent__appendSimpleDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 136) withName:@"dynamicButtonForDispatch"];
}

uint64_t __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 136) withName:@"dynamicButtonForDispatch"];
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 128) count];
  if (result)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_3;
    v5[3] = &unk_1E52D9F98;
    int8x16_t v4 = *(int8x16_t *)(a1 + 32);
    int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
    return [(id)v4.i64[0] appendBodySectionWithName:@"dynamicButtons" block:v5];
  }
  return result;
}

void __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_2;
  v4[3] = &unk_1E52D9F98;
  long long v5 = *(_OWORD *)(a1 + 32);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v4];
}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_2(int8x16_t *a1)
{
  id v2 = (void *)a1[2].i64[0];
  uint64_t v3 = [*(id *)(a1[2].i64[1] + 136) succinctDescription];
  id v4 = (id)[v2 appendObject:v3 withName:@"dynamicButtonForDispatch"];

  if ([*(id *)(a1[2].i64[1] + 128) count])
  {
    long long v5 = (void *)a1[2].i64[0];
    uint64_t v6 = [v5 activeMultilinePrefix];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_3;
    v7[3] = &unk_1E52D9F98;
    int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
    [v5 appendBodySectionWithName:@"dynamicButtons" multilinePrefix:v6 block:v7];
  }
}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        int8x16_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "succinctDescription", (void)v10);
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2(int8x16_t *a1)
{
  id v2 = (void *)a1[2].i64[0];
  uint64_t v3 = [*(id *)(a1[2].i64[1] + 136) succinctDescription];
  id v4 = (id)[v2 appendObject:v3 withName:@"dynamicButtonForDispatch"];

  if ([*(id *)(a1[2].i64[1] + 120) count])
  {
    uint64_t v5 = (void *)a1[2].i64[0];
    uint64_t v6 = [v5 activeMultilinePrefix];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v22[3] = &unk_1E52D9F98;
    int8x16_t v15 = a1[2];
    id v7 = (id)v15.i64[0];
    int8x16_t v23 = vextq_s8(v15, v15, 8uLL);
    [v5 appendBodySectionWithName:@"dynamicButtonsByWindow" multilinePrefix:v6 block:v22];
  }
  if (objc_msgSend(*(id *)(a1[2].i64[1] + 128), "count", *(_OWORD *)&v15))
  {
    uint64_t v8 = (void *)a1[2].i64[0];
    id v9 = [v8 activeMultilinePrefix];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v19[3] = &unk_1E52D9F98;
    id v10 = (id)a1[2].i64[0];
    uint64_t v11 = a1[2].i64[1];
    id v20 = v10;
    uint64_t v21 = v11;
    [v8 appendBodySectionWithName:@"dynamicButtons" multilinePrefix:v9 block:v19];

    long long v12 = (void *)a1[2].i64[0];
    long long v13 = [v12 activeMultilinePrefix];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_5;
    v17[3] = &unk_1E52D9F98;
    int8x16_t v16 = a1[2];
    id v14 = (id)v16.i64[0];
    int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
    [v12 appendBodySectionWithName:@"deliveryTables" multilinePrefix:v13 block:v17];
  }
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v4 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:v3];
        uint64_t v5 = (objc_class *)objc_opt_class();
        objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p; count: %lu>",
          class_getName(v5),
          v4,
        uint64_t v6 = [v4 count]);
        id v7 = *(void **)(a1 + 40);
        if (v3)
        {
          uint64_t v8 = NSString;
          id v9 = v3;
          id v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          long long v12 = [v8 stringWithFormat:@"<%@: %p>", v11, v9];
        }
        else
        {
          long long v12 = @"(nil)";
        }
        id v13 = (id)[v7 appendObject:v6 withName:v12];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v16);
  }
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) activeMultilinePrefix];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 40) + 128);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), 0, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 128);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v6];
        id v8 = *(void **)(a1 + 40);
        if (v6)
        {
          long long v9 = NSString;
          id v10 = v6;
          long long v11 = (objc_class *)objc_opt_class();
          long long v12 = NSStringFromClass(v11);
          id v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];
        }
        else
        {
          id v13 = @"(nil)";
        }
        id v14 = (id)[v8 appendObject:v7 withName:v13];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

@end