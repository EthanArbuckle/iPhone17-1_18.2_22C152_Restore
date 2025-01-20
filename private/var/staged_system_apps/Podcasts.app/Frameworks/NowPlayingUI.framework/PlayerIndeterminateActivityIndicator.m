@interface PlayerIndeterminateActivityIndicator
- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tick;
@end

@implementation PlayerIndeterminateActivityIndicator

- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithFrame:(CGRect)a3
{
  sub_E0344(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)tick
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_phaseXPosition) = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_speed) + *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_phaseXPosition);
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer) setBackgroundColorPhase:];
}

- (_TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_E076C();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PlayerIndeterminateActivityIndicator();
  v2 = (char *)v13.receiver;
  [(PlayerIndeterminateActivityIndicator *)&v13 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer];
  id v4 = [v2 layer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_patternLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI36PlayerIndeterminateActivityIndicator_displayLink);
}

@end