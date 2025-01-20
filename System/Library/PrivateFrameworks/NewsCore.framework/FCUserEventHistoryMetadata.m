@interface FCUserEventHistoryMetadata
+ (id)emptyWithSessionsOnDiskSize:(int64_t)a3 personalizationAnalyticsEnabled:(BOOL)a4;
- (FCUserEventHistoryAggregateStoreData)aggregateStoreData;
- (FCUserEventHistoryEventCounts)eventCounts;
- (FCUserEventHistoryMetadata)initWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 sessionsOnDiskSize:(int64_t)a6 standardDeviationOfEvents:(double)a7 totalEventsCount:(int64_t)a8 headlineEventCount:(int64_t)a9 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a11 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a12 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a13 eventCounts:(id)a14 aggregateStoreData:(id)a15;
- (double)meanCountOfEvents;
- (double)standardDeviationOfEvents;
- (id)description;
- (int64_t)aggregateStoreGenerationTime;
- (int64_t)aggregateTotalCount;
- (int64_t)headlineEventCount;
- (int64_t)headlinesWithInvalidBodyEmbeddingsEventCount;
- (int64_t)headlinesWithInvalidTitleEmbeddingsEventCount;
- (int64_t)headlinesWithValidBodyEmbeddingsEventCount;
- (int64_t)headlinesWithValidTitleEmbeddingsEventCount;
- (int64_t)sessionsOnDiskSize;
- (int64_t)totalEventsCount;
- (void)setAggregateStoreData:(id)a3;
- (void)setAggregateStoreGenerationTime:(int64_t)a3;
- (void)setAggregateTotalCount:(int64_t)a3;
- (void)setEventCounts:(id)a3;
- (void)setHeadlineEventCount:(int64_t)a3;
- (void)setHeadlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a3;
- (void)setHeadlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a3;
- (void)setHeadlinesWithValidBodyEmbeddingsEventCount:(int64_t)a3;
- (void)setHeadlinesWithValidTitleEmbeddingsEventCount:(int64_t)a3;
- (void)setMeanCountOfEvents:(double)a3;
- (void)setSessionsOnDiskSize:(int64_t)a3;
- (void)setStandardDeviationOfEvents:(double)a3;
- (void)setTotalEventsCount:(int64_t)a3;
@end

@implementation FCUserEventHistoryMetadata

- (id)description
{
  v20 = NSString;
  int64_t v19 = [(FCUserEventHistoryMetadata *)self aggregateStoreGenerationTime];
  int64_t v3 = [(FCUserEventHistoryMetadata *)self sessionsOnDiskSize];
  int64_t v4 = [(FCUserEventHistoryMetadata *)self aggregateTotalCount];
  [(FCUserEventHistoryMetadata *)self meanCountOfEvents];
  uint64_t v6 = v5;
  [(FCUserEventHistoryMetadata *)self standardDeviationOfEvents];
  uint64_t v8 = v7;
  int64_t v9 = [(FCUserEventHistoryMetadata *)self totalEventsCount];
  int64_t v10 = [(FCUserEventHistoryMetadata *)self headlineEventCount];
  int64_t v11 = [(FCUserEventHistoryMetadata *)self headlinesWithValidTitleEmbeddingsEventCount];
  int64_t v12 = [(FCUserEventHistoryMetadata *)self headlinesWithInvalidTitleEmbeddingsEventCount];
  int64_t v13 = [(FCUserEventHistoryMetadata *)self headlinesWithValidBodyEmbeddingsEventCount];
  int64_t v14 = [(FCUserEventHistoryMetadata *)self headlinesWithInvalidBodyEmbeddingsEventCount];
  v15 = [(FCUserEventHistoryMetadata *)self eventCounts];
  v16 = [(FCUserEventHistoryMetadata *)self aggregateStoreData];
  v17 = [v20 stringWithFormat:@"User Event History Metadata { aggregateStoreGenerationTime: %lld sessionsOnDiskSize: %lld aggregateTotalCount: %lld meanCountOfEvents: %.4f standardDeviationOfEvents: %.4f totalEventsCount: %lld headlineEventCount: %lld headlinesWithValidTitleEmbeddingsEventCount: %lld headlinesWithInvalidTitleEmbeddingsEventCount: %lld headlinesWithValidBodyEmbeddingsEventCount: %lld headlinesWithInvalidBodyEmbeddingsEventCount: %lld eventCounts: %@ aggregateStoreData: %@ }", v19, v3, v4, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16];

  return v17;
}

- (int64_t)totalEventsCount
{
  return self->_totalEventsCount;
}

- (double)standardDeviationOfEvents
{
  return self->_standardDeviationOfEvents;
}

- (int64_t)sessionsOnDiskSize
{
  return self->_sessionsOnDiskSize;
}

- (double)meanCountOfEvents
{
  return self->_meanCountOfEvents;
}

- (int64_t)headlinesWithValidTitleEmbeddingsEventCount
{
  return self->_headlinesWithValidTitleEmbeddingsEventCount;
}

- (int64_t)headlinesWithValidBodyEmbeddingsEventCount
{
  return self->_headlinesWithValidBodyEmbeddingsEventCount;
}

- (int64_t)headlinesWithInvalidTitleEmbeddingsEventCount
{
  return self->_headlinesWithInvalidTitleEmbeddingsEventCount;
}

