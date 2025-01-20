@interface CRLMathRecognitionItemsHandler
- (BOOL)isPresentingPopoverUI;
- (BOOL)shouldCallEditMenuTapForRep;
- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3;
- (CRLFreehandDrawingLayout)layout;
- (CRLFreehandDrawingRep)rep;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (NSString)crlaxRecognizedMathDescription;
- (OS_dispatch_queue)expressionsQueue;
- (PKMathRecognitionViewController)mathViewController;
- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController;
- (_TtC8Freeform30CRLMathRecognitionItemsHandler)init;
- (_TtC8Freeform30CRLMathRecognitionItemsHandler)initWithLayout:(id)a3 view:(id)a4 viewController:(id)a5;
- (double)lastStrokeTimestamp;
- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3;
- (id)mathViewController:(id)a3 coordinateSpaceForDrawing:(id)a4;
- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6;
- (id)mathViewController:(id)a3 resultForLocale:(id)a4 itemUUID:(id)a5;
- (id)mathViewControllerDrawing:(id)a3;
- (id)mathViewControllerTiledView:(id)a3;
- (uint64_t)mathHintsModeChanged:(uint64_t)a3;
- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7;
- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8;
- (void)mathViewController:(id)a3 willPresentPopoverUI:(int64_t)a4;
- (void)mathViewControllerDidDismissPopoverUI:(id)a3;
- (void)mathViewControllerUpdateFrameForContainer:(id)a3;
- (void)redrawSubviews;
- (void)setIsPresentingPopoverUI:(BOOL)a3;
- (void)setLastStrokeTimestamp:(double)a3;
- (void)setLayout:(id)a3;
- (void)setMathViewController:(id)a3;
- (void)setShouldCallEditMenuTapForRep:(BOOL)a3;
- (void)updateCalculateDocumentProvider;
- (void)updateMathSolvingStyle;
- (void)willBeRemoved;
@end

@implementation CRLMathRecognitionItemsHandler

- (CRLFreehandDrawingLayout)layout
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLFreehandDrawingLayout *)Strong;
}

- (void)setLayout:(id)a3
{
}

- (PKMathRecognitionViewController)mathViewController
{
  return (PKMathRecognitionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController));
}

- (void)setMathViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController) = (Class)a3;
  id v3 = a3;
}

- (double)lastStrokeTimestamp
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp);
}

- (void)setLastStrokeTimestamp:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp) = a3;
}

- (OS_dispatch_queue)expressionsQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_expressionsQueue));
}

- (BOOL)isPresentingPopoverUI
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI);
}

- (void)setIsPresentingPopoverUI:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI) = a3;
}

- (BOOL)shouldCallEditMenuTapForRep
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_shouldCallEditMenuTapForRep);
}

- (void)setShouldCallEditMenuTapForRep:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_shouldCallEditMenuTapForRep) = a3;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  v2 = self;
  sub_100868DEC();
  id v4 = v3;

  return (CRLInteractiveCanvasController *)v4;
}

- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController
{
  v2 = self;
  sub_100868F94();
  id v4 = v3;

  return (_TtC8Freeform28CRLMathCalculationController *)v4;
}

- (CRLFreehandDrawingRep)rep
{
  v2 = self;
  sub_100869164();
  id v4 = v3;

  return (CRLFreehandDrawingRep *)v4;
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)initWithLayout:(id)a3 view:(id)a4 viewController:(id)a5
{
  return (_TtC8Freeform30CRLMathRecognitionItemsHandler *)sub_10086934C((char *)a3, (char *)a4, (char *)a5);
}

- (uint64_t)mathHintsModeChanged:(uint64_t)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BE0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for Notification();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for Notification();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  id v11 = a1;
  sub_100869AB8();

  return sub_100522F00((uint64_t)v8, &qword_101672BE0);
}

- (void)updateMathSolvingStyle
{
  v2 = self;
  sub_100869AB8();
}

- (void)willBeRemoved
{
  v2 = self;
  sub_10086C0F8();
}

- (void)redrawSubviews
{
}

- (id)mathViewControllerDrawing:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_1016842F0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  sub_10086D074((uint64_t)v8);

  uint64_t v11 = type metadata accessor for PKDrawing();
  uint64_t v12 = *(void *)(v11 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    Class isa = PKDrawing._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }

  return isa;
}

- (id)mathViewControllerTiledView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100870268();
  uint64_t v7 = v6;

  return v7;
}

