@interface MathRecognitionViewControllerDelegate
- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3;
- (_TtC8PaperKit37MathRecognitionViewControllerDelegate)init;
- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3;
- (id)mathViewController:(id)a3 createScrubberControllerForView:(id)a4 delegate:(id)a5;
- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 expressionIdentifiersForCompatibleGraphNearLocation:(CGPoint)a4 expressionUUID:(id)a5;
- (id)mathViewController:(id)a3 expressionIdentifiersForExistingGraphNearLocation:(CGPoint)a4;
- (id)mathViewController:(id)a3 resultForLocale:(id)a4 itemUUID:(id)a5;
- (id)mathViewControllerDrawing:(id)a3;
- (id)mathViewControllerTiledView:(id)a3;
- (void)mathViewController:(id)a3 addGraphForExpression:(id)a4 variable:(id)a5 range:(CGRect)a6 identifier:(id)a7 expressionLocation:(CGPoint)a8 addToExisting:(BOOL)a9;
- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7;
- (void)mathViewController:(id)a3 replaceStrokes:(id)a4 withStrokes:(id)a5;
- (void)mathViewController:(id)a3 selectStrokes:(id)a4;
- (void)mathViewController:(id)a3 setHiddenStrokes:(id)a4;
- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7;
- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8;
- (void)mathViewController:(id)a3 updatedResult:(id)a4 strokes:(id)a5 expressionUUID:(id)a6;
- (void)mathViewControllerUpdateFrameForContainer:(id)a3;
@end

@implementation MathRecognitionViewControllerDelegate

- (id)mathViewControllerDrawing:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  MathRecognitionViewControllerDelegate.mathViewControllerDrawing(_:)((uint64_t)v7);

  uint64_t v10 = type metadata accessor for PKDrawing();
  uint64_t v11 = *(void *)(v10 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    PKDrawing._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v13;
}

- (id)mathViewControllerTiledView:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x320);
    id v8 = a3;
    v9 = self;
    uint64_t v10 = (void *)v7();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3
{
  id v6 = a4;
  v7 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewControllerDrawingTransform(_:)(v11);

  long long v9 = v11[1];
  long long v10 = v11[2];
  *(_OWORD *)&retstr->a = v11[0];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = v10;
  return result;
}

- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  double v6 = specialized MathRecognitionViewControllerDelegate.mathViewControllerLatestEnd(ofStrokeTimestamp:)();

  return v6;
}

- (void)mathViewControllerUpdateFrameForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewControllerUpdateFrame(forContainer:)();
}

- (id)mathViewController:(id)a3 expressionIdentifiersForExistingGraphNearLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = (objc_class *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas, a2);
  Class isa = v8;
  if (v8)
  {
    long long v10 = *(uint64_t (**)(void, double, double))((*MEMORY[0x263F8EED0] & *(void *)v8) + 0x760);
    id v11 = a3;
    v12 = self;
    uint64_t v13 = v10(0, x, y);

    if (v13)
    {
      Class isa = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      Class isa = 0;
    }
  }
  return isa;
}

- (id)mathViewController:(id)a3 expressionIdentifiersForCompatibleGraphNearLocation:(CGPoint)a4 expressionUUID:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  v14 = self;
  v15 = specialized MathRecognitionViewControllerDelegate.mathViewController(_:expressionIdentifiersForCompatibleGraphNearLocation:expressionUUID:)((uint64_t)v12, x, y);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v15)
  {
    v16.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v16.super.Class isa = 0;
  }
  return v16.super.isa;
}

