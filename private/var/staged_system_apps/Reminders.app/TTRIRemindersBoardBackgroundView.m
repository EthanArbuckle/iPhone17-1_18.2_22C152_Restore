@interface TTRIRemindersBoardBackgroundView
- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithCoder:(id)a3;
- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithFrame:(CGRect)a3;
- (void)tapGestureAction:(id)a3;
@end

@implementation TTRIRemindersBoardBackgroundView

- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC9Reminders32TTRIRemindersBoardBackgroundView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = -[TTRIRemindersBoardBackgroundView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v10 = objc_allocWithZone((Class)UITapGestureRecognizer);
  v11 = v9;
  id v12 = [v10 initWithTarget:v11 action:"tapGestureAction:"];
  [(TTRIRemindersBoardBackgroundView *)v11 addGestureRecognizer:v12];

  return v11;
}

- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithCoder:(id)a3
{
  return (_TtC9Reminders32TTRIRemindersBoardBackgroundView *)sub_100300DEC(a3);
}

- (void)tapGestureAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100300EF4((uint64_t)v6);

  sub_10003D3BC((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end