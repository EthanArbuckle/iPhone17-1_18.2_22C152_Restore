@interface SpriteSheetView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)tintColor;
- (_TtC9SeymourUI15SpriteSheetView)initWithCoder:(id)a3;
- (_TtC9SeymourUI15SpriteSheetView)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation SpriteSheetView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_239FA5104();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SpriteSheetView();
  v2 = [(SpriteSheetView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SpriteSheetView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(SpriteSheetView *)&v6 setTintColor:v4];
  sub_239FA5294();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SpriteSheetView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI15SpriteSheetView)initWithFrame:(CGRect)a3
{
  double v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_offsetAnimationKey);
  *double v3 = 0xD00000000000001DLL;
  v3[1] = 0x800000023A854450;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_animations) = (Class)MEMORY[0x263F8EE78];

  CGSize result = (_TtC9SeymourUI15SpriteSheetView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI15SpriteSheetView)initWithCoder:(id)a3
{
  double v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_offsetAnimationKey);
  *double v4 = 0xD00000000000001DLL;
  v4[1] = 0x800000023A854450;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_animations) = (Class)MEMORY[0x263F8EE78];
  id v5 = a3;

  CGSize result = (_TtC9SeymourUI15SpriteSheetView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end