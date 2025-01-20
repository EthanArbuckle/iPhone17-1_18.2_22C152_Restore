@interface CRLUSDZEditor
- (NSSet)selectedObjectsSupportingReplacement;
- (_TtC8Freeform13CRLUSDZEditor)initWithInteractiveCanvasController:(id)a3;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7;
- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)showMediaReplaceUI:(id)a3;
@end

@implementation CRLUSDZEditor

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1007E1B34((uint64_t)a3, v10, a5);
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = self;
  sub_1007E2A50(v7, x, y);
}

- (_TtC8Freeform13CRLUSDZEditor)initWithInteractiveCanvasController:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUSDZEditor____lazy_storage___commandProvider) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUSDZEditor();
  return [(CRLBoardItemEditor *)&v5 initWithInteractiveCanvasController:a3];
}

- (void).cxx_destruct
{
}

- (void)showMediaReplaceUI:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v5 = [objc_allocWithZone((Class)CRLMediaReplacingHelper) initWithEditor:v4];
  sub_10050F848(v6, v6[3]);
  [v5 showMediaReplaceUI:_bridgeAnythingToObjectiveC<A>(_:)()];

  swift_unknownObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);
}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  type metadata accessor for CRLAsset();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
    if (v7)
    {
LABEL_3:
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v7;
      id v7 = sub_10077C3E8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  v12 = self;
  sub_1007E305C(v8, v9, a4, v7, v11);
  sub_1005174AC((uint64_t)v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  id v10 = _Block_copy(a7);
  type metadata accessor for URL();
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a6)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v13;
    if (v10)
    {
LABEL_5:
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v10;
      id v10 = sub_1005E2108;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v14 = 0;
LABEL_8:
  v15 = self;
  uint64_t v16 = swift_unknownObjectRetain();
  sub_1007E3294(v16, v11, (Class)a5, v12, a6, v10, v14);
  sub_1005174AC((uint64_t)v10);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSSet)selectedObjectsSupportingReplacement
{
  v2 = self;
  v3 = [(CRLBoardItemEditor *)v2 boardItems];
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v4.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v4.super.isa;
}

@end