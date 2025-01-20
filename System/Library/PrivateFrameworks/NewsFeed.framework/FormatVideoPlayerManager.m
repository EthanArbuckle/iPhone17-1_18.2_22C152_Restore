@interface FormatVideoPlayerManager
- (_TtC8NewsFeed24FormatVideoPlayerManager)init;
- (id)videoAdForVideoPlayerViewController:(id)a3;
- (id)videoForVideoPlayerViewController:(id)a3;
- (void)didApplyBookmark;
- (void)didFinishCoveringWithNotification:(id)a3;
- (void)didStartCoveringWithNotification:(id)a3;
- (void)startPictureInPictureIfPossible;
- (void)videoPlayerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4;
- (void)videoPlayerViewController:(id)a3 startedPlaybackOfVideo:(id)a4;
- (void)videoPlayerViewControllerDidExitFullscreen:(id)a3;
- (void)videoPlayerViewControllerDidStopPictureInPicture:(id)a3;
- (void)videoPlayerViewControllerWillStartPictureInPicture:(id)a3;
- (void)willApplyBookmark;
@end

@implementation FormatVideoPlayerManager

- (void)startPictureInPictureIfPossible
{
  v2 = self;
  sub_1C0D8F00C();
}

- (void)willApplyBookmark
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isBookmarkInProgress) = 1;
}

- (void)didApplyBookmark
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isBookmarkInProgress) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isViewTransitionInProcess) = 0;
}

- (void)didStartCoveringWithNotification:(id)a3
{
}

- (void)didFinishCoveringWithNotification:(id)a3
{
}

- (_TtC8NewsFeed24FormatVideoPlayerManager)init
{
  result = (_TtC8NewsFeed24FormatVideoPlayerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_delegate);
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_reuseDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_playerViewController));
  swift_release();

  sub_1C0D91C00((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_cover);
  swift_bridgeObjectRelease();
  sub_1C0D92080((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_data, (uint64_t (*)(void))type metadata accessor for FormatVideoPlayerData);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_videoAdProviderFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_coordinator);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_sceneProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_offlineAlertControllerFactory;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)videoPlayerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0D921C0();
}

- (void)videoPlayerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0D904F0(v4);
}

- (void)videoPlayerViewController:(id)a3 startedPlaybackOfVideo:(id)a4
{
}

- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4
{
}

- (void)videoPlayerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1C0D92668(v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)videoPlayerViewControllerDidExitFullscreen:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0D90C70(v4);
}

- (id)videoAdForVideoPlayerViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1C0D91104((uint64_t)v4);

  return v6;
}

- (id)videoForVideoPlayerViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1C0D92828();

  return v6;
}

@end