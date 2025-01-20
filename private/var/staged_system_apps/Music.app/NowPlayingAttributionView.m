@interface NowPlayingAttributionView
- (_TtC5Music25NowPlayingAttributionView)initWithCoder:(id)a3;
- (_TtC5Music25NowPlayingAttributionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingAttributionView

- (_TtC5Music25NowPlayingAttributionView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music25NowPlayingAttributionView *)sub_1003D64E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music25NowPlayingAttributionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003D7154();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003D6CBC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___artworkView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___titleLabel);
}

@end