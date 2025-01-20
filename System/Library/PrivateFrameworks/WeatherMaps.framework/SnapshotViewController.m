@interface SnapshotViewController
- (_TtC11WeatherMaps22SnapshotViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SnapshotViewController

- (_TtC11WeatherMaps22SnapshotViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A3186D0();
}

- (void)dealloc
{
  v2 = self;
  sub_20A3187CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController____lazy_storage___snapshotView));
  sub_20A1E59F0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_onMapEventHandler));
  sub_20A31D3D4((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22SnapshotViewController_snapshotConfiguration, (void (*)(void))type metadata accessor for SnapshotViewController.SnapshotConfiguration);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A318B5C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20A3191B4();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_20A31937C(a3);
}

- (_TtC11WeatherMaps22SnapshotViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  sub_20A31B998();
}

@end