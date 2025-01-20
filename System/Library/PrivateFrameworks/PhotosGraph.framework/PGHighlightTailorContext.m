@interface PGHighlightTailorContext
- (CLSCurationContext)curationContext;
- (OS_os_log)loggingConnection;
- (PGBusinessLocationFeatureSummarySource)businessFeatureSummarySource;
- (PGHighlightTailorContext)initWithPhotoLibrary:(id)a3 graph:(id)a4 serviceManager:(id)a5 loggingConnection:(id)a6;
- (PGHolidayDateFeatureSummarySource)holidayDateFeatureSummarySource;
- (PGLocationFeatureSummarySource)locationFeatureSummarySource;
- (PGMeaningFeatureSummarySource)meaningFeatureSummarySource;
- (PGNeighborScoreComputer)neighborScoreComputer;
- (PGPublicEventFeatureSummarySource)publicEventFeatureSummarySource;
- (PGTitleGenerationContext)titleGenerationContext;
- (PHPhotoLibrary)photoLibrary;
- (double)topTierAestheticScore;
- (id)initForTesting;
- (unsigned)pendingEnrichmentStateForHighlightUUID:(id)a3;
- (void)savePendingEnrichmentState:(unsigned __int16)a3 forHighlightUUID:(id)a4;
@end

@implementation PGHighlightTailorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayDateFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_publicEventFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_businessFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_meaningFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_locationFeatureSummarySource, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pendingEnrichmentStateByHighlightUUID, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (double)topTierAestheticScore
{
  return self->_topTierAestheticScore;
}

- (PGTitleGenerationContext)titleGenerationContext
{
  return (PGTitleGenerationContext *)objc_getProperty(self, a2, 56, 1);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (CLSCurationContext)curationContext
{
  return (CLSCurationContext *)objc_getProperty(self, a2, 40, 1);
}

- (PGNeighborScoreComputer)neighborScoreComputer
{
  return (PGNeighborScoreComputer *)objc_getProperty(self, a2, 32, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)savePendingEnrichmentState:(unsigned __int16)a3 forHighlightUUID:(id)a4
{
  uint64_t v4 = a3;
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)self->_pendingEnrichmentStateByHighlightUUID setObject:v8 forKeyedSubscript:v7];
}

- (unsigned)pendingEnrichmentStateForHighlightUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_pendingEnrichmentStateByHighlightUUID objectForKeyedSubscript:a3];
  unsigned __int16 v4 = [v3 unsignedShortValue];

  return v4;
}

- (PGHolidayDateFeatureSummarySource)holidayDateFeatureSummarySource
{
  holidayDateFeatureSummarySource = self->_holidayDateFeatureSummarySource;
  if (!holidayDateFeatureSummarySource)
  {
    unsigned __int16 v4 = [[PGHolidayDateFeatureSummarySource alloc] initWithLoggingConnection:self->_loggingConnection titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
    v5 = self->_holidayDateFeatureSummarySource;
    self->_holidayDateFeatureSummarySource = v4;

    holidayDateFeatureSummarySource = self->_holidayDateFeatureSummarySource;
  }
  return holidayDateFeatureSummarySource;
}

- (PGPublicEventFeatureSummarySource)publicEventFeatureSummarySource
{
  publicEventFeatureSummarySource = self->_publicEventFeatureSummarySource;
  if (!publicEventFeatureSummarySource)
  {
    unsigned __int16 v4 = [[PGPublicEventFeatureSummarySource alloc] initWithLoggingConnection:self->_loggingConnection titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
    v5 = self->_publicEventFeatureSummarySource;
    self->_publicEventFeatureSummarySource = v4;

    publicEventFeatureSummarySource = self->_publicEventFeatureSummarySource;
  }
  return publicEventFeatureSummarySource;
}

- (PGBusinessLocationFeatureSummarySource)businessFeatureSummarySource
{
  businessFeatureSummarySource = self->_businessFeatureSummarySource;
  if (!businessFeatureSummarySource)
  {
    unsigned __int16 v4 = [[PGBusinessLocationFeatureSummarySource alloc] initWithLoggingConnection:self->_loggingConnection titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
    v5 = self->_businessFeatureSummarySource;
    self->_businessFeatureSummarySource = v4;

    businessFeatureSummarySource = self->_businessFeatureSummarySource;
  }
  return businessFeatureSummarySource;
}

- (PGMeaningFeatureSummarySource)meaningFeatureSummarySource
{
  meaningFeatureSummarySource = self->_meaningFeatureSummarySource;
  if (!meaningFeatureSummarySource)
  {
    unsigned __int16 v4 = [[PGMeaningFeatureSummarySource alloc] initWithLoggingConnection:self->_loggingConnection titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
    v5 = self->_meaningFeatureSummarySource;
    self->_meaningFeatureSummarySource = v4;

    meaningFeatureSummarySource = self->_meaningFeatureSummarySource;
  }
  return meaningFeatureSummarySource;
}

- (PGLocationFeatureSummarySource)locationFeatureSummarySource
{
  locationFeatureSummarySource = self->_locationFeatureSummarySource;
  if (!locationFeatureSummarySource)
  {
    unsigned __int16 v4 = [[PGLocationFeatureSummarySource alloc] initWithLoggingConnection:self->_loggingConnection titleGenerationContext:self->_titleGenerationContext graph:self->_graph];
    v5 = self->_locationFeatureSummarySource;
    self->_locationFeatureSummarySource = v4;

    locationFeatureSummarySource = self->_locationFeatureSummarySource;
  }
  return locationFeatureSummarySource;
}

- (id)initForTesting
{
  v6.receiver = self;
  v6.super_class = (Class)PGHighlightTailorContext;
  v2 = [(PGHighlightTailorContext *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v2->_neighborScoreComputer;
    v2->_neighborScoreComputer = v3;
  }
  return v2;
}

- (PGHighlightTailorContext)initWithPhotoLibrary:(id)a3 graph:(id)a4 serviceManager:(id)a5 loggingConnection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PGHighlightTailorContext;
  v15 = [(PGHighlightTailorContext *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    v17 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v16->_neighborScoreComputer;
    v16->_neighborScoreComputer = v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v16->_photoLibrary];
    curationContext = v16->_curationContext;
    v16->_curationContext = (CLSCurationContext *)v19;

    objc_storeStrong((id *)&v16->_loggingConnection, a6);
    v21 = [[PGTitleGenerationContext alloc] initWithGraph:v12 serviceManager:v13];
    titleGenerationContext = v16->_titleGenerationContext;
    v16->_titleGenerationContext = v21;

    v23 = [v12 infoNode];
    [v23 topTierAestheticScore];
    v16->_topTierAestheticScore = v24;

    objc_storeStrong((id *)&v16->_graph, a4);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingEnrichmentStateByHighlightUUID = v16->_pendingEnrichmentStateByHighlightUUID;
    v16->_pendingEnrichmentStateByHighlightUUID = v25;
  }
  return v16;
}

@end