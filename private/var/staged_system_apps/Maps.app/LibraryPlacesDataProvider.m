@interface LibraryPlacesDataProvider
- (NSArray)storeSubscriptionTypes;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation LibraryPlacesDataProvider

- (NSArray)storeSubscriptionTypes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  *(void *)&self->storeSubscriptionTypes[7] = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v3 = *(void *)&self->lastUsedSearchTerm[7];
  unint64_t v4 = *(void *)&self->lastUsedSearchTerm[15];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1002FF428(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

@end