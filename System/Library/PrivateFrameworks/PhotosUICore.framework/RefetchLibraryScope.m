@interface RefetchLibraryScope
@end

@implementation RefetchLibraryScope

void ___RefetchLibraryScope_block_invoke_654(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = (void *)MEMORY[0x1E4F39110];
  v21[0] = *(void *)(a1 + 40);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v6 = [v4 fetchLibraryScopesWithLocalIdentifiers:v5 options:v3];

  v7 = [v6 firstObject];
  v8 = PLSharedLibraryGetLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v7 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Did refetch library scope with identifier: %{public}@", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Failed to refetch library scope with identifier: %{public}@", buf, 0xCu);
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    v9 = [*(id *)(a1 + 32) localIdentifier];
    v11 = objc_msgSend(v13, "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, 0, @"Failed to refetch library scope with identifier: %@", v9);
  }

  v14 = *(void **)(a1 + 48);
  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___RefetchLibraryScope_block_invoke_658;
    block[3] = &unk_1E5DD0E78;
    id v18 = v14;
    id v16 = v7;
    id v17 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t ___RefetchLibraryScope_block_invoke_658(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___RefetchLibraryScope_block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v1 = dispatch_queue_create("PXSharedLibraryPhotoKitUtilitiesRefetchQueue", v0);
  v2 = (void *)_RefetchLibraryScope__refetchQueue;
  _RefetchLibraryScope__refetchQueue = (uint64_t)v1;
}

@end