@interface BKEngagementManagerMetadata
- (BKEngagementManagerMetadata)init;
- (NSDate)lastSyncFromCloudKitErrorTimestamp;
- (NSDate)lastSyncFromCloudKitSuccessTimestamp;
- (NSDate)lastSyncToCloudKitErrorTimestamp;
- (NSDate)lastSyncToCloudKitSuccessTimestamp;
- (NSDictionary)propertyCounts;
- (NSError)lastSyncFromCloudKitError;
- (NSError)lastSyncToCloudKitError;
- (void)setLastSyncFromCloudKitError:(id)a3;
- (void)setLastSyncFromCloudKitErrorTimestamp:(id)a3;
- (void)setLastSyncFromCloudKitSuccessTimestamp:(id)a3;
- (void)setLastSyncToCloudKitError:(id)a3;
- (void)setLastSyncToCloudKitErrorTimestamp:(id)a3;
- (void)setLastSyncToCloudKitSuccessTimestamp:(id)a3;
- (void)setPropertyCounts:(id)a3;
@end

@implementation BKEngagementManagerMetadata

- (BKEngagementManagerMetadata)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts) = (Class)&_swiftEmptyDictionarySingleton;
  v3 = (char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp;
  uint64_t v4 = sub_1007F2BA0();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError) = 0;
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp, 1, 1, v4);
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError) = 0;
  v5((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp, 1, 1, v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EngagementManagerMetadata();
  return [(BKEngagementManagerMetadata *)&v7 init];
}

- (NSDictionary)propertyCounts
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007FDA50().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setPropertyCounts:(id)a3
{
  uint64_t v4 = sub_1007FDA70();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BKEngagementManagerMetadata_propertyCounts);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDate)lastSyncToCloudKitSuccessTimestamp
{
  return (NSDate *)sub_100769F8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp);
}

- (void)setLastSyncToCloudKitSuccessTimestamp:(id)a3
{
}

- (NSError)lastSyncToCloudKitError
{
  return (NSError *)sub_100769D80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitError);
}

- (void)setLastSyncToCloudKitError:(id)a3
{
}

- (NSDate)lastSyncToCloudKitErrorTimestamp
{
  return (NSDate *)sub_100769F8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp);
}

- (void)setLastSyncToCloudKitErrorTimestamp:(id)a3
{
}

- (NSDate)lastSyncFromCloudKitSuccessTimestamp
{
  return (NSDate *)sub_100769F8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp);
}

- (void)setLastSyncFromCloudKitSuccessTimestamp:(id)a3
{
}

- (NSError)lastSyncFromCloudKitError
{
  return (NSError *)sub_100769D80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitError);
}

- (void)setLastSyncFromCloudKitError:(id)a3
{
}

- (NSDate)lastSyncFromCloudKitErrorTimestamp
{
  return (NSDate *)sub_100769F8C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp);
}

- (void)setLastSyncFromCloudKitErrorTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1003459F4((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitSuccessTimestamp);
  swift_errorRelease();
  sub_1003459F4((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncToCloudKitErrorTimestamp);
  sub_1003459F4((uint64_t)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitSuccessTimestamp);
  swift_errorRelease();
  v3 = (char *)self + OBJC_IVAR___BKEngagementManagerMetadata_lastSyncFromCloudKitErrorTimestamp;

  sub_1003459F4((uint64_t)v3);
}

@end