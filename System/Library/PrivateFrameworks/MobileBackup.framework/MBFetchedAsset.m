@interface MBFetchedAsset
- (MBAssetMetadata)metadata;
- (NSString)description;
- (_TtC7backupd14MBFetchedAsset)init;
- (_TtC7backupd14MBFetchedAsset)initWithMetadata:(id)a3 protectionClass:(unsigned __int8)a4 originalFileSize:(int64_t)a5 originalInode:(unint64_t)a6 linkCount:(unsigned int)a7 rpath:(id)a8;
- (int64_t)originalFileSize;
- (unint64_t)originalInode;
- (unsigned)protectionClass;
@end

@implementation MBFetchedAsset

- (MBAssetMetadata)metadata
{
  return (MBAssetMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC7backupd14MBFetchedAsset_metadata));
}

- (unsigned)protectionClass
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBFetchedAsset_protectionClass);
}

- (int64_t)originalFileSize
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBFetchedAsset_originalFileSize);
}

- (unint64_t)originalInode
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBFetchedAsset_originalInode);
}

- (_TtC7backupd14MBFetchedAsset)initWithMetadata:(id)a3 protectionClass:(unsigned __int8)a4 originalFileSize:(int64_t)a5 originalInode:(unint64_t)a6 linkCount:(unsigned int)a7 rpath:(id)a8
{
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  id v16 = a3;
  v17 = (_TtC7backupd14MBFetchedAsset *)sub_10000D574(v16, a4, a5, a6, a7, v13, v15);

  return v17;
}

- (_TtC7backupd14MBFetchedAsset)init
{
  result = (_TtC7backupd14MBFetchedAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  sub_10000D29C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end