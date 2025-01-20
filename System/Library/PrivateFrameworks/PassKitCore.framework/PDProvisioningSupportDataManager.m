@interface PDProvisioningSupportDataManager
- (PDProvisioningSupportDataManager)init;
- (void)applyPostPersonalizedSupportDataIfNecessaryToPass:(id)a3;
- (void)clearKnownSupportDataOfType:(unint64_t)a3;
- (void)saveWithSupportData:(id)a3 completion:(id)a4;
@end

@implementation PDProvisioningSupportDataManager

- (void)saveWithSupportData:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1004D0810();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_1004D0898;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  _s5passd30ProvisioningSupportDataManagerC4save07supportD010completionySaySo014PKProvisioningcD0CG_ys5Error_pSgcSgtF_0(v6, (uint64_t)v5, v7);
  sub_1004D0850((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)applyPostPersonalizedSupportDataIfNecessaryToPass:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s5passd30ProvisioningSupportDataManagerC021applyPostPersonalizedcD11IfNecessary2toySo6PKPassC_tF_0(v4);
}

- (void)clearKnownSupportDataOfType:(unint64_t)a3
{
}

- (PDProvisioningSupportDataManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PDProvisioningSupportDataManager *)&v3 init];
}

@end