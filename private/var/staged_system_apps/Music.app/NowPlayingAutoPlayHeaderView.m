@interface NowPlayingAutoPlayHeaderView
- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithCoder:(id)a3;
- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingAutoPlayHeaderView

- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music28NowPlayingAutoPlayHeaderView *)sub_1004D7664(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004D8C78();
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingAutoPlayHeaderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(NowPlayingAutoPlayHeaderView *)&v6 applyLayoutAttributes:v4];
  [v5 setClipsToBounds:sub_1004D8E30() & 1];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004D86BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_backgroundGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_autoplayImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_subtitleLabel);
}

@end