@interface CloudKitSyncEngineDataSource
- (_TtC14VoiceShortcuts28CloudKitSyncEngineDataSource)init;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4;
@end

@implementation CloudKitSyncEngineDataSource

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didSave:)((CKSyncEngine)v8, (CKRecordZone)v7);
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didDelete:)((CKSyncEngine)v8, (CKRecordZoneID)v7);
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToSave:error:)();
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToDelete:error:)();
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDChanged:)((CKSyncEngine)v8, (CKRecordZoneID)v7);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDWasDeleted:)((CKSyncEngine)v8, (CKRecordZoneID)v7);
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:zoneWithIDWasPurged:)((CKSyncEngine)v8, (CKRecordZoneID)v7);
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)CloudKitSyncEngineDataSource.syncEngine(_:recordToSaveFor:)((CKSyncEngine)v8, (CKRecordID)v7);

  return v9;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didSave:)((CKSyncEngine)v8, (CKRecord)v7);
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToSave:error:)();
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didDeleteRecordWith:)((CKSyncEngine)v8, (CKRecordID)v7);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:failedToDeleteRecordWith:error:)();
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CloudKitSyncEngineDataSource.syncEngine(_:didFetch:)((CKSyncEngine)v8, (CKRecord)v7);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  uint64_t v8 = sub_1C7E992D0();
  v10 = v9;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  CloudKitSyncEngineDataSource.syncEngine(_:recordWithIDWasDeleted:recordType:)((CKSyncEngine)v13, (CKRecordID)v12, v14);

  swift_bridgeObjectRelease();
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = self;
  uint64_t v8 = sub_1C7E98020();
  unint64_t v10 = v9;

  CloudKitSyncEngineDataSource.syncEngine(_:didUpdateMetadata:)(v11, v8, v10);
  sub_1C7D914B8(v8, v10);
}

- (_TtC14VoiceShortcuts28CloudKitSyncEngineDataSource)init
{
  return (_TtC14VoiceShortcuts28CloudKitSyncEngineDataSource *)CloudKitSyncEngineDataSource.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14VoiceShortcuts28CloudKitSyncEngineDataSource__eventStream;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA5071B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14VoiceShortcuts28CloudKitSyncEngineDataSource_recordSource;
  sub_1C7D8A328((uint64_t)v5);
}

@end