@interface SFFPShareCollaborationItem
@end

@implementation SFFPShareCollaborationItem

uint64_t __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_2;
  v3[3] = &unk_1E5BBE3F0;
  uint64_t v1 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return +[SFCollaborationUtilities loadMetadataForFileURL:v1 completionHandler:v3];
}

void __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setMetadataLoadError:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_3;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didLoadMetadata:*(void *)(a1 + 40)];
}

void __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke_cold_1(WeakRetained, (uint64_t)v6, v8);
    }

    id v5 = [WeakRetained fileURL];
  }
  [WeakRetained setSendCopyRepresentationURL:v5];
  v10[0] = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [WeakRetained setSendCopyActivityItems:v9];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 fileURL];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "Could not load copy representation URL, falling back to the original URL %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

@end