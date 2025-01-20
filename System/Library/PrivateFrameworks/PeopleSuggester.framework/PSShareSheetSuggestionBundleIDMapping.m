@interface PSShareSheetSuggestionBundleIDMapping
@end

@implementation PSShareSheetSuggestionBundleIDMapping

uint64_t ___PSShareSheetSuggestionBundleIDMapping_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  v1 = objc_opt_new();
  uint64_t v2 = [v0 initWithGuardedData:v1];
  v3 = (void *)_PSShareSheetSuggestionBundleIDMapping_lock;
  _PSShareSheetSuggestionBundleIDMapping_lock = v2;

  _PSShareSheetSuggestionBundleIDMapping_queue = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"_PSShareSheetSuggestionBundleIDMapping expiration" qosClass:9];

  return MEMORY[0x1F41817F8]();
}

void ___PSShareSheetSuggestionBundleIDMapping_block_invoke_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
  }
  else
  {
    uint64_t v6 = _uncachedPSShareSheetSuggestionBundleIDMapping(*(unsigned char *)(a1 + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v3 setObject:v9 forKeyedSubscript:v10];

    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___PSShareSheetSuggestionBundleIDMapping_block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v13 = *(unsigned char *)(a1 + 40);
    dispatch_after(v11, (dispatch_queue_t)_PSShareSheetSuggestionBundleIDMapping_queue, block);
  }
}

uint64_t ___PSShareSheetSuggestionBundleIDMapping_block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___PSShareSheetSuggestionBundleIDMapping_block_invoke_3;
  v2[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  char v3 = *(unsigned char *)(a1 + 32);
  return [(id)_PSShareSheetSuggestionBundleIDMapping_lock runWithLockAcquired:v2];
}

void ___PSShareSheetSuggestionBundleIDMapping_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setObject:0 forKeyedSubscript:v5];
}

@end