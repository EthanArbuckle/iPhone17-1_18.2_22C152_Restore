@interface LastSeenDateValueAccessor
@end

@implementation LastSeenDateValueAccessor

void ___LastSeenDateValueAccessor_block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:@"PXSharedAlbumsActivityLastSeenDateKey" defaultValueFuture:&__block_literal_global_12_160219 valueFilter:&__block_literal_global_16_160220 changeHandler:&__block_literal_global_20_160221];
  v2 = (void *)_LastSeenDateValueAccessor_lastSeenDateAccessor;
  _LastSeenDateValueAccessor_lastSeenDateAccessor = v1;
}

void ___LastSeenDateValueAccessor_block_invoke_2_17(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  v4 = [v2 defaultCenter];
  v6 = @"PXSharedAlbumsActivityLastSeenDateKey";
  v7[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PXSharedAlbumsActivityLastSeenDateChangeNotification" object:0 userInfo:v5];
}

BOOL ___LastSeenDateValueAccessor_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = (PFOSVariantHasInternalUI() & 1) != 0 || [v4 compare:v5] == -1;

  return v6;
}

id ___LastSeenDateValueAccessor_block_invoke_2()
{
  v0 = PLUIGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityLastSeen] Using default 'last seen' date (now)", v3, 2u);
  }

  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  return v1;
}

@end