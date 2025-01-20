@interface SessionRoutePickerHeaderView
- (_TtC9SeymourUI28SessionRoutePickerHeaderView)initWithCoder:(id)a3;
- (_TtC9SeymourUI28SessionRoutePickerHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SessionRoutePickerHeaderView

- (_TtC9SeymourUI28SessionRoutePickerHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28SessionRoutePickerHeaderView *)sub_23A3676B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28SessionRoutePickerHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A36828C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerHeaderView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerHeaderView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerHeaderView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerHeaderView_separatorView);
}

@end