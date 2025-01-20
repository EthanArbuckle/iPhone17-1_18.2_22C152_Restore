@interface WBSCoreAnalyticsExtensionsStatistics
- (BOOL)hasExtensionThatCanOverrideNewTabPage;
- (BOOL)newTabPageIsOverridden;
- (NSArray)telemetryDataForExtensions;
- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6;
- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6 newTabPageIsOverridden:(BOOL)a7;
- (unint64_t)disabledCount;
- (unint64_t)enabledCount;
@end

@implementation WBSCoreAnalyticsExtensionsStatistics

- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v9 = (void (**)(id, void))a4;
  v25 = (void (**)(id, void))a6;
  v31.receiver = self;
  v31.super_class = (Class)WBSCoreAnalyticsExtensionsStatistics;
  v26 = [(WBSCoreAnalyticsExtensionsStatistics *)&v31 init];
  if (v26)
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v22;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v16 = v9[2](v9, v15);
          if ([v16 length])
          {
            v17 = v25[2](v25, v15);
            unsigned int v18 = [v17 enabled];
            if (!v26->_hasExtensionThatCanOverrideNewTabPage
              && [v17 canOverrideNewTabPage])
            {
              v26->_hasExtensionThatCanOverrideNewTabPage = 1;
            }
            -[NSArray addObject:](v24, "addObject:", v17, v22);

            v10 += v18;
            v11 += v18 ^ 1;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    v26->_enabledCount = v10;
    v26->_disabledCount = v11;
    telemetryDataForExtensions = v26->_telemetryDataForExtensions;
    v26->_telemetryDataForExtensions = v24;

    v20 = v26;
  }

  return v26;
}

- (WBSCoreAnalyticsExtensionsStatistics)initWithExtensionsList:(id)a3 extractDeveloperIdentifier:(id)a4 extractComposedIdentifier:(id)a5 extensionTelemetryDataPredicate:(id)a6 newTabPageIsOverridden:(BOOL)a7
{
  self->_newTabPageIsOverridden = a7;
  return [(WBSCoreAnalyticsExtensionsStatistics *)self initWithExtensionsList:a3 extractDeveloperIdentifier:a4 extractComposedIdentifier:a5 extensionTelemetryDataPredicate:a6];
}

- (unint64_t)enabledCount
{
  return self->_enabledCount;
}

- (unint64_t)disabledCount
{
  return self->_disabledCount;
}

- (NSArray)telemetryDataForExtensions
{
  return self->_telemetryDataForExtensions;
}

- (BOOL)hasExtensionThatCanOverrideNewTabPage
{
  return self->_hasExtensionThatCanOverrideNewTabPage;
}

- (BOOL)newTabPageIsOverridden
{
  return self->_newTabPageIsOverridden;
}

- (void).cxx_destruct
{
}

@end