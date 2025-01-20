@interface BackgroundPlaybackUIInteractionManager
- (_TtC8VideosUI38BackgroundPlaybackUIInteractionManager)init;
- (void)onSwipeUp;
@end

@implementation BackgroundPlaybackUIInteractionManager

- (_TtC8VideosUI38BackgroundPlaybackUIInteractionManager)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_backgroundMediaController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_hostingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_swipeUpView));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_fullscreenTransitionHandler));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_playbackStateChangeHandler));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_updateUICompletionHandler));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_menuGestureRecognizer));
  swift_release();
  swift_release();
  swift_release();
}

- (void)onSwipeUp
{
  v2 = self;
  sub_1E33C43F4();
}

@end