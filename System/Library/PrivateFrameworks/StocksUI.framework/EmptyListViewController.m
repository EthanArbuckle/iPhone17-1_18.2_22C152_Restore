@interface EmptyListViewController
- (_TtC8StocksUI23EmptyListViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI23EmptyListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation EmptyListViewController

- (_TtC8StocksUI23EmptyListViewController)initWithCoder:(id)a3
{
  result = (_TtC8StocksUI23EmptyListViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A84E954();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20A84EA40();
}

- (_TtC8StocksUI23EmptyListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI23EmptyListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23EmptyListViewController_layoutAttributesFactory);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI23EmptyListViewController_emptyListView);
}

@end