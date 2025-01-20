@interface CRLMiniFormatterStateManager
- (_TtC8Freeform28CRLMiniFormatterStateManager)init;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)selectionPathDidChangeWithNotification:(id)a3;
- (void)teardown;
@end

@implementation CRLMiniFormatterStateManager

- (void)teardown
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  id v6 = [v3 defaultCenter];
  id v7 = v6;
  if (qword_10166FC68 != -1)
  {
    swift_once();
    id v6 = v7;
  }
  [v6 removeObserver:v4 name:qword_10171BEB0 object:0];
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  type metadata accessor for CRLChangeRecord();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  id v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  CRLMiniFormatterStateManager.processChanges(_:forChangeSource:)(v5, (uint64_t)v7);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v7);
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100679DE0(v4);
}

- (_TtC8Freeform28CRLMiniFormatterStateManager)init
{
  result = (_TtC8Freeform28CRLMiniFormatterStateManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_editorController));

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end