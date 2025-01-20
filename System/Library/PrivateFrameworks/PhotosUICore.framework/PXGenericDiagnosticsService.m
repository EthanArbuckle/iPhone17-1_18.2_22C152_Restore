@interface PXGenericDiagnosticsService
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideContextualViewController;
- (BOOL)canProvideSettingsViewController;
- (id)consoleDescription;
- (id)title;
@end

@implementation PXGenericDiagnosticsService

- (BOOL)canProvideSettingsViewController
{
  return 1;
}

- (BOOL)canProvideContextualViewController
{
  v2 = +[PXDiagnosticsSettings sharedInstance];
  char v3 = [v2 enableGenericService];

  return v3;
}

- (id)consoleDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F28E78] string];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        v5 = *(void **)(*((void *)&v22 + 1) + 8 * v4);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v6 = [v5 registeredIdentifiers];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v12 = [v5 itemForIdentifier:v11];
              if ([v3 length]) {
                [v3 appendString:@"\n"];
              }
              [v3 appendFormat:@"%@: %@\n", v11, v12];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }

  return v3;
}

- (BOOL)canProvideConsoleDescription
{
  v2 = +[PXDiagnosticsSettings sharedInstance];
  char v3 = [v2 enableGenericService];

  return v3;
}

- (id)title
{
  return @"Generic Diagnostics";
}

@end