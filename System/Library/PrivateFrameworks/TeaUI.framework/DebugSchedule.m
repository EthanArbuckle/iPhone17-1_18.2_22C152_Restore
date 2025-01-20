@interface DebugSchedule
- (_TtC5TeaUI13DebugSchedule)initWithCoder:(id)a3;
- (_TtC5TeaUI13DebugSchedule)initWithFrame:(CGRect)a3;
- (_TtC5TeaUI13DebugSchedule)initWithWindowScene:(id)a3;
- (void)layoutSubviews;
@end

@implementation DebugSchedule

- (_TtC5TeaUI13DebugSchedule)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B614C03C();
}

- (void)layoutSubviews
{
  v2 = self;
  DebugSchedule.layoutSubviews()();
}

- (_TtC5TeaUI13DebugSchedule)initWithWindowScene:(id)a3
{
  id v3 = a3;
  DebugSchedule.init(windowScene:)();
}

- (_TtC5TeaUI13DebugSchedule)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI13DebugSchedule_timer);
}

@end