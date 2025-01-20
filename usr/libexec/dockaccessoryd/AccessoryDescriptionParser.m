@interface AccessoryDescriptionParser
- (_TtC14dockaccessoryd26AccessoryDescriptionParser)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation AccessoryDescriptionParser

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a6) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = a3;
  v16 = self;
  sub_1001FD3C8(v11, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a6) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v13 = a3;
  uint64_t v14 = self;
  sub_1001FD9D8(v13, v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC14dockaccessoryd26AccessoryDescriptionParser)init
{
  result = (_TtC14dockaccessoryd26AccessoryDescriptionParser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_currentSensor));
  v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_identifier;
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_errorRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd26AccessoryDescriptionParser_parser);
}

@end