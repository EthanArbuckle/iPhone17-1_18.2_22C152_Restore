@interface WelcomeViewController
- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didSaveFirstLastNameFor:(id)a3;
- (void)didTapContinueButtonWithCompletion:(id)a3;
- (void)didTapNext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WelcomeViewController

- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  sub_10008CA0C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10008832C();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)didTapNext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100088640(v4);
}

- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC6Health21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100019AF4(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_completionHandler]);

  swift_release();
  swift_release();
  swift_release();
  sub_10008C38C((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_deepLinkCanceler], (uint64_t (*)(void))sub_10008C1D4);

  swift_release();
}

- (void)didTapContinueButtonWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10008A484((uint64_t)sub_10008C480, v5);

  swift_release();
}

- (void)didSaveFirstLastNameFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10008A608(v4);
}

@end