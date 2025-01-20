@interface ToastViewController
- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithCoder:(id)a3;
- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ToastViewController

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E363D4A0();
}

- (void)loadView
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E363D540();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E363D5E4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1E363DD7C(a3);
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E363DE5C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E363DF60();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  OUTLINED_FUNCTION_5_1();
  v6 = v5;
  swift_unknownObjectRetain();
  id v7 = v6;
  sub_1E363E2C0(a4);
  swift_unknownObjectRelease();
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E363E674();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController_hostingController));
  swift_release();
}

@end