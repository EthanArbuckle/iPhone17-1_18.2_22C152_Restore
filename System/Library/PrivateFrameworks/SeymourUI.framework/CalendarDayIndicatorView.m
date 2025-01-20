@interface CalendarDayIndicatorView
- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CalendarDayIndicatorView

- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24CalendarDayIndicatorView *)sub_239EFD4F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24CalendarDayIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_shapeLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_appearance) = (Class)0x3FF0000000000000;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_oldRect);
  _OWORD *v8 = 0u;
  v8[1] = 0u;

  result = (_TtC9SeymourUI24CalendarDayIndicatorView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EFD7DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24CalendarDayIndicatorView_shapeLayer));
}

@end