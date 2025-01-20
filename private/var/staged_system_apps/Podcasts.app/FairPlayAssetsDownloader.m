@interface FairPlayAssetsDownloader
- (_TtC8Podcasts24FairPlayAssetsDownloader)init;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation FairPlayAssetsDownloader

- (_TtC8Podcasts24FairPlayAssetsDownloader)init
{
  result = (_TtC8Podcasts24FairPlayAssetsDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_config);
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_statusUpdateHandler));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader_backgroundCompletionHandler));
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader____lazy_storage___sessionDelegateQueue));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts24FairPlayAssetsDownloader__session);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  id v15 = [v13 URLAsset];
  sub_1002B9C60(v15, (uint64_t)v11, v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  int64_t var3 = a7->var1.var3;
  v15[0] = a7->var0.var0;
  v15[1] = *(void *)&a7->var0.var1;
  long long v16 = *(_OWORD *)&a7->var0.var3;
  uint64_t v17 = *(void *)&a7->var1.var1;
  int64_t v18 = var3;
  sub_10004D29C(0, &qword_1005FE4C8);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100290C98(v13, v11, v15);

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_10028FBF8(v8, v9, (uint64_t)a5);
}

@end