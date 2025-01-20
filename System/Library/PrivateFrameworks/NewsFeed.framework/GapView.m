@interface GapView
- (_TtC8NewsFeed7GapView)initWithCoder:(id)a3;
- (_TtC8NewsFeed7GapView)initWithFrame:(CGRect)a3;
@end

@implementation GapView

- (_TtC8NewsFeed7GapView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FB1400]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithActivityIndicatorStyle_, 100);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[GapView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(GapView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView)];
  return v12;
}

- (_TtC8NewsFeed7GapView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed7GapView_activityIndicatorView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1400]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 100);

  result = (_TtC8NewsFeed7GapView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end