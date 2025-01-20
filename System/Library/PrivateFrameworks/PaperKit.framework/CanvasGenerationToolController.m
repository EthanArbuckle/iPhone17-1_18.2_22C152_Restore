@interface CanvasGenerationToolController
- (_TtC8PaperKit30CanvasGenerationToolController)initWithCoder:(id)a3;
- (_TtC8PaperKit30CanvasGenerationToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CanvasGenerationToolController

- (_TtC8PaperKit30CanvasGenerationToolController)initWithCoder:(id)a3
{
  result = (_TtC8PaperKit30CanvasGenerationToolController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CanvasGenerationToolController();
  v2 = (char *)v3.receiver;
  [(CanvasGenerationToolController *)&v3 viewDidLoad];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8PaperKit30CanvasGenerationToolController_canvasGenerationTool], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, v3.receiver, v3.super_class);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CanvasGenerationToolController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[CanvasGenerationToolController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  CanvasGenerationTool.updateScrollViewLayout(_:animationDuration:animationCurveOptions:)(0, 0.0, 0.0);
  swift_unknownObjectRelease();
}

- (_TtC8PaperKit30CanvasGenerationToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKit30CanvasGenerationToolController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit30CanvasGenerationToolController_canvasGenerationTool));
}

@end