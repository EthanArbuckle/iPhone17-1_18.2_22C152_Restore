@interface PGPublicEventFeatureSummarySource
- (PGPublicEventFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5;
- (id)summarizedFeaturesForMomentNodes:(id)a3;
@end

@implementation PGPublicEventFeatureSummarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithRelevantPublicEvent, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MAElementCollection *)self->_momentNodesWithRelevantPublicEvent collectionByIntersecting:a3];
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F76D68] appleEvents];
    v5 = [PGPublicEventSummarizedFeature alloc];
    v6 = [v3 universalDateIntervals];
    v7 = [(PGPublicEventSummarizedFeature *)v5 initWithIntervalsPresent:v6 isMandatoryForKeyAsset:0 publicEventLabel:v4];

    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (PGPublicEventFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventFeatureSummarySource;
  v12 = [(PGPublicEventFeatureSummarySource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    v14 = [(PGTitleGenerationContext *)v13->_titleGenerationContext appleEventsCategoryNodes];
    v15 = [v14 publicEventNodes];
    uint64_t v16 = [v15 momentNodes];
    momentNodesWithRelevantPublicEvent = v13->_momentNodesWithRelevantPublicEvent;
    v13->_momentNodesWithRelevantPublicEvent = (PGGraphMomentNodeCollection *)v16;
  }
  return v13;
}

@end