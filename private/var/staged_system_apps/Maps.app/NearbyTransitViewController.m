@interface NearbyTransitViewController
- (_TtC4Maps27NearbyTransitViewController)initWithActionCoordinator:(id)a3;
- (_TtC4Maps27NearbyTransitViewController)initWithCoder:(id)a3;
- (_TtC4Maps27NearbyTransitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NearbyTransitViewController

- (_TtC4Maps27NearbyTransitViewController)initWithActionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC4Maps27NearbyTransitViewController *)sub_1002A44A0(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC4Maps27NearbyTransitViewController)initWithCoder:(id)a3
{
  return (_TtC4Maps27NearbyTransitViewController *)sub_1002A2470(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002A2580();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002A371C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1002A3888(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyTransitViewController();
  id v4 = v5.receiver;
  [(NearbyTransitViewController *)&v5 viewDidAppear:v3];
  +[NearbyTeachableMomentContaineeViewController hasDisplayedNearbyCard]_0();
  sub_1002A39F0();
}

- (_TtC4Maps27NearbyTransitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps27NearbyTransitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitView;
  sub_1002A4BD4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitView), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void *)v3 + 6), *((void **)v3 + 7));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_nearbyTransitDeparturesProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27NearbyTransitViewController_mapView));

  swift_unknownObjectRelease();
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  v6 = self;
  id v7 = a3;
  v8 = self;
  [v6 captureUserAction:4 target:44 value:0];
  [(ContaineeViewController *)v8 handleDismissAction:v7];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1002A4684(v5);
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  v8 = self;
  sub_1002A4A48(a4);
}

@end