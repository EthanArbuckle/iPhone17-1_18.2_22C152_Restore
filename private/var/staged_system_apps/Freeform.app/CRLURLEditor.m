@interface CRLURLEditor
+ (BOOL)canOpenItemURLFor:(id)a3;
+ (void)openItemURLFor:(id)a3;
- (_TtC8Freeform12CRLURLEditor)initWithInteractiveCanvasController:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)editURL:(id)a3;
- (void)reloadMetadata:(id)a3;
- (void)tearDown;
- (void)willResignCurrentEditor;
@end

@implementation CRLURLEditor

- (void)tearDown
{
  v2 = self;
  sub_100811AE4();
}

- (void)willResignCurrentEditor
{
  uint64_t v3 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor();
  v8 = self;
  uint64_t v9 = static MainActor.shared.getter();
  v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  sub_1005912D0((uint64_t)v6, (uint64_t)&unk_101682E60, (uint64_t)v10);
  swift_release();
  v11 = (objc_class *)type metadata accessor for CRLURLEditor();
  v12.receiver = v8;
  v12.super_class = v11;
  [(CRLBoardItemEditor *)&v12 willResignCurrentEditor];
}

- (void)editURL:(id)a3
{
}

+ (BOOL)canOpenItemURLFor:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  sub_100817DB0((unint64_t *)&qword_101676C20, (void (*)(uint64_t))type metadata accessor for CRLBoardItem);
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v4 = sub_1008179A8(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (void)openItemURLFor:(id)a3
{
  id v3 = a3;
  sub_100817A40();
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  uint64_t v7 = self;
  sub_1008122D4(v8, x, y);
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  int64_t v8 = sub_100812B84((uint64_t)a3, (uint64_t)v10);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
  return v8;
}

- (void)reloadMetadata:(id)a3
{
}

- (_TtC8Freeform12CRLURLEditor)initWithInteractiveCanvasController:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_editURLAlert) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_reloadTask) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor____lazy_storage___insertingHelper) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLURLEditor_replaceTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLURLEditor();
  return [(CRLBoardItemEditor *)&v5 initWithInteractiveCanvasController:a3];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end