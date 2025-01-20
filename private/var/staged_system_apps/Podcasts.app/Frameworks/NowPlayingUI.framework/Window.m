@interface Window
- (UITraitCollection)traitCollection;
- (_TtC12NowPlayingUI6Window)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI6Window)initWithContentRect:(CGRect)a3;
- (_TtC12NowPlayingUI6Window)initWithFrame:(CGRect)a3;
- (_TtC12NowPlayingUI6Window)initWithWindowScene:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation Window

- (_TtC12NowPlayingUI6Window)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI6Window_screenDimensionsDidChangeHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI6Window_boundsSizeDidChangeHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection) = 0;
  id v6 = a3;

  result = (_TtC12NowPlayingUI6Window *)sub_12A480();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  Window.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection) = 0;
  id v5 = a3;
  id v6 = self;

  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for Window();
  [(Window *)&v7 traitCollectionDidChange:v5];
}

- (UITraitCollection)traitCollection
{
  v2 = self;
  id v3 = (id)sub_124F58();

  return (UITraitCollection *)v3;
}

- (_TtC12NowPlayingUI6Window)initWithWindowScene:(id)a3
{
  id v3 = a3;
  result = (_TtC12NowPlayingUI6Window *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12NowPlayingUI6Window)initWithFrame:(CGRect)a3
{
}

- (_TtC12NowPlayingUI6Window)initWithContentRect:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI6Window_screenDimensionsDidChangeHandler));
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI6Window_boundsSizeDidChangeHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI6Window_overrideTraitCollection);
}

@end