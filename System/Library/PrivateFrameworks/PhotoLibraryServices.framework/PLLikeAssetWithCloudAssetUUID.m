@interface PLLikeAssetWithCloudAssetUUID
@end

@implementation PLLikeAssetWithCloudAssetUUID

void ___PLLikeAssetWithCloudAssetUUID_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) assetWithUUID:*(void *)(a1 + 40)];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  id v8 = 0;
  BOOL v4 = +[PLPhotoSharingHelper canSetUserCloudSharedLiked:1 forAssets:v3 error:&v8];
  id v5 = v8;

  if (v4)
  {
    [v2 setUserCloudSharedLiked:1];
  }
  else
  {
    v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Cannot like asset with UUID: \"%@\", Error: %@", buf, 0x16u);
    }
  }
}

@end