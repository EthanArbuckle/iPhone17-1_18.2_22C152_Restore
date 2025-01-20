@interface FMMutableGestureView
- (_TtC6FindMy20FMMutableGestureView)initWithCoder:(id)a3;
- (_TtC6FindMy20FMMutableGestureView)initWithFrame:(CGRect)a3;
@end

@implementation FMMutableGestureView

- (_TtC6FindMy20FMMutableGestureView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMMutableGestureView_identifier);
  v9 = (objc_class *)type metadata accessor for FMMutableGestureView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[FMMutableGestureView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy20FMMutableGestureView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMMutableGestureView_identifier);
  v6 = (objc_class *)type metadata accessor for FMMutableGestureView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(FMMutableGestureView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end