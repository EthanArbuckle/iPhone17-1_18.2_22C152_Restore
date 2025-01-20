@interface ValueEditingViewController
- (_TtC8PaperKit26ValueEditingViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit26ValueEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didChangeSliderValue;
- (void)didChangeStepperValue;
- (void)didFinishChangingSliderValue;
- (void)didStartChangingSliderValue;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ValueEditingViewController

- (_TtC8PaperKit26ValueEditingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ValueEditingViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  ValueEditingViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ValueEditingViewController();
  id v4 = v6.receiver;
  [(ValueEditingViewController *)&v6 viewDidAppear:v3];
  LODWORD(v3) = *MEMORY[0x263F83200];
  id v5 = ValueEditingViewController.stepper.getter();
  UIAccessibilityPostNotification(v3, v5);
}

- (void)didChangeStepperValue
{
  v2 = self;
  ValueEditingViewController.didChangeStepperValue()();
}

- (void)didStartChangingSliderValue
{
}

- (void)didFinishChangingSliderValue
{
}

- (void)didChangeSliderValue
{
  v2 = self;
  ValueEditingViewController.didChangeSliderValue()();
}

- (_TtC8PaperKit26ValueEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKit26ValueEditingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController____lazy_storage___stepper));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit26ValueEditingViewController____lazy_storage___slider);
}

@end