@interface StickerEffectChooser
- (CGSize)intrinsicContentSize;
- (_TtC10StickersUI20StickerEffectChooser)initWithCoder:(id)a3;
- (_TtC10StickersUI20StickerEffectChooser)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation StickerEffectChooser

- (_TtC10StickersUI20StickerEffectChooser)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI20StickerEffectChooser *)sub_25E47CA5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI20StickerEffectChooser)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25E47EB74();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25E47D5B4(v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_25E47DA64();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_25E47E690();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_25E47EC2C((uint64_t)self + OBJC_IVAR____TtC10StickersUI20StickerEffectChooser_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI20StickerEffectChooser_highlightView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI20StickerEffectChooser_image);
}

@end