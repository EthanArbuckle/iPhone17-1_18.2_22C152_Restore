@interface TPSFullTipUsageEventManager
- (TPSFullTipUsageEventManager)init;
- (id)contextualInfoForIdentifier:(id)a3;
- (id)contextualInfoMap;
- (void)removeUsageEventCache;
- (void)updateContextualInfoForIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5;
@end

@implementation TPSFullTipUsageEventManager

- (void)updateContextualInfoForIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5
{
  uint64_t v8 = sub_1E451B948();
  if (a4) {
    a4 = (id)sub_1E451B818();
  }
  if (a5) {
    LOBYTE(a5) = sub_1E451B818();
  }
  v9 = self;
  v11.value._rawValue = a4;
  v11.is_nil = (char)a5;
  TPSFullTipUsageEventManager.updateContextualInfo(for:tipsDeliveryInfoMap:deliveryInfoMap:)((Swift::OpaquePointer)v8, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)contextualInfoForIdentifier:(id)a3
{
  sub_1E451B868();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48470);
  sub_1E451BAD8();

  swift_bridgeObjectRelease();

  return v6;
}

- (id)contextualInfoMap
{
  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5848);
  sub_1E451BAD8();

  sub_1E449AE1C(0, &qword_1EBFF58C0);
  v3 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)removeUsageEventCache
{
  v2 = self;
  TPSFullTipUsageEventManager.removeUsageEventCache()();
}

- (TPSFullTipUsageEventManager)init
{
  return (TPSFullTipUsageEventManager *)TPSFullTipUsageEventManager.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
}

@end