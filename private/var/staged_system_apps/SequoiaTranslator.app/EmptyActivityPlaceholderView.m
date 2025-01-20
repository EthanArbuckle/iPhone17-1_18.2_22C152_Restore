@interface EmptyActivityPlaceholderView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithFrame:(CGRect)a3;
@end

@implementation EmptyActivityPlaceholderView

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for EmptyActivityPlaceholderView();
  return -[EmptyActivityPlaceholderView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmptyActivityPlaceholderView();
  return [(EmptyActivityPlaceholderView *)&v5 initWithCoder:a3];
}

@end