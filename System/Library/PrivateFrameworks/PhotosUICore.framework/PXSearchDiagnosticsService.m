@interface PXSearchDiagnosticsService
+ (id)viewControllerForDetailsOfAsset:(id)a3;
- (BOOL)canProvideContextualViewController;
- (id)contextualViewController;
- (id)title;
@end

@implementation PXSearchDiagnosticsService

+ (id)viewControllerForDetailsOfAsset:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "px_searchDebugString");
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Search Details" message:0 preferredStyle:1];
  [v5 _setAttributedMessage:v4];
  v6 = (void *)MEMORY[0x1E4FB1410];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke;
  v19[3] = &unk_1E5DD0030;
  id v20 = v4;
  id v7 = v4;
  v8 = [v6 actionWithTitle:@"Copy Text" style:0 handler:v19];
  [v5 addAction:v8];

  v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2;
  v17 = &unk_1E5DD0030;
  id v18 = v3;
  id v10 = v3;
  v11 = [v9 actionWithTitle:@"Copy UUID" style:0 handler:&v14];
  objc_msgSend(v5, "addAction:", v11, v14, v15, v16, v17);

  v12 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
  [v5 addAction:v12];

  return v5;
}

void __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [*(id *)(a1 + 32) string];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setObjects:v4];
}

void __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [*(id *)(a1 + 32) uuid];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setObjects:v4];
}

- (id)contextualViewController
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (!v4)
  {

    v6 = 0;
LABEL_14:
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [(PXDiagnosticsService *)self itemProviders];
      *(_DWORD *)buf = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "Search Diagnostics Service Error: No item providers can be used (%@)", buf, 0xCu);
    }
    v11 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if ([v9 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierAsset"])
      {
        uint64_t v10 = [v9 itemForIdentifier:@"PXDiagnosticsItemIdentifierAsset"];

        v6 = (void *)v10;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_14;
  }
  v11 = [(id)objc_opt_class() viewControllerForDetailsOfAsset:v6];
  if (!v11) {
    goto LABEL_14;
  }
LABEL_17:

  return v11;
}

- (BOOL)canProvideContextualViewController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(PXDiagnosticsService *)self itemProviders];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierAsset", (void)v9))
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (id)title
{
  return @"Search Details";
}

@end