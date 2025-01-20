@interface ParallaxView.ContentView
- (UIColor)backgroundColor;
- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation ParallaxView.ContentView

- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12ParallaxView11ContentView *)sub_546154(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ParallaxView.ContentView();
  v2 = [(ParallaxView.ContentView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ParallaxView.ContentView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ParallaxView.ContentView *)&v6 setBackgroundColor:v4];
  sub_54777C();
}

- (_TtCC16MusicApplication12ParallaxView11ContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5487E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_546DA4();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_controlsView));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageDidChange));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkProminentColorDidChange));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_artworkImageAttachmentsDidChange));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidChangeHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_videoLooperDidFailHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_isPlayingDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_topBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_topBlurMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___bottomGradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView_gradientColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication12ParallaxView11ContentView____lazy_storage___legibilityGradient);
}

@end