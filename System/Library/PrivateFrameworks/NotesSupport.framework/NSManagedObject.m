@interface NSManagedObject
@end

@implementation NSManagedObject

BOOL __57__NSManagedObject_IC__ic_containsFaultingManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 faultingState] != 0;

  return v3;
}

uint64_t __56__NSManagedObject_IC__ic_permanentObjectIDsFromObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectID];
  uint64_t v3 = [v2 isTemporaryID];

  return v3;
}

void __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = objc_msgSend(WeakRetained, "ic_permanentObjectID");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = objc_msgSend(WeakRetained, "ic_permanentObjectID");

  if (v3)
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke_2;
    v9 = &unk_2640CD448;
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    dispatch_async(MEMORY[0x263EF83A0], &v6);
  }
  v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6, v7, v8, v9);
  id v5 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v4 removeObserver:v5];
}

void __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

@end