@interface DownloadingEpisodeStateDataSource
- (_TtC8Podcasts33DownloadingEpisodeStateDataSource)init;
@end

@implementation DownloadingEpisodeStateDataSource

- (_TtC8Podcasts33DownloadingEpisodeStateDataSource)init
{
  result = (_TtC8Podcasts33DownloadingEpisodeStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_downloadsNotifier));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_refreshControllerStates));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_accessQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Podcasts33DownloadingEpisodeStateDataSource_downloadManagerObserver);
}

@end