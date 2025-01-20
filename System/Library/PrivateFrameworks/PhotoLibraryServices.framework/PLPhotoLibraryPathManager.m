@interface PLPhotoLibraryPathManager
@end

@implementation PLPhotoLibraryPathManager

uint64_t __89__PLPhotoLibraryPathManager_conveniences__cleanupOutboundSharingFilesWithExpiryInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "cleanupOutboundSharingFilesWithExpiryTimeout: Failed to identify url: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

@end