@interface PECopyActionEventBuilder
- (NSDictionary)configurationAnalyticsPayload;
- (PEAsset)asset;
- (PICompositionController)copiedCompositionController;
- (id)buildEvent;
- (void)setAsset:(id)a3;
- (void)setConfigurationAnalyticsPayload:(id)a3;
- (void)setCopiedCompositionController:(id)a3;
@end

@implementation PECopyActionEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationAnalyticsPayload, 0);
  objc_storeStrong((id *)&self->_copiedCompositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setConfigurationAnalyticsPayload:(id)a3
{
}

- (NSDictionary)configurationAnalyticsPayload
{
  return self->_configurationAnalyticsPayload;
}

- (void)setCopiedCompositionController:(id)a3
{
}

- (PICompositionController)copiedCompositionController
{
  return self->_copiedCompositionController;
}

- (void)setAsset:(id)a3
{
}

- (PEAsset)asset
{
  return self->_asset;
}

- (id)buildEvent
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(PECopyActionEventBuilder *)self asset];

  if (v4)
  {
    v5 = [(PECopyActionEventBuilder *)self asset];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F2F9F8]];
  }
  v6 = [(PECopyActionEventBuilder *)self asset];
  v7 = +[PEAnalyticsUtility semanticStylesIdentifierForItem:v6];

  if (v7 && [v7 length])
  {
    v15 = @"semantic_style";
    v16[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v3 addEntriesFromDictionary:v8];
  }
  v9 = [(PECopyActionEventBuilder *)self copiedCompositionController];

  if (v9)
  {
    v10 = [(PECopyActionEventBuilder *)self copiedCompositionController];
    v11 = +[PEAnalyticsUtility analyticPayloadForCompositionController:v10];

    [v3 addEntriesFromDictionary:v11];
  }
  v12 = [(PECopyActionEventBuilder *)self configurationAnalyticsPayload];

  if (v12)
  {
    v13 = [(PECopyActionEventBuilder *)self configurationAnalyticsPayload];
    [v3 addEntriesFromDictionary:v13];
  }
  return v3;
}

@end