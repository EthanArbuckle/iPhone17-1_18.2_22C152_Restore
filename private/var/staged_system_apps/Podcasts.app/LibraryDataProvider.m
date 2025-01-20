@interface LibraryDataProvider
- (BOOL)handleEventsForBackgroundURLSessionWithIdentifier:(id)a3 handler:(id)a4;
- (_TtC8Podcasts19LibraryDataProvider)init;
- (void)restorePreviouslyDownloadedEpisodes;
@end

@implementation LibraryDataProvider

- (void)restorePreviouslyDownloadedEpisodes
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_downloadsRestoreController))
  {
    v2 = self;
    sub_1000158E0();
  }
}

- (_TtC8Podcasts19LibraryDataProvider)init
{
  result = (_TtC8Podcasts19LibraryDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider____lazy_storage___libraryActionController, &qword_1005F6EE8);
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_purchaseController);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_pendingPlaybackController);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_episodeDownloadStateControllerProvider));
  swift_release();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_libraryObserverProvider);
  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_assetsFolder;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider_metricsCalendar;
  uint64_t v6 = type metadata accessor for Calendar();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts19LibraryDataProvider____lazy_storage___signpostID, &qword_1005F7678);
}

- (BOOL)handleEventsForBackgroundURLSessionWithIdentifier:(id)a3 handler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  LOBYTE(v6) = _s8Podcasts19LibraryDataProviderC35handleEventsForBackgroundURLSession10identifier7handlerSbSS_yyctF_0(v6, v8, (uint64_t)sub_1000343D8, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

@end