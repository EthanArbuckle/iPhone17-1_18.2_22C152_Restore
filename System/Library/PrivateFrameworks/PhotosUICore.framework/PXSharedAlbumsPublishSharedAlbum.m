@interface PXSharedAlbumsPublishSharedAlbum
@end

@implementation PXSharedAlbumsPublishSharedAlbum

void ___PXSharedAlbumsPublishSharedAlbum_block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F38FE8] changeRequestForCloudSharedAlbum:*(void *)(a1 + 32)];
  [v1 publish];
}

void ___PXSharedAlbumsPublishSharedAlbum_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  *(id *)(a1 + 40);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t ___PXSharedAlbumsPublishSharedAlbum_block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = PLSharedAlbumsGetLog();
  id v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v5 = [*(id *)(a1 + 32) localizedTitle];
    int v12 = 138412290;
    v13 = v5;
    v6 = "Successfully published shared album '%@'";
    v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v5 = [*(id *)(a1 + 32) localizedTitle];
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138412546;
    v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    v6 = "Failed to publish shared album '%@'. Error = %@";
    v7 = v4;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 22;
  }
  _os_log_impl(&dword_1A9AE7000, v7, v8, v6, (uint8_t *)&v12, v9);

LABEL_7:
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

@end