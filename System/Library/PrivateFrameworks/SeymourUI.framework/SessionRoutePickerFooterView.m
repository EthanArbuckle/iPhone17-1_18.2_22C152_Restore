@interface SessionRoutePickerFooterView
- (_TtC9SeymourUI28SessionRoutePickerFooterView)initWithCoder:(id)a3;
- (_TtC9SeymourUI28SessionRoutePickerFooterView)initWithFrame:(CGRect)a3;
@end

@implementation SessionRoutePickerFooterView

- (_TtC9SeymourUI28SessionRoutePickerFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28SessionRoutePickerFooterView *)sub_239F148E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28SessionRoutePickerFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F14E70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerFooterView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28SessionRoutePickerFooterView_separatorView);
}

@end