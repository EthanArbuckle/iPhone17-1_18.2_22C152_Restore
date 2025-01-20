@interface SiriInvocationAnalyticsUtils
- (_TtC29SiriInvocationAnalyticsPlugin28SiriInvocationAnalyticsUtils)init;
- (_TtC29SiriInvocationAnalyticsPlugin28SiriInvocationAnalyticsUtils)initWithTrialClient:(id)a3;
- (void)gradeSiriMissesWithTurnType:(NSString *)a3 streamsBookmarkName:(NSString *)a4 syncBookmarkWrite:(BOOL)a5 includeIdsInOutput:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation SiriInvocationAnalyticsUtils

- (_TtC29SiriInvocationAnalyticsPlugin28SiriInvocationAnalyticsUtils)initWithTrialClient:(id)a3
{
  id v4 = a3;
  return (_TtC29SiriInvocationAnalyticsPlugin28SiriInvocationAnalyticsUtils *)SiriInvocationAnalyticsUtils.init(trialClient:)(a3);
}

- (void)gradeSiriMissesWithTurnType:(NSString *)a3 streamsBookmarkName:(NSString *)a4 syncBookmarkWrite:(BOOL)a5 includeIdsInOutput:(BOOL)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(unsigned char *)(v13 + 32) = a5;
  *(unsigned char *)(v13 + 33) = a6;
  *(void *)(v13 + 40) = v12;
  *(void *)(v13 + 48) = self;
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_1000070DC((uint64_t)&unk_100011B20, v13);
}

- (_TtC29SiriInvocationAnalyticsPlugin28SiriInvocationAnalyticsUtils)init
{
}

@end