@interface CarEVChargingAvailabilityViewController
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithCoder:(id)a3;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithViewModal:(id)a3;
- (void)configureForModalPresentation;
- (void)evChargingViewModelDidUpdate:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation CarEVChargingAvailabilityViewController

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithViewModal:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps39CarEVChargingAvailabilityViewController_viewModal) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CarEVChargingAvailabilityViewController();
  id v4 = a3;
  v5 = [(CarEVChargingAvailabilityViewController *)&v7 initWithNibName:0 bundle:0];
  swift_unknownObjectWeakAssign();

  return v5;
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithCoder:(id)a3
{
  result = (_TtC4Maps39CarEVChargingAvailabilityViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  type metadata accessor for CarEVChargingAvailabilityView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = self;
  id v5 = [v3 init];
  [(CarEVChargingAvailabilityViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  CarEVChargingAvailabilityViewController.viewDidLoad()();
}

- (void)evChargingViewModelDidUpdate:(id)a3
{
  id v4 = a3;
  v8 = self;
  objc_super v7 = (_TtC4Maps39CarEVChargingAvailabilityViewController *)[(CarEVChargingAvailabilityViewController *)v8 view];
  if (v7)
  {
    type metadata accessor for CarEVChargingAvailabilityView();
    if (swift_dynamicCastClass())
    {
      uint64_t v5 = swift_bridgeObjectRetain();
      sub_1002D07DC(v5);

      swift_bridgeObjectRelease();
      return;
    }

    v6 = v7;
  }
  else
  {

    v6 = v8;
  }
}

- (NSArray)focusOrderSubItems
{
  sub_1000FF33C((uint64_t *)&unk_1015D9E20);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (NSArray)preferredFocusEnvironments
{
  sub_1000FF33C(&qword_1015D9DB8);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)configureForModalPresentation
{
  NSArray v2 = self;
  id v3 = [(CarEVChargingAvailabilityViewController *)v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 setDirectionalLayoutMargins:16.0, 16.0, 16.0, 16.0];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps39CarEVChargingAvailabilityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps39CarEVChargingAvailabilityViewController_viewModal));
}

@end