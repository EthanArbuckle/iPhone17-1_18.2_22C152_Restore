@interface ClassKitContextBuilder
- (_TtC8Podcasts22ClassKitContextBuilder)init;
- (id)createContextForIdentifier:(id)a3 parentContext:(id)a4 parentIdentifierPath:(id)a5;
@end

@implementation ClassKitContextBuilder

- (_TtC8Podcasts22ClassKitContextBuilder)init
{
  id v2 = [objc_allocWithZone((Class)type metadata accessor for MediaRequestController()) init];
  id v3 = objc_allocWithZone((Class)type metadata accessor for ClassKitContextBuilder());
  v4 = (_TtC8Podcasts22ClassKitContextBuilder *)sub_1003B5DCC(v2);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (id)createContextForIdentifier:(id)a3 parentContext:(id)a4 parentIdentifierPath:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  v10 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  v12 = self;
  v13 = (void *)sub_1003B5FF4(v7, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts22ClassKitContextBuilder_workQueue);
}

@end