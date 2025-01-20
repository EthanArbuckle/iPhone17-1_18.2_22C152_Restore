@interface NUStoragePoolStats
- (float)reusedRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)discardedCount;
- (int64_t)migrationBytes;
- (int64_t)migrationCount;
- (int64_t)nonPurgeableBytes;
- (int64_t)nonPurgeableCount;
- (int64_t)peakNonPurgeableBytes;
- (int64_t)peakTotalBytes;
- (int64_t)peakUsedBytes;
- (int64_t)peakVolatileBytes;
- (int64_t)purgedBytes;
- (int64_t)purgedCount;
- (int64_t)requestCount;
- (int64_t)reusedCount;
- (int64_t)reusedNonPurgeableCount;
- (int64_t)reusedVolatileCount;
- (int64_t)totalBytes;
- (int64_t)totalCount;
- (int64_t)usedBytes;
- (int64_t)usedCount;
- (int64_t)volatileBytes;
- (int64_t)volatileCount;
- (void)setDiscardedCount:(int64_t)a3;
- (void)setMigrationBytes:(int64_t)a3;
- (void)setMigrationCount:(int64_t)a3;
- (void)setNonPurgeableBytes:(int64_t)a3;
- (void)setNonPurgeableCount:(int64_t)a3;
- (void)setPurgedBytes:(int64_t)a3;
- (void)setPurgedCount:(int64_t)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)setReusedNonPurgeableCount:(int64_t)a3;
- (void)setReusedVolatileCount:(int64_t)a3;
- (void)setUsedBytes:(int64_t)a3;
- (void)setUsedCount:(int64_t)a3;
- (void)setVolatileBytes:(int64_t)a3;
- (void)setVolatileCount:(int64_t)a3;
@end

@implementation NUStoragePoolStats

- (void)setReusedVolatileCount:(int64_t)a3
{
  self->_reusedVolatileCount = a3;
}

- (int64_t)reusedVolatileCount
{
  return self->_reusedVolatileCount;
}

- (void)setReusedNonPurgeableCount:(int64_t)a3
{
  self->_reusedNonPurgeableCount = a3;
}

- (int64_t)reusedNonPurgeableCount
{
  return self->_reusedNonPurgeableCount;
}

- (void)setRequestCount:(int64_t)a3
{
  self->_requestCount = a3;
}

- (int64_t)requestCount
{
  return self->_requestCount;
}

- (void)setPurgedBytes:(int64_t)a3
{
  self->_purgedBytes = a3;
}

- (int64_t)purgedBytes
{
  return self->_purgedBytes;
}

- (void)setPurgedCount:(int64_t)a3
{
  self->_purgedCount = a3;
}

- (int64_t)purgedCount
{
  return self->_purgedCount;
}

- (void)setMigrationBytes:(int64_t)a3
{
  self->_migrationBytes = a3;
}

- (int64_t)migrationBytes
{
  return self->_migrationBytes;
}

- (void)setMigrationCount:(int64_t)a3
{
  self->_migrationCount = a3;
}

- (int64_t)migrationCount
{
  return self->_migrationCount;
}

- (void)setDiscardedCount:(int64_t)a3
{
  self->_discardedCount = a3;
}

- (int64_t)discardedCount
{
  return self->_discardedCount;
}

- (int64_t)peakVolatileBytes
{
  return self->_peakVolatileBytes;
}

- (int64_t)volatileBytes
{
  return self->_volatileBytes;
}

- (void)setVolatileCount:(int64_t)a3
{
  self->_volatileCount = a3;
}

- (int64_t)volatileCount
{
  return self->_volatileCount;
}

- (int64_t)peakNonPurgeableBytes
{
  return self->_peakNonPurgeableBytes;
}

- (int64_t)nonPurgeableBytes
{
  return self->_nonPurgeableBytes;
}

- (void)setNonPurgeableCount:(int64_t)a3
{
  self->_nonPurgeableCount = a3;
}

- (int64_t)nonPurgeableCount
{
  return self->_nonPurgeableCount;
}

- (int64_t)peakUsedBytes
{
  return self->_peakUsedBytes;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (int64_t)peakTotalBytes
{
  return self->_peakTotalBytes;
}

- (id)description
{
  [(NUStoragePoolStats *)self usedBytes];
  v22 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self peakUsedBytes];
  v21 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self nonPurgeableBytes];
  v20 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self peakNonPurgeableBytes];
  v19 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self volatileBytes];
  v18 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self peakVolatileBytes];
  v16 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self totalBytes];
  v17 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self peakTotalBytes];
  v15 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self migrationBytes];
  v12 = NSLocalizedFileSizeDescription();
  [(NUStoragePoolStats *)self purgedBytes];
  v3 = NSLocalizedFileSizeDescription();
  v13 = NSString;
  int64_t v11 = [(NUStoragePoolStats *)self totalCount];
  int64_t v10 = [(NUStoragePoolStats *)self usedCount];
  int64_t v9 = [(NUStoragePoolStats *)self nonPurgeableCount];
  int64_t v8 = [(NUStoragePoolStats *)self volatileCount];
  int64_t v4 = [(NUStoragePoolStats *)self migrationCount];
  int64_t v5 = [(NUStoragePoolStats *)self purgedCount];
  [(NUStoragePoolStats *)self reusedRate];
  objc_msgSend(v13, "stringWithFormat:", @"\tTotal:     %ld (%@/%@)\n\t Used:     %ld (%@/%@)\n\t   NP:     %ld (%@/%@)\n\t    V:     %ld (%@/%@) migrations: %ld (%@)\n\tPurge:     %ld (%@)\n\tReuse:     %d%% (%ld/%ld) NP: %ld V: %ld\n\tDiscarded: %ld\n", v11, v17, v15, v10, v22, v21, v9, v20, v19, v8, v18, v16, v4, v12, v5, v3,
    (int)rintf(v6 * 100.0),
    [(NUStoragePoolStats *)self reusedCount],
    [(NUStoragePoolStats *)self requestCount],
    [(NUStoragePoolStats *)self reusedNonPurgeableCount],
    [(NUStoragePoolStats *)self reusedVolatileCount],
  v14 = [(NUStoragePoolStats *)self discardedCount]);

  return v14;
}

