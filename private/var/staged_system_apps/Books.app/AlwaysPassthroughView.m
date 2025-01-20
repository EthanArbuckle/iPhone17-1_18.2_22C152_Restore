@interface AlwaysPassthroughView
- (BOOL)isUserInteractionEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5Books21AlwaysPassthroughView)initWithCoder:(id)a3;
- (_TtC5Books21AlwaysPassthroughView)initWithFrame:(CGRect)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation AlwaysPassthroughView

- (_TtC5Books21AlwaysPassthroughView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AlwaysPassthroughView();
  v7 = -[AlwaysPassthroughView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = [v8 clearColor];
  [(AlwaysPassthroughView *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC5Books21AlwaysPassthroughView)initWithCoder:(id)a3
{
  result = (_TtC5Books21AlwaysPassthroughView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AlwaysPassthroughView();
  [(AlwaysPassthroughView *)&v4 setUserInteractionEnabled:v3];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end