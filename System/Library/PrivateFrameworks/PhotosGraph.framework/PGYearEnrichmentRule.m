@interface PGYearEnrichmentRule
- (OS_os_log)loggingConnection;
- (PGHighlightItemModelReader)modelReader;
- (PGYearEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4;
- (double)promotionScoreForHighlightItemList:(id)a3;
- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4;
- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7;
@end

@implementation PGYearEnrichmentRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_modelReader, 0);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PGHighlightItemModelReader)modelReader
{
  return self->_modelReader;
}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7
{
  uint64_t v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, void, uint64_t))a7;
  v26 = v10;
  [v10 childHighlightItemsForHighlightFilter:v8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v17 = [(PGYearEnrichmentRule *)self modelReader];
        uint64_t v18 = [v17 visibilityStateForHighlightItem:v16 sharingFilter:v8];

        v11[2](v11, v16, v18);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }
  v19 = [v10 sortedChildHighlightItems];
  v20 = [v19 arrayByExcludingObjectsInArray:obj];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        v11[2](v11, *(void *)(*((void *)&v28 + 1) + 8 * j), 0);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }
}

- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PGHighlightItemModelReader *)self->_modelReader contextualKeyAssetForHighlightItem:v6 sharingFilter:v4];
  if (!v7)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "Unexpected nil contextual key asset for highlight item list %@, will fallback to promotion score.", buf, 0xCu);
    }
    v9 = [v6 childHighlightItemsForHighlightFilter:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v22;
      double v14 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v16 promotionScore];
          if (v17 > v14)
          {
            double v18 = v17;
            id v19 = v16;

            uint64_t v12 = v19;
            double v14 = v18;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    v7 = [v12 keyAssetForHighlightFilter:v4];
  }
  return v7;
}

- (double)promotionScoreForHighlightItemList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "sortedChildHighlightItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) promotionScore];
        if (v7 < v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (PGYearEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGYearEnrichmentRule;
  double v9 = [(PGYearEnrichmentRule *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelReader, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

@end