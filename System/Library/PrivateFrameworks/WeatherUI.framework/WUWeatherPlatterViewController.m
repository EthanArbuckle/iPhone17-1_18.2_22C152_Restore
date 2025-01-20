@interface WUWeatherPlatterViewController
- (WUWeatherPlatterViewController)initWithCoder:(id)a3;
- (WUWeatherPlatterViewController)initWithLocation:(id)a3;
- (WUWeatherPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WUWeatherPlatterViewController)initWithURL:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WUWeatherPlatterViewController

- (WUWeatherPlatterViewController)initWithLocation:(id)a3
{
  return (WUWeatherPlatterViewController *)WeatherPlatterViewController.init(location:)(a3);
}

- (WUWeatherPlatterViewController)initWithURL:(id)a3
{
  uint64_t v3 = sub_1B4834AE0();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4834AC0();
  return (WUWeatherPlatterViewController *)WeatherPlatterViewController.init(url:)((uint64_t)v5);
}

- (WUWeatherPlatterViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  WeatherPlatterViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  WeatherPlatterViewController.viewWillLayoutSubviews()();
}

- (WUWeatherPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B4838D20();
  }
  id v5 = a4;
  WeatherPlatterViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
}

@end