@interface RDJSONCoder
- (BOOL)allowsKeyedCoding;
- (_TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder)init;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
@end

@implementation RDJSONCoder

- (_TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder)init
{
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_key);
  void *v3 = 0;
  v3[1] = 0;
  sub_100094134((uint64_t *)&unk_10090D7E0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100776E40;
  v5 = self;
  *(void *)(v4 + 32) = sub_1001805C0((uint64_t)_swiftEmptyArrayStorage);
  *(Class *)((char *)&v5->super.super.isa
           + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_dicts) = (Class)v4;
  *(Class *)((char *)&v5->super.super.isa
           + OBJC_IVAR____TtC7reminddP33_673FACCCF2F505342EF4BC86AF8BFBA711RDJSONCoder_arrays) = (Class)_swiftEmptyArrayStorage;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RDJSONCoder();
  return [(RDJSONCoder *)&v7 init];
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v9 = self;
  sub_1001784C4(v4, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v9 = self;
  sub_10017863C(v4, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v9 = self;
  sub_1001787B4(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_10017892C(v5, v7);

  swift_bridgeObjectRelease();
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    id v8 = a4;
    v9 = self;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  sub_100178D6C((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();
  sub_1000966BC((uint64_t)v13, &qword_100908190);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end