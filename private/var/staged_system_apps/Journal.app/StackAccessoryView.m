@interface StackAccessoryView
- (_TtC7Journal18StackAccessoryView)initWithCoder:(id)a3;
- (_TtC7Journal18StackAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation StackAccessoryView

- (_TtC7Journal18StackAccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StackAccessoryView();
  return -[StackAccessoryView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal18StackAccessoryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StackAccessoryView();
  return [(StackAccessoryView *)&v5 initWithCoder:a3];
}

@end