@interface MAAutoAssetSetShortTermLock
- (NSMutableDictionary)lockCountByReason;
- (NSString)assetSetAtomicInstance;
- (NSString)lockedFilename;
- (id)initForAssetSetAtomicInstance:(id)a3 withLockedFilename:(id)a4 withLockedFileDescriptor:(int)a5 forFirstLockReason:(id)a6;
- (id)summary;
- (int)lockedFileDescriptor;
- (int64_t)totalLockCount;
- (void)setLockCountByReason:(id)a3;
- (void)setLockedFileDescriptor:(int)a3;
- (void)setTotalLockCount:(int64_t)a3;
@end

@implementation MAAutoAssetSetShortTermLock

- (id)summary
{
  v3 = NSString;
  v4 = [(MAAutoAssetSetShortTermLock *)self assetSetAtomicInstance];
  v5 = [(MAAutoAssetSetShortTermLock *)self lockedFilename];
  uint64_t v6 = [(MAAutoAssetSetShortTermLock *)self lockedFileDescriptor];
  v7 = [(MAAutoAssetSetShortTermLock *)self lockCountByReason];
  v8 = [v7 safeSummary];
  v9 = [v3 stringWithFormat:@"assetSetAtomicInstance:%@|lockedFilename:%@|lockedFileDescriptor:%d|lockCountByReason:%@|totalLockCount:%ld", v4, v5, v6, v8, -[MAAutoAssetSetShortTermLock totalLockCount](self, "totalLockCount")];

  return v9;
}

- (NSMutableDictionary)lockCountByReason
{
  return self->_lockCountByReason;
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (NSString)assetSetAtomicInstance
{
  return self->_assetSetAtomicInstance;
}

- (int)lockedFileDescriptor
{
  return self->_lockedFileDescriptor;
}

- (NSString)lockedFilename
{
  return self->_lockedFilename;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (id)initForAssetSetAtomicInstance:(id)a3 withLockedFilename:(id)a4 withLockedFileDescriptor:(int)a5 forFirstLockReason:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MAAutoAssetSetShortTermLock;
  v14 = [(MAAutoAssetSetShortTermLock *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetSetAtomicInstance, a3);
    objc_storeStrong((id *)&v15->_lockedFilename, a4);
    v15->_lockedFileDescriptor = a5;
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lockCountByReason = v15->_lockCountByReason;
    v15->_lockCountByReason = v16;

    v18 = v15->_lockCountByReason;
    v19 = (void *)[objc_alloc(NSNumber) initWithInteger:1];
    [(NSMutableDictionary *)v18 setSafeObject:v19 forKey:v13];

    v15->_totalLockCount = 1;
  }

  return v15;
}

- (void)setLockedFileDescriptor:(int)a3
{
  self->_lockedFileDescriptor = a3;
}

- (void)setLockCountByReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockCountByReason, 0);
  objc_storeStrong((id *)&self->_lockedFilename, 0);
  objc_storeStrong((id *)&self->_assetSetAtomicInstance, 0);
}

@end