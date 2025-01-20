@interface CRLAssetFileManager
- (_TtC8Freeform19CRLAssetFileManager)init;
@end

@implementation CRLAssetFileManager

- (_TtC8Freeform19CRLAssetFileManager)init
{
  result = (_TtC8Freeform19CRLAssetFileManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_assetsDirectoryURL;
  uint64_t v4 = type metadata accessor for URL();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_deletedAssetsDirectoryURL, v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end