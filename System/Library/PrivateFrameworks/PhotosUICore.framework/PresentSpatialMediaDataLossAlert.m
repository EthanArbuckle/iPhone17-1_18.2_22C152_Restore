@interface PresentSpatialMediaDataLossAlert
@end

@implementation PresentSpatialMediaDataLossAlert

void ___PresentSpatialMediaDataLossAlert_block_invoke(uint64_t a1)
{
  v2 = PXLocalizedSharedAlbumsString(@"PXSharedAlbumSpatialMediaDataLossAlertTitle");
  v3 = PXLocalizedSharedAlbumsString(@"PXSharedAlbumSpatialMediaDataLossAlertMessage");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___PresentSpatialMediaDataLossAlert_block_invoke_2;
  v11[3] = &unk_1E5DC56E8;
  id v12 = v2;
  id v13 = v3;
  v4 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = v2;
  v7 = [v4 presentAlertWithConfigurationHandler:v11];
  v8 = PLSharedAlbumsGetLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Presented shared album spatial data loss alert", v10, 2u);
    }

    PXPreferencesSetBool(@"HasShownSharedAlbumsSpatialMediaDataLossAlert", 1);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Failed to present shared album spatial data loss alert", v10, 2u);
    }
  }
}

void ___PresentSpatialMediaDataLossAlert_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:*(void *)(a1 + 40)];
  id v5 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___PresentSpatialMediaDataLossAlert_block_invoke_3;
  v6[3] = &unk_1E5DD3128;
  id v7 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v5 style:1 action:v6];
}

uint64_t ___PresentSpatialMediaDataLossAlert_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end