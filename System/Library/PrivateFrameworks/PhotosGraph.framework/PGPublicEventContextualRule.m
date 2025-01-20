@interface PGPublicEventContextualRule
- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3;
- (PGPublicEventContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5;
- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5;
- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8;
@end

@implementation PGPublicEventContextualRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_momentNodesMatchingPublicEvents, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5
{
  uint64_t v5 = a4;
  v7 = +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:a3 withOptions:a5];
  v8 = [v7 dateByAddingTimeInterval:-1209600.0];
  v9 = [v7 dateByAddingTimeInterval:1209600.0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
  v11 = [(PGGraphMomentNodeCollection *)self->_momentNodesMatchingPublicEvents subsetForLocalDateInterval:v10];
  v12 = [v11 highlightNodes];
  v13 = +[PGHighlightEnrichmentUtilities filteredHighlightNodesWithHighlightNodes:v12 forSharingFilter:v5];

  return v13;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18
    && [(MAElementCollection *)self->_publicEventNodes count]
    && [(MAElementCollection *)self->_momentNodesMatchingPublicEvents count])
  {
    v19 = [(PGPublicEventContextualRule *)self highlightNodesMatchingYearHighlight:v14 sharingFilter:v12 withOptions:v15];
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      publicEventNodes = self->_publicEventNodes;
      v22 = loggingConnection;
      *(_DWORD *)buf = 138412802;
      v32 = publicEventNodes;
      __int16 v33 = 2048;
      uint64_t v34 = [v19 count];
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Public event nodes %@ matched %tu highlight nodes for year %@", buf, 0x20u);
    }
    v23 = +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:v14 withOptions:v15];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __141__PGPublicEventContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
    v25[3] = &unk_1E68E99E8;
    id v26 = v23;
    __int16 v30 = v12;
    id v27 = v14;
    v28 = self;
    id v29 = v18;
    id v24 = v23;
    [v19 enumerateNodesUsingBlock:v25];
  }
}

void __141__PGPublicEventContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 localStartDate];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v5 = fabs(v4);

  if (v5 / 86400.0 <= 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = 1.0 / (v5 / 86400.0);
  }
  +[PGContextualRuleUtils returnContextualKeyAssetForHighlightNode:v7 yearHighlight:*(void *)(a1 + 40) sharingFilter:*(unsigned __int16 *)(a1 + 64) score:*(void *)(*(void *)(a1 + 48) + 32) inPhotoLibrary:*(void *)(*(void *)(a1 + 48) + 40) loggingConnection:*(void *)(a1 + 56) usingBlock:v6];
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 localToday];
  double v5 = +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:v4 inGraph:self->_graph];
  double v6 = [v5 dateNodes];
  id v7 = [v6 momentNodes];

  v8 = [v7 publicEventNodes];
  int v32 = [v8 isEmpty];
  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  v10 = [v4 dateByAddingTimeInterval:-172800.0];
  v11 = (void *)[v9 initWithStartDate:v10 endDate:v4];

  uint64_t v12 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v11 inGraph:self->_graph];
  v13 = [v12 publicEventNodes];
  int v31 = [v13 isEmpty];
  id v14 = [v8 collectionByFormingUnionWith:v13];
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v14;

  unint64_t v16 = [(MAElementCollection *)self->_publicEventNodes count];
  if (v16)
  {
    id v17 = [(PGGraphPublicEventNodeCollection *)self->_publicEventNodes categoryNodes];
    [v17 labels];
    __int16 v30 = v4;
    id v18 = v8;
    v19 = v12;
    v20 = v11;
    v21 = v7;
    v23 = v22 = v5;

    id v24 = +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:v23 inGraph:self->_graph];
    v25 = [v24 momentNodes];
    momentNodesMatchingPublicEvents = self->_momentNodesMatchingPublicEvents;
    self->_momentNodesMatchingPublicEvents = v25;

    double v5 = v22;
    id v7 = v21;
    v11 = v20;
    uint64_t v12 = v19;
    v8 = v18;
    double v4 = v30;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->_publicEventNodes;
    *(_DWORD *)buf = 138413314;
    uint64_t v34 = self;
    __int16 v35 = 1024;
    BOOL v36 = v16 != 0;
    __int16 v37 = 2112;
    v38 = v28;
    __int16 v39 = 1024;
    int v40 = v31 ^ 1;
    __int16 v41 = 1024;
    int v42 = v32 ^ 1;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d\n\tMatched public events: %@\n\tRecently at public event: %d\n\tMatched on this day public event: %d", buf, 0x28u);
  }

  return v16 != 0;
}

- (PGPublicEventContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPublicEventContextualRule;
  uint64_t v12 = [(PGPublicEventContextualRule *)&v15 init];
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