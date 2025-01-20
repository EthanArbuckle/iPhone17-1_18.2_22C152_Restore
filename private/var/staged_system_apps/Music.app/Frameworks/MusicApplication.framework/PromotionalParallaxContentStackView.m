@interface PromotionalParallaxContentStackView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithCoder:(id)a3;
- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PromotionalParallaxContentStackView

- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_interitemSpacing) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_arrangedSubviews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_lastKnownHeight) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PromotionalParallaxContentStackView();
  return -[PromotionalParallaxContentStackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication35PromotionalParallaxContentStackView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_interitemSpacing) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_arrangedSubviews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_lastKnownHeight) = 0;
  id v5 = a3;

  result = (_TtC16MusicApplication35PromotionalParallaxContentStackView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_37CC38();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_37D318(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_37D318(0.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotionalParallaxContentStackView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(PromotionalParallaxContentStackView *)&v6 traitCollectionDidChange:v4];
  sub_37CB60(0);
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication35PromotionalParallaxContentStackView_layoutInvalidationHandler));

  swift_bridgeObjectRelease();
}

@end