@interface MPMediaItem
@end

@implementation MPMediaItem

id __36__MPMediaItem_VideosUI__vui_credits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "vui_stringForKey:", @"name", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

uint64_t __60__MPMediaItem_VideosUI__vui_isLocalCheckingSidebandLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) downloadState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 2;
  return result;
}

uint64_t __64__MPMediaItem_VideosUI__vui_isDownloadedOrDownloadingOrEnqueued__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) downloadState];
  BOOL v4 = result == 2 || (result & 0xFFFFFFFFFFFFFFFDLL) == 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

void __59__MPMediaItem_VideosUI___vui_imageIdentifierWithImageType___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F313F0], *MEMORY[0x1E4F31430], 0);
  id v2 = (void *)_vui_imageIdentifierWithImageType____propertiesToFetch;
  _vui_imageIdentifierWithImageType____propertiesToFetch = v1;
}

@end