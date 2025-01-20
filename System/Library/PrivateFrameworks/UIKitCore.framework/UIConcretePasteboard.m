@interface UIConcretePasteboard
@end

@implementation UIConcretePasteboard

void __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  if (*(unsigned char *)(a1 + 64))
  {
    v3 = 0;
  }
  else
  {
    v3 = _pasteboardCacheQueue_pasteboardForName(*(void **)(a1 + 32));
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "_pasteboardCacheQueue_isPersistent"))
    {
      if (!*(unsigned char *)(a1 + 65))
      {
        v5 = _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);

        if (!v5)
        {
          _pasteboardCacheQueue_removePasteboardForName(*(void **)(a1 + 32));
          uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
          v7 = *(void **)(v6 + 40);
          *(void *)(v6 + 40) = 0;
        }
      }
    }
  }
  else
  {
    v8 = _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);

    if (v8)
    {
      uint64_t v9 = [objc_alloc(*(Class *)(a1 + 56)) _initWithName:*(void *)(a1 + 32)];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else if (*(unsigned char *)(a1 + 65))
    {
      uint64_t v12 = [objc_alloc(*(Class *)(a1 + 56)) _initWithName:*(void *)(a1 + 32)];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if (([*(id *)(a1 + 32) isEqualToString:@"com.apple.UIKit.pboard.general"] & 1) != 0
        || !_UIApplicationIsExtension()
        || (dyld_program_sdk_at_least() & 1) == 0)
      {
        v15 = _notificationStateQueue();
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke_2;
        v20[3] = &unk_1E52EAC30;
        int8x16_t v21 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        dispatch_sync(v15, v20);
      }
    }
    v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v16 && !*(unsigned char *)(a1 + 64))
    {
      id v17 = *(id *)(a1 + 32);
      id v18 = v16;
      v19 = _pasteboardCacheQueue_PasteboardNameToPasteboardMap();
      [v19 setObject:v18 forKeyedSubscript:v17];
    }
  }
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke(uint64_t a1)
{
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [*(id *)(a1 + 40) name];
    NSLog(&cfstr_CouldNotSavePa.isa, v7, v6);
  }
  else
  {
    v8 = _notificationStateQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_3;
    block[3] = &unk_1E52D9F70;
    id v9 = v5;
    id v12 = v9;
    dispatch_sync(v8, block);

    uint64_t v10 = [v9 sharingToken];
    [*(id *)(a1 + 32) setSharingToken:v10];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

uint64_t __45___UIConcretePasteboard__saveItemCollection___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) notificationState];
  _notificationStateQueue_notificationState = result;
  return result;
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_4(uint64_t a1)
{
}

void __45___UIConcretePasteboard__saveItemCollection___block_invoke_5(uint64_t a1)
{
  int v2 = _notificationStateQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_6;
  block[3] = &unk_1E52E1B98;
  void block[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_sync(v2, block);
}

uint64_t __45___UIConcretePasteboard__saveItemCollection___block_invoke_6(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_saveItemCollection:currentNotificationState:outNewNotificationState:", *(void *)(a1 + 40), _notificationStateQueue_notificationState);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __44___UIConcretePasteboard__pinItemCollection___block_invoke(uint64_t a1)
{
}

uint64_t __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "_pasteboardCacheQueue_setPersistent:currentNotificationState:outNewNotificationState:", 1, _notificationStateQueue_notificationState);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __50___UIConcretePasteboard_removePasteboardWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = _pasteboardCacheQueue_pasteboardForName(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  _pasteboardCacheQueue_removePasteboardForName(*(void **)(a1 + 32));
  _pasteboardCacheQueue_removeItemCollectionForName(*(void **)(a1 + 32));
  id v5 = *(void **)(a1 + 32);
  _pasteboardCacheQueue_removePinnedItemCollectionForName(v5);
}

uint64_t __50___UIConcretePasteboard_removePasteboardWithName___block_invoke_2(uint64_t result)
{
  _notificationStateQueue_notificationState = *(void *)(result + 32);
  return result;
}

void __81___UIConcretePasteboard__pinItemProviders_forPasteboardNamed_withExpirationDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = _pasteboardCacheQueue_itemCollectionForName(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.UIKit.pboard.general"]) {
      _getTemporaryLocalGeneralPasteboard(0);
    }
    else {
    uint64_t v5 = _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(a1 + 32), 0);
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F881C8]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

void __59___UIConcretePasteboard__attemptAuthenticationWithMessage___block_invoke(uint64_t a1)
{
}

