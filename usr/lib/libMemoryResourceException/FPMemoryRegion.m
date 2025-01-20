@interface FPMemoryRegion
+ (id)categoryNameForTag:(unsigned int)a3;
+ (id)vmLedgerNameForTag:(unint64_t)a3;
- (BOOL)couldHaveProcessView;
- (BOOL)eligibleForProcessView;
- (BOOL)eligibleForSubrangesUsingPageSize:(unint64_t)a3;
- (BOOL)finalizeObject;
- (BOOL)inSharedCache;
- (BOOL)isFake;
- (BOOL)ownedExclusivelyByParentProcess;
- (BOOL)privateSharedCacheRegion;
- (BOOL)unusedSharedCacheRegion;
- (BOOL)verbose;
- (BOOL)wired;
- (FPMemoryObject)memoryObject;
- (FPRangeList)subrangeList;
- (NSArray)memoryRegions;
- (NSDictionary)auxData;
- (NSDictionary)detailedAuxData;
- (NSString)auxDataName;
- (NSString)description;
- (NSString)detailedAuxDataName;
- (NSString)detailedName;
- (NSString)extendedInfo;
- (NSString)fullName;
- (NSString)name;
- (id)ensureMemoryObject;
- (int)ownerPid;
- (unint64_t)cleanSize;
- (unint64_t)dirtySize;
- (unint64_t)end;
- (unint64_t)object_id;
- (unint64_t)offset;
- (unint64_t)reclaimableSize;
- (unint64_t)size;
- (unint64_t)start;
- (unint64_t)swappedSize;
- (unint64_t)wiredSize;
- (unsigned)segment;
- (unsigned)share_mode;
- (unsigned)totalRegions;
- (unsigned)user_tag;
- (void)addSubrange:(_NSRange)a3 memoryTotal:(id *)a4 pageSize:(unint64_t)a5;
- (void)freeSubrangeList;
- (void)setCleanSize:(unint64_t)a3;
- (void)setDetailedName:(id)a3;
- (void)setDirtySize:(unint64_t)a3;
- (void)setEnd:(unint64_t)a3;
- (void)setExtendedInfo:(id)a3;
- (void)setInSharedCache:(BOOL)a3;
- (void)setMemoryObject:(id)a3;
- (void)setName:(id)a3;
- (void)setObject_id:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setOwnedExclusivelyByParentProcess:(BOOL)a3;
- (void)setReclaimableSize:(unint64_t)a3;
- (void)setSegment:(unsigned __int8)a3;
- (void)setShare_mode:(unsigned __int8)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStart:(unint64_t)a3;
- (void)setSwappedSize:(unint64_t)a3;
- (void)setUnusedSharedCacheRegion:(BOOL)a3;
- (void)setUser_tag:(unsigned int)a3;
- (void)setVerbose:(BOOL)a3;
- (void)setWired:(BOOL)a3;
@end

@implementation FPMemoryRegion

- (BOOL)wired
{
  return *((unsigned char *)self + 8) & 1;
}

- (void)setWired:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | a3;
}

- (BOOL)inSharedCache
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setInSharedCache:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFD | v3;
}

- (BOOL)unusedSharedCacheRegion
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setUnusedSharedCacheRegion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v3;
}

- (BOOL)ownedExclusivelyByParentProcess
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setOwnedExclusivelyByParentProcess:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xF7 | v3;
}

- (BOOL)verbose
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setVerbose:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xEF | v3;
}

- (unint64_t)end
{
  unint64_t result = [(FPMemoryRegion *)self start];
  if (result != -1)
  {
    unint64_t v4 = [(FPMemoryRegion *)self start];
    return [(FPMemoryRegion *)self size] + v4;
  }
  return result;
}

- (void)setEnd:(unint64_t)a3
{
  if ([(FPMemoryRegion *)self start] > a3) {
    __assert_rtn("-[FPMemoryRegion setEnd:]", "FPMemoryRegion.m", 185, "end >= self.start");
  }
  unint64_t v5 = a3 - [(FPMemoryRegion *)self start];

  [(FPMemoryRegion *)self setSize:v5];
}

