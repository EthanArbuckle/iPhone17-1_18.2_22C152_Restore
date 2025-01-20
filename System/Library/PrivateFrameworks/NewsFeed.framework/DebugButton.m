@interface DebugButton
- (_TtC8NewsFeed11DebugButton)initWithCoder:(id)a3;
- (_TtC8NewsFeed11DebugButton)initWithFrame:(CGRect)a3;
@end

@implementation DebugButton

- (_TtC8NewsFeed11DebugButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap;
  sub_1BFD22278();
  id v11 = objc_allocWithZone(v10);
  v12 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);

  v18.receiver = v12;
  v18.super_class = ObjectType;
  v13 = -[DebugButton initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v14 = *(Class *)((char *)&v13->super.super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap);
  v15 = v13;
  id v16 = v14;
  sub_1C151C87C();

  return v15;
}

- (_TtC8NewsFeed11DebugButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed11DebugButton_onTap;
  sub_1BFD22278();
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed11DebugButton *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end