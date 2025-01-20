@interface WFNetworkListViewController
- (WFNetworkListViewController)initWithCoder:(id)a3;
- (WFNetworkListViewController)initWithNetworkListDataSource:(id)a3 networkListConfigDataSource:(id)a4;
- (WFNetworkListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFNetworkListViewController

- (void)viewDidLoad
{
  v2 = self;
  WFNetworkListViewController.viewDidLoad()();
}

- (WFNetworkListViewController)initWithNetworkListDataSource:(id)a3 networkListConfigDataSource:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_networkListDataSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  id v6 = a3;
  id v7 = a4;
  return [(WFNetworkListViewController *)&v9 initWithNibName:0 bundle:0];
}

- (WFNetworkListViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_hostingController) = 0;
  id v4 = a3;

  result = (WFNetworkListViewController *)sub_2258827B8();
  __break(1u);
  return result;
}

- (WFNetworkListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (WFNetworkListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFNetworkListViewController_networkListDataSource));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource);
}

@end