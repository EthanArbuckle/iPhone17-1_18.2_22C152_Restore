@interface NTWidgetConfigDataOperation
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCHeldRecords)cachedRecords;
- (NSArray)resultArticleIDs;
- (NSArray)resultArticleListIDs;
- (NSDictionary)resultDefaultConfigurationDictionary;
- (NSDictionary)resultHeldRecordsByType;
- (NSDictionary)resultSingleTagConfigurationDictionary;
- (NSDictionary)widgetConfiguration;
- (id)widgetConfigDataCompletionHandler;
- (void)_collectRecordsFromWidgetConfigDictionary:(id)a3;
- (void)_finalizeResultFromCachedRecords;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachedRecords:(id)a3;
- (void)setContext:(id)a3;
- (void)setResultArticleIDs:(id)a3;
- (void)setResultArticleListIDs:(id)a3;
- (void)setResultDefaultConfigurationDictionary:(id)a3;
- (void)setResultHeldRecordsByType:(id)a3;
- (void)setResultSingleTagConfigurationDictionary:(id)a3;
- (void)setWidgetConfigDataCompletionHandler:(id)a3;
- (void)setWidgetConfiguration:(id)a3;
- (void)validateOperation;
@end

@implementation NTWidgetConfigDataOperation

- (BOOL)validateOperation
{
  v3 = [(NTWidgetConfigDataOperation *)self widgetConfiguration];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTWidgetConfigDataOperation validateOperation]();
  }
  v4 = [(NTWidgetConfigDataOperation *)self context];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTWidgetConfigDataOperation validateOperation]();
  }
  v5 = [(NTWidgetConfigDataOperation *)self widgetConfigDataCompletionHandler];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTWidgetConfigDataOperation validateOperation]();
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  v3 = [(NTWidgetConfigDataOperation *)self widgetConfiguration];
  [(NTWidgetConfigDataOperation *)self _collectRecordsFromWidgetConfigDictionary:v3];

  [(NTWidgetConfigDataOperation *)self _finalizeResultFromCachedRecords];

  [(FCOperation *)self finishedPerformingOperationWithError:0];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v11 = a3;
  v4 = [(NTWidgetConfigDataOperation *)self widgetConfigDataCompletionHandler];

  if (v4)
  {
    v5 = [(NTWidgetConfigDataOperation *)self widgetConfigDataCompletionHandler];
    BOOL v6 = [(NTWidgetConfigDataOperation *)self resultDefaultConfigurationDictionary];
    v7 = [(NTWidgetConfigDataOperation *)self resultSingleTagConfigurationDictionary];
    v8 = [(NTWidgetConfigDataOperation *)self resultArticleIDs];
    v9 = [(NTWidgetConfigDataOperation *)self resultArticleListIDs];
    v10 = [(NTWidgetConfigDataOperation *)self resultHeldRecordsByType];
    ((void (**)(void, void *, void *, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)_collectRecordsFromWidgetConfigDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F592D0];
  BOOL v6 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEBUG)) {
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:](v6, self);
  }
  v7 = FCAppConfigurationDictionaryValue();
  os_log_t v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:](v8, self);
  }
  v9 = FCAppConfigurationDictionaryValue();
  os_log_t v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    -[NTWidgetConfigDataOperation _collectRecordsFromWidgetConfigDictionary:](v10, self);
  }
  id v11 = FCAppConfigurationDictionaryValue();
  v12 = FCAppConfigurationDictionaryValue();
  v13 = FCAppConfigurationDictionaryValue();
  uint64_t v14 = [v11 allKeys];
  uint64_t v15 = [v12 allKeys];
  [(NTWidgetConfigDataOperation *)self setResultDefaultConfigurationDictionary:v7];
  [(NTWidgetConfigDataOperation *)self setResultSingleTagConfigurationDictionary:v9];
  v27 = (void *)v15;
  [(NTWidgetConfigDataOperation *)self setResultArticleListIDs:v15];
  v28 = (void *)v14;
  [(NTWidgetConfigDataOperation *)self setResultArticleIDs:v14];
  v16 = [MEMORY[0x263EFF980] array];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke;
  v33[3] = &unk_26475C4D8;
  v33[4] = self;
  id v17 = v16;
  id v34 = v17;
  [v11 enumerateKeysAndObjectsUsingBlock:v33];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_28;
  v31[3] = &unk_26475C4D8;
  v31[4] = self;
  id v18 = v17;
  id v32 = v18;
  [v12 enumerateKeysAndObjectsUsingBlock:v31];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_29;
  v29[3] = &unk_26475C4D8;
  v29[4] = self;
  id v19 = v18;
  id v30 = v19;
  [v13 enumerateKeysAndObjectsUsingBlock:v29];
  v20 = [(NTWidgetConfigDataOperation *)self context];
  v21 = [v20 convertRecords:v19];
  [(NTWidgetConfigDataOperation *)self setCachedRecords:v21];

  v22 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    v24 = [(FCOperation *)self shortOperationDescription];
    v25 = [(NTWidgetConfigDataOperation *)self cachedRecords];
    uint64_t v26 = [v25 count];
    *(_DWORD *)buf = 138543618;
    v36 = v24;
    __int16 v37 = 2048;
    uint64_t v38 = v26;
    _os_log_impl(&dword_22592C000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ converted %lu records", buf, 0x16u);
  }
}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NTCKRecordFromArticleJSONDictionary(v4);
  BOOL v6 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    os_log_t v8 = v6;
    v9 = [v7 shortOperationDescription];
    int v10 = 138543874;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_22592C000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert article JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 40) addObject:v5];
}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NTCKRecordFromArticleListJSONDictionary(v4);
  BOOL v6 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    os_log_t v8 = v6;
    v9 = [v7 shortOperationDescription];
    int v10 = 138543874;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_22592C000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert articleList JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 40) addObject:v5];
}

