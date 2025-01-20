@interface AutomaticCloudMirroringMonitor
- (id)fetchCurrentCloudKitSyncingStatus;
- (id)forceMirroringSync;
- (id)startCloudKitSyncing;
- (id)stopCloudKitSyncing;
@end

@implementation AutomaticCloudMirroringMonitor

- (id)startCloudKitSyncing
{
  return sub_1001D4E5C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1001D32BC);
}

- (id)stopCloudKitSyncing
{
  return sub_1001D4E5C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1001D3B18);
}

- (id)fetchCurrentCloudKitSyncingStatus
{
  return sub_1001D4E5C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1001D4728);
}

- (id)forceMirroringSync
{
  return sub_1001D4E5C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1001D4AAC);
}

@end