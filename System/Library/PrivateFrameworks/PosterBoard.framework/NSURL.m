@interface NSURL
@end

@implementation NSURL

uint64_t __47__NSURL_PBFAdditions__pbf_isGallerySnapshotURL__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = objc_msgSend(v2, "pbf_snapshotDefinitionForPosterSnapshotURL");
  uint64_t v5 = [v4 isEqual:v3];

  return v5;
}

uint64_t __53__NSURL_PBFAdditions__pbf_isConfigurationSnapshotURL__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = objc_msgSend(v2, "pbf_snapshotDefinitionForPosterSnapshotURL");
  uint64_t v5 = [v4 isEqual:v3];

  return v5;
}

void __76__NSURL_PBFAdditions__pbf_URLIsReachableAndConformsToAttributeValues_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 objectForKeyedSubscript:a2];
  LOBYTE(a2) = BSEqualObjects();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 ^ 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(unsigned char *)(a1 + 40))
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v4 addObject:v8];
    id v3 = v8;
  }
}

uint64_t __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t __65__NSURL_PBFAdditions__pbf_recursivelyUpdateFileAttributes_error___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

void __74__NSURL_PBFAdditions__pbf_URLIsReachableAndConformToResourceValues_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id obj = 0;
  id v12 = 0;
  id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v9 = [*(id *)(a1 + 32) getResourceValue:&v12 forKey:a2 error:&obj];
  id v10 = v12;
  objc_storeStrong(v8, obj);
  if (v9) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = BSEqualObjects() ^ 1;
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(unsigned char *)(a1 + 40))
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v4 addObject:v8];
    id v3 = v8;
  }
}

uint64_t __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t __65__NSURL_PBFAdditions__pbf_recursivelyUpdateResourceValues_error___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

void __51__NSURL_PBFAdditions__pbf_archivedDataStoreBaseURL__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:0];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"ArchivedDataStores" isDirectory:1];
  id v3 = (void *)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL;
  pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL = v2;

  uint64_t v4 = *MEMORY[0x1E4F1C590];
  v9[0] = *MEMORY[0x1E4F1C630];
  v9[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1C598];
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (([(id)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 createDirectoryAtURL:pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL withIntermediateDirectories:1 attributes:MEMORY[0x1E4F1CC08] error:0];

    if (v8) {
      objc_msgSend((id)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL, "pbf_updateResourceValues:error:", v6, 0);
    }
  }
}

@end