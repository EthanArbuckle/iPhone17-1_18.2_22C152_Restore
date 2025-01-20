@interface TTRIReminderPrintPageRenderer
- (_TtC9Reminders29TTRIReminderPrintPageRenderer)init;
- (int64_t)numberOfPages;
- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
@end

@implementation TTRIReminderPrintPageRenderer

- (int64_t)numberOfPages
{
  v2 = self;
  sub_1005ED9E8();
  int64_t v4 = v3;

  return v4;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = (char *)self + OBJC_IVAR____TtC9Reminders29TTRIReminderPrintPageRenderer_pageRange;
  *(void *)v7 = location;
  *((void *)v7 + 1) = length;
  v7[16] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[TTRIReminderPrintPageRenderer prepareForDrawingPages:](&v8, "prepareForDrawingPages:", location, length);
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  -[TTRIReminderPrintPageRenderer drawContentForPageAtIndex:inRect:](&v9, "drawContentForPageAtIndex:inRect:", a3, x, y, width, height);
}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_super v9 = self;
  sub_1005EDEBC(a3, x, y, width, height);
}

- (_TtC9Reminders29TTRIReminderPrintPageRenderer)init
{
  result = (_TtC9Reminders29TTRIReminderPrintPageRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end