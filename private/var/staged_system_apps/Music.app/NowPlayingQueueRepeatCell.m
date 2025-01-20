@interface NowPlayingQueueRepeatCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC5Music25NowPlayingQueueRepeatCell)initWithCoder:(id)a3;
- (_TtC5Music25NowPlayingQueueRepeatCell)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingQueueRepeatCell

- (_TtC5Music25NowPlayingQueueRepeatCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music25NowPlayingQueueRepeatCell *)sub_10024FBC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music25NowPlayingQueueRepeatCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002502FC();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music25NowPlayingQueueRepeatCell_label);
}

@end