@interface NowPlayingQueueViewController.NowPlayingQueueFooterView
- (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView)initWithCoder:(id)a3;
- (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingQueueViewController.NowPlayingQueueFooterView

- (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView *)sub_1003AFB40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView____lazy_storage___topPaddingConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView____lazy_storage___bottomPaddingConstraint) = 0;
  id v4 = a3;

  result = (_TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView____lazy_storage___topPaddingConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController25NowPlayingQueueFooterView____lazy_storage___bottomPaddingConstraint);
}

@end