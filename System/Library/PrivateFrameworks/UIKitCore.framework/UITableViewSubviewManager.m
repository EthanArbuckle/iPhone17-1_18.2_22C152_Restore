@interface UITableViewSubviewManager
@end

@implementation UITableViewSubviewManager

uint64_t __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    return [v7 setObject:a3 forKey:a2];
  }
  return result;
}

void __72___UITableViewSubviewManager_rebasePrefetchedCellIndexPathsWithMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = (id)v6;
  if (v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:a3 forKey:v6];
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKey:a3];
  }
  else
  {
    [*(id *)(a1 + 40) _reusePrefetchedCell:a3 withIndexPath:a2];
  }
}

uint64_t __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:a2];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:a3];
  uint64_t v6 = *(void **)(a1 + 40);
  return [v6 _reusePrefetchedCell:a3 withIndexPath:a2];
}

uint64_t __54___UITableViewSubviewManager_removeAllPrefetchedCells__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _reusePrefetchedCell:a3 withIndexPath:a2];
}

@end