uint64_t __37___UIConcretePasteboard_isPersistent__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_isPersistent");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __40___UIConcretePasteboard__setPersistent___block_invoke(uint64_t a1)
{
  uint64_t v2 = _notificationStateQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___UIConcretePasteboard__setPersistent___block_invoke_2;
  block[3] = &unk_1E52FF990;
  long long v4 = *(_OWORD *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 48);
  dispatch_sync(v2, block);
}

uint64_t __40___UIConcretePasteboard__setPersistent___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_pasteboardCacheQueue_setPersistent:currentNotificationState:outNewNotificationState:", *(unsigned __int8 *)(a1 + 48), _notificationStateQueue_notificationState);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __36___UIConcretePasteboard_changeCount__block_invoke(uint64_t a1)
{
  _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(*(void *)(a1 + 32) + 8), 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = _pasteboardCacheQueue_countOffsetForName(*(void **)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 changeCount] + v2;
}

void __60___UIConcretePasteboard__changeCountIgnoringPinningActivity__block_invoke(uint64_t a1)
{
  _pasteboardCacheQueue_existingItemCollectionWithName(*(void **)(*(void *)(a1 + 32) + 8), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 changeCount];
}

void __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke_2;
  block[3] = &unk_1E52DA040;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56___UIConcretePasteboard_itemProvidersWithRetryBehavior___block_invoke_2(uint64_t a1)
{
  return +[UIUndoGestureInteraction showSecurePasteConfirmationWithCompletionHandler:*(void *)(a1 + 32)];
}

void __51___UIConcretePasteboard_pasteboardTypesForItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  long long v4 = [*(id *)(a1 + 32) items];
  unint64_t v5 = [v4 count];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    id v10 = [v6 name];
    id v8 = [*(id *)(a1 + 32) items];
    NSLog(&cfstr_AttemptingToQu.isa, v10, a2, [v8 count]);
  }
  else
  {
    v7 = [v6 items];
    id v10 = [v7 objectAtIndexedSubscript:a2];

    id v8 = [v10 availableTypes];
    if (v8)
    {
      [*(id *)(a1 + 40) addObject:v8];
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) name];
      NSLog(&cfstr_PasteboardItem.isa, v9, a2);
    }
  }
}

void __59___UIConcretePasteboard_containsPasteboardTypes_inItemSet___block_invoke(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) items];
  unint64_t v7 = [v6 count];

  if (v7 > a2)
  {
    id v8 = [*(id *)(a1 + 32) items];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a2];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(v9, "hasRepresentationConformingToType:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            *a3 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

void __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__151;
  v57 = __Block_byref_object_dispose__151;
  id v58 = 0;
  long long v4 = [*(id *)(a1 + 32) items];
  unint64_t v5 = [v4 count];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    id v10 = [v6 name];
    uint64_t v20 = [*(id *)(a1 + 32) items];
    NSLog(&cfstr_AttemptingToCo.isa, v10, a2, [v20 count]);

    goto LABEL_31;
  }
  unint64_t v7 = [v6 items];
  id v8 = [v7 objectAtIndexedSubscript:a2];

  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = v8;
  id v11 = v9;
  uint64_t v86 = 0;
  v87 = (id *)&v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__151;
  v90 = __Block_byref_object_dispose__151;
  id v91 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__151;
  v84 = __Block_byref_object_dispose__151;
  id v85 = 0;
  uint64_t v12 = +[_UIConcretePasteboard _loadRequestContextForBlockingUIKitCall];
  if ([UIPasteboardTypeListImage containsObject:v11]
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    uint64_t v66 = 0;
    uint64_t v67 = (uint64_t)&v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__151;
    v70 = __Block_byref_object_dispose__151;
    v71 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = objc_opt_class();
    uint64_t v73 = MEMORY[0x1E4F143A8];
    uint64_t v74 = 3221225472;
    uint64_t v75 = (uint64_t)___coerceItemToType_block_invoke;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52FFA30;
    v78 = &v66;
    v79 = &v80;
    long long v15 = v13;
    v77 = (void (*)(uint64_t))v15;
    id v16 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v14, v12, &v73);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (*(void *)(v67 + 40))
    {
      long long v17 = [(id)*MEMORY[0x1E4F44460] identifier];
      int v18 = [v11 isEqualToString:v17];

      if (v18)
      {
        uint64_t v19 = UIImagePNGRepresentation(*(UIImage **)(v67 + 40));
LABEL_19:
        id v38 = v87[5];
        v87[5] = (id)v19;

        goto LABEL_20;
      }
      v36 = [(id)*MEMORY[0x1E4F44410] identifier];
      int v37 = [v11 isEqualToString:v36];

      if (v37)
      {
        uint64_t v19 = _UIImageJPEGRepresentation(*(void **)(v67 + 40), 0, 0.9);
        goto LABEL_19;
      }
    }
