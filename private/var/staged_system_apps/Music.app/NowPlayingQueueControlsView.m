@interface NowPlayingQueueControlsView
- (_TtC5Music27NowPlayingQueueControlsView)initWithCoder:(id)a3;
- (_TtC5Music27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityRepeatType;
- (int64_t)accessibilityShuffleType;
- (void)layoutSubviews;
@end

@implementation NowPlayingQueueControlsView

- (_TtC5Music27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music27NowPlayingQueueControlsView *)sub_10024C244(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music27NowPlayingQueueControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10024EABC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10024E794();
}

- (int64_t)accessibilityShuffleType
{
  if (self->contentView[OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_shuffleType]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.super.super.isa
  }
                             + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_shuffleType);
}

- (int64_t)accessibilityRepeatType
{
  if (self->contentView[OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_repeatType]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.super.super.super.isa
  }
                             + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_repeatType);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_autoPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_repeatButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_useListeningHistoryButton));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_autoPlayButtonAction));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_shuffleButtonAction));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_repeatButtonAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music27NowPlayingQueueControlsView_useListeningHistoryButtonAction);

  sub_10006ADFC(v3);
}

@end