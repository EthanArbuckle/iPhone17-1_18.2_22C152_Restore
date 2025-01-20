@interface PXDebugDictionaryDiagnosticsService
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideContextualViewController;
- (id)_debugDictionary;
- (id)consoleDescription;
- (id)contextualViewController;
- (id)title;
@end

@implementation PXDebugDictionaryDiagnosticsService

- (id)_debugDictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PXDiagnosticsService *)self itemProviders];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    v6 = (void *)MEMORY[0x1E4F1CC08];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierDebugDictionary", (void)v10))
        {
          v6 = [v8 itemForIdentifier:@"PXDiagnosticsItemIdentifierDebugDictionary"];
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
LABEL_12:

  return v6;
}

- (id)contextualViewController
{
  id v2 = [(PXDebugDictionaryDiagnosticsService *)self _debugDictionary];
  uint64_t v3 = [[PXDebugDictionaryViewController alloc] initWithDebugDictionary:v2];

  return v3;
}

- (BOOL)canProvideContextualViewController
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PXDiagnosticsSettings sharedInstance];
  int v4 = [v3 enableDebugDictionaryService];

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
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierDebugDictionary", (void)v12))
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

- (id)consoleDescription
{
  id v2 = [(PXDebugDictionaryDiagnosticsService *)self _debugDictionary];
  uint64_t v3 = [v2 debugDescription];

  return v3;
}

- (BOOL)canProvideConsoleDescription
{
  return 1;
}

- (id)title
{
  return @"Debug Dictionary Diagnostics";
}

@end