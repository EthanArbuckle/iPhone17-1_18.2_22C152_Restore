@interface TIAssetManagerMock
- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5;
- (id)enabledInputModeIdentifiersProviderBlock;
- (id)enabledInputModes;
- (id)preferencesProviderBlock;
- (id)topActiveRegions;
- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6;
- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5;
- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4;
- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3;
- (void)setPreferencesProviderBlock:(id)a3;
@end

@implementation TIAssetManagerMock

- (void).cxx_destruct
{
  objc_storeStrong(&self->preferencesProviderBlock, 0);
  objc_storeStrong(&self->enabledInputModeIdentifiersProviderBlock, 0);
}

- (void)setPreferencesProviderBlock:(id)a3
{
}

- (id)preferencesProviderBlock
{
  return self->preferencesProviderBlock;
}

- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3
{
}

- (id)enabledInputModeIdentifiersProviderBlock
{
  return self->enabledInputModeIdentifiersProviderBlock;
}

- (id)topActiveRegions
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, MEMORY[0x263EFFA68]);
  }
}

- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, MEMORY[0x263EFFA68]);
  }
}

- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)enabledInputModes
{
  return 0;
}

- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

@end