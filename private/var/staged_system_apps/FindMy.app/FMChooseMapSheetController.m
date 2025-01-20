@interface FMChooseMapSheetController
- (_TtC6FindMy26FMChooseMapSheetController)initWithCoder:(id)a3;
- (_TtC6FindMy26FMChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)handleCloseAction;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMChooseMapSheetController

- (_TtC6FindMy26FMChooseMapSheetController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_blurredBackground;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMChooseMapSheetController.FMBlurredBackgroundView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_closeButton;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[self buttonWithType:7];

  result = (_TtC6FindMy26FMChooseMapSheetController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1001A7B40(a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(FMChooseMapSheetController *)&v3 viewDidLoad];
  sub_1001A7D6C();
  sub_1001A7FAC();
}

- (void)handleCloseAction
{
}

- (_TtC6FindMy26FMChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy26FMChooseMapSheetController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100028108((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_previousSelection);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_blurredBackground));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy26FMChooseMapSheetController_closeButton);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == (id)1) {
    return -1;
  }
  else {
    return 2;
  }
}

@end