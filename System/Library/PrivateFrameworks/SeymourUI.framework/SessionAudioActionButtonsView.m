@interface SessionAudioActionButtonsView
- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithFrame:(CGRect)a3;
- (void)onRouteButtonTapped:(id)a3;
- (void)onRouteButtonTappedDown:(id)a3;
- (void)onRouteButtonTappedUp:(id)a3;
@end

@implementation SessionAudioActionButtonsView

- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI29SessionAudioActionButtonsView *)sub_23A30C8EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A30E0AC();
}

- (void)onRouteButtonTappedDown:(id)a3
{
}

- (void)onRouteButtonTappedUp:(id)a3
{
}

- (void)onRouteButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_alignmentRouteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_stackView));
  objc_release(*(id *)((char *)&self->super._gestureRecognizers
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_styleProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView____lazy_storage___mediaControls);
}

@end