@interface THKOnDemandUtils
- (_TtC17THKOnDemandPlugin16THKOnDemandUtils)init;
- (_TtC17THKOnDemandPlugin16THKOnDemandUtils)initWithTrialClient:(id)a3;
- (void)runThkAnalyticsWithTurnType:(NSString *)a3 thkTaskEvents:(NSArray *)a4 isThkEventsOrdered:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation THKOnDemandUtils

- (_TtC17THKOnDemandPlugin16THKOnDemandUtils)initWithTrialClient:(id)a3
{
  id v4 = a3;
  return (_TtC17THKOnDemandPlugin16THKOnDemandUtils *)THKOnDemandUtils.init(trialClient:)(a3);
}

- (void)runThkAnalyticsWithTurnType:(NSString *)a3 thkTaskEvents:(NSArray *)a4 isThkEventsOrdered:(BOOL)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = a4;
  *(unsigned char *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1000060CC((uint64_t)&unk_1000111C8, v11);
}

- (_TtC17THKOnDemandPlugin16THKOnDemandUtils)init
{
}

@end