- (unint64_t)wiredSize
{
  if ([(FPMemoryRegion *)self wired]) {
    return self->_size;
  }
  else {
    return 0;
  }
}

- (unsigned)totalRegions
{
  return 1;
}

- (NSDictionary)auxData
{
  return 0;
}

- (NSDictionary)detailedAuxData
{
  return 0;
}

- (NSString)auxDataName
{
  return self->_name;
}

- (NSString)detailedAuxDataName
{
  return self->_detailedName;
}

- (void)addSubrange:(_NSRange)a3 memoryTotal:(id *)a4 pageSize:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  subrangeList = self->_subrangeList;
  if (!subrangeList)
  {
    v11 = objc_alloc_init(FPRangeList);
    v12 = self->_subrangeList;
    self->_subrangeList = v11;

    subrangeList = self->_subrangeList;
  }

  sub_21E8549C8((int64x2_t *)subrangeList, location, length, a5, (uint64_t *)a4);
}

- (void)freeSubrangeList
{
  self->_subrangeList = 0;
  MEMORY[0x270F9A758]();
}

+ (id)categoryNameForTag:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((a3 & 0xFFFFFFF0) == 0xF0)
  {
    if (qword_26AB1E288 != -1) {
      dispatch_once(&qword_26AB1E288, &unk_26CFD25C0);
    }
    unint64_t v4 = (__CFString *)*((id *)&unk_26AB1E280 + (v3 - 240) + 4);
LABEL_5:
    if (v4) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (a3 > 0xFF)
  {
    if (a3 == -1)
    {
      unint64_t v4 = @"Owned physical footprint (unmapped)";
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v5 = off_2644CA6A0[a3];
    if (v5)
    {
      unint64_t v4 = v5;
      goto LABEL_17;
    }
    VMURegionTypeDescriptionForTagShareProtAndPager();
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (![(__CFString *)v4 hasPrefix:@"Memory Tag"]) {
      goto LABEL_5;
    }
  }
LABEL_14:
  uint64_t v6 = [NSString stringWithFormat:@"tag %d", v3];
  v7 = (void *)v6;
  v8 = @"unknown";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  unint64_t v4 = v8;

LABEL_17:

  return v4;
}

+ (id)vmLedgerNameForTag:(unint64_t)a3
{
  if (a3 > 5) {
    id v3 = [(id)[NSString alloc] initWithFormat:@"VM ledger tag %llu", a3];
  }
  else {
    id v3 = qword_2644CAEA0[a3];
  }

  return v3;
}

- (NSString)fullName
{
  id v3 = self->_detailedName;
  unint64_t v4 = v3;
  if (v3 && [(NSString *)v3 length]) {
    unint64_t v5 = (NSString *)[[NSString alloc] initWithFormat:@"%@ %@", self->_name, v4];
  }
  else {
    unint64_t v5 = self->_name;
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)eligibleForProcessView
{
  BOOL result = ![(FPMemoryRegion *)self inSharedCache]
        && ((share_mode = self->_share_mode, BOOL v4 = share_mode > 6, v5 = (1 << share_mode) & 0x4C, !v4)
          ? (BOOL v6 = v5 == 0)
          : (BOOL v6 = 1),
            v6)
        && self->_segment - 5 < 0xFFFFFFFD;
  return result;
}

- (BOOL)eligibleForSubrangesUsingPageSize:(unint64_t)a3
{
  if ([(FPMemoryRegion *)self isFake]) {
    goto LABEL_9;
  }
  BOOL v5 = [(FPMemoryRegion *)self eligibleForProcessView];
  if (v5)
  {
    if (self->_size <= a3
      || [(FPMemoryRegion *)self ownedExclusivelyByParentProcess]
      || (unint64_t dirtySize = self->_dirtySize, size = self->_size, dirtySize == size)
      || (unint64_t swappedSize = self->_swappedSize, swappedSize == size)
      || (unint64_t cleanSize = self->_cleanSize, cleanSize == size)
      || (unint64_t reclaimableSize = self->_reclaimableSize, reclaimableSize == size))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (swappedSize | dirtySize | cleanSize | reclaimableSize) != 0;
  }
  return v5;
}

- (BOOL)isFake
{
  return self->_user_tag == -1;
}

- (BOOL)privateSharedCacheRegion
{
  if ((*((unsigned char *)self + 8) & 2) == 0) {
    return 0;
  }
  int segment = self->_segment;
  if (segment == 2 || segment == 4) {
    return 0;
  }
  if (self->_dirtySize) {
    return 1;
  }
  return self->_swappedSize != 0;
}

- (NSString)description
{
  unint64_t offset = self->_offset;
  BOOL v4 = NSString;
  BOOL v5 = [(FPMemoryRegion *)self fullName];
  if (offset)
  {
    unint64_t v6 = self->_offset;
    unint64_t start = self->_start;
    unint64_t v8 = [(FPMemoryRegion *)self end];
    v9 = [NSNumber numberWithUnsignedLongLong:self->_size];
    [v4 stringWithFormat:@"%@ Offset %#llx [%#llx - %#llx](%@)", v5, v6, start, v8, v9];
  }
  else
  {
    unint64_t v10 = self->_start;
    unint64_t v11 = [(FPMemoryRegion *)self end];
    v9 = [NSNumber numberWithUnsignedLongLong:self->_size];
    [v4 stringWithFormat:@"%@ [%#llx - %#llx](%@)", v5, v10, v11, v9, v14];
  v12 = };

  return (NSString *)v12;
}

- (NSArray)memoryRegions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (int)ownerPid
{
  return -1;
}

- (BOOL)finalizeObject
{
  return 1;
}

- (BOOL)couldHaveProcessView
{
  return 0;
}

- (id)ensureMemoryObject
{
  id v3 = objc_alloc_init(FPMemoryObject);
  BOOL v4 = v3;
  self->_memoryObject = v3;
  if (v3) {
    sub_21E862D48((uint64_t)v3, self, *MEMORY[0x263EF8AE0], 0);
  }

  return v4;
}

- (NSString)extendedInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB1E280);
  if (qword_26AB1E298[0] != -1) {
    dispatch_once(qword_26AB1E298, &unk_26CFD25E0);
  }
  id v3 = [(id)qword_26AB1E290 objectForKey:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB1E280);

  return (NSString *)v3;
}

