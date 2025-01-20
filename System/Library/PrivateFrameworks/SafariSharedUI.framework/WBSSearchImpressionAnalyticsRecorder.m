@interface WBSSearchImpressionAnalyticsRecorder
+ (WBSSearchImpressionAnalyticsRecorder)sharedRecorder;
- (NSArray)searchProviders;
- (WBSSearchImpressionAnalyticsRecorder)init;
- (WBSSearchProvider)defaultSearchProvider;
- (id)searchProviderForURL:(id)a3;
- (void)didActualizeImpressionForURL:(id)a3 provenance:(int64_t)a4;
- (void)setDefaultSearchProvider:(id)a3;
- (void)setSearchProviders:(id)a3;
@end

@implementation WBSSearchImpressionAnalyticsRecorder

- (void)setSearchProviders:(id)a3
{
}

void __54__WBSSearchImpressionAnalyticsRecorder_sharedRecorder__block_invoke()
{
  v0 = objc_alloc_init(WBSSearchImpressionAnalyticsRecorder);
  v1 = (void *)sharedRecorder_sharedRecorder;
  sharedRecorder_sharedRecorder = (uint64_t)v0;
}

- (WBSSearchImpressionAnalyticsRecorder)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSSearchImpressionAnalyticsRecorder;
  v2 = [(WBSSearchImpressionAnalyticsRecorder *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (WBSSearchImpressionAnalyticsRecorder)sharedRecorder
{
  if (sharedRecorder_onceToken != -1) {
    dispatch_once(&sharedRecorder_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)sharedRecorder_sharedRecorder;
  return (WBSSearchImpressionAnalyticsRecorder *)v2;
}

- (void)setDefaultSearchProvider:(id)a3
{
  v5 = (WBSSearchProvider *)a3;
  defaultSearchProvider = self->_defaultSearchProvider;
  p_defaultSearchProvider = &self->_defaultSearchProvider;
  if (defaultSearchProvider != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_defaultSearchProvider, a3);
    v5 = v8;
  }
}

- (void)didActualizeImpressionForURL:(id)a3 provenance:(int64_t)a4
{
  id v13 = a3;
  int v6 = objc_msgSend(v13, "safari_isHTTPFamilyURL");
  v7 = v13;
  if (v6)
  {
    uint64_t v8 = [(WBSSearchImpressionAnalyticsRecorder *)self searchProviderForURL:v13];
    v9 = (void *)v8;
    if (a4 == 1 || v8)
    {
      v10 = [MEMORY[0x1E4F98290] sharedLogger];
      v11 = [(WBSSearchProvider *)self->_defaultSearchProvider shortName];
      v12 = [v9 shortName];
      [v10 recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier:v11 searchProviderIdentifier:v12 provenance:a4];
    }
    v7 = v13;
  }
}

- (id)searchProviderForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WBSSearchProvider *)self->_defaultSearchProvider urlIsValidSearch:v4])
  {
    v5 = self->_defaultSearchProvider;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v6 = self->_searchProviders;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "urlIsValidSearch:", v4, (void)v13))
          {
            v5 = v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (NSArray)searchProviders
{
  return self->_searchProviders;
}

- (WBSSearchProvider)defaultSearchProvider
{
  return self->_defaultSearchProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSearchProvider, 0);
  objc_storeStrong((id *)&self->_searchProviders, 0);
}

@end