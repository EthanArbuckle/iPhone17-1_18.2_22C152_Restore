@interface BurnBarModalityIconPlatter
- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithCoder:(id)a3;
- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BurnBarModalityIconPlatter

- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26BurnBarModalityIconPlatter *)sub_23A373400(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A373D74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A373958();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_circleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_circleGradientLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_modalityIconView);
}

@end