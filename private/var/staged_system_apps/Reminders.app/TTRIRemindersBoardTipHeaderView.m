@interface TTRIRemindersBoardTipHeaderView
- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithArrangedSubviews:(id)a3;
- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIRemindersBoardTipHeaderView

- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders31TTRIRemindersBoardTipHeaderView *)sub_100113E4C();
}

- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithCoder:(id)a3
{
  v4 = &self->NUIContainerBoxView_opaque[OBJC_IVAR____TtC9Reminders31TTRIRemindersBoardTipHeaderView_contentConfiguration];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v5 = &self->NUIContainerBoxView_opaque[OBJC_IVAR____TtC9Reminders31TTRIRemindersBoardTipHeaderView_contentView];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = a3;

  result = (_TtC9Reminders31TTRIRemindersBoardTipHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC9Reminders31TTRIRemindersBoardTipHeaderView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9Reminders31TTRIRemindersBoardTipHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100113DEC((uint64_t)&self->NUIContainerBoxView_opaque[OBJC_IVAR____TtC9Reminders31TTRIRemindersBoardTipHeaderView_contentConfiguration]);

  v3 = *(void **)&self->NUIContainerBoxView_opaque[OBJC_IVAR____TtC9Reminders31TTRIRemindersBoardTipHeaderView_contentView];
}

@end