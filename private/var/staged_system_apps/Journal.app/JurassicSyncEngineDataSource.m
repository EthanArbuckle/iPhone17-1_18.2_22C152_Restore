@interface JurassicSyncEngineDataSource
- (BOOL)syncEngine:(id)a3 shouldFetchAssetContentsForZoneID:(id)a4;
- (_TtC7Journal28JurassicSyncEngineDataSource)init;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
- (void)syncEngineDidEndFetchingChanges:(id)a3;
- (void)syncEngineDidEndModifyingPendingChanges:(id)a3;
- (void)syncEngineWillBeginFetchingChanges:(id)a3;
- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3;
@end

@implementation JurassicSyncEngineDataSource

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = sub_1000A596C(v7);

  return v9;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000A735C(v7);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000A8A5C(v7);
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000A9360(v7);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_1000A98DC(v8, v10);
  sub_100040DD0(v8, v10);
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  unint64_t v10 = self;
  sub_10009F260(v8, v9, (uint64_t)v11);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  unint64_t v10 = self;
  sub_1000A3D70(v8, v9, (uint64_t)v11);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = self;
  sub_1000AA060(v9);

  swift_bridgeObjectRelease();
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000AA64C(v7);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000AA914(v7);
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000AAD68(v7);
}

- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3
{
  byte_10083D319 = 1;
  sub_1002D1C64();
}

- (void)syncEngineDidEndModifyingPendingChanges:(id)a3
{
  byte_10083D319 = 0;
  sub_1002D1C64();
}

- (void)syncEngineWillBeginFetchingChanges:(id)a3
{
  byte_10083D318 = 1;
  sub_1002D1C64();
}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000AB20C();
}

- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1000AB4B4(a4, a5);
}

- (_TtC7Journal28JurassicSyncEngineDataSource)init
{
  result = (_TtC7Journal28JurassicSyncEngineDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal28JurassicSyncEngineDataSource_handleData));
  v3 = (char *)self + OBJC_IVAR____TtC7Journal28JurassicSyncEngineDataSource_sessionID;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (BOOL)syncEngine:(id)a3 shouldFetchAssetContentsForZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1000AC0C0();

  return v9 & 1;
}

@end