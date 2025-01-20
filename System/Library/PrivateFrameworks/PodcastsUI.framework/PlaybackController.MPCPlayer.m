@interface PlaybackController.MPCPlayer
- (_TtCC10PodcastsUI18PlaybackController9MPCPlayer)init;
- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 didUpdatePlaybackPositionWithEvent:(id)a4;
@end

@implementation PlaybackController.MPCPlayer

- (_TtCC10PodcastsUI18PlaybackController9MPCPlayer)init
{
  result = (_TtCC10PodcastsUI18PlaybackController9MPCPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E3C10CE0((uint64_t)self + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController9MPCPlayer_playbackPositionTracker, &qword_1EBFE00C8);
  sub_1E3C10CE0((uint64_t)self + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController9MPCPlayer_observer, &qword_1EBFE4E70);
}

- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1E3E2F76C(v11);
}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1E3E2F9A0(v11);
}

- (void)engine:(id)a3 didUpdatePlaybackPositionWithEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1E3E2FBAC(v7);
}

@end