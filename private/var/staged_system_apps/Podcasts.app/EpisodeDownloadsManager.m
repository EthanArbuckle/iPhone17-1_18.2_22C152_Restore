@interface EpisodeDownloadsManager
- (BOOL)handleEventsForBackgroundURLSession:(id)a3 handler:(id)a4;
- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3;
- (_TtC8Podcasts23EpisodeDownloadsManager)init;
- (id)cancelAllDownloadsUserInitiated:(BOOL)a3;
- (id)downloadAtIndex:(int64_t)a3;
- (id)downloadForEpisodeWithUuid:(id)a3;
- (id)episodeUuidForDownloadWithAdamID:(id)a3;
- (int64_t)indexForDownload:(id)a3;
- (int64_t)numberOfDownloads;
- (int64_t)numberOfDownloadsFrom:(id)a3;
- (void)addEpisodeAutoDownloads:(id)a3 completion:(id)a4;
- (void)cancelDownloadsForEpisodeUuid:(id)a3 userInitiated:(BOOL)a4;
- (void)downloadEpisode:(id)a3 isFromSaving:(BOOL)a4;
- (void)invalidateURLSessions;
- (void)removeDownload:(id)a3 shouldAllowAutomaticRedownloads:(BOOL)a4 completion:(id)a5;
- (void)removeDownloadedEpisodes:(id)a3;
- (void)restoreDownloadedEpisodes:(id)a3 completion:(id)a4;
@end

@implementation EpisodeDownloadsManager

- (_TtC8Podcasts23EpisodeDownloadsManager)init
{
  result = (_TtC8Podcasts23EpisodeDownloadsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___serialQueue));

  swift_bridgeObjectRelease();
  swift_release();
  sub_100011468((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_downloaderConfiguration);

  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_userAlertsPresenter, (uint64_t *)&unk_1005F7AA0);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_assetsFolder;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_mediaLibraryClient, (uint64_t *)&unk_1005F6FD0);
  swift_unknownObjectRelease();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_dsidProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___restoreQueue));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_artworkStorage);
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager_finalCheckBeforStart));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Podcasts23EpisodeDownloadsManager____lazy_storage___preflightURLSession);
}

- (BOOL)handleEventsForBackgroundURLSession:(id)a3 handler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  LOBYTE(v6) = EpisodeDownloadsManager.handleEventsForBackgroundURLSession(identifier:handler:)(v6, v8, (uint64_t)sub_1000343D8, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

- (void)restoreDownloadedEpisodes:(id)a3 completion:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_1003D2A84;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = self;
  EpisodeDownloadsManager.restoreDownloadedEpisodes(_:completion:)(v6, (uint64_t)v5, v7);
  sub_1000536BC((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)downloadEpisode:(id)a3 isFromSaving:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  EpisodeDownloadsManager.downloadEpisode(_:isFromSaving:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)addEpisodeAutoDownloads:(id)a3 completion:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v5 = sub_1003D2A84;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = self;
  EpisodeDownloadsManager.addEpisodeAutoDownloads(_:completion:)(v6, (uint64_t)v5, v7);
  sub_1000536BC((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (BOOL)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = EpisodeDownloadsManager.resumeOrPauseEpisodeDownload(withUuid:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)cancelDownloadsForEpisodeUuid:(id)a3 userInitiated:(BOOL)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  id v10 = sub_100041274();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v6;
  *(void *)(v12 + 32) = v8;
  *(unsigned char *)(v12 + 40) = a4;
  v14[4] = sub_1003D35B8;
  v14[5] = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10003B424;
  v14[3] = &unk_100567D30;
  v13 = _Block_copy(v14);
  swift_bridgeObjectRetain();
  swift_release();
  [v10 addOperationWithBlock:v13];
  _Block_release(v13);

  swift_bridgeObjectRelease();
}

- (id)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  uint64_t v4 = self;
  EpisodeDownloadsManager.cancelAllDownloads(userInitiated:)(a3);

  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (id)episodeUuidForDownloadWithAdamID:(id)a3
{
  id v4 = a3;
  NSSet v5 = self;
  object = EpisodeDownloadsManager.episodeUuidForDownload(withAdamID:)((NSNumber)v4).value._object;

  if (object)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

- (void)removeDownload:(id)a3 shouldAllowAutomaticRedownloads:(BOOL)a4 completion:(id)a5
{
  NSString v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = self;
  EpisodeDownloadsManager.removeDownload(_:shouldAllowAutomaticRedownloads:completion:)(v8, v10, a4, (uint64_t)sub_1003D2A38, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)removeDownloadedEpisodes:(id)a3
{
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  NSSet v5 = self;
  EpisodeDownloadsManager.removeDownloadedEpisodes(_:)(v4);

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfDownloadsFrom:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  NSString v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  Swift::Int v9 = EpisodeDownloadsManager.numberOfDownloads(from:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (int64_t)numberOfDownloads
{
  v2 = self;
  Swift::Int v3 = EpisodeDownloadsManager.numberOfDownloads()();

  return v3;
}

- (id)downloadAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = EpisodeDownloadsManager.download(at:)(a3);

  return v5;
}

- (int64_t)indexForDownload:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  id v6 = EpisodeDownloadsManager.index(for:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return (int64_t)v6;
}

- (id)downloadForEpisodeWithUuid:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  NSString v7 = self;
  id v8 = EpisodeDownloadsManager.downloadForEpisode(withUuid:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)invalidateURLSessions
{
  v2 = self;
  EpisodeDownloadsManager.invalidateURLSessions()();
}

@end