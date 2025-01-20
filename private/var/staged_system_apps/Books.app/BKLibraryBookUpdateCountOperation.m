@interface BKLibraryBookUpdateCountOperation
- (BKLibraryBookUpdateCountOperation)init;
- (BKLibraryBookUpdateCountOperation)initWithLibraryAssetProvider:(id)a3 updatesURL:(id)a4;
- (NSDictionary)result;
- (void)main;
- (void)setResult:(id)a3;
@end

@implementation BKLibraryBookUpdateCountOperation

- (NSDictionary)result
{
  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3.super.isa = sub_1007FDA50().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSDictionary *)v3.super.isa;
}

- (void)setResult:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1007FDA70();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BKLibraryBookUpdateCountOperation)initWithLibraryAssetProvider:(id)a3 updatesURL:(id)a4
{
  uint64_t v6 = sub_1007F29D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2990();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKLibraryBookUpdateCountOperation_libraryAssetProvider) = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_updatesURL, v9, v6);
  updated = (objc_class *)type metadata accessor for LibraryBookUpdateCountOperation();
  v13.receiver = self;
  v13.super_class = updated;
  swift_unknownObjectRetain();
  v11 = [(BKLibraryBookUpdateCountOperation *)&v13 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (void)main
{
  v2 = self;
  LibraryBookUpdateCountOperation.main()();
}

- (BKLibraryBookUpdateCountOperation)init
{
  result = (BKLibraryBookUpdateCountOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  NSDictionary v3 = (char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_updatesURL;
  uint64_t v4 = sub_1007F29D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end