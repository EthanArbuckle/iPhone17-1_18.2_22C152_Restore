@interface PersonalizedFavoriteItemSource
- (NSArray)allItems;
- (NSArray)storeSubscriptionTypes;
- (_TtC4Maps30PersonalizedFavoriteItemSource)init;
- (_TtC4Maps30PersonalizedFavoriteItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4;
- (void)dealloc;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation PersonalizedFavoriteItemSource

- (NSArray)allItems
{
  v2 = self;
  sub_1000FF33C(&qword_1015D52E0);
  OS_dispatch_queue.sync<A>(execute:)();

  sub_1000FF33C(&qword_1015D52E8);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC4Maps30PersonalizedFavoriteItemSource)init
{
  return (_TtC4Maps30PersonalizedFavoriteItemSource *)sub_10005F690();
}

- (NSArray)storeSubscriptionTypes
{
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_storeSubscriptionTypes) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for MapsSyncStore();
  v4 = self;
  v5 = (void *)static MapsSyncStore.sharedStore.getter();
  v6 = v4;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)();

  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(PersonalizedFavoriteItemSource *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource____lazy_storage___updateQueue));

  NSArray v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_queryQueue);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  NSArray v3 = self;
  sub_10003A4B4();
}

- (_TtC4Maps30PersonalizedFavoriteItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  result = (_TtC4Maps30PersonalizedFavoriteItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end