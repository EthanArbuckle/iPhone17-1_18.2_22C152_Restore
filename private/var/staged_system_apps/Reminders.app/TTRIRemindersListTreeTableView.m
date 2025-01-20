@interface TTRIRemindersListTreeTableView
- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset;
- (BOOL)isAccessibilityElement;
- (CGPoint)contentOffset;
- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentOffset:(CGPoint)a3;
@end

@implementation TTRIRemindersListTreeTableView

- (CGPoint)contentOffset
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TTRIRemindersListTreeTableView *)&v4 contentOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_10016A7D8(x, y);
}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514);
  void *v11 = 0;
  v11[1] = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[TTRITreeTableView initWithFrame:style:](&v13, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(TTRITreeTableView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1000499C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514));
}

@end