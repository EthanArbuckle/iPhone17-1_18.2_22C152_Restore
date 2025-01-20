@interface ClipsTabViewController
- (CGSize)preferredContentSize;
- (_TtC8VideosUI22ClipsTabViewController)initWithCoder:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)vui_viewDidLoad;
@end

@implementation ClipsTabViewController

- (_TtC8VideosUI22ClipsTabViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3048688();
}

- (CGSize)preferredContentSize
{
  double v2 = 266.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double v3 = self;
  sub_1E30487AC();
}

- (void)vui_viewDidLoad
{
  double v2 = self;
  sub_1E3048970();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end