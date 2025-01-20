@interface PurchasingSpinnerViewController
- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithCoder:(id)a3;
- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PurchasingSpinnerViewController

- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_spinnerView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for PurchasingSpinnerView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16NewsSubscription31PurchasingSpinnerViewController *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(PurchasingSpinnerViewController *)&v6 viewDidAppear:v3];
  PurchasingSpinner.label.getter();
  uint64_t v5 = (void *)sub_1BFBD45C8();
  swift_bridgeObjectRelease();
  MEMORY[0x1C18BC3E0](v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  PurchasingSpinnerViewController.viewWillLayoutSubviews()();
}

- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16NewsSubscription31PurchasingSpinnerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewStyler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewLayoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewRenderer);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_spinnerView);
}

@end