@interface TouchPassThroughView
- (_TtC7Measure20TouchPassThroughView)initWithCoder:(id)a3;
- (_TtC7Measure20TouchPassThroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TouchPassThroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TouchPassThroughView();
  id v7 = v12.receiver;
  id v8 = a4;
  id v9 = -[TouchPassThroughView hitTest:withEvent:](&v12, "hitTest:withEvent:", v8, x, y);
  if (!v9 || (v10 = v9, v8, id v8 = v7, v10 == v7))
  {

    id v10 = 0;
  }

  return v10;
}

- (_TtC7Measure20TouchPassThroughView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TouchPassThroughView();
  return -[TouchPassThroughView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure20TouchPassThroughView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TouchPassThroughView();
  return [(TouchPassThroughView *)&v5 initWithCoder:a3];
}

@end