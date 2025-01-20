@interface PXSharedAlbumsShowAlertForNotEditable
@end

@implementation PXSharedAlbumsShowAlertForNotEditable

void ___PXSharedAlbumsShowAlertForNotEditable_block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_2;
  v10[3] = &unk_1E5DC56E8;
  v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  v3 = [v2 presentAlertWithConfigurationHandler:v10];
  v4 = PLSharedAlbumsGetLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      v6 = "Presented shared album editable validation alert";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v7, v8, v6, v9, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    v6 = "Failed to present shared album editable validation alert";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

void ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:*(void *)(a1 + 40)];
  v5 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_3;
  v6[3] = &unk_1E5DD3128;
  id v7 = *(id *)(a1 + 48);
  [v4 addActionWithTitle:v5 style:1 action:v6];
}

uint64_t ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end