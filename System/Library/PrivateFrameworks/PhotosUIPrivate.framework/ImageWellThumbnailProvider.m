@interface ImageWellThumbnailProvider
- (_TtC15PhotosUIPrivate26ImageWellThumbnailProvider)init;
- (int64_t)requestImageAndUUIDForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4;
- (int64_t)requestImageForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4;
- (void)cancelThumbnailRequest:(int64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation ImageWellThumbnailProvider

- (int64_t)requestImageForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4
{
  return sub_1AEA174E8(self, (int)a2, a4, a3.width, a3.height, (uint64_t)&unk_1F06ADFA8, (uint64_t)sub_1AEA1B27C, sub_1AEA1728C);
}

- (int64_t)requestImageAndUUIDForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4
{
  return sub_1AEA174E8(self, (int)a2, a4, a3.width, a3.height, (uint64_t)&unk_1F06ADF80, (uint64_t)sub_1AEA1B274, sub_1AEA17418);
}

- (void)cancelThumbnailRequest:(int64_t)a3
{
  v4 = self;
  sub_1AEA17640(a3);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5 = a4;
  id v7 = a3;
  v8 = self;
  sub_1AEA17768((uint64_t)v7, v5);
}

- (_TtC15PhotosUIPrivate26ImageWellThumbnailProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26ImageWellThumbnailProvider_dataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26ImageWellThumbnailProvider_mediaProvider));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end