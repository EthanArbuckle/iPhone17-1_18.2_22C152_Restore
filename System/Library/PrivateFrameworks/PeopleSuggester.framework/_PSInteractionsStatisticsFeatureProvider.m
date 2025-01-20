@interface _PSInteractionsStatisticsFeatureProvider
- (_PSInteractionsStatisticsFeatureProvider)initWithInteractionsStatistics:(id)a3;
- (id)featureValueForFeature:(id)a3 forConversationId:(id)a4;
- (id)mlFeatures;
- (id)mlFeaturesForConversationId:(id)a3;
@end

@implementation _PSInteractionsStatisticsFeatureProvider

- (_PSInteractionsStatisticsFeatureProvider)initWithInteractionsStatistics:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_PSInteractionsStatisticsFeatureProvider;
  v5 = [(_PSInteractionsStatisticsFeatureProvider *)&v41 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    mlFeatures = v5->_mlFeatures;
    v5->_mlFeatures = (NSMutableDictionary *)v6;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = [v4 properties];
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v13 = objc_opt_new();
          v14 = [v4 properties];
          v15 = [v14 objectForKeyedSubscript:v12];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke;
          v35[3] = &unk_1E5ADE8F0;
          id v36 = v13;
          id v16 = v13;
          [v15 enumerateKeysAndObjectsUsingBlock:v35];

          [(NSMutableDictionary *)v5->_mlFeatures setObject:v16 forKeyedSubscript:v12];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obja = [v4 features];
    uint64_t v17 = [obja countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(obja);
          }
          uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          v22 = [(NSMutableDictionary *)v5->_mlFeatures objectForKeyedSubscript:v21];
          if (!v22)
          {
            v22 = objc_opt_new();
            [(NSMutableDictionary *)v5->_mlFeatures setObject:v22 forKeyedSubscript:v21];
          }
          v23 = [v4 features];
          v24 = [v23 objectForKeyedSubscript:v21];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke_2;
          v29[3] = &unk_1E5ADE918;
          id v30 = v22;
          id v25 = v22;
          [v24 enumerateKeysAndObjectsUsingBlock:v29];
        }
        uint64_t v18 = [obja countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v18);
    }
  }
  return v5;
}

- (id)mlFeatures
{
  v2 = (void *)[(NSMutableDictionary *)self->_mlFeatures copy];

  return v2;
}

- (id)mlFeaturesForConversationId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_mlFeatures objectForKeyedSubscript:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)featureValueForFeature:(id)a3 forConversationId:(id)a4
{
  mlFeatures = self->_mlFeatures;
  id v6 = a3;
  v7 = [(NSMutableDictionary *)mlFeatures objectForKeyedSubscript:a4];
  uint64_t v8 = [v7 featureValueForName:v6];

  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (void).cxx_destruct
{
}

@end