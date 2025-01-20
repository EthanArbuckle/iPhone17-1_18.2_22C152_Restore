@interface PXDreamyDiagnosticsService
- (BOOL)canProvideContextualViewController;
- (PXDreamyDiagnosticsService)initWithItemProviders:(id)a3;
- (id)contextualViewController;
- (id)title;
@end

@implementation PXDreamyDiagnosticsService

- (void).cxx_destruct
{
}

- (id)contextualViewController
{
  if ([(PXDreamyDiagnosticsService *)self canProvideContextualViewController]) {
    v3 = [(PXVideoComparisonViewController *)[PXDreamyDiagnosticsViewController alloc] initWithInputAsset:self->_asset];
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)canProvideContextualViewController
{
  return [(PHAsset *)self->_asset playbackStyle] == 3;
}

- (id)title
{
  return @"Dreamy";
}

- (PXDreamyDiagnosticsService)initWithItemProviders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXDreamyDiagnosticsService;
  v5 = [(PXDiagnosticsService *)&v18 initWithItemProviders:v4];
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "itemForIdentifier:", @"PXDiagnosticsItemIdentifierAsset", (void)v14);
          v11 = (PHAsset *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            asset = v5->_asset;
            v5->_asset = v11;

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

@end