@interface REMNSPersistentHistoryTracking
- (_TtC7remindd30REMNSPersistentHistoryTracking)init;
- (id)_accountIdentifierForPersistenceStoreID:(id)a3;
- (id)_persistenceStoreForAccountID:(id)a3;
- (id)_persistenceStoresForAccountTypes:(id)a3;
- (void)withManagedObjectContext:(id)a3;
@end

@implementation REMNSPersistentHistoryTracking

- (void)withManagedObjectContext:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1002437CC((uint64_t)sub_100243D7C, v5);

  swift_release();
}

- (id)_accountIdentifierForPersistenceStoreID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  uint64_t v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v4 accountIdentifierForStoreID:v6];

  if (v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRelease();
    NSString v8 = String._bridgeToObjectiveC()();
  }
  else
  {

    NSString v8 = 0;
  }
  swift_bridgeObjectRelease();

  return v8;
}

- (id)_persistenceStoreForAccountID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  uint64_t v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v4 storeForAccountIdentifier:v6];

  swift_bridgeObjectRelease();

  return v7;
}

- (id)_persistenceStoresForAccountTypes:(id)a3
{
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController);
  uint64_t v5 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  id v7 = [v4 storesForAccountTypes:isa];

  sub_100243D04();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
  v8.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (_TtC7remindd30REMNSPersistentHistoryTracking)init
{
  result = (_TtC7remindd30REMNSPersistentHistoryTracking *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7remindd30REMNSPersistentHistoryTracking_storeController));
}

@end