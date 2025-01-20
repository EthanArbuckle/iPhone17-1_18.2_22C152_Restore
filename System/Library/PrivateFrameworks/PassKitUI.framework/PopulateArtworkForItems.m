@interface PopulateArtworkForItems
@end

@implementation PopulateArtworkForItems

void ___PopulateArtworkForItems_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F290E0] sharedSession];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___PopulateArtworkForItems_block_invoke_2;
  v20[3] = &unk_1E59E0040;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v21 = v7;
  uint64_t v22 = v11;
  id v23 = v8;
  id v24 = v9;
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  v16 = [v10 dataTaskWithURL:v12 completionHandler:v20];

  [v16 resume];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___PopulateArtworkForItems_block_invoke_172;
  v18[3] = &unk_1E59CA7D0;
  id v19 = v16;
  id v17 = v16;
  [v15 addCancelAction:v18];
}

void ___PopulateArtworkForItems_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v7 || v9 || ([*(id *)(a1 + 32) isCanceled] & 1) != 0)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 40) description];
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Failed to download artwork for %@ with error: %@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  if ((unint64_t)[*(id *)(a1 + 40) type] <= 2)
  {
    uint64_t v11 = [*(id *)(a1 + 40) musicItem];
    [v11 setArtwork:v7];
LABEL_8:
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t ___PopulateArtworkForItems_block_invoke_172(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t ___PopulateArtworkForItems_block_invoke_2_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end