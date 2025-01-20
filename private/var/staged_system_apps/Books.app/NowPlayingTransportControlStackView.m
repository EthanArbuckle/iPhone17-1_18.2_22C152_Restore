@interface NowPlayingTransportControlStackView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5Books35NowPlayingTransportControlStackView)initWithCoder:(id)a3;
- (_TtC5Books35NowPlayingTransportControlStackView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingTransportControlStackView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_100650B10(v4, x, y);

  return v4 & 1;
}

- (_TtC5Books35NowPlayingTransportControlStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books35NowPlayingTransportControlStackView_useBoundsAsPointInside) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingTransportControlStackView();
  return -[NowPlayingTransportControlStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books35NowPlayingTransportControlStackView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Books35NowPlayingTransportControlStackView_useBoundsAsPointInside) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingTransportControlStackView();
  return [(NowPlayingTransportControlStackView *)&v5 initWithCoder:a3];
}

@end