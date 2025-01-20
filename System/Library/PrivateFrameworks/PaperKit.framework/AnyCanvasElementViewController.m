@interface AnyCanvasElementViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC8PaperKit30AnyCanvasElementViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit30AnyCanvasElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation AnyCanvasElementViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC8PaperKit30AnyCanvasElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8PaperKit30AnyCanvasElementViewController *)AnyCanvasElementViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit30AnyCanvasElementViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit30AnyCanvasElementViewController *)AnyCanvasElementViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit30AnyCanvasElementViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit30AnyCanvasElementViewController_toolPicker);
}

@end