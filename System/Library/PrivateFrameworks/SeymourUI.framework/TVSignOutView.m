@interface TVSignOutView
- (_TtC9SeymourUI13TVSignOutView)initWithCoder:(id)a3;
- (_TtC9SeymourUI13TVSignOutView)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation TVSignOutView

- (_TtC9SeymourUI13TVSignOutView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13TVSignOutView *)sub_23A785ACC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13TVSignOutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7877F8();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A787300(v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_imageBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_buttonTrailingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13TVSignOutView_labelWidthConstraint);
}

@end