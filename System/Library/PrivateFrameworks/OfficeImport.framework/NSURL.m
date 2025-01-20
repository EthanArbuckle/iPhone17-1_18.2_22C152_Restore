@interface NSURL
@end

@implementation NSURL

uint64_t __87__NSURL_TSUAdditions__tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

void __42__NSURL_TSUAdditions__tsu_fileSize_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __47__NSURL_TSUAdditions___isShareRole_role_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __45__NSURL_TSUAdditions__tsu_displayName_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFF7D8];
  uint64_t v3 = *MEMORY[0x263EFF7E0];
  v14[0] = *MEMORY[0x263EFF7D8];
  v14[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFF7B0];
  v14[2] = *MEMORY[0x263EFF7B0];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  objc_msgSend(*(id *)(a1 + 32), "tsu_removeCachedResourceValueForKeys:", v5);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  v8 = [v6 resourceValuesForKeys:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v9 = [v8 objectForKeyedSubscript:v2];
    v10 = [v8 objectForKeyedSubscript:v3];
    v11 = [v8 objectForKeyedSubscript:v4];
    int v12 = [v9 BOOLValue];
    if (v12)
    {
      if ([v10 BOOLValue]) {
        LOBYTE(v12) = 0;
      }
      else {
        LOBYTE(v12) = [(id)*MEMORY[0x263EFF7A0] isEqualToString:v11];
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;
  }
  else if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_10);
  }
}

void __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __48__NSURL_TSUAdditions__tsu_shareOwnerName_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __45__NSURL_TSUAdditions__tsu_fileSystemTypeName__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __44__NSURL_TSUAdditions__tsu_isOnSameVolumeAs___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __44__NSURL_TSUAdditions__tsu_isOnSameVolumeAs___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_2;
  v8[3] = &unk_264D60EA0;
  uint64_t v4 = a1[6];
  uint64_t v6 = a1[4];
  v5 = (void *)a1[5];
  id v10 = v3;
  uint64_t v11 = v4;
  id v9 = v5;
  id v7 = v3;
  +[TSUFileProviderUtilities bookmarkableStringFromDocumentURL:v6 completion:v8];
}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v9 && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_26);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __36__NSURL_TSUAdditions__tsu_isInTrash__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

@end