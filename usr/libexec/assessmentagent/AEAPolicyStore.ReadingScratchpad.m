@interface AEAPolicyStore.ReadingScratchpad
- (BOOL)removeWithError:(id *)a3;
- (id)arrayForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)stringForKey:(id)a3;
@end

@implementation AEAPolicyStore.ReadingScratchpad

- (id)numberForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  v6 = (void *)sub_100071658(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)stringForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  sub_1000717EC(v3, v5);
  uint64_t v7 = v6;
  swift_release();
  swift_bridgeObjectRelease();
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)arrayForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  uint64_t v6 = sub_1000719A0(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (BOOL)removeWithError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  NSString v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006340(self->fileSystem, *(void *)&self->fileSystem[24]);
  swift_retain();
  sub_10007145C((uint64_t)v8);
  sub_10001B224();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_release();
  return 1;
}

@end