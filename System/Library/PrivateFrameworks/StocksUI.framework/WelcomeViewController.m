@interface WelcomeViewController
- (_TtC8StocksUI21WelcomeViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)didTapContinueButton;
- (void)showPrivacyText;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WelcomeViewController

- (_TtC8StocksUI21WelcomeViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_allowRendering) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI21WelcomeViewController_statusBarView;
  id v6 = objc_allocWithZone((Class)sub_20A8C8480());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI21WelcomeViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_viewProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_viewAnimator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_statusBarView));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A857950();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WelcomeViewController *)&v5 viewWillAppear:v3];
  swift_getObjectType();
  sub_20A8C90B0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_20A857F54(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(WelcomeViewController *)&v6 viewWillDisappear:v3];
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager], *(void *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_sceneStateManager + 24]);
  sub_20A8587C8(&qword_26763E598, v5, (void (*)(uint64_t))type metadata accessor for WelcomeViewController);
  sub_20A8C62C0();
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler] + 88), *(void *)(*(void *)&v4[OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler] + 112));
  sub_20A8C48E0();
  swift_getObjectType();
  sub_20A8C90B0();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20A858208();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(WelcomeViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A857BF4((uint64_t)v6);
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_styler);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  id v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, double))(v7 + 16))((char *)&v16 - v9, v8);
  uint64_t v11 = *(void *)(v5 + 16);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  int64_t v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)didTapContinueButton
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI21WelcomeViewController_eventHandler);
  __swift_project_boxed_opaque_existential_1(v3 + 11, v3[14]);
  uint64_t v4 = self;
  sub_20A8C48E0();
  if (qword_26AC69190 != -1) {
    swift_once();
  }
  type metadata accessor for WelcomeInteractor();
  sub_20A8587C8(&qword_26763E590, 255, (void (*)(uint64_t))type metadata accessor for WelcomeInteractor);
  sub_20A8C42F0();
  swift_getObjectType();
  sub_20A8C7440();
  __swift_project_boxed_opaque_existential_1(v3 + 6, v3[9]);
  sub_20A6A198C();
}

- (void)showPrivacyText
{
  v2 = self;
  sub_20A857678();
}

@end