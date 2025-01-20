@interface UpsellViewController
- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UpsellViewController

- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_57348();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpsellViewController();
  id v2 = v3.receiver;
  [(UpsellViewController *)&v3 viewDidLoad];
  sub_53EB0();
  sub_5433C();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_53C48(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UpsellViewController();
  id v2 = v3.receiver;
  [(UpsellViewController *)&v3 viewWillLayoutSubviews];
  sub_54D90();
}

- (_TtC23ShelfKitCollectionViews20UpsellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews20UpsellViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_purchaseController);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_upsellInformation));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_artworkHeader));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews20UpsellViewController_infoContainerView);
}

@end