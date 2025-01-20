@interface CDCloudSyncVersionsAdaptor
- (NSPersistentHistoryToken)historyToken;
- (NSString)dataType;
- (int64_t)cloudVersion;
- (int64_t)historyTokenOffset;
- (int64_t)localVersion;
- (int64_t)syncVersion;
@end

@implementation CDCloudSyncVersionsAdaptor

- (NSString)dataType
{
  sub_10005DA74(self->cdVersions, *(void *)&self->cdVersions[24]);
  swift_retain();
  sub_1007F57B0();
  swift_release();
  NSString v2 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSPersistentHistoryToken)historyToken
{
  sub_10005DA74(self->cdVersions, *(void *)&self->cdVersions[24]);
  swift_retain();
  NSString v2 = (void *)sub_1007F57A0();
  swift_release();

  return (NSPersistentHistoryToken *)v2;
}

- (int64_t)historyTokenOffset
{
  return sub_1003991EC(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.historyTokenOffset.getter);
}

- (int64_t)cloudVersion
{
  return sub_1003991EC(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.cloudVersion.getter);
}

- (int64_t)localVersion
{
  return sub_1003991EC(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.localVersion.getter);
}

- (int64_t)syncVersion
{
  return sub_1003991EC(self, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of CDCloudSyncVersionsProtocol.syncVersion.getter);
}

@end