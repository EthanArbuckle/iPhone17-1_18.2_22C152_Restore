@interface RouteButton_iOS
- (_TtC12NowPlayingUI15RouteButton_iOS)init;
- (_TtC12NowPlayingUI15RouteButton_iOS)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI15RouteButton_iOS)initWithFrame:(CGRect)a3;
@end

@implementation RouteButton_iOS

- (_TtC12NowPlayingUI15RouteButton_iOS)init
{
  return (_TtC12NowPlayingUI15RouteButton_iOS *)sub_91800();
}

- (_TtC12NowPlayingUI15RouteButton_iOS)initWithFrame:(CGRect)a3
{
  *(void *)&self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_controlsViewController] = 0;
  *(void *)&self->controlsViewController[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NowPlayingUI15RouteButton_iOS *)sub_12A480();
  __break(1u);
  return result;
}

- (_TtC12NowPlayingUI15RouteButton_iOS)initWithCoder:(id)a3
{
  *(void *)&self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_controlsViewController] = 0;
  *(void *)&self->controlsViewController[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC12NowPlayingUI15RouteButton_iOS *)sub_12A480();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = &self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate];

  sub_1A608((uint64_t)v3);
}

@end