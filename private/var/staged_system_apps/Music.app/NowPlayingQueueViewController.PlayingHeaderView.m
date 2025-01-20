@interface NowPlayingQueueViewController.PlayingHeaderView
- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithCoder:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation NowPlayingQueueViewController.PlayingHeaderView

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_s17PlayingHeaderViewCMa();
  id v4 = a3;
  v5 = (char *)v7.receiver;
  [(NowPlayingQueueViewController.PlayingHeaderView *)&v7 applyLayoutAttributes:v4];
  v6 = *(void (**)(id))&v5[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes];
  if (v6)
  {
    swift_retain();
    v6(v4);
    sub_10006ADFC((uint64_t)v6);
  }
}

- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView *)sub_1003AD160(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes);
  *id v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_didUpdateAttributes));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController17PlayingHeaderView_footer);
}

@end