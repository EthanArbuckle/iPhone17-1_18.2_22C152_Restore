@interface NowPlayingQueueViewController.AutoPlayBackgroundView
- (_TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView)initWithCoder:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingQueueViewController.AutoPlayBackgroundView

- (_TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView *)sub_1003AF600(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003B25D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController22AutoPlayBackgroundView_backgroundView));
}

@end