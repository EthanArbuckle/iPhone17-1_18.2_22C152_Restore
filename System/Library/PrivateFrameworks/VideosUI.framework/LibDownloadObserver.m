@interface LibDownloadObserver
- (_TtC8VideosUI19LibDownloadObserver)init;
- (void)dealloc;
- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5;
- (void)downloadManagerDownloadsDidChange:(id)a3;
@end

@implementation LibDownloadObserver

- (_TtC8VideosUI19LibDownloadObserver)init
{
  return (_TtC8VideosUI19LibDownloadObserver *)sub_1E3112834();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3113450();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI19LibDownloadObserver__hasDownloadInProgress;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF84090);
  OUTLINED_FUNCTION_34();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI19LibDownloadObserver_ssDownloadManager);
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  if (a4)
  {
    sub_1E2BE915C(0, &qword_1EADEAEB8);
    sub_1E387CC98();
  }
  if (a5)
  {
    sub_1E2BE915C(0, &qword_1EADEAEB8);
    sub_1E387CC98();
  }
  id v8 = a3;
  v9 = self;
  sub_1E3113638();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E31147BC();
}

@end