- (void)mathViewController:(id)a3 addGraphForExpression:(id)a4 variable:(id)a5 range:(CGRect)a6 identifier:(id)a7 expressionLocation:(CGPoint)a8 addToExisting:(BOOL)a9
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v14 = a6.origin.y;
  double v15 = a6.origin.x;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;
  if (a5)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v23;
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;
  id v27 = a3;
  v28 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:addGraphForExpression:variable:range:identifier:expressionLocation:addToExisting:)(v19, v21, v22, (unint64_t)a5, v24, v26, a9, v15, v14, width, height, x, y);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7
{
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type UUID and conformance UUID();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PKMathRecognitionItem);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  double v14 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:didUpdateExpressions:newExpressions:removedExpressions:mathItems:)(v9, v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 replaceStrokes:(id)a4 withStrokes:(id)a5
{
  type metadata accessor for PKStroke();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:replace:with:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 setHiddenStrokes:(id)a4
{
  type metadata accessor for PKStroke();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v7)
  {
    id v8 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0x518);
    id v11 = v7;
    id v9 = a3;
    uint64_t v10 = self;
    v8(v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (id)mathViewController:(id)a3 createScrubberControllerForView:(id)a4 delegate:(id)a5
{
  id v8 = objc_allocWithZone((Class)type metadata accessor for CalculateScrubberController());
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = a3;
  id v11 = self;
  id v12 = specialized CalculateScrubberController.init(view:delegate:)();

  swift_unknownObjectRelease();
  return v12;
}

- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  id v13 = a3;
  double v14 = self;
  double v15 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetViewControllerForExpression:latex:fontSize:)(a6, v10, v12, a5);

  swift_bridgeObjectRelease();
  return v15;
}

- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  id v13 = a3;
  double v14 = self;
  double v15 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetImageForExpression:latex:fontSize:)(a6, v10, v12, a5);

  swift_bridgeObjectRelease();
  return v15;
}

- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  double v15 = self;
  NSSet v16 = (void *)specialized MathRecognitionViewControllerDelegate.mathViewController(_:createTypesetImageForItemUUID:showResult:fontSize:)((uint64_t)v13, a5, a6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v16;
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7
{
  BOOL v10 = a4;
  uint64_t v13 = type metadata accessor for PKStroke();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  NSSet v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = a3;
  uint64_t v18 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)a5;
  id v19 = a6;
  unint64_t v20 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v21 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)MEMORY[0x210550400]((char *)v20+ OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v21)
  {
    uint64_t v22 = v21;
    (*(void (**)(BOOL, char *, unint64_t, void))((*MEMORY[0x263F8EED0] & (uint64_t)v21->super.isa)
                                                                     + 0x748))(v10, v16, a7, 0);

    uint64_t v18 = v20;
    unint64_t v20 = v22;
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8
{
  BOOL v25 = a8;
  BOOL v11 = a4;
  uint64_t v14 = type metadata accessor for PKStroke();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = a3;
  id v19 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)a5;
  id v20 = a6;
  unint64_t v21 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v22 = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)MEMORY[0x210550400]((char *)v21+ OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_canvas);
  if (v22)
  {
    uint64_t v23 = v22;
    (*(void (**)(BOOL, char *, unint64_t, BOOL))((*MEMORY[0x263F8EED0] & (uint64_t)v22->super.isa)
                                                                     + 0x748))(v11, v17, a7, v25);

    id v19 = v21;
    unint64_t v21 = v23;
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)mathViewController:(id)a3 selectStrokes:(id)a4
{
  type metadata accessor for PKStroke();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:select:)(v6);

  swift_bridgeObjectRelease();
}

- (void)mathViewController:(id)a3 updatedResult:(id)a4 strokes:(id)a5 expressionUUID:(id)a6
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  type metadata accessor for PKStroke();
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  uint64_t v15 = self;
  specialized MathRecognitionViewControllerDelegate.mathViewController(_:updatedResult:strokes:expressionUUID:)(v13, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)mathViewController:(id)a3 resultForLocale:(id)a4 itemUUID:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Locale();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = a3;
  uint64_t v16 = self;
  id v17 = specialized MathRecognitionViewControllerDelegate.mathViewController(_:resultFor:itemUUID:)((uint64_t)v14, (uint64_t)v10);
  uint64_t v19 = v18;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v19)
  {
    id v20 = (void *)MEMORY[0x21054D080](v17, v19);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v20 = 0;
  }
  return v20;
}

- (_TtC8PaperKit37MathRecognitionViewControllerDelegate)init
{
  result = (_TtC8PaperKit37MathRecognitionViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_controller));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit37MathRecognitionViewControllerDelegate_viewController);
}

@end