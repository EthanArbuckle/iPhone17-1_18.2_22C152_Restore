@interface NowPlayingRouteSharePlayTogetherControl
- (CGSize)intrinsicContentSize;
- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithCoder:(id)a3;
- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingRouteSharePlayTogetherControl

- (CGSize)intrinsicContentSize
{
  if (self->routeButton[OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_style] == 1)
  {
    if (*(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_style))
    {
      uint64_t v2 = qword_101098060;
      v3 = self;
      if (v2 != -1) {
        swift_once();
      }
      CGFloat v5 = *((double *)&xmmword_1011296F0 + 1);
      CGFloat v4 = *(double *)&xmmword_1011296F0;
    }
    else
    {
      [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButton) intrinsicContentSize];
      CGFloat v4 = v6;
      CGFloat v5 = v7;
    }
  }
  else
  {
    CGFloat v4 = UIViewNoIntrinsicMetric;
    CGFloat v5 = UIViewNoIntrinsicMetric;
  }
  double v8 = v4;
  double v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithFrame:(CGRect)a3
{
  return (_TtC5Music39NowPlayingRouteSharePlayTogetherControl *)sub_1003E56EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_1003E68E0();
}

- (_TtC5Music39NowPlayingRouteSharePlayTogetherControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E6ED4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_sharePlayTogetherButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_routeButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_sharePlayTogetherButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music39NowPlayingRouteSharePlayTogetherControl_badgeMaskLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end