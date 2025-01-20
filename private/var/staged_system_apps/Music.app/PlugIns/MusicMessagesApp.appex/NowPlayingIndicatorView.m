@interface NowPlayingIndicatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingIndicatorView

- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp23NowPlayingIndicatorView *)sub_1000079D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100009844();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_100007E68();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100007FE0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC16MusicMessagesApp23NowPlayingIndicatorView_levelWidth);
  uint64_t v4 = qword_10059EFB0;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  double v6 = v3 * 5.0 + *(double *)&qword_10059F230 * 4.0;
  double v7 = *(double *)((char *)&v5->super.super.super.isa
                 + OBJC_IVAR____TtC16MusicMessagesApp23NowPlayingIndicatorView_maximumLevelHeight);

  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_100008360(a3);
}

- (void).cxx_destruct
{
}

@end