@interface TTRIRemindersBoardColumnReorderingDebugOverlayView
- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithCoder:(id)a3;
- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIRemindersBoardColumnReorderingDebugOverlayView

- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView *)sub_1004DDC2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_activeReorderingContext) = 0;
  id v4 = a3;

  result = (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_infoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_pointView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_borderView);
}

@end