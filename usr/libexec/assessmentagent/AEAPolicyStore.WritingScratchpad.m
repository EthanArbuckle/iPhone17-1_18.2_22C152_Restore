@interface AEAPolicyStore.WritingScratchpad
- (BOOL)persistWithError:(id *)a3;
- (void)setArray:(id)a3 forKey:(id)a4;
- (void)setNumber:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation AEAPolicyStore.WritingScratchpad

- (void)setNumber:(id)a3 forKey:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  v9[3] = sub_10000650C();
  v9[0] = a3;
  swift_beginAccess();
  id v8 = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1000384D4((uint64_t)v9, v5, v7);
  swift_endAccess();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)setString:(id)a3 forKey:(id)a4
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v10[3] = &type metadata for String;
  v10[0] = v4;
  v10[1] = v6;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000384D4((uint64_t)v10, v7, v9);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  v8[3] = sub_1000048A0(&qword_1000AB600);
  v8[0] = v4;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000384D4((uint64_t)v8, v5, v7);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)persistWithError:(id *)a3
{
  return 1;
}

@end