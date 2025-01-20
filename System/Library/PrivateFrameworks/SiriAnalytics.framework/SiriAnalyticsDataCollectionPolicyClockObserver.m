@interface SiriAnalyticsDataCollectionPolicyClockObserver
- (SiriAnalyticsDataCollectionPolicyClockObserver)init;
- (SiriAnalyticsDataCollectionPolicyClockObserver)initWithSiriConfiguration:(id)a3 metastore:(id)a4 metastoreQueue:(id)a5;
- (void)rootClockCreatedWithClockIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SiriAnalyticsDataCollectionPolicyClockObserver

- (SiriAnalyticsDataCollectionPolicyClockObserver)initWithSiriConfiguration:(id)a3 metastore:(id)a4 metastoreQueue:(id)a5
{
  return (SiriAnalyticsDataCollectionPolicyClockObserver *)DataCollectionPolicyClockObserver.init(siriConfiguration:metastore:metastoreQueue:)((uint64_t)a3, a4, a5);
}

- (void)rootClockCreatedWithClockIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1A2C0CE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1A2C0CE00();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_1A2BAE498((uint64_t)v9, (uint64_t)sub_1A2BAEE38, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (SiriAnalyticsDataCollectionPolicyClockObserver)init
{
}

- (void).cxx_destruct
{
}

@end