LABEL_20:
    if (!v87[5]) {
      objc_storeStrong(v87 + 5, *(id *)(v67 + 40));
    }
    _Block_object_dispose(&v66, 8);
    v35 = v71;
    goto LABEL_23;
  }
  if ([UIPasteboardTypeListColor containsObject:v11]
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    uint64_t v22 = objc_opt_class();
    uint64_t v73 = MEMORY[0x1E4F143A8];
    uint64_t v74 = 3221225472;
    uint64_t v75 = (uint64_t)___coerceItemToType_block_invoke_2;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52FFA30;
    v78 = &v86;
    v79 = &v80;
    v23 = v21;
    v77 = (void (*)(uint64_t))v23;
    id v24 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v22, v12, &v73);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_24;
  }
  if (![UIPasteboardTypeListURL containsObject:v11]) {
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    uint64_t v26 = objc_opt_class();
    uint64_t v73 = MEMORY[0x1E4F143A8];
    uint64_t v74 = 3221225472;
    uint64_t v75 = (uint64_t)___coerceItemToType_block_invoke_3;
    v76 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52FFA30;
    v78 = &v86;
    v79 = &v80;
    v27 = v25;
    v77 = (void (*)(uint64_t))v27;
    id v28 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v26, v12, &v73);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v87[5] || !objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class())) {
    goto LABEL_24;
  }
  uint64_t v59 = 0;
  uint64_t v60 = (uint64_t)&v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__151;
  v63 = __Block_byref_object_dispose__151;
  v64 = 0;
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
  uint64_t v30 = objc_opt_class();
  uint64_t v66 = MEMORY[0x1E4F143A8];
  uint64_t v67 = 3221225472;
  uint64_t v68 = (uint64_t)___coerceItemToType_block_invoke_4;
  v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52FFA30;
  v71 = &v59;
  v72 = &v80;
  v31 = v29;
  v70 = (void (*)(uint64_t))v31;
  id v32 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v30, v12, &v66);
  dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v33 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(v60 + 40) encodingInvalidCharacters:0];
  id v34 = v87[5];
  v87[5] = (id)v33;

  _Block_object_dispose(&v59, 8);
  v35 = v64;
LABEL_23:

LABEL_24:
  if (!v87[5]
    && [UIPasteboardTypeListString containsObject:v11]
    && objc_msgSend(v10, "uikit_canInstantiateObjectOfClass:", objc_opt_class()))
  {
    dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
    uint64_t v40 = objc_opt_class();
    uint64_t v59 = MEMORY[0x1E4F143A8];
    uint64_t v60 = 3221225472;
    uint64_t v61 = (uint64_t)___coerceItemToType_block_invoke_5;
    v62 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52FFA30;
    v64 = &v86;
    v65 = &v80;
    v41 = v39;
    v63 = (void (*)(uint64_t))v41;
    id v42 = (id)objc_msgSend(v10, "uikit_loadObjectOfClass:context:completionBlock:", v40, v12, &v59);
    dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
  }
  _recordHangAssertionIfNecessaryForResponseMetadata((void *)v81[5]);
  id v43 = v87[5];

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  v44 = (void *)v54[5];
  v54[5] = (uint64_t)v43;

  if (!v54[5] && [v10 hasRepresentationConformingToType:*(void *)(a1 + 40)])
  {
    uint64_t v73 = 0;
    uint64_t v74 = (uint64_t)&v73;
    uint64_t v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__151;
    v77 = __Block_byref_object_dispose__151;
    v78 = 0;
    dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
    uint64_t v46 = *(void *)(a1 + 40);
    uint64_t v47 = *(void *)(a1 + 48);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke_2;
    v49[3] = &unk_1E52FF9E0;
    v51 = &v53;
    v52 = &v73;
    v48 = v45;
    v50 = v48;
    objc_msgSend(v10, "uikit_loadRepresentationAsType:context:completionBlock:", v46, v47, v49);
    dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

    _recordHangAssertionIfNecessaryForResponseMetadata(*(void **)(v74 + 40));
    _Block_object_dispose(&v73, 8);
  }
