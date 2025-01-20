@interface EpisodeDownloadStateControllerProvider
- (MTLegacyDownloadManagerProtocol)downloadManager;
- (_TtC8Podcasts38EpisodeDownloadStateControllerProvider)init;
- (void)setDownloadManager:(id)a3;
@end

@implementation EpisodeDownloadStateControllerProvider

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLegacyDownloadManagerProtocol *)v2;
}

- (void)setDownloadManager:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadManager) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC8Podcasts38EpisodeDownloadStateControllerProvider)init
{
  result = (_TtC8Podcasts38EpisodeDownloadStateControllerProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadingStateDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts38EpisodeDownloadStateControllerProvider_downloadsNotifier));

  swift_unknownObjectRelease();
}

@end