@interface RemoteFollowCommandCenter
- (_TtC10PodcastsUI25RemoteFollowCommandCenter)init;
- (void)remoteSetPlaybackQueueCommand:(id)a3 completion:(id)a4;
@end

@implementation RemoteFollowCommandCenter

- (void)remoteSetPlaybackQueueCommand:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1E3D9D170(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC10PodcastsUI25RemoteFollowCommandCenter)init
{
  result = (_TtC10PodcastsUI25RemoteFollowCommandCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

@end