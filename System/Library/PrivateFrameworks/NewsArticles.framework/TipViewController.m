@interface TipViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC12NewsArticles17TipViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles17TipViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3;
- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)messageViewControllerDidDismiss:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TipViewController

- (_TtC12NewsArticles17TipViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_1BF7DD138();

  result = (_TtC12NewsArticles17TipViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(AMSUIBaseMessageViewController *)&v6 viewDidLoad];
  sub_1BF50CFA4(0, (unint64_t *)&qword_1EBA64190, (uint64_t (*)(uint64_t))sub_1BF4C36FC, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BF7E9080;
  uint64_t v4 = sub_1BF7E0E48();
  uint64_t v5 = MEMORY[0x1E4FB1138];
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  sub_1BF7E4228();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TipViewController *)&v5 viewIsAppearing:v3];
  sub_1BF50AC10();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  TipViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  TipViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_viewModel;
  return *(_DWORD *)&v2[*(int *)(type metadata accessor for TipViewModel(0) + 24)] & 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_1BF4A7104(0, &qword_1EA153FB8);
  sub_1BF50D034();
  uint64_t v6 = sub_1BF7E3EE8();
  id v7 = a4;
  v8 = self;
  TipViewController.pressesBegan(_:with:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles17TipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF50E390((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_viewModel, type metadata accessor for TipViewModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_requestFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_tipPresentationConfig);
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_startDate;
  uint64_t v4 = sub_1BF7DD148();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  TipViewController.messageViewController(_:didSelectActionWith:)((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s12NewsArticles17TipViewControllerC07messagedE0_7didLoadySo012AMSUIMessagedE0_So06UIViewE0CXc_So16AMSDialogRequestCtF_0((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = self;
  _s12NewsArticles17TipViewControllerC07messagedE0_9didUpdateySo012AMSUIMessagedE0_So06UIViewE0CXc_So6CGSizeVtF_0();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  _s12NewsArticles17TipViewControllerC07messagedE0_16didFailWithErrorySo012AMSUIMessagedE0_So06UIViewE0CXc_s0J0_pSgtF_0((uint64_t)v6, a4);
}

- (void)messageViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s12NewsArticles17TipViewControllerC07messagedE10DidDismissyySo012AMSUIMessagedE0_So06UIViewE0CXcF_0();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5 = type metadata accessor for TipViewImpression(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super._overrideTransitioningDelegate
                  + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super._view
                   + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler), v9);
  v11 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_startDate;
  swift_beginAccess();
  uint64_t v12 = sub_1BF7DD148();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v8, v11, v12);
  id v13 = a3;
  v14 = self;
  sub_1BF7DD138();
  v8[*(int *)(v6 + 32)] = 2;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v8, v9, v10);
  sub_1BF50E390((uint64_t)v8, type metadata accessor for TipViewImpression);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
}

@end