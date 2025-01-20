@interface VUIAccountViewController
- (VUIAccountViewController)init;
- (VUIAccountViewController)initWithCoder:(id)a3;
- (VUIAccountViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)signInControllerDidSkip:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VUIAccountViewController

- (VUIAccountViewController)init
{
  return (VUIAccountViewController *)AccountViewController.init()();
}

- (VUIAccountViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34437B8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  AccountViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  AccountViewController.viewDidLayoutSubviews()();
}

- (VUIAccountViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  AccountViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___VUIAccountViewController____lazy_storage___accountSettingsViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___VUIAccountViewController____lazy_storage___signInController);
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  AccountViewController.signInControllerDidCancel(_:)(v6);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_1E2BE915C(0, (unint64_t *)&unk_1EADF1530);
  uint64_t v6 = sub_1E387C678();
  id v7 = a3;
  v8 = self;
  AccountViewController.signInController(_:didCompleteWithOperationsResults:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidSkip:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_0_25();
  AccountViewController.signInControllerDidSkip(_:)(v6);
}

@end