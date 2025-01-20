@interface TTRIRemindersBoardCompletedHeaderView
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityElements;
- (NSString)accessibilityLabel;
- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithArrangedSubviews:(id)a3;
- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithCoder:(id)a3;
- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersBoardCompletedHeaderView

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *)sub_100616D44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006176B4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10061720C();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_1006173A0();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100617488();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 16];
  uint64_t v4 = *(void *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 32];
  swift_bridgeObjectRelease();
  sub_1000499C4(v3);
  sub_1000499C4(v4);

  swift_release();
}

@end