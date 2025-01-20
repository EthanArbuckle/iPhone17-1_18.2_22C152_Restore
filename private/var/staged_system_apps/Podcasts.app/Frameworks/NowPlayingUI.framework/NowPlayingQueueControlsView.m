@interface NowPlayingQueueControlsView
- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
@end

@implementation NowPlayingQueueControlsView

- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI27NowPlayingQueueControlsView *)sub_A34F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A3DE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_A3B1C();
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  v6 = self;
  sub_A3980();
  [(NowPlayingQueueControlsView *)v6 setNeedsLayout];
  v5 = *(void (**)(_TtC12NowPlayingUI27NowPlayingQueueControlsView *))((char *)&v6->super.super.super.isa
                                                                                + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler);
  if (v5)
  {
    swift_retain();
    v5(v6);
    sub_FB70((uint64_t)v5);
  }
}

- (void).cxx_destruct
{
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_shareHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_sleepButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler);

  sub_FB70(v3);
}

@end