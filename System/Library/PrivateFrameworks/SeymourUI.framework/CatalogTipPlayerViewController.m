@interface CatalogTipPlayerViewController
- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CatalogTipPlayerViewController

- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI30CatalogTipPlayerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CatalogTipPlayerViewController();
  id v4 = v5.receiver;
  [(CatalogTipPlayerViewController *)&v5 viewDidAppear:v3];
  sub_23A5FE268();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_239CBF9D4(a3);
}

- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI30CatalogTipPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30CatalogTipPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI30CatalogTipPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end