@interface MiniPlayerView
- (_TtC12NowPlayingUI14MiniPlayerView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI14MiniPlayerView)initWithFrame:(CGRect)a3;
@end

@implementation MiniPlayerView

- (_TtC12NowPlayingUI14MiniPlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MiniPlayerView();
  return -[MiniPlayerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI14MiniPlayerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MiniPlayerView();
  return [(MiniPlayerView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end