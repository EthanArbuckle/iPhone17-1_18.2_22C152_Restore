@interface ReusableContainerView
- (_TtC8NewsFeed21ReusableContainerView)initWithCoder:(id)a3;
- (_TtC8NewsFeed21ReusableContainerView)initWithFrame:(CGRect)a3;
@end

@implementation ReusableContainerView

- (_TtC8NewsFeed21ReusableContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC8NewsFeed21ReusableContainerView_onReuse;
  sub_1BFD22278();
  id v11 = objc_allocWithZone(v10);
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v11, sel_init);

  v14.receiver = v12;
  v14.super_class = ObjectType;
  return -[ReusableContainerView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed21ReusableContainerView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC8NewsFeed21ReusableContainerView_onReuse;
  sub_1BFD22278();
  id v8 = objc_allocWithZone(v7);
  id v9 = a3;
  Class v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v8, sel_init);

  v13.receiver = v10;
  v13.super_class = ObjectType;
  id v11 = [(ReusableContainerView *)&v13 initWithCoder:v9];

  return v11;
}

- (void).cxx_destruct
{
}

@end