@interface VibrantShadowView
- (_TtC9SeymourUI17VibrantShadowView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17VibrantShadowView)initWithFrame:(CGRect)a3;
@end

@implementation VibrantShadowView

- (_TtC9SeymourUI17VibrantShadowView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17VibrantShadowView *)sub_239EFCBA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17VibrantShadowView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EFD400();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17VibrantShadowView_rasterizingContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17VibrantShadowView_snapshot);
}

@end