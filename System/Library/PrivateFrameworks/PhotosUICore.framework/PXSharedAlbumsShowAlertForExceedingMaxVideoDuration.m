@interface PXSharedAlbumsShowAlertForExceedingMaxVideoDuration
@end

@implementation PXSharedAlbumsShowAlertForExceedingMaxVideoDuration

void ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_2;
  v8[3] = &unk_1E5DC5758;
  v2 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 72);
  id v12 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  v3 = [v2 presentAlertWithConfigurationHandler:v8];
  v4 = PLSharedAlbumsGetLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Presented shared album add video validation alert", v7, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to present shared album add video validation alert", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

void ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:*(void *)(a1 + 32)];
  [v3 setMessage:*(void *)(a1 + 40)];
  v4 = @"PXOK";
  if (*(unsigned char *)(a1 + 64))
  {
    v5 = PXLocalizedStringFromTable(@"PXSkip", @"PhotosUICore");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_3;
    v9[3] = &unk_1E5DD3280;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    [v3 addActionWithTitle:v5 style:0 action:v9];

    if (*(unsigned char *)(a1 + 64)) {
      v4 = @"PXCancel";
    }
  }
  uint64_t v6 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_4;
  v7[3] = &unk_1E5DD3128;
  id v8 = *(id *)(a1 + 56);
  [v3 addActionWithTitle:v6 style:1 action:v7];
}

uint64_t ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

@end