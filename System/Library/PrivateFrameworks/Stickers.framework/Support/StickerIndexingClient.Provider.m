@interface StickerIndexingClient.Provider
- (_TtCV9stickersd21StickerIndexingClient8Provider)init;
- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)reindexAllItemsForBundleID:(NSString *)a3 protectionClass:(NSString *)a4 acknowledgementHandler:(id)a5;
- (void)reindexItemsWithIdentifiers:(NSArray *)a3 bundleID:(NSString *)a4 protectionClass:(NSString *)a5 acknowledgementHandler:(id)a6;
@end

@implementation StickerIndexingClient.Provider

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)reindexAllItemsForBundleID:(NSString *)a3 protectionClass:(NSString *)a4 acknowledgementHandler:(id)a5
{
  uint64_t v9 = sub_1000039CC(&qword_1000196F0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100019740;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100019748;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10000C5A4((uint64_t)v11, (uint64_t)&unk_100019750, (uint64_t)v16);
  swift_release();
}

- (void)reindexItemsWithIdentifiers:(NSArray *)a3 bundleID:(NSString *)a4 protectionClass:(NSString *)a5 acknowledgementHandler:(id)a6
{
  uint64_t v11 = sub_1000039CC(&qword_1000196F0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100019700;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100019710;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_10000C5A4((uint64_t)v13, (uint64_t)&unk_100019720, (uint64_t)v18);
  swift_release();
}

- (_TtCV9stickersd21StickerIndexingClient8Provider)init
{
  result = (_TtCV9stickersd21StickerIndexingClient8Provider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100007120((uint64_t)self + OBJC_IVAR____TtCV9stickersd21StickerIndexingClient8Provider_store);
}

@end