@interface PassthroughView
- (_TtC11MusicCoreUI15PassthroughView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI15PassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = PassthroughView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC11MusicCoreUI15PassthroughView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PassthroughView();
  return -[PassthroughView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MusicCoreUI15PassthroughView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassthroughView();
  return [(PassthroughView *)&v5 initWithCoder:a3];
}

@end