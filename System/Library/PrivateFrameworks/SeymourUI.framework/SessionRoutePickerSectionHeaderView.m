@interface SessionRoutePickerSectionHeaderView
- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithCoder:(id)a3;
- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SessionRoutePickerSectionHeaderView

- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView *)sub_239E77048(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_separatorView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC9SeymourUI35SessionRoutePickerSectionHeaderView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35SessionRoutePickerSectionHeaderView_separatorView);
}

@end