@interface PHMemoryChangeRequest
@end

@implementation PHMemoryChangeRequest

id __115__PHMemoryChangeRequest_PhotosUICore__px_creationRequestForAssetCollection_displayTitleInfo_people_ignoreCuration___block_invoke(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1[4] options:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

@end