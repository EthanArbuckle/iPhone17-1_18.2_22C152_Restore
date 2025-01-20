@interface PGMeaningFeatureSummarySource
- (PGMeaningFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5;
- (id)summarizedFeaturesForMomentNodes:(id)a3;
@end

@implementation PGMeaningFeatureSummarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 temporarySet];
  v6 = +[PGHighlightTitleGenerator commonMeaningLabelForTitleUsingMomentNodes:v5];
  if (v6)
  {
    v7 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
    int v8 = [v7 containsObject:v6];

    if (v8)
    {
      if (+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents])
      {
        [v6 isEqualToString:@"HolidayEvent"];
LABEL_5:
        v20[0] = v6;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        v10 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v9 inGraph:self->_graph];

        v11 = [v10 momentNodes];
        v12 = [v11 collectionByIntersecting:v4];

        v13 = [PGMeaningSummarizedFeature alloc];
        v14 = [v12 universalDateIntervals];
        v15 = [(PGMeaningSummarizedFeature *)v13 initWithIntervalsPresent:v14 isMandatoryForKeyAsset:0 meaningLabel:v6];

        v19 = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

        goto LABEL_9;
      }
      BOOL v17 = +[PGUserDefaults isShowingHolidayCalendarEvents];
      if (![v6 isEqualToString:@"HolidayEvent"] || v17) {
        goto LABEL_5;
      }
    }
  }
  v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:

  return v16;
}

- (PGMeaningFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningFeatureSummarySource;
  v12 = [(PGMeaningFeatureSummarySource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
  }

  return v13;
}

@end