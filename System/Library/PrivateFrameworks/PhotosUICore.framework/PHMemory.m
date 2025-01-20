@interface PHMemory
@end

@implementation PHMemory

void __52__PHMemory_PhotosUICore__px_blockableFeatureActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    v7 = PLMemoriesGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Skip duplicate blockable feature: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v8 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
    v9 = [[PXBlockableMemoryFeatureActionInfo alloc] initWithActionType:v6 localizedTitle:v8];
    [*(id *)(a1 + 40) addObject:v9];
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __74__PHMemory_PhotosUICore__px_mutatedPhotosGraphPropertiesWithRejectReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = NSNumber;
    id v4 = a2;
    id v5 = [v3 numberWithUnsignedInteger:v2];
    objc_msgSend(v4, "setObject:forKeyedSubscript:");
  }
  else
  {
    id v5 = a2;
    [v5 removeObjectForKey:@"PHMemoryGraphPropertyRejectReasonKey"];
  }
}

@end