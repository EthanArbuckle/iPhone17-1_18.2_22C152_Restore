@interface EmptyView
- (_TtC8NewsFeed9EmptyView)initWithCoder:(id)a3;
- (_TtC8NewsFeed9EmptyView)initWithFrame:(CGRect)a3;
@end

@implementation EmptyView

- (_TtC8NewsFeed9EmptyView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[EmptyView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed9EmptyView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(EmptyView *)&v5 initWithCoder:a3];
}

@end