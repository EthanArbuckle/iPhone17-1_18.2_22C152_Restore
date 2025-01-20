@interface CRLiOSPencilKitCanvasViewController
- (BOOL)_canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4;
- (CRLBezierPath)unscaledRulerBezierPath;
- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager;
- (PKCanvasView)pencilKitCanvasView;
- (UIView)smartSelectionView;
- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithCoder:(id)a3;
- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithDelegate:(id)a3;
- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_canvasViewRulerHostingView:(id)a3;
- (id)currentDocumentModeForPKSelectionManager:(id)a3;
- (id)interactiveCanvasControllerForPKSelectionManager:(id)a3;
- (id)pencilKitCanvasViewForPKSelectionManager:(id)a3;
- (id)rulerEdgePathInUnscaledSpaceForTopOfRuler:(BOOL)a3;
- (void)_canvasView:(id)a3 beganStroke:(id)a4;
- (void)_canvasView:(id)a3 cancelledStroke:(id)a4;
- (void)_canvasView:(id)a3 didChangeHiddenState:(BOOL)a4;
- (void)_canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5;
- (void)_canvasViewWillCreateSnapshot:(id)a3;
- (void)dealloc;
- (void)installSmartSelectionView:(id)a3 forPKSelectionManager:(id)a4;
- (void)loadView;
- (void)removeSmartSelectionViewIfNecessary;
- (void)setSmartSelectionManager:(id)a3;
- (void)setSmartSelectionView:(id)a3;
- (void)tearDown;
- (void)toolkitDidUpdateCurrentToolSelection;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CRLiOSPencilKitCanvasViewController

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = 0;
  swift_unknownObjectUnownedInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSPencilKitCanvasViewController();
  return [(CRLiOSPencilKitCanvasViewController *)&v5 initWithNibName:0 bundle:0];
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = 0;
  id v5 = a3;

  result = (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tearDown
{
  v2 = self;
  sub_1007E7514();
}

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilKitCanvasViewController.swift", 105, 2, 105, (uint64_t)"CRLiOSPencilKitCanvasViewController must be torn down before deinit.", 68, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilKitCanvasViewController.swift", 105, 2, 105);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSPencilKitCanvasViewController();
  [(CRLiOSPencilKitCanvasViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1007E9E50((uint64_t)self + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_delegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView);
}

- (PKCanvasView)pencilKitCanvasView
{
  char v2 = self;
  result = (PKCanvasView *)[(CRLiOSPencilKitCanvasViewController *)v2 view];
  if (result)
  {

    self;
    objc_super v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    return (PKCanvasView *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager
{
  return (CRLFreehandDrawingPKSelectionManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager));
}

- (void)setSmartSelectionManager:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionManager) = (Class)a3;
  id v3 = a3;
}

- (UIView)smartSelectionView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView));
}

- (void)setSmartSelectionView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView) = (Class)a3;
  id v3 = a3;
}

- (void)loadView
{
  char v2 = self;
  CRLiOSPencilKitCanvasViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  CRLiOSPencilKitCanvasViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  CRLiOSPencilKitCanvasViewController.viewDidAppear(_:)(a3);
}

- (id)rulerEdgePathInUnscaledSpaceForTopOfRuler:(BOOL)a3
{
  id v4 = self;
  id v5 = sub_1007E80B8(a3);

  return v5;
}

- (CRLBezierPath)unscaledRulerBezierPath
{
  char v2 = self;
  id v3 = sub_1007E82B4();

  return (CRLBezierPath *)v3;
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)_canvasView:(id)a3 didChangeHiddenState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  id v8 = [(CRLiOSPencilKitCanvasViewController *)v7 view];
  if (v8)
  {
    v9 = v8;
    [v8 setHidden:v4];

    [(id)swift_unknownObjectUnownedLoadStrong() pencilKitViewWantsSuppressedFreehandContent:v4 ^ 1 forPencilKitCanvasViewController:v7];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (id)_canvasViewRulerHostingView:(id)a3
{
  return sub_1007E96B0(self, (uint64_t)a2, a3, (SEL *)&selRef_pencilKitRulerHostingViewForPencilKitCanvasViewController_);
}

- (void)_canvasView:(id)a3 beganStroke:(id)a4
{
}

- (void)_canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  uint64_t v9 = type metadata accessor for PKStroke();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  id v17 = a5;
  static PKStroke._unconditionallyBridgeFromObjectiveC(_:)();

  if (v17)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  [(id)swift_unknownObjectUnownedLoadStrong() prepareForPencilKitEndingOrCancellingStroke:v16];

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)_canvasView:(id)a3 cancelledStroke:(id)a4
{
}

- (BOOL)_canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  LOBYTE(self) = CRLiOSPencilKitCanvasViewController._canvasView(_:hoverShouldBeActiveAt:)(v7, x, y);

  return self & 1;
}

- (void)_canvasViewWillCreateSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s8Freeform35CRLiOSPencilKitCanvasViewControllerC07_canvasF18WillCreateSnapshotyySo08PKCanvasF0CF_0();
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  char v2 = self;
  CRLiOSPencilKitCanvasViewController.toolkitDidUpdateCurrentToolSelection()();
}

- (void)installSmartSelectionView:(id)a3 forPKSelectionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  _s8Freeform35CRLiOSPencilKitCanvasViewControllerC021installSmartSelectionF0_3forySo6UIViewCSg_So36CRLFreehandDrawingPKSelectionManagerCtF_0(a3);
}

- (id)pencilKitCanvasViewForPKSelectionManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id result = [(CRLiOSPencilKitCanvasViewController *)v5 view];
  if (result)
  {

    self;
    id v7 = (void *)swift_dynamicCastObjCClassUnconditional();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)interactiveCanvasControllerForPKSelectionManager:(id)a3
{
  return sub_1007E96B0(self, (uint64_t)a2, a3, (SEL *)&selRef_interactiveCanvasControllerForPencilKitCanvasViewController_);
}

- (id)currentDocumentModeForPKSelectionManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = _s8Freeform35CRLiOSPencilKitCanvasViewControllerC19currentDocumentMode3forSo0b10OSDocumentJ0CSgSo36CRLFreehandDrawingPKSelectionManagerC_tF_0();

  return v6;
}

- (void)removeSmartSelectionViewIfNecessary
{
  uint64_t v2 = OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView;
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform35CRLiOSPencilKitCanvasViewController_smartSelectionView);
  if (v3)
  {
    id v5 = self;
    [v3 removeFromSuperview];
    id v6 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = 0;
  }
}

@end