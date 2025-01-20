@interface DownloadCountObserver
- (_TtC8Podcasts21DownloadCountObserver)init;
- (void)dealloc;
- (void)downloadManagerDidAddDownload:(void *)a1;
- (void)downloadManagerDidRemoveDownloads:(id)a3;
@end

@implementation DownloadCountObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_downloadsNotifier);
  v3 = self;
  [v2 unregisterForUpdates:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DownloadCountObserver();
  [(DownloadCountObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21DownloadCountObserver_didChange));

  swift_bridgeObjectRelease();
}

- (void)downloadManagerDidAddDownload:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_1003AA4BC();
  swift_unknownObjectRelease();
}

- (void)downloadManagerDidRemoveDownloads:(id)a3
{
  v3 = self;
  sub_1003AA4BC();
}

- (_TtC8Podcasts21DownloadCountObserver)init
{
  result = (_TtC8Podcasts21DownloadCountObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end