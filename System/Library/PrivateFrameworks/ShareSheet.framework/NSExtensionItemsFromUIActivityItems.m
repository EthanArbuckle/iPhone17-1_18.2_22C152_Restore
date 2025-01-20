@interface NSExtensionItemsFromUIActivityItems
@end

@implementation NSExtensionItemsFromUIActivityItems

uint64_t ____NSExtensionItemsFromUIActivityItems_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = objc_getAssociatedObject(*(id *)(*((void *)&v9 + 1) + 8 * v5), &__UIIsContentManagedReferenceKey);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "BOOLValue", (void)v9))
        {

          uint64_t v7 = 1;
          goto LABEL_12;
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_12:

  return v7;
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (_UIActivityItemIsLivePhoto(v7))
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithLivePhoto:v7];
    if (v5)
    {
      [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v5];
      uint64_t v6 = a1[4];
      if (v6) {
        (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
      }
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeObjectAtIndex:a3];
  }
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v7 = a3;
  v8 = _UIActivityItemsWithTypes(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2, 0, a4, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_4;
  v14[3] = &unk_1E5A22718;
  id v15 = v7;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v9;
  uint64_t v18 = v10;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v17 = v11;
  uint64_t v19 = v12;
  id v13 = v7;
  [v8 enumerateObjectsUsingBlock:v14];
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = _NSItemProviderForUIActivityItem(v5, *(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v3];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v3, v5);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObjectIdenticalTo:v5];
  }
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)*MEMORY[0x1E4F226A8];
    id v5 = [*(id *)(a1 + 32) activityType];
    uint64_t v6 = _UIActivityGetTypeIdentifier(v3, v4, (uint64_t)v5);

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v3 typeIdentifier:v6];
    uint64_t v8 = *MEMORY[0x1E4F22688];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_6;
    v14[3] = &unk_1E5A22768;
    id v9 = v3;
    id v15 = v9;
    [v7 registerItemForTypeIdentifier:v8 loadHandler:v14];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v7, v9);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectIdenticalTo:v9];

LABEL_9:
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)*MEMORY[0x1E4F22688];
    uint64_t v12 = [*(id *)(a1 + 32) activityType];
    uint64_t v6 = _UIActivityGetTypeIdentifier(v3, v11, (uint64_t)v12);

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v3 typeIdentifier:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v7, v3);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectIdenticalTo:v3];
    goto LABEL_9;
  }
LABEL_10:
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_6(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  id v5 = [v3 string];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_7(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 registeredTypeIdentifiers];
  if ((unint64_t)[v3 count] <= 1)
  {
    char v4 = [v7 hasItemConformingToTypeIdentifier:@"com.apple.group-activities.activity"];

    id v5 = v7;
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v7];
  id v5 = v7;
  uint64_t v6 = a1[4];
  if (v6)
  {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v7);
    id v5 = v7;
  }
LABEL_6:
  [*(id *)(*(void *)(a1[6] + 8) + 40) removeObjectIdenticalTo:v5];
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    id v5 = [v3 attachments];
    uint64_t v6 = [v5 count];

    if (v4 == v6)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = [v3 attachments];
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v31;
        uint64_t v9 = *MEMORY[0x1E4F226F8];
        uint64_t v18 = *MEMORY[0x1E4F284B0];
        uint64_t v19 = *MEMORY[0x1E4F284B8];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v31 != v8) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v11, "hasItemConformingToTypeIdentifier:", v9, v18, v19))
            {
              uint64_t v24 = 0;
              v25 = &v24;
              uint64_t v26 = 0x3032000000;
              v27 = __Block_byref_object_copy__2;
              v28 = __Block_byref_object_dispose__2;
              id v29 = 0;
              dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
              uint64_t v34 = v19;
              uint64_t v35 = v18;
              uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v21[2] = ____NSExtensionItemsFromUIActivityItems_block_invoke_9;
              v21[3] = &unk_1E5A227E0;
              v23 = &v24;
              uint64_t v14 = v12;
              v22 = v14;
              [v11 loadItemForTypeIdentifier:v9 options:v13 completionHandler:v21];

              dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
              if (v25[5])
              {
                uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:");
                if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
                  [*(id *)(a1 + 32) removeObjectAtIndex:v15];
                }
              }

              _Block_object_dispose(&v24, 8);
            }
            uint64_t v16 = *(void *)(a1 + 40);
            if (v16) {
              (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v11, v3);
            }
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v7);
      }
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v3, v3);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectIdenticalTo:v3];
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_9(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ____NSExtensionItemsFromUIActivityItems_block_invoke_10(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 userInfo];
  if (v3)
  {
    id v4 = [v7 userInfo];
    id v5 = (id)[v4 mutableCopy];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
  }
  [v5 setObject:v6 forKeyedSubscript:@"com.apple.UIKit.NSExtensionItemUserInfoIsContentManagedKey"];
  [v7 setUserInfo:v5];
}

@end