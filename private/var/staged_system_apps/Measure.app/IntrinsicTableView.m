@interface IntrinsicTableView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC7Measure18IntrinsicTableView)initWithCoder:(id)a3;
- (_TtC7Measure18IntrinsicTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation IntrinsicTableView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(IntrinsicTableView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v5 = v6.receiver;
  -[IntrinsicTableView setContentSize:](&v6, "setContentSize:", width, height);
  [v5 invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v4 = self;
  [(IntrinsicTableView *)v4 layoutIfNeeded];
  v9.receiver = v4;
  v9.super_class = ObjectType;
  [(IntrinsicTableView *)&v9 contentSize];
  double v6 = v5;

  double v7 = UIViewNoIntrinsicMetric;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (_TtC7Measure18IntrinsicTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[IntrinsicTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC7Measure18IntrinsicTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(IntrinsicTableView *)&v5 initWithCoder:a3];
}

@end