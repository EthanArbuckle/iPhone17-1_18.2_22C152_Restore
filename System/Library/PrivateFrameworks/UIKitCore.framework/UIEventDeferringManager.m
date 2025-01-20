@interface UIEventDeferringManager
@end

@implementation UIEventDeferringManager

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v7, (void)v13);
        v10 = [v9 description];
        v11 = [v7 description];
        id v12 = (id)[v8 appendObject:v10 withName:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __100___UIEventDeferringManager__currentLocalRecordsMatchingEnvironment_forcePreviousHardwareIdentifier___block_invoke(uint64_t *a1)
{
  uint64_t v2 = _queue_compatibilityRecord(a1[4], a1[5]);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __85___UIEventDeferringManager__startObservingContextForLocalTargetWindow_inEnvironment___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &__systemShellBehaviorDelegate_block_invoke_25___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v5 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)a1[5];
      uint64_t v7 = a1[6];
      uint64_t v8 = a1[4];
      v9 = v5;
      int v10 = 134349826;
      uint64_t v11 = v8;
      __int16 v12 = 2082;
      uint64_t v13 = v7;
      __int16 v14 = 2050;
      long long v15 = v6;
      __int16 v16 = 1026;
      int v17 = [v6 _contextId];
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] Began tracking context for local target window: %{public}p; contextId: 0x%{public}X",
        (uint8_t *)&v10,
        0x26u);
    }
  }
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:a1[4] selector:sel__localTargetWindowDidAttachContext_ name:_UIWindowDidAttachContextNotification object:a1[5]];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:a1[4] selector:sel__localTargetWindowDidDetachContext_ name:_UIWindowDidDetachContextNotification object:a1[5]];
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_7(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) countForObject:v6];
        uint64_t v8 = *(void **)(a1 + 40);
        v9 = objc_msgSend(NSString, "stringWithFormat:", @"%p count", objc_msgSend(v6, "pointerValue"));
        id v10 = (id)[v8 appendUnsignedInteger:v7 withName:v9];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

void __83___UIEventDeferringManager__stopObservingContextForLocalTargetWindowInEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 pointerValue];
  if (v3)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventDeferring", &__systemShellBehaviorDelegate_block_invoke_26___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        id v10 = v7;
        int v11 = 134349826;
        uint64_t v12 = v8;
        __int16 v13 = 2082;
        uint64_t v14 = v9;
        __int16 v15 = 2050;
        __int16 v16 = v3;
        __int16 v17 = 1026;
        int v18 = [v3 _contextId];
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] End tracking context for local target window: %{public}p; contextId: 0x%{public}X",
          (uint8_t *)&v11,
          0x26u);
      }
    }
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:*(void *)(a1 + 32) name:_UIWindowDidAttachContextNotification object:v3];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:*(void *)(a1 + 32) name:_UIWindowDidDetachContextNotification object:v3];
  }
}

id __42___UIEventDeferringManager_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained descriptionBuilderWithMultilinePrefix:&stru_1ED0E84C0];
  uint64_t v3 = [v2 build];

  return v3;
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:](*(unsigned __int8 **)(a1 + 32), 1);
  if (v2) {
    [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v2];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
  }
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__35;
  __int16 v16 = __Block_byref_object_dispose__35;
  id v17 = 0;
  uint64_t v4 = _eventDeferringCompatibilityQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  block[3] = &unk_1E52E3210;
  int v11 = &v12;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, block);

  v6 = *(void **)(a1 + 40);
  uint64_t v7 = v13[5];
  uint64_t v8 = [NSString stringWithFormat:@"display: %@", v5];
  [v6 appendDictionarySection:v7 withName:v8 skipIfEmpty:0];

  _Block_object_dispose(&v12, 8);
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) windowHostingScene];
  id v4 = [v3 succinctDescription];
  id v5 = (id)[v2 appendObject:v4 withName:@"scene"];

  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 104) withName:@"behavior"];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"localDeferringRecords" skipIfEmpty:0];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 activeMultilinePrefix];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v29[3] = &unk_1E52D9F98;
  int8x16_t v19 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v19.i64[0];
  int8x16_t v30 = vextq_s8(v19, v19, 8uLL);
  [v7 appendBodySectionWithName:@"localCompatibilityDeferringRecords" multilinePrefix:v8 block:v29];

  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 24) withName:@"remoteDeferringRecordStacks" skipIfEmpty:0];
  id v10 = *(void **)(a1 + 32);
  int v11 = [v10 activeMultilinePrefix];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v27[3] = &unk_1E52D9F98;
  int8x16_t v20 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v20.i64[0];
  int8x16_t v28 = vextq_s8(v20, v20, 8uLL);
  [v10 appendBodySectionWithName:@"targetWindowProvidersByEnvironment" multilinePrefix:v11 block:v27];

  __int16 v13 = *(void **)(a1 + 32);
  uint64_t v14 = [v13 activeMultilinePrefix];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_6;
  v25[3] = &unk_1E52D9F98;
  int8x16_t v21 = *(int8x16_t *)(a1 + 32);
  id v15 = (id)v21.i64[0];
  int8x16_t v26 = vextq_s8(v21, v21, 8uLL);
  [v13 appendBodySectionWithName:@"trackedLocalTargetWindowPointersByEnvironment" multilinePrefix:v14 block:v25];

  __int16 v16 = *(void **)(a1 + 32);
  id v17 = [v16 activeMultilinePrefix];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_7;
  v23[3] = &unk_1E52D9F98;
  int8x16_t v22 = *(int8x16_t *)(a1 + 32);
  id v18 = (id)v22.i64[0];
  int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
  [v16 appendBodySectionWithName:@"localTargetWindowPointersUnderObservation" multilinePrefix:v17 block:v23];
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKey:", v7, (void)v13);
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = [v8 pointerValue];
        int v11 = [v7 description];
        id v12 = (id)[v9 appendPointer:v10 withName:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = _queue_compatibilityRecordsForDisplay(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __42___UIEventDeferringManager_initWithScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v2 = WeakRetained + 11;
    id v3 = objc_loadWeakRetained(WeakRetained + 11);
    if ([v3 _allowsEventUIWindowRouting]) {
      id v4 = objc_loadWeakRetained(v2);
    }
    else {
      id v4 = 0;
    }

    +[_UIEventDeferringManager targetOfEventDeferringEnvironmentsDidUpdateForScene:]((uint64_t)_UIEventDeferringManager, v4);
    id WeakRetained = v5;
  }
}

