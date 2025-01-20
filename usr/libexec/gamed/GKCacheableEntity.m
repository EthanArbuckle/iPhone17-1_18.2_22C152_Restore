@interface GKCacheableEntity
+ (id)createWithBagKey:(id)a3 entityID:(id)a4 entity:(id)a5;
+ (id)createWithEntityID:(id)a3 entity:(id)a4;
- (NSString)debugDescription;
- (_TtC14GameDaemonCore17GKCacheableEntity)init;
@end

@implementation GKCacheableEntity

- (NSString)debugDescription
{
  return (NSString *)sub_100198640(self, (uint64_t)a2, (void (*)(void))sub_1001986AC);
}

+ (id)createWithEntityID:(id)a3 entity:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  v8 = (void *)sub_10019887C(v5, v7, a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

+ (id)createWithBagKey:(id)a3 entityID:(id)a4 entity:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  v12 = (void *)sub_100198968(v6, v8, v9, v11, a5);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (_TtC14GameDaemonCore17GKCacheableEntity)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end