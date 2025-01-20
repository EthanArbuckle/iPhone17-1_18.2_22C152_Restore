@interface TPSAssetsDownloadOperation
- (NSString)assetIdentifier;
- (NSURL)downloadedURL;
- (TPSAssetsDownloadOperation)init;
- (TPSAssetsDownloadOperation)initWithAssetIdentifier:(id)a3 assetURLPath:(id)a4;
- (void)main;
- (void)setAssetIdentifier:(id)a3;
- (void)setDownloadedURL:(id)a3;
@end

@implementation TPSAssetsDownloadOperation

- (NSString)assetIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setAssetIdentifier:(id)a3
{
  uint64_t v4 = sub_1E451B868();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSURL)downloadedURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  sub_1E44E3AAC((uint64_t)v6, (uint64_t)v5, &qword_1EBFF52B0);
  uint64_t v7 = sub_1E451B1D8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1E451B168();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (void)setDownloadedURL:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E451B1A8();
    uint64_t v8 = sub_1E451B1D8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1E451B1D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1E45055B0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (TPSAssetsDownloadOperation)initWithAssetIdentifier:(id)a3 assetURLPath:(id)a4
{
  uint64_t v5 = sub_1E451B868();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1E451B868();
  uint64_t v10 = v9;
  uint64_t v11 = (char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  uint64_t v12 = sub_1E451B1D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPSAssetsDownloadOperation_priority) = *MEMORY[0x1E4F28A00];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem) = 0;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  uint64_t *v13 = v5;
  v13[1] = v7;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath);
  uint64_t *v14 = v8;
  v14[1] = v10;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return [(TPSAsyncOperation *)&v16 init];
}

- (void)main
{
  v2 = self;
  sub_1E4504CD8();
}

- (TPSAssetsDownloadOperation)init
{
  result = (TPSAssetsDownloadOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1E44DD780((uint64_t)self + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL, &qword_1EBFF52B0);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem);
}

@end