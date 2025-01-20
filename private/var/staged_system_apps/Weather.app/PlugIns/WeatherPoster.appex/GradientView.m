@interface GradientView
- (_TtC13WeatherPoster12GradientView)initWithCoder:(id)a3;
- (_TtC13WeatherPoster12GradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GradientView

- (_TtC13WeatherPoster12GradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002B160();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002B21C();
}

- (_TtC13WeatherPoster12GradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12GradientView_rotationState);
  id v3 = (char *)self + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
  uint64_t v4 = sub_100053CA8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end