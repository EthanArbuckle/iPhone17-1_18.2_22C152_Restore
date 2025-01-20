@interface CRLiOSMiniShapePickerHostingController
- (NSArray)decoratorOverlayRenderables;
- (_TtC8Freeform38CRLiOSMiniShapePickerHostingController)initWithCoder:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willBeginZoomingOperation;
@end

@implementation CRLiOSMiniShapePickerHostingController

- (_TtC8Freeform38CRLiOSMiniShapePickerHostingController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_associatedBoardItems) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController) = 0;
  id v4 = a3;

  result = (_TtC8Freeform38CRLiOSMiniShapePickerHostingController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSMiniShapePickerHostingController();
  id v4 = (char *)v6.receiver;
  [(CRLiOSMiniShapePickerHostingController *)&v6 viewDidAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController];
  if (v5) {
    [v5 addDecorator:v4];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100B9CA8C(a3);
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  type metadata accessor for CRLChangeRecord();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  objc_super v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100B9CCCC(v5, (uint64_t)v7);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v7);
}

- (NSArray)decoratorOverlayRenderables
{
  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)willBeginZoomingOperation
{
  NSArray v2 = self;
  sub_100B9D204();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController);
}

@end