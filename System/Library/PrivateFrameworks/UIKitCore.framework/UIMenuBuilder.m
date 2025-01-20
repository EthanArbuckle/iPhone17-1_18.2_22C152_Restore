@interface UIMenuBuilder
@end

@implementation UIMenuBuilder

id __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) children];
  v3 = (void *)[v2 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_2;
  v8[3] = &unk_1E5303CC8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 indexOfObjectPassingTest:v8];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 48) file:@"UIMenuBuilder.m" lineNumber:511 description:@"menu not found in parent"];
  }
  [v3 insertObject:*(void *)(a1 + 56) atIndex:v4];
  v5 = [*(id *)(a1 + 32) menuByReplacingChildren:v3];

  return v5;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_3;
  v5[3] = &unk_1E5303C80;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = [a2 _acceptBoolMenuVisit:v5 leafVisit:&__block_literal_global_456];

  return v3;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_4()
{
  return 0;
}

id __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) children];
  uint64_t v3 = (void *)[v2 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_2;
  v8[3] = &unk_1E5303CC8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 indexOfObjectPassingTest:v8];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 48) file:@"UIMenuBuilder.m" lineNumber:537 description:@"menu not found in parent"];
  }
  [v3 insertObject:*(void *)(a1 + 56) atIndex:v4 + 1];
  v5 = [*(id *)(a1 + 32) menuByReplacingChildren:v3];

  return v5;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_3;
  v5[3] = &unk_1E5303C80;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = [a2 _acceptBoolMenuVisit:v5 leafVisit:&__block_literal_global_45_2];

  return v3;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_4()
{
  return 0;
}

id __61___UIMenuBuilder_insertChildMenu_atStartOfMenuForIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) children];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 insertObject:*(void *)(a1 + 40) atIndex:0];
  uint64_t v4 = [*(id *)(a1 + 32) menuByReplacingChildren:v3];

  return v4;
}

id __59___UIMenuBuilder_insertChildMenu_atEndOfMenuForIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 children];
  uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 40)];
  v5 = [v2 menuByReplacingChildren:v4];

  return v5;
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v18 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [*(id *)(a1 + 32) _parentOfMenuForIdentifier:v18 commandForIdentifier:v11];
  if (v15)
  {
    if (v18) {
      id v16 = v18;
    }
    else {
      id v16 = v11;
    }
    [*(id *)(a1 + 40) insertBeforeElements:v13 afterElements:v14 aroundElement:v16 inMenu:v15];
  }
  else
  {
    v17 = [*(id *)(a1 + 32) _firstValidMenuWithinIdentifiers:v12];
    if (v17) {
      [*(id *)(a1 + 40) insertFallbackBeforeElements:v13 fallbackAfterElements:v14 inMenu:v17];
    }
  }
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) menuForIdentifier:v10];

  if (v9) {
    [*(id *)(a1 + 40) insertAtStartElements:v7 atEndElements:v8 inMenu:v10];
  }
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_parentOfMenuForIdentifier:commandForIdentifier:", 0);
  if (v3) {
    [*(id *)(a1 + 40) deleteItem:v4 inMenu:v3];
  }
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "menuForIdentifier:");

  if (v3) {
    [*(id *)(a1 + 40) deleteMenu:v4];
  }
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 anchor];
  id v4 = [v3 fallbacks];
  v5 = [v3 insertsBefore];
  id v6 = [v3 insertsAfter];

  (*(void (**)(uint64_t, void, id, void *, void *, void *))(v2 + 16))(v2, 0, v7, v4, v5, v6);
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 anchor];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  v5 = [v4 anchor];
  id v6 = [v4 fallbacks];
  id v7 = [v4 insertsBefore];
  id v8 = [v4 insertsAfter];
  (*(void (**)(uint64_t, void *, void, void *, void *, void *))(v3 + 16))(v3, v5, 0, v6, v7, v8);

  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = [v4 anchor];
  id v10 = [v4 insertsAtStart];
  id v11 = [v4 insertsAtEnd];

  (*(void (**)(uint64_t, id, void *, void *))(v9 + 16))(v9, v12, v10, v11);
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 anchor];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3;
        v12[3] = &unk_1E5305328;
        id v13 = *(id *)(a1 + 32);
        if ([v9 _acceptBoolMenuVisit:&__block_literal_global_480 commandVisit:v12 actionVisit:0])objc_msgSend(v11, "addObject:", v9); {
      }
        }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v11;
}

uint64_t __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2()
{
  return 1;
}

uint64_t __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 _identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v29 = a1;
  uint64_t v5 = [*(id *)(a1 + 32) atStartElements];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) atStartElements];
    [v4 addObjectsFromArray:v7];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v8)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x3032000000;
        v47 = __Block_byref_object_copy__176;
        v48 = __Block_byref_object_dispose__176;
        id v49 = 0;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_12;
        v41[3] = &unk_1E5305350;
        v43 = &v44;
        id v42 = *(id *)(a1 + 32);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2_14;
        v38[3] = &unk_1E5305378;
        v40 = &v44;
        id v39 = *(id *)(a1 + 32);
        [v10 _acceptMenuVisit:v41 commandVisit:v38 actionVisit:0 deferredElementVisit:0];
        id v11 = (void *)v45[5];
        if (v11)
        {
          id v12 = [v11 beforeElements];
          [v4 addObjectsFromArray:v12];
        }
        [v4 addObject:v10];
        id v13 = (void *)v45[5];
        if (v13)
        {
          long long v14 = [v13 afterElements];
          [v4 addObjectsFromArray:v14];
        }
        _Block_object_dispose(&v44, 8);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v15 = [*(id *)(a1 + 32) fallbackBeforeElements];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v15);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v55 count:16];
    }
    while (v16);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v19 = [*(id *)(v29 + 32) fallbackAfterElements];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        [v4 addObjectsFromArray:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v54 count:16];
    }
    while (v20);
  }

  v23 = [*(id *)(v29 + 32) atEndElements];
  BOOL v24 = [v23 count] == 0;

  if (!v24)
  {
    v25 = [*(id *)(v29 + 32) atEndElements];
    [v4 addObjectsFromArray:v25];
  }
  return v4;
}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 childInserts];
  uint64_t v5 = [v4 identifier];

  uint64_t v6 = [v9 objectForKeyedSubscript:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 childInserts];
  uint64_t v5 = [v4 _identifier];

  uint64_t v6 = [v9 objectForKeyedSubscript:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3_16(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x3032000000;
        uint64_t v19 = __Block_byref_object_copy__176;
        uint64_t v20 = __Block_byref_object_dispose__176;
        id v21 = 0;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4_17;
        v13[3] = &unk_1E5305378;
        long long v15 = &v16;
        id v14 = *(id *)(a1 + 32);
        [v8 _acceptMenuVisit:0 commandVisit:v13 actionVisit:0 deferredElementVisit:0];
        id v9 = (void *)v17[5];
        if (v9)
        {
          id v10 = [v9 replacementElements];
          [v4 addObjectsFromArray:v10];
        }
        else
        {
          [v4 addObject:v8];
        }

        _Block_object_dispose(&v16, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return v4;
}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4_17(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 childReplacements];
  uint64_t v5 = [v4 _identifier];

  uint64_t v6 = [v9 objectForKeyedSubscript:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end