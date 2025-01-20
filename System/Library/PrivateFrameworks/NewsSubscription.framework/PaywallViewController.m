@interface PaywallViewController
- (_TtC16NewsSubscription21PaywallViewController)initWithCoder:(id)a3;
- (_TtC16NewsSubscription21PaywallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)handlePurchaseAddedNotificationWithNotification:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PaywallViewController

- (_TtC16NewsSubscription21PaywallViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFABA944();
}

- (void)viewDidLoad
{
  v2 = self;
  PaywallViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  id v4 = v11.receiver;
  [(PaywallViewController *)&v11 viewWillAppear:v3];
  uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider;
  swift_beginAccess();
  sub_1BFA4DFE0(v5, (uint64_t)v8);
  uint64_t v6 = v9;
  uint64_t v7 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  PaywallViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  PaywallViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(PaywallViewController *)&v5 viewWillLayoutSubviews];
  sub_1BFABBC98(0, (unint64_t *)&qword_1EBA885C0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
  sub_1BFBD2CB8();
  sub_1BFA4DF3C(0, (unint64_t *)&qword_1EBA84FF0);
  BOOL v3 = (void *)sub_1BFBD4A78();
  *(void *)(swift_allocObject() + 16) = v2;
  type metadata accessor for CGSize(0);
  id v4 = v2;
  sub_1BFBD2B58();

  swift_release();
  swift_release();

  swift_release();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v10.receiver;
  [(PaywallViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v6 = (uint64_t)v5 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider;
  swift_beginAccess();
  sub_1BFA4DFE0(v6, (uint64_t)v9);
  uint64_t v7 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  id v8 = objc_msgSend(v5, sel_traitCollection);
  (*(void (**)(void))(v7 + 88))();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4 = sub_1BFBD1B68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1B48();
  id v8 = self;
  sub_1BFAB7DFC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC16NewsSubscription21PaywallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16NewsSubscription21PaywallViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_delegate);
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_pluggableDelegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider);
  swift_unknownObjectRelease();
  long long v3 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[6] = *(_OWORD *)((char *)&self->super._nibBundle
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[7] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super._dimmingView
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[9] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  void v8[3] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[4] = *(_OWORD *)((char *)&self->super._navigationItem
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[5] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[1] = v7;
  sub_1BFA516CC((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_layoutOptionsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController____lazy_storage___verificationSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController____lazy_storage___purchasingSpinner));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_purchasePresenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_sceneStateManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_webOptinFlowManager);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_personalizedPaywallDataService);
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  id v5 = a4;
  long long v6 = self;
  sub_1BFBD25E8();

  return v8;
}

@end