@interface PSInteractionAndContactMonitor
@end

@implementation PSInteractionAndContactMonitor

void __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "_PSInteractionAndContactMonitor: Contact store changed, processing changes", buf, 2u);
    }

    v3 = WeakRetained[9];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_7;
    block[3] = &unk_1E5ADE940;
    v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyWhenContactStoreChanged];
}

uint64_t __73___PSInteractionAndContactMonitor_initWithInteractionStore_contactStore___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69___PSInteractionAndContactMonitor_fetchAllContactIdsFromContactStore__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = (void *)MEMORY[0x1A6243860]();
  v4 = *(__CFSet **)(*(void *)(a1 + 32) + 24);
  v5 = [v8 identifier];
  CFSetAddValue(v4, (const void *)objc_msgSend(v5, "_ps_pointerSizedHash"));

  v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v7 = [v8 identifier];
  objc_msgSend(v6, "_ps_appendObject:truncatingToCount:", v7, 32);
}

uint64_t __73___PSInteractionAndContactMonitor_fetchChangedContactIdsFromContactStore__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = CFSetContainsValue(*(CFSetRef *)(*(void *)(a1 + 32) + 56), (const void *)objc_msgSend(a2, "_ps_pointerSizedHash"));
  if (result)
  {
    v6 = *(void **)(a1 + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

void __66___PSInteractionAndContactMonitor_enumerateContactStoreWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)MEMORY[0x1A6243860]();
  v4 = (void *)MEMORY[0x1A6243860]();
  v5 = [v6 identifier];
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    if ((unint64_t)[*(id *)(*(void *)(a1 + 40) + 16) count] <= 0x1F) {
      [*(id *)(*(void *)(a1 + 40) + 16) addObject:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end