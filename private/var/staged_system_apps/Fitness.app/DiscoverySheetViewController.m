@interface DiscoverySheetViewController
- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton;
- (void)didTapXButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DiscoverySheetViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100643F04();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DiscoverySheetViewController();
  v4 = v5.receiver;
  [(DiscoverySheetViewController *)&v5 viewDidAppear:v3];
  sub_100644668();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10038380C(v4[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_dataModel]);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didTapXButton
{
  v2 = self;
  sub_100644D6C();
  [(DiscoverySheetViewController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)didTapContinueButton
{
  v2 = self;
  sub_100644D4C();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_100383D48(v2);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC10FitnessApp28DiscoverySheetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp28DiscoverySheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC10FitnessApp28DiscoverySheetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_delegate]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  BOOL v3 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC10FitnessApp28DiscoverySheetViewController_metricPage];
  uint64_t v4 = type metadata accessor for MetricPage();
  objc_super v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end