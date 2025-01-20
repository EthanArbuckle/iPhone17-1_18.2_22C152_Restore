@interface PromotionalParallaxContentView
- (CGRect)frame;
- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithCoder:(id)a3;
- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PromotionalParallaxContentView

- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30PromotionalParallaxContentView *)sub_1CDF68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D348C();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(PromotionalParallaxContentView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  [(PromotionalParallaxContentView *)&v19 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[PromotionalParallaxContentView setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_1CF088(v11, v13, v15, v17);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1CF1DC();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v3.receiver;
  [(PromotionalParallaxContentView *)&v3 music_inheritedLayoutInsetsDidChange];
  if (*(void *)(*(void *)&v2[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_thumbnailArtworkComponent]
                 + 96))
    [v2 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1D0B3C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_additionalContentStackView));
  swift_release();
  swift_release();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_didInvalidatePreferredBaseHeight));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_pageHeaderContentView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundOverlayColor));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidChangeHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidFailHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_isPlayingDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_thumbnailArtworkShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_titleCompositingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_collapsedTitleCompositingView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_subtitleCompositingView);
}

@end