@interface HeroCarouselItemView
- (NSArray)preferredFocusEnvironments;
- (_TtC8AppStore20HeroCarouselItemView)initWithCoder:(id)a3;
- (_TtC8AppStore20HeroCarouselItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeroCarouselItemView

- (_TtC8AppStore20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20HeroCarouselItemView *)sub_1003E25B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E56C4();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_overlayView);
  if (v2)
  {
    id v3 = self;
    id v4 = [v2 preferredFocusEnvironments];
    sub_100082C28((uint64_t *)&unk_100994C30);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_100082C28((uint64_t *)&unk_100994C30);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E2CAC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003E30BC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView____lazy_storage___moduleGradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_overlayView);
}

@end