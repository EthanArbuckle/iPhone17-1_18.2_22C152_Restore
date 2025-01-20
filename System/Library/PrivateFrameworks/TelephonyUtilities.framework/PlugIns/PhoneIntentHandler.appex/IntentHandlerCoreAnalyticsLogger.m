@interface IntentHandlerCoreAnalyticsLogger
- (void)logSiriMatchEvent:(id)a3 matchesByIdCount:(id)a4 matchesByNameCount:(id)a5 siriLocale:(id)a6;
@end

@implementation IntentHandlerCoreAnalyticsLogger

- (void)logSiriMatchEvent:(id)a3 matchesByIdCount:(id)a4 matchesByNameCount:(id)a5 siriLocale:(id)a6
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v9 = v16;
  id v10 = v15;
  id v11 = v14;
  id v12 = v13;
  AnalyticsSendEventLazy();
}

@end