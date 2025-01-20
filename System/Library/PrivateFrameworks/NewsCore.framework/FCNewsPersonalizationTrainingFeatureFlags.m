@interface FCNewsPersonalizationTrainingFeatureFlags
- (BOOL)enableSingleLifetimeSeenEventPerArticle;
- (BOOL)enableSyntheticTagFollowEvents;
- (FCNewsPersonalizationTrainingFeatureFlags)initWithDictionary:(id)a3;
- (NSNumber)eventLimit;
- (NSNumber)uniqueAggregateLimit;
- (id)description;
- (int64_t)readingHistoryItemCountToProcess;
- (void)setEnableSingleLifetimeSeenEventPerArticle:(BOOL)a3;
- (void)setEnableSyntheticTagFollowEvents:(BOOL)a3;
- (void)setEventLimit:(id)a3;
- (void)setReadingHistoryItemCountToProcess:(int64_t)a3;
- (void)setUniqueAggregateLimit:(id)a3;
@end

@implementation FCNewsPersonalizationTrainingFeatureFlags

- (BOOL)enableSingleLifetimeSeenEventPerArticle
{
  return self->_enableSingleLifetimeSeenEventPerArticle;
}

- (FCNewsPersonalizationTrainingFeatureFlags)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCNewsPersonalizationTrainingFeatureFlags;
  v5 = [(FCNewsPersonalizationTrainingFeatureFlags *)&v11 init];
  if (v5)
  {
    v5->_enableSingleLifetimeSeenEventPerArticle = FCAppConfigurationBoolValue(v4, @"enableSingleLifetimeSeenEventPerArticle", 0);
    v5->_enableSyntheticTagFollowEvents = FCAppConfigurationBoolValue(v4, @"enableSyntheticTagFollowEvents", 0);
    v5->_readingHistoryItemCountToProcess = FCAppConfigurationIntegerValue(v4, @"readingHistoryItemCountToProcess", 0);
    uint64_t v6 = FCAppConfigurationNumberValue(v4, @"uniqueAggregateLimit", 0);
    uniqueAggregateLimit = v5->_uniqueAggregateLimit;
    v5->_uniqueAggregateLimit = (NSNumber *)v6;

    uint64_t v8 = FCAppConfigurationNumberValue(v4, @"eventLimit", 0);
    eventLimit = v5->_eventLimit;
    v5->_eventLimit = (NSNumber *)v8;
  }
  return v5;
}

- (NSNumber)uniqueAggregateLimit
{
  return self->_uniqueAggregateLimit;
}

- (int64_t)readingHistoryItemCountToProcess
{
  return self->_readingHistoryItemCountToProcess;
}

- (NSNumber)eventLimit
{
  return self->_eventLimit;
}

- (BOOL)enableSyntheticTagFollowEvents
{
  return self->_enableSyntheticTagFollowEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLimit, 0);
  objc_storeStrong((id *)&self->_uniqueAggregateLimit, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; enableSingleLifetimeSeenEventPerArticle: %d",
    [(FCNewsPersonalizationTrainingFeatureFlags *)self enableSingleLifetimeSeenEventPerArticle]);
  objc_msgSend(v3, "appendFormat:", @"; enableSyntheticTagFollowEvents: %d",
    [(FCNewsPersonalizationTrainingFeatureFlags *)self enableSyntheticTagFollowEvents]);
  objc_msgSend(v3, "appendFormat:", @"; readingHistoryItemCountToProcess: %llu",
    [(FCNewsPersonalizationTrainingFeatureFlags *)self readingHistoryItemCountToProcess]);
  id v4 = [(FCNewsPersonalizationTrainingFeatureFlags *)self uniqueAggregateLimit];
  [v3 appendFormat:@"; uniqueAggregateLimit: %@", v4];

  v5 = [(FCNewsPersonalizationTrainingFeatureFlags *)self eventLimit];
  [v3 appendFormat:@"; eventLimit: %@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (void)setEnableSingleLifetimeSeenEventPerArticle:(BOOL)a3
{
  self->_enableSingleLifetimeSeenEventPerArticle = a3;
}

- (void)setEnableSyntheticTagFollowEvents:(BOOL)a3
{
  self->_enableSyntheticTagFollowEvents = a3;
}

- (void)setReadingHistoryItemCountToProcess:(int64_t)a3
{
  self->_readingHistoryItemCountToProcess = a3;
}

- (void)setUniqueAggregateLimit:(id)a3
{
}

- (void)setEventLimit:(id)a3
{
}

@end