@interface CompactShapeOpacityController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit29CompactShapeOpacityController)initWithCoder:(id)a3;
- (_TtC8PaperKit29CompactShapeOpacityController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CompactShapeOpacityController

- (void)viewDidLoad
{
  v2 = self;
  CompactShapeOpacityController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit29CompactShapeOpacityController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit29CompactShapeOpacityController *)CompactShapeOpacityController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit29CompactShapeOpacityController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit29CompactShapeOpacityController *)CompactShapeOpacityController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29CompactShapeOpacityController_slider));
}

@end