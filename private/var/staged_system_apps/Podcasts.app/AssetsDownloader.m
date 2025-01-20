@interface AssetsDownloader
- (_TtC8Podcasts16AssetsDownloader)init;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
@end

@implementation AssetsDownloader

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003D95C0();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1003D9984(v9, (uint64_t)a5);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1003DA7D4(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  sub_1003DB6A4(v12, a6, a7);
}

- (_TtC8Podcasts16AssetsDownloader)init
{
  result = (_TtC8Podcasts16AssetsDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_config);
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_backgroundCompletionHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts16AssetsDownloader_statusUpdateHandler);

  sub_1000536BC(v3);
}

@end