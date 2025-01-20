@interface SpriteSheetAnimationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithCoder:(id)a3;
- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SpriteSheetAnimationView

- (void)layoutSubviews
{
  v2 = self;
  sub_2261B9058();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SpriteSheetAnimationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithCoder:(id)a3
{
  CGSize result = (_TtC12SeymourMedia24SpriteSheetAnimationView *)sub_22629A300();
  __break(1u);
  return result;
}

- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12SeymourMedia24SpriteSheetAnimationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12SeymourMedia24SpriteSheetAnimationView_spriteImageLayer));
}

@end