- (CGAffineTransform)mathViewControllerDrawingTransform:(SEL)a3
{
  retstr->a = 1.0;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = 1.0;
  retstr->tx = 0.0;
  retstr->ty = 0.0;
  return self;
}

- (double)mathViewControllerLatestEndOfStrokeTimestamp:(id)a3
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_lastStrokeTimestamp);
}

- (id)mathViewController:(id)a3 coordinateSpaceForDrawing:(id)a4
{
  uint64_t v7 = type metadata accessor for PKDrawing();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  id v15 = sub_100870438();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v15;
}

- (id)mathViewController:(id)a3 createTypesetViewControllerForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = self;
  v14 = (void *)sub_10087061C(v9, v11, a5);

  swift_bridgeObjectRelease();

  return v14;
}

- (void)mathViewController:(id)a3 setShouldSolve:(BOOL)a4 item:(id)a5 heroStroke:(id)a6 flag:(unint64_t)a7 undoable:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a4;
  uint64_t v14 = type metadata accessor for PKStroke();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  v22 = self;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100869164();
  if (v23)
  {
    v24 = v23;
    Class isa = PKStroke._bridgeToObjectiveC()().super.isa;
    [v24 didUpdateShouldSolveMathForTriggerStroke:isa shouldSolveMath:v11 undoable:v8];

    id v20 = v24;
    v22 = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)isa;
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

- (void)mathViewController:(id)a3 willPresentPopoverUI:(int64_t)a4
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI) = 1;
}

- (void)mathViewControllerDidDismissPopoverUI:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_isPresentingPopoverUI) = 0;
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_shouldCallEditMenuTapForRep) == 1)
  {
    id v4 = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)a3;
    uint64_t v7 = self;
    sub_100869164();
    if (v5)
    {
      uint64_t v6 = v5;
      -[CRLMathRecognitionItemsHandler handleEditMenuTapAtPoint:inputType:](v5, "handleEditMenuTapAtPoint:inputType:", 1, 0.0, 0.0);

      id v4 = v7;
      uint64_t v7 = v6;
    }
  }
}

- (id)mathViewController:(id)a3 resultForLocale:(id)a4 itemUUID:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  BOOL v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Locale();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = a3;
  v18 = self;
  sub_100870888((uint64_t)v16, (uint64_t)v11);
  uint64_t v20 = v19;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  if (v20)
  {
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }

  return v21;
}

- (id)mathViewController:(id)a3 createTypesetImageForItemUUID:(id)a4 showResult:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  uint64_t v14 = self;
  sub_100870A48((unint64_t)v12);
  uint64_t v16 = v15;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

  return v16;
}

- (id)mathViewController:(id)a3 createTypesetImageForExpression:(id)a4 latex:(BOOL)a5 fontSize:(double)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = self;
  uint64_t v14 = (void *)sub_100870DBC(v9, v11, a5);

  swift_bridgeObjectRelease();

  return v14;
}

- (void)mathViewController:(id)a3 didUpdateExpressions:(id)a4 newExpressions:(id)a5 removedExpressions:(id)a6 mathItems:(id)a7
{
  type metadata accessor for UUID();
  sub_100870220((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v9 = (uint64_t (**)(uint64_t))static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = (char *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10050BF48(0, (unint64_t *)&unk_101684348);
  id v12 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  uint64_t v14 = self;
  sub_100871090(v9, v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)mathViewControllerUpdateFrameForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100869164();
  id v7 = v6;
  [v6 didUpdateMathResultView];
}

- (void)updateCalculateDocumentProvider
{
  uint64_t v8 = self;
  sub_100869164();
  if (v2)
  {
    id v7 = v2;
    id v3 = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)[(CRLMathRecognitionItemsHandler *)v2 pkRecognitionController];
    if (v3)
    {
      uint64_t v6 = v3;
      sub_10086DE28();
      if (v4)
      {
        [(CRLMathRecognitionItemsHandler *)v6 setCalculateDocumentProvider:v4];

        swift_unknownObjectRelease();
        return;
      }

      uint64_t v5 = v6;
    }
    else
    {

      uint64_t v5 = v7;
    }
  }
  else
  {
    uint64_t v5 = v8;
  }
}

- (NSString)crlaxRecognizedMathDescription
{
  v2 = self;
  sub_10086F0E8();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (_TtC8Freeform30CRLMathRecognitionItemsHandler)init
{
  result = (_TtC8Freeform30CRLMathRecognitionItemsHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_mathViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLMathRecognitionItemsHandler_expressionsQueue));

  swift_bridgeObjectRelease();
}

@end