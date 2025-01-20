@interface WeatherMapCachingViewController
- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WeatherMapCachingViewController

- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A352DC8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A35351C();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_20A3535B0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_20A353670(a3);
}

- (void)dealloc
{
  v2 = self;
  WeatherMapCachingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (_TtC11WeatherMaps31WeatherMapCachingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  WeatherMapCachingViewController.init(nibName:bundle:)();
}

@end