@interface PodcastsStateCoordinator
+ (_TtC8Podcasts24PodcastsStateCoordinator)shared;
+ (void)setShared:(id)a3;
- (_TtC8Podcasts24PodcastsStateCoordinator)init;
- (id)currentPodcastStateDescriptionFrom:(id)a3;
- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4;
- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)disableSubscriptionsOnPodcastUUIDs:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)enableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4;
- (void)insertNewImplicitFollowIfNeededForPlayerItem:(id)a3 from:(int64_t)a4 completion:(id)a5;
- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4 shouldDownloadEpisode:(BOOL)a5 from:(int64_t)a6;
- (void)unsafeDidBumpLastDatePlayedFor:(id)a3;
- (void)unsafeEnableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5;
- (void)unsafeEpisodePlayedBeyondThresholdForFirstTime:(id)a3 from:(int64_t)a4;
- (void)unsafeMark:(id)a3 as:(int64_t)a4 in:(id)a5 from:(int64_t)a6;
- (void)unsafeRemoveEpisodeFromBookmarks:(id)a3 from:(int64_t)a4;
@end

@implementation PodcastsStateCoordinator

+ (_TtC8Podcasts24PodcastsStateCoordinator)shared
{
  if (qword_1005F5AE0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC8Podcasts24PodcastsStateCoordinator *)(id)static PodcastsStateCoordinator.shared;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1005F5AE0;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)static PodcastsStateCoordinator.shared;
  static PodcastsStateCoordinator.shared = (uint64_t)v4;
}

- (_TtC8Podcasts24PodcastsStateCoordinator)init
{
  result = (_TtC8Podcasts24PodcastsStateCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_library);
}

- (void)enableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v9 = self;
  PodcastsStateCoordinator.enableSubscription(onPodcastUUID:from:)(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)unsafeEnableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a5;
  uint64_t v8 = self;
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v11 podcastForUuid:v9];

  if (v10)
  {
    sub_100336848(v10, a4);
    [v11 saveInCurrentBlock];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider) mainOrPrivateContext];
  [(PodcastsStateCoordinator *)v6 disableSubscriptionOnPodcastUUID:v7 from:a4 context:v8];

  swift_bridgeObjectRelease();
}

- (void)disableSubscriptionOnPodcastUUID:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = (void *)swift_allocObject();
  v11[2] = a5;
  v11[3] = v8;
  v11[4] = v10;
  v11[5] = self;
  v11[6] = a4;
  v17[4] = sub_10033D7F0;
  v17[5] = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10003B424;
  v17[3] = &unk_100562650;
  v12 = _Block_copy(v17);
  id v13 = a5;
  v14 = self;
  id v15 = v13;
  v16 = v14;
  swift_bridgeObjectRetain();
  swift_release();
  [v15 performBlockAndWaitWithSave:v12];
  _Block_release(v12);

  swift_bridgeObjectRelease();
}

- (void)disableSubscriptionsOnPodcastUUIDs:(id)a3 from:(int64_t)a4 context:(id)a5
{
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a5;
  v9[3] = v8;
  v9[4] = self;
  v9[5] = a4;
  v15[4] = sub_10033F1F0;
  v15[5] = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10003B424;
  v15[3] = &unk_100562600;
  uint64_t v10 = _Block_copy(v15);
  id v11 = a5;
  v12 = self;
  id v13 = v11;
  v14 = v12;
  swift_bridgeObjectRetain();
  swift_release();
  [v13 performBlockAndWaitWithSave:v10];
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4 shouldDownloadEpisode:(BOOL)a5 from:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = self;
  sub_100337C9C(v10, *(void **)&a4, 0, v7, a6);
}

- (void)unsafeRemoveEpisodeFromBookmarks:(id)a3 from:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = self;
  PodcastsStateCoordinator.unsafeRemoveEpisodeFromBookmarks(episode:from:)(v6, a4);
}

- (void)insertNewImplicitFollowIfNeededForPlayerItem:(id)a3 from:(int64_t)a4 completion:(id)a5
{
  type metadata accessor for EpisodePlayerItem();
  __chkstk_darwin();
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PodcastPlayerItem();
  __chkstk_darwin();
  uint64_t v11 = type metadata accessor for PlayerItem();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = _Block_copy(a5);
  id v16 = a3;
  _Block_copy(v15);
  v17 = self;
  sub_10024830C(v16);
  id v18 = v16;
  sub_100248468(v18, (uint64_t)v10);
  PlayerItem.init(podcast:episode:)();

  sub_10033D860((uint64_t)v14, a4, (uint64_t)v17, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  _Block_release(v15);
}

- (void)unsafeEpisodePlayedBeyondThresholdForFirstTime:(id)a3 from:(int64_t)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  PodcastsStateCoordinator.unsafeEpisodePlayedBeyondThresholdForFirstTime(_:from:)(a3, a4);
}

- (void)unsafeMark:(id)a3 as:(int64_t)a4 in:(id)a5 from:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = self;
  sub_10033DF18(v10, (void *)a4, a6);
}

- (void)unsafeDidBumpLastDatePlayedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  PodcastsStateCoordinator.unsafeDidBumpLastDatePlayed(for:)(v4);
}

- (id)currentPodcastStateDescriptionFrom:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  _s8Podcasts0A16StateCoordinatorC014currentPodcastB11Description4fromS2S_tF_0();

  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

@end