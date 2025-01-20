@interface TTRIBoardReminderCellBackgroundStrokeView
- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithCoder:(id)a3;
- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIBoardReminderCellBackgroundStrokeView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIBoardReminderCellBackgroundStrokeView *)&v3 layoutSubviews];
  sub_1004E42AC();
}

- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeWidth) = 0;
  uint64_t v9 = OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeColor;
  v10 = self;
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)[v10 tintColor];

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[TTRIBoardReminderCellBackgroundStrokeView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithCoder:(id)a3
{
  return (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView *)sub_1004E44FC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeColor));
}

@end