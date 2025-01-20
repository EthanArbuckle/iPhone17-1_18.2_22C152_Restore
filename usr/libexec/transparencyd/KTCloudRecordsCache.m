@interface KTCloudRecordsCache
- (BOOL)disableKTSyncabledKVSStore;
- (_TtC13transparencyd19KTCloudRecordsCache)init;
- (_TtC13transparencyd19KTCloudRecordsCache)initWithRecords:(id)a3;
- (id)fetchSyncedLoggableDataByDeviceIdHash:(id)a3;
- (id)fetchSyncedLoggableDataByPushToken:(id)a3 registrationData:(id)a4;
- (void)setWithUriVRFHash:(id)a3;
@end

@implementation KTCloudRecordsCache

- (_TtC13transparencyd19KTCloudRecordsCache)initWithRecords:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC13transparencyd19KTCloudRecordsCache *)sub_1000D2844((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)setWithUriVRFHash:(id)a3
{
  id v4 = a3;
  v10 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  v8 = *(void (**)(uint64_t, unint64_t))((swift_isaMask & (uint64_t)v10->super.isa) + 0x90);
  sub_100080C58(v5, v7);
  v8(v5, v7);
  unint64_t v9 = sub_1000C9878((uint64_t)_swiftEmptyArrayStorage);
  (*(void (**)(unint64_t))((swift_isaMask & (uint64_t)v10->super.isa) + 0xA8))(v9);
  sub_100080CB0(v5, v7);
}

- (BOOL)disableKTSyncabledKVSStore
{
  return [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records) disableKTSyncabledKVSStore];
}

- (id)fetchSyncedLoggableDataByPushToken:(id)a3 registrationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  v15 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Class v17 = Data._bridgeToObjectiveC()().super.isa;
  id v18 = [v15 fetchSyncedLoggableDataWithPushToken:isa tbsRegistrationData:v17];

  sub_100080CB0(v12, v14);
  sub_100080CB0(v9, v11);

  return v18;
}

- (id)fetchSyncedLoggableDataByDeviceIdHash:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  KTCloudRecordsCache.fetchSyncedLoggableData(byDeviceIdHash:)(v6, v8);
  uint64_t v10 = v9;
  sub_100080CB0(v6, v8);

  if (v10)
  {
    sub_10008E0A0(0, &qword_100321510);
    v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v11.super.Class isa = 0;
  }

  return v11.super.isa;
}

- (_TtC13transparencyd19KTCloudRecordsCache)init
{
  result = (_TtC13transparencyd19KTCloudRecordsCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10008FCD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash), *(void *)&self->records[OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash]);

  swift_bridgeObjectRelease();
}

@end