@interface AssetImageLoader
- (_TtC15SeymourServices16AssetImageLoader)init;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
@end

@implementation AssetImageLoader

- (_TtC15SeymourServices16AssetImageLoader)init
{
  result = (_TtC15SeymourServices16AssetImageLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices16AssetImageLoader_assetFileStore);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices16AssetImageLoader____lazy_storage___session));
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8 = sub_1D6FA02E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6FA0280();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1D693C1F4(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  sub_1D693CC4C(v12, a6, a7);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1D693D400(v7);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_1D693D8F4(v9, a5);
}

@end