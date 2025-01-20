@interface RDCoreDataCoreSpotlightDelegate
+ (void)deleteAllIndicesIfVersionOutdatedWithCompletionHandler:(id)a3;
- (BOOL)shouldStart;
- (id)attributeSetForObject:(id)a3;
- (id)bundleIdentifier;
- (id)indexName;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4;
- (id)protectionClass;
- (void)deleteAllIndicesWithCompletionHandler:(id)a3;
- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4;
- (void)setShouldStart:(BOOL)a3;
@end

@implementation RDCoreDataCoreSpotlightDelegate

- (id)indexName
{
  return sub_10017AB20();
}

- (id)bundleIdentifier
{
  return sub_10017AB20();
}

- (id)protectionClass
{
  v2 = self;
  uint64_t v3 = static NSFileProtectionType.rem_spotlightIndexFileProtection.getter();
  if (v3)
  {
    v4 = (void *)v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return v5;
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  v6 = (void *)sub_10017AC64(v4);

  return v6;
}

+ (void)deleteAllIndicesIfVersionOutdatedWithCompletionHandler:(id)a3
{
  uint64_t v3 = (uint64_t (*)())_Block_copy(a3);
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    uint64_t v3 = sub_10011FBC8;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_100180958((void (*)(void))v3, v4);

  sub_100096314((uint64_t)v3);
}

- (void)deleteAllIndicesWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10017F9AC((uint64_t)sub_10011C2EC, v5);

  swift_release();
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_10011FCF0;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_10017FB88((uint64_t)v7, v6);
  sub_100096314((uint64_t)v7);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v5 = sub_10011DEA0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_10017FDA0(v6, (uint64_t)v5, v7);
  sub_100096314((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (BOOL)shouldStart
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart);
}

- (void)setShouldStart:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart) = a3;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate____lazy_storage___contactStore) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate_shouldStart) = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RDCoreDataCoreSpotlightDelegate();
  return [(RDCoreDataCoreSpotlightDelegate *)&v7 initForStoreWithDescription:a3 coordinator:a4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7remindd31RDCoreDataCoreSpotlightDelegate____lazy_storage___contactStore));
}

@end