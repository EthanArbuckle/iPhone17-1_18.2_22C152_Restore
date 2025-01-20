@interface ChargingNetworkPickerViewController
+ (NSString)reuseIdentifier;
- (_TtC4Maps35ChargingNetworkPickerViewController)init;
- (_TtC4Maps35ChargingNetworkPickerViewController)initWithCoder:(id)a3;
- (_TtC4Maps35ChargingNetworkPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4;
- (_TtC4Maps35ChargingNetworkPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate;
- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4;
- (void)reloadData;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ChargingNetworkPickerViewController

- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4
{
  v4 = a3;
  if (a3)
  {
    sub_100100830(0, (unint64_t *)&unk_1015D4B20);
    sub_1001EF808();
    v4 = (void *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();
  return (_TtC4Maps35ChargingNetworkPickerViewController *)sub_1003305A4(v4);
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100331458();
}

- (_TtC4Maps35ChargingNetworkPickerViewController)init
{
}

- (_TtC4Maps35ChargingNetworkPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_100331458();
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_100330904();
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_searchController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_tableView);
}

- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100330FF4(v6, a4);
}

- (void)reloadData
{
  NSString v2 = self;
  if ([(ChargingNetworkPickerViewController *)v2 isViewLoaded]) {
    [*(id *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC4Maps35ChargingNetworkPickerViewController_tableView) reloadData];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  [v4 resignFirstResponder];
  [(ChargingNetworkPickerViewController *)v5 dismissViewControllerAnimated:1 completion:0];
}

@end