BOOL __83___UIEventDeferringManager__remoteRecordInStackMatchingEnvironment_deferringToken___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (a2) {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  }
  else {
    id WeakRetained = 0;
  }
  BOOL v6 = WeakRetained == *(id *)(a1 + 32);

  *a3 = v6;
  return v6;
}

uint64_t __65___UIEventDeferringManager__sortRemoteRecordStackForEnvironment___block_invoke(uint64_t a1, id *a2, id *a3)
{
  BOOL v6 = -[_UIEventDeferringManager internalBehavior](*(id **)(a1 + 32));
  if (a2 && (id WeakRetained = (id *)objc_loadWeakRetained(a2 + 4), (a2 = WeakRetained) != 0))
  {
    id v8 = WeakRetained[6];
    if (!a3)
    {
LABEL_8:
      id v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = 0;
    if (!a3) {
      goto LABEL_8;
    }
  }
  id v9 = (id *)objc_loadWeakRetained(a3 + 4);
  a3 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  id v10 = v9[6];
LABEL_6:
  uint64_t v11 = [v6 compareRemoteRuleOwningElement:v8 toElement:v10 inEnvironment:*(void *)(a1 + 40)];

  return v11;
}

BOOL __83___UIEventDeferringManager__isRemoteRuleOwningElement_visibleForLocalTargetWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2 || *(void *)(a1 + 40) == a2;
}

id __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) descriptionBuilderWithMultilinePrefix:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_2;
  v11[3] = &unk_1E52E3148;
  id v5 = v4;
  id v12 = v5;
  uint64_t v13 = a2;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = v6;
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 40);
  long long v15 = v7;
  id v8 = (id)[v5 modifyBody:v11];
  id v9 = v5;

  return v9;
}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [v2 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_3;
  v7[3] = &unk_1E52E3120;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = v5;
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v10 = v6;
  [v2 appendBodySectionWithName:v3 multilinePrefix:v4 block:v7];
}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(uint64_t **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  for (uint64_t i = objc_opt_new(); v4; --v4)
  {
    uint64_t v6 = *v3++;
    [i addObject:_NSStringFromUIDeferringAction[v6]];
  }
  [v2 appendArraySection:i withName:@"actions" skipIfEmpty:0];

  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 40) withName:@"deferringToken"];
  id v8 = *(void **)(a1 + 32);
  long long v9 = [v8 activeMultilinePrefix];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_4;
  long long v15 = &unk_1E52D9F98;
  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = *(id *)(a1 + 32);
  [v8 appendBodySectionWithName:@"environments" multilinePrefix:v9 block:&v12];

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(void *)(a1 + 56), @"target", v12, v13, v14, v15, v16);
  id v11 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 64) withName:@"reason"];
}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        long long v9 = objc_msgSend(v7, "description", (void)v11);
        id v10 = (id)[v8 appendObject:v7 withName:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __119___UIEventDeferringManager__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason___block_invoke(uint64_t *a1)
{
  uint64_t v2 = _queue_compatibilityRecord(a1[4], a1[5]);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

BOOL __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = 0;
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  if (!WeakRetained)
  {
LABEL_6:
    uint64_t v4 = 0;
    goto LABEL_4;
  }
  uint64_t v4 = WeakRetained[6];
LABEL_4:
  BOOL v5 = v4 == *(void *)(a1 + 32);

  return v5;
}

void __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke_516(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIEventDeferringManager endEventDeferringForToken:withReason:]((uint64_t)WeakRetained, a2, a3);
}

void __103___UIEventDeferringManager__removeEventDeferringRecordsForAllEnvironmentsWithOwningElement_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIEventDeferringManager endEventDeferringForToken:withReason:]((uint64_t)WeakRetained, a2, a3);
}

void __104___UIEventDeferringManager_beginLocalEventDeferringInEnvironments_forOwningInterfaceElement_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIEventDeferringManager endEventDeferringForToken:withReason:]((uint64_t)WeakRetained, a2, a3);
}

void __114___UIEventDeferringManager_beginRemoteEventDeferringInEnvironments_forOwningInterfaceElement_toTarget_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIEventDeferringManager endEventDeferringForToken:withReason:]((uint64_t)WeakRetained, a2, a3);
}

void __116___UIEventDeferringManager_setNeedsRemoteEventDeferringRuleComparisonInEnvironments_forBehaviorDelegate_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  -[_UIEventDeferringManager endEventDeferringForToken:withReason:](*(void *)(a1 + 32), a2, a3);
  objc_destroyWeak(&location);
}

uint64_t __75___UIEventDeferringManager_bufferKeyboardFocusEnvironmentEventsWithReason___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 40) + 72), 0xFFFFFFFFFFFFFFFFLL);
  return result;
}

@end