@interface PassthroughView
- (_TtC12MobileSafari15PassthroughView)initWithCoder:(id)a3;
- (_TtC12MobileSafari15PassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassthroughView

- (_TtC12MobileSafari15PassthroughView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PassthroughView();
  return -[BlurrableView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PassthroughView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[PassthroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_18C3A2670();
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_18C6FA0F8();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (_TtC12MobileSafari15PassthroughView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassthroughView();
  return [(BlurrableView *)&v5 initWithCoder:a3];
}

@end