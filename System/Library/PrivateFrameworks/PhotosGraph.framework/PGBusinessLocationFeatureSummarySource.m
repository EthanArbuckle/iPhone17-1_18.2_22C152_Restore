@interface PGBusinessLocationFeatureSummarySource
- (PGBusinessLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5;
- (id)summarizedBusinessNodesForMomentNode:(id)a3;
- (id)summarizedFeaturesForMomentNodes:(id)a3;
@end

@implementation PGBusinessLocationFeatureSummarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (id)summarizedBusinessNodesForMomentNode:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGLocationTitleUtility businessNodeForTitlingFromMomentNodes:v4 businessNodesByMomentNode:self->_businessNodesByMomentNode];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 collection];
    v8 = +[PGGraphEdgeCollection edgesFromNodes:v4 toNodes:v7];

    v9 = [v8 anyEdge];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 universalStartDate];
      uint64_t v12 = [v10 universalEndDate];
      v13 = (void *)v12;
      if (v11) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
        {
          v16 = loggingConnection;
          *(_DWORD *)buf = 134217984;
          uint64_t v24 = [v6 muid];
          _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGBusinessLocationFeatureSummarySource] No start and end date found for business edge for business node %llu", buf, 0xCu);
        }
        v20 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v12];
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v17, 0);
        v19 = [[PGBusinessLocationSummarizedFeature alloc] initWithIntervalsPresent:v18 isMandatoryForKeyAsset:1 businessNode:v6];
        v22 = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PGBusinessLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke;
  v11[3] = &unk_1E68E5A60;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateIdentifiersAsCollectionsWithBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

void __75__PGBusinessLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "summarizedBusinessNodesForMomentNode:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObjectsFromArray:v2];
}

- (PGBusinessLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGBusinessLocationFeatureSummarySource;
  id v12 = [(PGBusinessLocationFeatureSummarySource *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    BOOL v14 = (void *)MEMORY[0x1E4F71E88];
    v15 = +[PGGraphNodeCollection nodesInGraph:v11];
    v16 = +[PGGraphBusinessNode momentOfBusiness];
    v17 = [v14 adjacencyWithSources:v15 relation:v16 targetsClass:objc_opt_class()];

    uint64_t v18 = [v17 transposed];
    businessNodesByMomentNode = v13->_businessNodesByMomentNode;
    v13->_businessNodesByMomentNode = (MABinaryAdjacency *)v18;
  }
  return v13;
}

@end