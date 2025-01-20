@interface XMLParserDelegate
- (_TtC11ShaderGraph17XMLParserDelegate)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation XMLParserDelegate

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
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  specialized XMLParserDelegate.parser(_:didStartElement:namespaceURI:qualifiedName:attributes:)(v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (a5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v9 = a3;
  v10 = self;
  specialized XMLParserDelegate.parser(_:didEndElement:namespaceURI:qualifiedName:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11ShaderGraph17XMLParserDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11ShaderGraph17XMLParserDelegate_currentElement) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11ShaderGraph17XMLParserDelegate_rootElement);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(XMLParserDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end