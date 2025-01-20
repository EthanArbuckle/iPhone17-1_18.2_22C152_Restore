@interface SubscriptionOffersViewController
- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithCoder:(id)a3;
- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SubscriptionOffersViewController

- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFA6A688();
}

- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16NewsSubscription32SubscriptionOffersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_styler);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController____lazy_storage___verificationSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController____lazy_storage___purchasingSpinner));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchasePresenter);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchaseController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_subscriptionOffersView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_layoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModelFactory);
  swift_bridgeObjectRelease();
  sub_1BFA6AB7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel));
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_webOptinFlowManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(SubscriptionOffersViewController *)&v4 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1BFBD1F08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.receiver = self;
  v17.super_class = ObjectType;
  v10 = self;
  [(SubscriptionOffersViewController *)&v17 viewDidDisappear:v3];
  v11 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_eventHandler);
  sub_1BFBD1EF8();
  uint64_t v12 = sub_1BFBD1EE8();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v11[4] = v12;
  v11[5] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = v11[16];
  uint64_t v16 = v11[17];
  __swift_project_boxed_opaque_existential_1(v11 + 13, v15);
  (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BFA68978();
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = (char *)v12.receiver;
  [(SubscriptionOffersViewController *)&v12 viewWillLayoutSubviews];
  BOOL v3 = &v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
  if (v4)
  {
    uint64_t v5 = *((void *)v3 + 1);
    uint64_t v6 = *((void *)v3 + 2);
    uint64_t v7 = *((void *)v3 + 3);
    uint64_t v8 = *((void *)v3 + 4);
    uint64_t v9 = *((void *)v3 + 5);
    char v10 = v3[48];
    uint64_t v13 = *(void *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
    char v14 = v5 & 1;
    uint64_t v15 = v6;
    uint64_t v16 = v7;
    uint64_t v17 = v8;
    uint64_t v18 = v9;
    char v19 = v10 & 1;
    uint64_t v11 = *(void *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_tag];
    if (v11)
    {
      sub_1BFA6AB30(v4);
      swift_unknownObjectRetain();
      sub_1BFA69184((uint64_t)&v13, v11);
      swift_unknownObjectRelease();
      sub_1BFA6AB7C(v4);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SubscriptionOffersViewController *)&v3 viewDidLayoutSubviews];
  sub_1BFBD31D8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SubscriptionOffersViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1BFA6A768();
}

- (void)cancelButtonTapped
{
}

@end