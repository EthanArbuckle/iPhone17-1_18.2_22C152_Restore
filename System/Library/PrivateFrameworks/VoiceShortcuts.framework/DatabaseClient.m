@interface DatabaseClient
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
@end

@implementation DatabaseClient

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_1C7D8E904(0, (unint64_t *)&qword_1EB6A5420);
  sub_1C7DBFD98();
  v7 = (void *)sub_1C7E99610();
  uint64_t v8 = sub_1C7E99610();
  unint64_t v9 = sub_1C7E99610();
  id v10 = a3;
  swift_retain();
  DatabaseClient.databaseDidChange(_:modified:inserted:removed:)((uint64_t)v10, v7, v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end