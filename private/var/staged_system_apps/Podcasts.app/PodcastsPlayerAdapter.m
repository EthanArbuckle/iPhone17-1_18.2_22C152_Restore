@interface PodcastsPlayerAdapter
+ (_TtC8Podcasts21PodcastsPlayerAdapter)sharedInstance;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)isTargetPlaying;
- (MPAVRoute)route;
- (MPCPlayerPath)playbackPlayerPath;
- (NSString)PlayerNotification_JumpDurationDidChange_String;
- (NSString)localizedStringForSkipBackwards;
- (NSString)localizedStringForSkipForward;
- (_TtC8Podcasts21PodcastsPlayerAdapter)init;
- (void)autoStopModeDidChange;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)currentChapterDidChange;
- (void)dealloc;
- (void)jumpBackwardsWithCompletion:(id)a3;
- (void)jumpForwardsWithCompletion:(id)a3;
- (void)loadedDurationDidChange;
- (void)pauseWithCompletion:(id)a3;
- (void)periodicUpdate;
- (void)playWithCompletion:(id)a3;
- (void)playerRateDidChange;
- (void)playerVolumeDidChange;
- (void)setIsTargetPlaying:(BOOL)a3;
- (void)setRoute:(id)a3;
@end

@implementation PodcastsPlayerAdapter

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  PodcastsPlayerAdapter.controller(_:defersResponseReplacement:)(v8, (uint64_t)sub_1000343D8, v7);

  swift_release();
}

- (_TtC8Podcasts21PodcastsPlayerAdapter)init
{
  return (_TtC8Podcasts21PodcastsPlayerAdapter *)sub_100050CB0();
}

+ (_TtC8Podcasts21PodcastsPlayerAdapter)sharedInstance
{
  if (qword_1005F5AE8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10061ACB0;

  return (_TtC8Podcasts21PodcastsPlayerAdapter *)v2;
}

- (MPCPlayerPath)playbackPlayerPath
{
  id v2 = [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator) metadataPlayerPath];

  return (MPCPlayerPath *)v2;
}

- (MPAVRoute)route
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerPathCoordinator);
  v3 = self;
  id v4 = [v2 metadataPlayerPath];
  id v5 = [v4 route];

  return (MPAVRoute *)v5;
}

- (void)setRoute:(id)a3
{
  id v5 = a3;
  id v4 = self;
  dispatch thunk of PlayerPathCoordinator.updatePlayerPaths(with:)();
}

- (void)dealloc
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerRequestController);
  v3 = self;
  [v2 endAutomaticResponseLoading];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PodcastsPlayerAdapter(0);
  [(PodcastsPlayerAdapter *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter__playbackSpeedMenu;
  uint64_t v4 = sub_100054B78(&qword_100604210);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_playerRequestController));
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)isTargetPlaying
{
  id v2 = (BOOL *)self + OBJC_IVAR____TtC8Podcasts21PodcastsPlayerAdapter_isTargetPlaying;
  swift_beginAccess();
  return *v2;
}

- (void)setIsTargetPlaying:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10034CF98(a3);
}

- (NSString)PlayerNotification_JumpDurationDidChange_String
{
  PlayerNotification_JumpDurationDidChange.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)playWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_100352B10;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  PodcastsPlayerAdapter.play(completion:)((uint64_t)v7, v6);
  sub_1000536BC((uint64_t)v7);
}

- (void)pauseWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_100352B10;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  PodcastsPlayerAdapter.pause(completion:)((uint64_t)v7, v6);
  sub_1000536BC((uint64_t)v7);
}

- (void)jumpForwardsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_100352B10;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  PodcastsPlayerAdapter.jumpForwards(completion:)((uint64_t)v7, v6);
  sub_1000536BC((uint64_t)v7);
}

- (NSString)localizedStringForSkipForward
{
  return (NSString *)sub_10034F3C0(self, (uint64_t)a2, (void (*)(void))PodcastsPlayerAdapter.localizedStringForSkipForward.getter);
}

- (NSString)localizedStringForSkipBackwards
{
  return (NSString *)sub_10034F3C0(self, (uint64_t)a2, (void (*)(void))PodcastsPlayerAdapter.localizedStringForSkipBackwards.getter);
}

- (void)jumpBackwardsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1003528C0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  PodcastsPlayerAdapter.jumpBackwards(completion:)((uint64_t)v7, v6);
  sub_1000536BC((uint64_t)v7);
}

- (void)periodicUpdate
{
}

- (void)autoStopModeDidChange
{
  NSString v2 = self;
  sub_100350670();
}

- (void)currentChapterDidChange
{
}

- (void)loadedDurationDidChange
{
}

- (void)playerVolumeDidChange
{
}

- (void)playerRateDidChange
{
  NSString v2 = self;
  sub_100350B10();
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [v6 request];
  self;
  v10 = (void *)swift_dynamicCastObjCClass();
  if (v10)
  {
    id v11 = [v10 playerPath];
    if (!v11)
    {
      __break(1u);
      return (char)v11;
    }
    v12 = v11;
    dispatch thunk of PlayerPathCoordinator.didReceiveErrorLoadingResponse(for:error:)();

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }

  LOBYTE(v11) = 1;
  return (char)v11;
}

@end