LABEL_31:

  if (v54[5]) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
  }
  _Block_object_dispose(&v53, 8);
}

void __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v20)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = v20;
    uint64_t v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v15 = [v9 readDataToEndOfFile];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

LABEL_6:
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  int v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v10;
  id v19 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__151;
  uint64_t v53 = __Block_byref_object_dispose__151;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__151;
  uint64_t v47 = __Block_byref_object_dispose__151;
  id v48 = 0;
  long long v4 = [*(id *)(a1 + 32) items];
  unint64_t v5 = [v4 count];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5 <= a2)
  {
    id v8 = [v6 name];
    uint64_t v12 = [*(id *)(a1 + 32) items];
    NSLog(&cfstr_AttemptingToRe_2.isa, v8, a2, [v12 count]);
  }
  else
  {
    unint64_t v7 = [v6 items];
    id v8 = [v7 objectAtIndexedSubscript:a2];

    if ([*(id *)(a1 + 40) isEqualToString:0x1ED154EA0])
    {
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 48);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_2;
      v39[3] = &unk_1E52FFA30;
      v41 = &v49;
      id v42 = &v43;
      uint64_t v12 = v9;
      uint64_t v40 = v12;
      id v13 = (id)objc_msgSend(v8, "uikit_loadObjectOfClass:context:completionBlock:", v10, v11, v39);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v14 = [v8 representationConformingToType:*(void *)(a1 + 40)];
      uint64_t v12 = v14;
      if (v14)
      {
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x2020000000;
        char v38 = 1;
        uint64_t v15 = (void *)MEMORY[0x1E4F442D8];
        uint64_t v16 = [v14 typeIdentifier];
        uint64_t v17 = [v15 _typeWithIdentifier:v16 allowUndeclared:1];

        if ([v17 conformsToType:*MEMORY[0x1E4F444A8]])
        {
          dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
          uint64_t v19 = *(void *)(a1 + 48);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_3;
          v30[3] = &unk_1E52FFA58;
          id v32 = &v49;
          uint64_t v33 = &v35;
          id v34 = &v43;
          id v20 = v18;
          v31 = v20;
          id v21 = (id)[v12 loadFileCopyWithContext:v19 completion:v30];
          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        }
        if (*((unsigned char *)v36 + 24))
        {
          dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
          uint64_t v23 = *(void *)(a1 + 48);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_4;
          v26[3] = &unk_1E52FFA80;
          id v28 = &v49;
          dispatch_semaphore_t v29 = &v43;
          id v24 = v22;
          v27 = v24;
          id v25 = (id)[v12 loadDataWithContext:v23 completion:v26];
          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
        }
        _Block_object_dispose(&v35, 8);
      }
    }
  }

  if (v50[5]) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
  }
  _recordHangAssertionIfNecessaryForResponseMetadata((void *)v44[5]);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_2(uint64_t a1, UIImage *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = UIImagePNGRepresentation(a2);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v19 = 0;
    int v7 = [v5 getResourceValue:&v19 forKey:*MEMORY[0x1E4F1C628] error:0];
    id v8 = v19;
    uint64_t v9 = v8;
    if (v7 && [v8 BOOLValue])
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v5 options:1 error:0];
      uint64_t v11 = [v10 serializedRepresentation];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:2 error:0];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v6;
  id v18 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __30___UIConcretePasteboard_items__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = v9;
    goto LABEL_18;
  }
  if (!v9 && v10)
  {
    id v9 = [v10 readDataToEndOfFile];
  }
  uint64_t v14 = *(void **)(a1 + 32);
  id v13 = v9;
  id v15 = v14;
  uint64_t v16 = v15;
  if (!v13) {
    goto LABEL_12;
  }
  if (!v15)
  {
    NSLog(&cfstr_SMustBeCalledW_3.isa, "_magicallyConvertDataToObject");
LABEL_12:
    id v18 = 0;
    goto LABEL_16;
  }
  if (![UIPasteboardTypeListImage containsObject:v15])
  {
    if (![UIPasteboardTypeListColor containsObject:v16])
    {
      if ([UIPasteboardTypeListURL containsObject:v16])
      {
        id v28 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:0];
        objc_opt_class();
        id v18 = 0;
        if (objc_opt_isKindOfClass())
        {
          if ((unint64_t)[v28 count] < 2)
          {
            id v18 = 0;
          }
          else
          {
            uint64_t v43 = v16;
            dispatch_semaphore_t v29 = [v28 objectAtIndex:1];
            int v30 = [v29 isEqualToString:&stru_1ED0E84C0];

            v31 = (void *)MEMORY[0x1E4F1CB10];
            if (v30)
            {
              uint64_t v32 = [v28 objectAtIndexedSubscript:0];
              uint64_t v33 = v31;
              id v34 = (void *)v32;
              id v18 = [v33 URLWithString:v32 encodingInvalidCharacters:0];
            }
            else
            {
              uint64_t v40 = [v28 objectAtIndexedSubscript:1];
              id v34 = [v31 URLWithString:v40 encodingInvalidCharacters:0];

              if (v34)
              {
                v41 = (void *)MEMORY[0x1E4F1CB10];
                id v42 = [v28 objectAtIndexedSubscript:0];
                id v18 = [v41 URLWithString:v42 relativeToURL:v34];
              }
              else
              {
                id v18 = 0;
              }
            }
            uint64_t v16 = v43;
          }
        }
      }
      else
      {
        v44 = v16;
        uint64_t v46 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v16 allowUndeclared:1];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        obj = UIPasteboardTypeListString;
        uint64_t v35 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v48;
          while (2)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v48 != v37) {
                objc_enumerationMutation(obj);
              }
              dispatch_semaphore_t v39 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:*(void *)(*((void *)&v47 + 1) + 8 * i) allowUndeclared:1];
              if ([v46 conformsToType:v39])
              {
                id v18 = (id)[[NSString alloc] initWithData:v13 usedEncoding:0];

                goto LABEL_34;
              }
            }
            uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v51 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }

        id v18 = v13;
