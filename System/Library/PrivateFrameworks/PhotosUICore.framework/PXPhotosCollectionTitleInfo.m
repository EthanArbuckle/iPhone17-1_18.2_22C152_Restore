@interface PXPhotosCollectionTitleInfo
- (NSString)subtitle;
- (NSString)title;
- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)init;
- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)initWithAssetCollection:(id)a3;
@end

@implementation PXPhotosCollectionTitleInfo

- (NSString)title
{
  return (NSString *)sub_1A9E8A564((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12PhotosUICore27PXPhotosCollectionTitleInfo_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_1A9E8A564((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12PhotosUICore27PXPhotosCollectionTitleInfo_subtitle);
}

- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)initWithAssetCollection:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  if (a3)
  {
    swift_unknownObjectRetain();
    PXDisplayAssetCollection.photosCollectionTitleInfo.getter((uint64_t *)&v9);
    long long v5 = v9;
    long long v6 = v10;
  }
  else
  {
    long long v5 = xmmword_1AB2F42D0;
    long long v6 = 0uLL;
  }
  long long v9 = v5;
  long long v10 = v6;
  v7 = (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo *)(*(uint64_t (**)(long long *))(ObjectType + 96))(&v9);
  swift_unknownObjectRelease();
  swift_deallocPartialClassInstance();
  return v7;
}

- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)init
{
  result = (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end