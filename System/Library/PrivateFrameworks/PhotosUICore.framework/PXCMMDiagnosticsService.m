@interface PXCMMDiagnosticsService
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideContextualViewController;
- (BOOL)canProvideSettingsViewController;
- (id)contextualViewController;
- (id)settingsViewController;
- (id)title;
@end

@implementation PXCMMDiagnosticsService

- (id)settingsViewController
{
  return 0;
}

- (BOOL)canProvideSettingsViewController
{
  return 0;
}

- (id)contextualViewController
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(PXDiagnosticsService *)self itemProviders];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (!v4)
  {
    v6 = 0;
LABEL_14:
    v12 = PLSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(PXDiagnosticsService *)self itemProviders];
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Diagnosis Error: No item providers can be used (%@)", buf, 0xCu);
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
      if ([v9 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierSharingSuggestion"])
      {
        uint64_t v10 = [v9 itemForIdentifier:@"PXDiagnosticsItemIdentifierSharingSuggestion"];

        v6 = (void *)v10;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  }
  while (v5);
  if (!v6) {
    goto LABEL_14;
  }
  v11 = [[PXCMMDebugSharingSuggestionViewController alloc] initWithSharingSuggestion:v6];
  if (!v11) {
    goto LABEL_14;
  }
LABEL_17:

  return v11;
}

- (BOOL)canProvideContextualViewController
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[PXDiagnosticsSettings sharedInstance];
  int v4 = [v3 enableCompleteMyMomentService];

  if (!v4) {
    return 0;
  }
  [(PXDiagnosticsService *)self itemProviders];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierSharingSuggestion", (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)canProvideConsoleDescription
{
  return 0;
}

- (id)title
{
  return @"Complete My Moment Diagnostics";
}

@end