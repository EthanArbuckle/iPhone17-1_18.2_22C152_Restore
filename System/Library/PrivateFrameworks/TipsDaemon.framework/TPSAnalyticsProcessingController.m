@interface TPSAnalyticsProcessingController
- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6;
- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6 processors:(id)a7;
- (id)allContextualInfo;
- (id)allTipStatus;
- (id)contextualEventForIdentifier:(id)a3;
- (id)contextualInfoForIdentifier:(id)a3;
- (id)experiment;
- (void)processAnalytics;
- (void)resetAnalytics;
@end

@implementation TPSAnalyticsProcessingController

- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(TPSAnalyticsUsageEventsProcessor);
  [(TPSAnalyticsProcessor *)v14 setDataSource:self];
  v15 = objc_alloc_init(TPSAnalyticsHistoricTipsDataProcessor);
  [(TPSAnalyticsProcessor *)v15 setDataSource:self];
  v19[0] = v14;
  v19[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v17 = [(TPSAnalyticsProcessingController *)self initWithAllTipStatus:v13 contextualInfoMap:v12 eventHistoryMap:v11 experiment:v10 processors:v16];

  return v17;
}

- (TPSAnalyticsProcessingController)initWithAllTipStatus:(id)a3 contextualInfoMap:(id)a4 eventHistoryMap:(id)a5 experiment:(id)a6 processors:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsProcessingController;
  v17 = [(TPSAnalyticsProcessingController *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processors, a7);
    objc_storeStrong((id *)&v18->_allTipStatus, a3);
    objc_storeStrong((id *)&v18->_contextualInfoMap, a4);
    objc_storeStrong((id *)&v18->_eventHistoryMap, a5);
    objc_storeStrong((id *)&v18->_experiment, a6);
  }

  return v18;
}

- (void)processAnalytics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FAF480] analytics];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    processors = self->_processors;
    *(_DWORD *)buf = 138412290;
    objc_super v21 = processors;
    _os_log_impl(&dword_1E4492000, v3, OS_LOG_TYPE_DEFAULT, "Processing analytics: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_processors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52__TPSAnalyticsProcessingController_processAnalytics__block_invoke;
        v13[3] = &unk_1E6E6BEF8;
        v13[4] = v10;
        id v14 = v11;
        id v12 = v11;
        [v10 processAnalytics:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

uint64_t __52__TPSAnalyticsProcessingController_processAnalytics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDateLastRun:*(void *)(a1 + 40)];
}

- (void)resetAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FAF480] analytics];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    processors = self->_processors;
    *(_DWORD *)buf = 138412290;
    long long v16 = processors;
    _os_log_impl(&dword_1E4492000, v3, OS_LOG_TYPE_DEFAULT, "Resetting analytics: %@", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_processors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "resetAnalytics", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)allTipStatus
{
  return self->_allTipStatus;
}

- (id)allContextualInfo
{
  return [(NSDictionary *)self->_contextualInfoMap allValues];
}

- (id)contextualEventForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_eventHistoryMap objectForKeyedSubscript:a3];
}

- (id)contextualInfoForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_contextualInfoMap objectForKeyedSubscript:a3];
}

- (id)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_eventHistoryMap, 0);
  objc_storeStrong((id *)&self->_contextualInfoMap, 0);
  objc_storeStrong((id *)&self->_allTipStatus, 0);

  objc_storeStrong((id *)&self->_processors, 0);
}

@end