@interface CategorizationManager
+ (CategorizationManager)sharedInstance;
- (CategorizationManager)init;
- (void)createWebRule:(id)a3 completion:(id)a4;
- (void)getBlackPearlVersionWithCompletion:(id)a3;
- (void)getIABCategoryIDWith:(id)a3 completion:(id)a4;
- (void)invokeModelDownloadWithCompletion:(id)a3;
- (void)isModelReadyWithCompletion:(id)a3;
- (void)isPersonalDomainWith:(id)a3 completion:(id)a4;
- (void)notifyRuleListenersWithRules:(id)a3;
- (void)predictCommerceEmailWith:(id)a3 completion:(id)a4;
- (void)registerCategoryRulesCallbackListenerWithEndpoint:(id)a3 completion:(id)a4;
- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4;
- (void)start;
- (void)syncRecategorizationRules:(id)a3 completion:(id)a4;
@end

@implementation CategorizationManager

+ (CategorizationManager)sharedInstance
{
  if (qword_100063EC0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100067A40;

  return (CategorizationManager *)v2;
}

- (CategorizationManager)init
{
  return (CategorizationManager *)sub_100037F9C();
}

- (void)start
{
  v2 = self;
  sub_100038238();
}

- (void)predictCommerceEmailWith:(id)a3 completion:(id)a4
{
}

- (void)isModelReadyWithCompletion:(id)a3
{
}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
}

- (void)getIABCategoryIDWith:(id)a3 completion:(id)a4
{
}

- (void)isPersonalDomainWith:(id)a3 completion:(id)a4
{
}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
}

- (void)registerCategoryRulesCallbackListenerWithEndpoint:(id)a3 completion:(id)a4
{
}

- (void)notifyRuleListenersWithRules:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10003B910(v4);

  swift_bridgeObjectRelease();
}

- (void)syncRecategorizationRules:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_100022940(0, (unint64_t *)&qword_1000647C0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  sub_10003EAF0(v6);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createWebRule:(id)a3 completion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  sub_10003E03C((uint64_t)a3, (char *)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end