- (float)reusedRate
{
  if (![(NUStoragePoolStats *)self requestCount]) {
    return 0.0;
  }
  float v3 = (float)[(NUStoragePoolStats *)self reusedCount];
  return v3 / (float)[(NUStoragePoolStats *)self requestCount];
}

- (int64_t)reusedCount
{
  int64_t v3 = [(NUStoragePoolStats *)self reusedNonPurgeableCount];
  return [(NUStoragePoolStats *)self reusedVolatileCount] + v3;
}

- (int64_t)totalBytes
{
  int64_t v3 = [(NUStoragePoolStats *)self usedBytes];
  int64_t v4 = [(NUStoragePoolStats *)self volatileBytes] + v3;
  return v4 + [(NUStoragePoolStats *)self nonPurgeableBytes];
}

- (int64_t)totalCount
{
  int64_t v3 = [(NUStoragePoolStats *)self usedCount];
  int64_t v4 = [(NUStoragePoolStats *)self volatileCount] + v3;
  return v4 + [(NUStoragePoolStats *)self nonPurgeableCount];
}

- (void)setVolatileBytes:(int64_t)a3
{
  int64_t peakVolatileBytes = self->_peakVolatileBytes;
  if (peakVolatileBytes <= a3) {
    int64_t peakVolatileBytes = a3;
  }
  self->_volatileBytes = a3;
  self->_int64_t peakVolatileBytes = peakVolatileBytes;
  int64_t peakTotalBytes = self->_peakTotalBytes;
  int64_t v6 = [(NUStoragePoolStats *)self totalBytes];
  if (peakTotalBytes <= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = peakTotalBytes;
  }
  self->_int64_t peakTotalBytes = v7;
}

- (void)setNonPurgeableBytes:(int64_t)a3
{
  int64_t peakNonPurgeableBytes = self->_peakNonPurgeableBytes;
  if (peakNonPurgeableBytes <= a3) {
    int64_t peakNonPurgeableBytes = a3;
  }
  self->_nonPurgeableBytes = a3;
  self->_int64_t peakNonPurgeableBytes = peakNonPurgeableBytes;
  int64_t peakTotalBytes = self->_peakTotalBytes;
  int64_t v6 = [(NUStoragePoolStats *)self totalBytes];
  if (peakTotalBytes <= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = peakTotalBytes;
  }
  self->_int64_t peakTotalBytes = v7;
}

- (void)setUsedBytes:(int64_t)a3
{
  int64_t peakUsedBytes = self->_peakUsedBytes;
  if (peakUsedBytes <= a3) {
    int64_t peakUsedBytes = a3;
  }
  self->_usedBytes = a3;
  self->_int64_t peakUsedBytes = peakUsedBytes;
  int64_t peakTotalBytes = self->_peakTotalBytes;
  int64_t v6 = [(NUStoragePoolStats *)self totalBytes];
  if (peakTotalBytes <= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = peakTotalBytes;
  }
  self->_int64_t peakTotalBytes = v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[NUStoragePoolStats allocWithZone:a3] init];
  *((void *)result + 1) = self->_peakTotalBytes;
  *((void *)result + 2) = self->_usedCount;
  *((void *)result + 3) = self->_usedBytes;
  *((void *)result + 4) = self->_peakUsedBytes;
  *((void *)result + 5) = self->_nonPurgeableCount;
  *((void *)result + 6) = self->_nonPurgeableBytes;
  *((void *)result + 7) = self->_peakNonPurgeableBytes;
  *((void *)result + 8) = self->_volatileCount;
  *((void *)result + 9) = self->_volatileBytes;
  *((void *)result + 10) = self->_peakVolatileBytes;
  *((void *)result + 11) = self->_discardedCount;
  *((void *)result + 12) = self->_migrationCount;
  *((void *)result + 13) = self->_migrationBytes;
  *((void *)result + 14) = self->_purgedCount;
  *((void *)result + 15) = self->_purgedBytes;
  *((void *)result + 16) = self->_requestCount;
  *((void *)result + 17) = self->_reusedNonPurgeableCount;
  *((void *)result + 18) = self->_reusedVolatileCount;
  return result;
}

@end