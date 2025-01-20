@interface WeekdayPickerView
- (_TtC9SeymourUI17WeekdayPickerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17WeekdayPickerView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation WeekdayPickerView

- (_TtC9SeymourUI17WeekdayPickerView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17WeekdayPickerView *)sub_23A48F1C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17WeekdayPickerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A48FD44();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A48F58C();
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17WeekdayPickerView_onItemTapped));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end