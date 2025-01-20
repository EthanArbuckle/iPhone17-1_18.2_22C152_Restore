@interface TTRITableViewCellSelectedBackground
- (_TtC15RemindersUICoreP33_5EAE53F771078A2FF6F74718F262CF6635TTRITableViewCellSelectedBackground)initWithCoder:(id)a3;
- (_TtC15RemindersUICoreP33_5EAE53F771078A2FF6F74718F262CF6635TTRITableViewCellSelectedBackground)initWithFrame:(CGRect)a3;
@end

@implementation TTRITableViewCellSelectedBackground

- (_TtC15RemindersUICoreP33_5EAE53F771078A2FF6F74718F262CF6635TTRITableViewCellSelectedBackground)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[TTRITableViewCellSelectedBackground initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICoreP33_5EAE53F771078A2FF6F74718F262CF6635TTRITableViewCellSelectedBackground)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TTRITableViewCellSelectedBackground *)&v5 initWithCoder:a3];
}

@end