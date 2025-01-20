@interface AmbientEditButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (_TtC11PosterBoard17AmbientEditButton)initWithCoder:(id)a3;
- (_TtC11PosterBoard17AmbientEditButton)initWithFrame:(CGRect)a3;
@end

@implementation AmbientEditButton

- (_TtC11PosterBoard17AmbientEditButton)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard17AmbientEditButton *)sub_1D3356354(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard17AmbientEditButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleCoordinator) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleItemView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyle) = 0;
  id v4 = a3;

  result = (_TtC11PosterBoard17AmbientEditButton *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(AmbientEditButton *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 10.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_outerRing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_innerRing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleItemView));
  swift_unknownObjectRelease();
}

@end