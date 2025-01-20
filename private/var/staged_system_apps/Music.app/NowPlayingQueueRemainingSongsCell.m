@interface NowPlayingQueueRemainingSongsCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithCoder:(id)a3;
- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingQueueRemainingSongsCell

- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music33NowPlayingQueueRemainingSongsCell *)sub_10024ED80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music33NowPlayingQueueRemainingSongsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10024F844();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music33NowPlayingQueueRemainingSongsCell_label);
}

@end