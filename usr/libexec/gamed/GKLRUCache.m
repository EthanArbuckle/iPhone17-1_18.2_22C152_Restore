@interface GKLRUCache
- (_TtC14GameDaemonCore10GKLRUCache)init;
- (_TtC14GameDaemonCore10GKLRUCache)initWithCapacity:(int64_t)a3;
- (id)getValueForKey:(id)a3;
- (void)clear;
- (void)insertValue:(id)a3 forKey:(id)a4;
@end

@implementation GKLRUCache

- (_TtC14GameDaemonCore10GKLRUCache)initWithCapacity:(int64_t)a3
{
  return (_TtC14GameDaemonCore10GKLRUCache *)GKLRUCache.init(capacity:)(a3);
}

- (void)clear
{
  v2 = self;
  GKLRUCache.clear()();
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)();

  GKLRUCache.insertValue(_:forKey:)((uint64_t)v9, (uint64_t)v8);
  sub_1001658C4((uint64_t)v8);
  sub_100016C38((uint64_t)v9);
}

- (id)getValueForKey:(id)a3
{
  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  GKLRUCache.getValue(forKey:)();

  sub_1001658C4((uint64_t)v13);
  uint64_t v5 = v15;
  if (v15)
  {
    id v6 = sub_100165918(v14, v15);
    uint64_t v7 = *(void *)(v5 - 8);
    __chkstk_darwin(v6, v6);
    v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    sub_100016C38((uint64_t)v14);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_TtC14GameDaemonCore10GKLRUCache)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end