void __73__NTWidgetConfigDataOperation__collectRecordsFromWidgetConfigDictionary___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NTCKRecordFromTagJSONDictionary(v4);
  BOOL v6 = (void *)*MEMORY[0x263F592D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F592D0], OS_LOG_TYPE_DEBUG))
  {
    v7 = *(void **)(a1 + 32);
    os_log_t v8 = v6;
    v9 = [v7 shortOperationDescription];
    int v10 = 138543874;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_debug_impl(&dword_22592C000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ convert tag JSON: %@ into record: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)_finalizeResultFromCachedRecords
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [(NTWidgetConfigDataOperation *)self cachedRecords];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke;
  v18[3] = &unk_26475C500;
  id v6 = v3;
  id v19 = v6;
  id v7 = v4;
  id v20 = v7;
  [v5 enumerateRecordsAndInterestTokensWithBlock:v18];

  os_log_t v8 = NSDictionary;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  __int16 v14 = __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke_2;
  uint64_t v15 = &unk_26475C528;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_msgSend(v8, "fc_dictionary:", &v12);
  -[NTWidgetConfigDataOperation setResultHeldRecordsByType:](self, "setResultHeldRecordsByType:", v11, v12, v13, v14, v15);
}

void __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v14 = [v6 base];
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "recordType"));
  os_log_t v8 = [v14 identifier];
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v9)
  {
    id v10 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];

    id v11 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
  }
  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  [v12 setObject:v6 forKeyedSubscript:v8];

  uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  [v13 setObject:v5 forKeyedSubscript:v8];
}

void __63__NTWidgetConfigDataOperation__finalizeResultFromCachedRecords__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x263F594F8]);
        id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
        uint64_t v12 = (void *)[v9 initWithRecordsByID:v10 interestTokensByID:v11];

        [v3 setObject:v12 forKeyedSubscript:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)widgetConfiguration
{
  return self->_widgetConfiguration;
}

- (void)setWidgetConfiguration:(id)a3
{
}

- (id)widgetConfigDataCompletionHandler
{
  return self->_widgetConfigDataCompletionHandler;
}

- (void)setWidgetConfigDataCompletionHandler:(id)a3
{
}

- (FCHeldRecords)cachedRecords
{
  return self->_cachedRecords;
}

- (void)setCachedRecords:(id)a3
{
}

- (NSDictionary)resultDefaultConfigurationDictionary
{
  return self->_resultDefaultConfigurationDictionary;
}

- (void)setResultDefaultConfigurationDictionary:(id)a3
{
}

- (NSDictionary)resultSingleTagConfigurationDictionary
{
  return self->_resultSingleTagConfigurationDictionary;
}

- (void)setResultSingleTagConfigurationDictionary:(id)a3
{
}

- (NSArray)resultArticleIDs
{
  return self->_resultArticleIDs;
}

- (void)setResultArticleIDs:(id)a3
{
}

- (NSArray)resultArticleListIDs
{
  return self->_resultArticleListIDs;
}

- (void)setResultArticleListIDs:(id)a3
{
}

- (NSDictionary)resultHeldRecordsByType
{
  return self->_resultHeldRecordsByType;
}

- (void)setResultHeldRecordsByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_resultArticleListIDs, 0);
  objc_storeStrong((id *)&self->_resultArticleIDs, 0);
  objc_storeStrong((id *)&self->_resultSingleTagConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_resultDefaultConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong(&self->_widgetConfigDataCompletionHandler, 0);
  objc_storeStrong((id *)&self->_widgetConfiguration, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Record chain conversion conversion operation requires widgetConfiguration."];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 shortOperationDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_22592C000, v5, v6, "%{public}@ parsed single tag configuration %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 shortOperationDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_22592C000, v5, v6, "%{public}@ parsed default configuration %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectRecordsFromWidgetConfigDictionary:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 shortOperationDescription];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_22592C000, v5, v6, "%{public}@ about to convert config JSON: %{public}@", v7, v8, v9, v10, v11);
}

@end