LABEL_34:

        uint64_t v16 = v44;
      }
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if ([v16 isEqual:0x1ED154EA0])
  {
LABEL_14:
    uint64_t v19 = objc_opt_class();
    uint64_t v17 = _UISecurelyDecodePasteboardDataToObject(v13, v19);
    goto LABEL_15;
  }
  uint64_t v17 = +[UIImage imageWithData:v13];
LABEL_15:
  id v18 = (id)v17;
LABEL_16:

  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v18;

  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v24 = *(void *)(v22 + 40);
  uint64_t v23 = (id *)(v22 + 40);
  if (!v24) {
    objc_storeStrong(v23, v9);
  }
LABEL_18:
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v11;
  id v27 = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __42___UIConcretePasteboard_setItems_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0, 0);
}

void __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0, 0);
}

uint64_t __34___UIConcretePasteboard_addItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0, 0);
}

uint64_t __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  long long v4 = (objc_class *)MEMORY[0x1E4F881E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithURL:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_2;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 40);
  (*((void (**)(id, void, void *, void, void, void *))v5 + 2))(v5, 0, v6, 0, 0, v8);

  return 0;
}

void __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

uint64_t __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0;
}

void __61___UIConcretePasteboard__setItemsAndSaveFromObjects_ofClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    uint64_t v7 = _NSFullMethodName();
    id v8 = NSStringFromClass(*(Class *)(a1 + 48));
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v5 raise:v6, @"%@: Item %ld is not an object of type %@ [%@]", v7, a3, v8, v10 format];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v12];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 present]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_3;
  v5[3] = &unk_1E52FFB98;
  id v6 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) addPatternDetections:v4];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 present]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 present])
  {
    id v6 = [v5 value];

    if (v6)
    {
      uint64_t v7 = [v5 value];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v8];
    }
  }
}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_3;
  v5[3] = &unk_1E52FFB98;
  id v6 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) addPatternDetections:v4];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 present])
  {
    id v6 = [v5 value];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PBIndexOutOfRangeError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 present]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _pasteboardCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5;
    block[3] = &unk_1E52DB330;
    id v8 = &v18;
    id v18 = a1[6];
    id v9 = &v17;
    id v17 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6;
    v14[3] = &unk_1E52FFB98;
    id v8 = &v15;
    id v15 = a1[4];
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
    [a1[5] addPatternDetections:v5];
    id v10 = _pasteboardCompletionQueue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7;
    v11[3] = &unk_1E52DB330;
    id v9 = &v13;
    id v13 = a1[6];
    id v12 = a1[4];
    dispatch_async(v10, v11);

    id v7 = v12;
  }
}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 present]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.uikit.pasteboard-detection-pattern.dd.link";
  v2[1] = @"com.apple.uikit.pasteboard-detection-pattern.dd.phone";
  v3[0] = &__block_literal_global_93_1;
  v3[1] = &__block_literal_global_97_1;
  v2[2] = @"com.apple.uikit.pasteboard-detection-pattern.dd.email";
  v2[3] = @"com.apple.uikit.pasteboard-detection-pattern.dd.address";
  v3[2] = &__block_literal_global_101_1;
  v3[3] = &__block_literal_global_105_0;
  v2[4] = @"com.apple.uikit.pasteboard-detection-pattern.dd.event";
  v2[5] = @"com.apple.uikit.pasteboard-detection-pattern.dd.shipment";
  v3[4] = &__block_literal_global_109;
  v3[5] = &__block_literal_global_113_6;
  v2[6] = @"com.apple.uikit.pasteboard-detection-pattern.dd.flight";
  v2[7] = @"com.apple.uikit.pasteboard-detection-pattern.dd.money";
  v3[6] = &__block_literal_global_117_1;
  v3[7] = &__block_literal_global_121_1;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  uint64_t v1 = (void *)_MergedGlobals_5_12;
  _MergedGlobals_5_12 = v0;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F25290];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F252A0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F25280];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F252A8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F25270];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F252B0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F25288];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

