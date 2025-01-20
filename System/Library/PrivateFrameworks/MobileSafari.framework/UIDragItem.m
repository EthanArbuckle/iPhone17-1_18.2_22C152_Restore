@interface UIDragItem
@end

@implementation UIDragItem

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  v5 = *(void **)(a1 + 32);
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v7 forKeyedSubscript:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (*(void *)(a1 + 56)
    && ([v5 localObject], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7)
    && ((*(void (**)(void *))(a1 + 56))(v6), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v9 = *(void (**)(void *, void *))(a1 + 64);
    v10 = [v6 itemProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_3;
    v11[3] = &unk_1E54EBF98;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = a3;
    id v12 = *(id *)(a1 + 32);
    v9(v10, v11);
  }
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_4(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 48));
  objc_msgSend(MEMORY[0x1E4F1C978], "safari_arrayFromDictionaryOfObjectsByIndex:", a1[4]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[6] + 8) + 48));
  (*(void (**)(void))(a1[5] + 16))();
}

@end