- (void)setExtendedInfo:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AB1E280);
  if (qword_26AB1E298[0] != -1) {
    dispatch_once(qword_26AB1E298, &unk_26CFD25E0);
  }
  [(id)qword_26AB1E290 setObject:v4 forKey:self];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AB1E280);
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (void)setDirtySize:(unint64_t)a3
{
  self->_unint64_t dirtySize = a3;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (void)setSwappedSize:(unint64_t)a3
{
  self->_unint64_t swappedSize = a3;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (void)setCleanSize:(unint64_t)a3
{
  self->_unint64_t cleanSize = a3;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (void)setReclaimableSize:(unint64_t)a3
{
  self->_unint64_t reclaimableSize = a3;
}

- (NSString)detailedName
{
  return self->_detailedName;
}

- (void)setDetailedName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (FPMemoryObject)memoryObject
{
  return self->_memoryObject;
}

- (void)setMemoryObject:(id)a3
{
  self->_memoryObject = (FPMemoryObject *)a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_unint64_t offset = a3;
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_unint64_t start = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (unsigned)segment
{
  return self->_segment;
}

- (void)setSegment:(unsigned __int8)a3
{
  self->_int segment = a3;
}

- (unsigned)user_tag
{
  return self->_user_tag;
}

- (void)setUser_tag:(unsigned int)a3
{
  self->_user_tag = a3;
}

- (unint64_t)object_id
{
  return self->_object_id;
}

- (void)setObject_id:(unint64_t)a3
{
  self->_object_id = a3;
}

- (unsigned)share_mode
{
  return self->_share_mode;
}

- (void)setShare_mode:(unsigned __int8)a3
{
  self->_unsigned int share_mode = a3;
}

- (FPRangeList)subrangeList
{
  return self->_subrangeList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrangeList, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_detailedName, 0);
}

@end