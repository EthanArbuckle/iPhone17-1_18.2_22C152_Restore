@interface PLAllowedForCameraPreviewSortDescriptors
@end

@implementation PLAllowedForCameraPreviewSortDescriptors

void ___PLAllowedForCameraPreviewSortDescriptors_block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = +[PLFetchingAlbum sortDescriptorsForAlbumKind:1613];
  v1 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = v0;
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
        v8 = objc_msgSend(v7, "key", (void)v13);

        if (v8)
        {
          v9 = (void *)MEMORY[0x1E4F29008];
          v10 = [v7 key];
          v11 = objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, objc_msgSend(v7, "ascending") ^ 1);
          [v1 addObject:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  v12 = (void *)_PLAllowedForCameraPreviewSortDescriptors_s_descriptors;
  _PLAllowedForCameraPreviewSortDescriptors_s_descriptors = (uint64_t)v1;
}

@end