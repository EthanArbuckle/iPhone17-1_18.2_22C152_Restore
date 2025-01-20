@interface PGHolidayDateFeatureSummarySource
- (PGHolidayDateFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5;
- (id)summarizedFeaturesForMomentNodes:(id)a3;
@end

@implementation PGHolidayDateFeatureSummarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dateNodes];
  if (![v5 count]
    || ([v4 celebratedHolidayNodes],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
  v9 = [v5 set];
  id v21 = 0;
  BOOL v10 = +[PGCommonTitleUtility containsCelebrationForDateNodes:v9 holidayName:&v21 titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
  id v11 = v21;

  if (!v10) {
    goto LABEL_9;
  }
  if (!v11)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "Date %@ contains celebration but holiday name is nil", buf, 0xCu);
    }
LABEL_9:
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  v12 = +[PGGraphHolidayNodeCollection holidayNodesWithName:v11 inGraph:self->_graph];
  v13 = [v12 dateNodes];
  v14 = [v13 momentNodes];
  v15 = [v14 collectionByIntersecting:v4];

  v16 = [PGHolidayDateSummarizedFeature alloc];
  v17 = [v15 universalDateIntervals];
  v18 = [(PGHolidayDateSummarizedFeature *)v16 initWithIntervalsPresent:v17 isMandatoryForKeyAsset:0 holidayName:v11];

  v22 = v18;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

LABEL_10:
LABEL_11:

  return v8;
}

- (PGHolidayDateFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayDateFeatureSummarySource;
  v12 = [(PGHolidayDateFeatureSummarySource *)&v15 init];
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