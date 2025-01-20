@interface PGHolidayContextualRule
- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3;
- (PGHolidayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5;
- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5;
- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8;
@end

@implementation PGHolidayContextualRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesForHoliday, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_holidayNode, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 localStartDate];
  uint64_t v9 = [v7 localEndDate];
  v10 = (void *)v9;
  if (v8 && v9)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
    v12 = [(PGGraphMomentNodeCollection *)self->_momentNodesForHoliday subsetForLocalDateInterval:v11];
    v13 = [v12 highlightNodes];
    v14 = +[PGHighlightEnrichmentUtilities filteredHighlightNodesWithHighlightNodes:v13 forSharingFilter:v5];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      v20 = v8;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "Could not match holiday to yearHighlight %@: invalid localStartDate %@, localEndDate %@", (uint8_t *)&v17, 0x20u);
    }
    v14 = [(MAElementCollection *)[PGGraphHighlightNodeCollection alloc] initWithGraph:self->_graph];
  }

  return v14;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18 && self->_holidayNode && [(MAElementCollection *)self->_momentNodesForHoliday count])
  {
    __int16 v19 = [(PGHolidayContextualRule *)self highlightNodesMatchingYearHighlight:v14 sharingFilter:v12 withOptions:v15];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      holidayNode = self->_holidayNode;
      v22 = loggingConnection;
      *(_DWORD *)buf = 138412802;
      v29 = holidayNode;
      __int16 v30 = 2048;
      uint64_t v31 = [v19 count];
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Holiday node %@ matched %tu highlight nodes for year %@", buf, 0x20u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __137__PGHolidayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
    v23[3] = &unk_1E68E82D8;
    __int16 v27 = v12;
    id v24 = v14;
    v25 = self;
    id v26 = v18;
    [v19 enumerateNodesUsingBlock:v23];
  }
}

uint64_t __137__PGHolidayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGContextualRuleUtils returnContextualKeyAssetForHighlightNode:a2 yearHighlight:*(void *)(a1 + 32) sharingFilter:*(unsigned __int16 *)(a1 + 56) score:*(void *)(*(void *)(a1 + 40) + 24) inPhotoLibrary:*(void *)(*(void *)(a1 + 40) + 32) loggingConnection:*(void *)(a1 + 48) usingBlock:0.0];
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F76CB8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  v8 = (void *)[v6 initWithLocale:v7];

  uint64_t v9 = [v5 localToday];

  v10 = [v8 eventRulesForLocalDate:v9];

  if ([v10 count])
  {
    v11 = [v10 firstObject];
    uint64_t v12 = [v11 name];
    graph = self->_graph;
    id v33 = @"name";
    v34[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v15 = [(MAGraph *)graph anyNodeForLabel:@"Holiday" domain:401 properties:v14];
    holidayNode = self->_holidayNode;
    self->_holidayNode = v15;

    id v17 = self->_holidayNode;
    if (v17)
    {
      id v18 = [(PGGraphHolidayNode *)v17 collection];
      __int16 v19 = [v18 celebratingMomentNodes];
      momentNodesForHoliday = self->_momentNodesForHoliday;
      self->_momentNodesForHoliday = v19;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  unint64_t v21 = [(MAElementCollection *)self->_momentNodesForHoliday count];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = self->_holidayNode;
    int v25 = 138413058;
    id v26 = self;
    __int16 v27 = 1024;
    BOOL v28 = v21 != 0;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    __int16 v31 = 2112;
    __int16 v32 = v23;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d\n\tEvent rule: %@\n\tHoliday node %@", (uint8_t *)&v25, 0x26u);
  }

  return v21 != 0;
}

- (PGHolidayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayContextualRule;
  uint64_t v12 = [(PGHolidayContextualRule *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
  }

  return v13;
}

@end