- (int64_t)headlinesWithInvalidBodyEmbeddingsEventCount
{
  return self->_headlinesWithInvalidBodyEmbeddingsEventCount;
}

- (int64_t)headlineEventCount
{
  return self->_headlineEventCount;
}

- (FCUserEventHistoryEventCounts)eventCounts
{
  return self->_eventCounts;
}

- (int64_t)aggregateTotalCount
{
  return self->_aggregateTotalCount;
}

- (int64_t)aggregateStoreGenerationTime
{
  return self->_aggregateStoreGenerationTime;
}

- (FCUserEventHistoryAggregateStoreData)aggregateStoreData
{
  return self->_aggregateStoreData;
}

- (FCUserEventHistoryMetadata)initWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 sessionsOnDiskSize:(int64_t)a6 standardDeviationOfEvents:(double)a7 totalEventsCount:(int64_t)a8 headlineEventCount:(int64_t)a9 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a11 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a12 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a13 eventCounts:(id)a14 aggregateStoreData:(id)a15
{
  id v23 = a14;
  id v24 = a15;
  v29.receiver = self;
  v29.super_class = (Class)FCUserEventHistoryMetadata;
  v25 = [(FCUserEventHistoryMetadata *)&v29 init];
  v26 = v25;
  if (v25)
  {
    v25->_sessionsOnDiskSize = a6;
    v25->_aggregateStoreGenerationTime = a3;
    v25->_aggregateTotalCount = a4;
    v25->_meanCountOfEvents = a5;
    v25->_standardDeviationOfEvents = a7;
    v25->_totalEventsCount = a8;
    v25->_headlineEventCount = a9;
    v25->_headlinesWithValidTitleEmbeddingsEventCount = a10;
    v25->_headlinesWithInvalidTitleEmbeddingsEventCount = a11;
    v25->_headlinesWithValidBodyEmbeddingsEventCount = a12;
    v25->_headlinesWithInvalidBodyEmbeddingsEventCount = a13;
    objc_storeStrong((id *)&v25->_eventCounts, a14);
    objc_storeStrong((id *)&v26->_aggregateStoreData, a15);
  }

  return v26;
}

+ (id)emptyWithSessionsOnDiskSize:(int64_t)a3 personalizationAnalyticsEnabled:(BOOL)a4
{
  id v6 = objc_alloc((Class)a1);
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = +[FCUserEventHistoryEventCounts empty];
    int64_t v9 = +[FCUserEventHistoryAggregateStoreData empty];
    int64_t v10 = (void *)[v7 initWithAggregateStoreGenerationTime:-1 aggregateTotalCount:-1 meanCountOfEvents:a3 sessionsOnDiskSize:-1 standardDeviationOfEvents:-1 totalEventsCount:-1 headlineEventCount:-1.0 headlinesWithValidTitleEmbeddingsEventCount:-1.0 headlinesWithInvalidTitleEmbeddingsEventCount:-1 headlinesWithValidBodyEmbeddingsEventCount:-1 headlinesWithInvalidBodyEmbeddingsEventCount:-1 eventCounts:v8 aggregateStoreData:v9];
  }
  else
  {
    int64_t v10 = (void *)[v6 initWithAggregateStoreGenerationTime:-1 aggregateTotalCount:-1 meanCountOfEvents:a3 sessionsOnDiskSize:-1 standardDeviationOfEvents:-1 totalEventsCount:-1 headlineEventCount:-1.0 headlinesWithValidTitleEmbeddingsEventCount:-1.0 headlinesWithInvalidTitleEmbeddingsEventCount:-1 headlinesWithValidBodyEmbeddingsEventCount:-1 headlinesWithInvalidBodyEmbeddingsEventCount:-1 eventCounts:0 aggregateStoreData:0];
  }
  return v10;
}

- (void)setAggregateStoreGenerationTime:(int64_t)a3
{
  self->_aggregateStoreGenerationTime = a3;
}

- (void)setAggregateTotalCount:(int64_t)a3
{
  self->_aggregateTotalCount = a3;
}

- (void)setMeanCountOfEvents:(double)a3
{
  self->_meanCountOfEvents = a3;
}

- (void)setSessionsOnDiskSize:(int64_t)a3
{
  self->_sessionsOnDiskSize = a3;
}

- (void)setStandardDeviationOfEvents:(double)a3
{
  self->_standardDeviationOfEvents = a3;
}

- (void)setTotalEventsCount:(int64_t)a3
{
  self->_totalEventsCount = a3;
}

- (void)setHeadlineEventCount:(int64_t)a3
{
  self->_headlineEventCount = a3;
}

- (void)setHeadlinesWithValidTitleEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithValidTitleEmbeddingsEventCount = a3;
}

- (void)setHeadlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithInvalidTitleEmbeddingsEventCount = a3;
}

- (void)setHeadlinesWithValidBodyEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithValidBodyEmbeddingsEventCount = a3;
}

- (void)setHeadlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a3
{
  self->_headlinesWithInvalidBodyEmbeddingsEventCount = a3;
}

- (void)setEventCounts:(id)a3
{
}

- (void)setAggregateStoreData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateStoreData, 0);
  objc_storeStrong((id *)&self->_eventCounts, 0);
}

@end