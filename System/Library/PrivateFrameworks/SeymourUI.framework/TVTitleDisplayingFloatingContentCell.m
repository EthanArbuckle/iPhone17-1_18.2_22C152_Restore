@interface TVTitleDisplayingFloatingContentCell
- (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVTitleDisplayingFloatingContentCell

- (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell *)sub_23A70E2AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI36TVTitleDisplayingFloatingContentCell *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A70E76C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI36TVTitleDisplayingFloatingContentCell_floatingView));
}

@end