id __53___UIConcretePasteboard_clientValueForValue_pattern___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F25298];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDDScannerResult:v3];

  return v4;
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PBIndexOutOfRangeError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 present])
  {
    id v6 = [v5 value];

    if (v6)
    {
      id v7 = *(void **)(a1 + 48);
      id v8 = [v5 value];
      id v9 = [v7 clientValueForValue:v8 pattern:v10];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v10];
    }
  }
}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _pasteboardCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5;
    block[3] = &unk_1E52DB330;
    id v8 = &v20;
    id v20 = *(id *)(a1 + 48);
    id v9 = &v19;
    id v19 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6;
    v16[3] = &unk_1E52FFD60;
    id v8 = (id *)v17;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    v17[0] = v10;
    v17[1] = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v16];
    [*(id *)(a1 + 40) addPatternDetections:v5];
    id v12 = _pasteboardCompletionQueue();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7;
    v13[3] = &unk_1E52DB330;
    id v9 = &v15;
    id v15 = *(id *)(a1 + 48);
    uint64_t v14 = *(id *)(a1 + 32);
    dispatch_async(v12, v13);

    id v7 = v14;
  }
}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 present])
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [v5 value];
    id v8 = [v6 clientValueForValue:v7 pattern:v9];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

uint64_t __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = a2;
    id v8 = [v5 arrayWithObjects:v10 count:1];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void, id))(v3 + 16);
    id v7 = a3;
    v9(v3, 0, v7);
    id v8 = 0;
  }
}

void __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v16) {
    id v6 = v16;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 8 * *(void *)(a1 + 56)), v6);
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1uLL);
  uint64_t v9 = *(void *)(a1 + 64);
  if (add == v9 - 1)
  {
    if (v9)
    {
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = *(id *)(*(void *)(a1 + 48) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }

        if ((unint64_t)++v10 >= *(void *)(a1 + 64)) {
          goto LABEL_9;
        }
      }
      (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v11);
    }
    else
    {
LABEL_9:
      uint64_t v12 = *(void *)(a1 + 32);
      id v11 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:*(void *)(a1 + 48) count:*(void *)(a1 + 64)];
      (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v11, 0);
    }

    if (*(void *)(a1 + 64))
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = *(void *)(a1 + 48);
        id v15 = *(void **)(v14 + 8 * v13);
        *(void *)(v14 + 8 * v13) = 0;

        ++v13;
      }
      while (v13 < *(void *)(a1 + 64));
    }
    free(*(void **)(a1 + 48));
  }
}

uint64_t __79___UIConcretePasteboard_detectPatternsForPatterns_inItemSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_UIConcretePasteboard _detectPatternsForPatterns:*(void *)(a1 + 32) atIndex:a2 itemCollection:*(void *)(a1 + 40) completionHandler:a3];
}

uint64_t __77___UIConcretePasteboard_detectValuesForPatterns_inItemSet_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_UIConcretePasteboard _detectValuesForPatterns:*(void *)(a1 + 32) atIndex:a2 itemCollection:*(void *)(a1 + 40) completionHandler:a3];
}

void __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = _serverConnection();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v15 = 0;
  id v5 = [v2 requestSecurePasteAuthenticationMessageWithContext:v3 forClientVersionedPID:v4 error:&v15];
  id v6 = v15;

  id v7 = _pasteboardCompletionQueue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E52E3968;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end