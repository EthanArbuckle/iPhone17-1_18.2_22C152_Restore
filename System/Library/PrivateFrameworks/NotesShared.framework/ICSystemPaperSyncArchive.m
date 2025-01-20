@interface ICSystemPaperSyncArchive
- (ICSystemPaperSyncArchive)init;
- (ICSystemPaperSyncArchive)initWithDatabaseArchive:(id)a3 assetArchives:(id)a4;
- (NSArray)assetArchives;
- (NSString)description;
- (NSURL)databaseArchive;
@end

@implementation ICSystemPaperSyncArchive

- (NSURL)databaseArchive
{
  v2 = (void *)sub_1C3DB8848();
  return (NSURL *)v2;
}

- (NSArray)assetArchives
{
  sub_1C3DB88F8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C3DB9FF8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ICSystemPaperSyncArchive)initWithDatabaseArchive:(id)a3 assetArchives:(id)a4
{
  uint64_t v5 = sub_1C3DB88F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  v9 = (objc_class *)sub_1C3DBA018();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR___ICSystemPaperSyncArchive_databaseArchive, v8, v5);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperSyncArchive_assetArchives) = v9;
  v10 = (objc_class *)type metadata accessor for SystemPaperSyncArchive();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = [(ICSystemPaperSyncArchive *)&v13 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (NSString)description
{
  v2 = self;
  sub_1C3CED4E8();

  v3 = (void *)sub_1C3DB9BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ICSystemPaperSyncArchive)init
{
  result = (ICSystemPaperSyncArchive *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___ICSystemPaperSyncArchive_databaseArchive;
  uint64_t v3 = sub_1C3DB88F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end