@interface FPMemoryObject
- (BOOL)containsFakeRegion;
- (BOOL)couldHaveProcessView;
- (BOOL)finalizeObject;
- (BOOL)verbose;
- (FPMemoryObject)init;
- (NSArray)memoryRegions;
- (NSDictionary)auxData;
- (NSDictionary)detailedAuxData;
- (NSString)auxDataName;
- (NSString)detailedAuxDataName;
- (NSString)detailedName;
- (NSString)fullName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)viewForProcess:(id)a3;
- (int)ownerPid;
- (unint64_t)cleanSize;
- (unint64_t)dirtySize;
- (unint64_t)reclaimableSize;
- (unint64_t)swappedSize;
- (unint64_t)wiredSize;
- (unsigned)totalRegions;
- (void)setOwnerPid:(int)a3;
@end

@implementation FPMemoryObject

- (FPMemoryObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)FPMemoryObject;
  v2 = [(FPMemoryObject *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    memoryRegions = v2->_memoryRegions;
    v2->_memoryRegions = v3;

    v2->_ownerPid = -1;
  }
  return v2;
}

- (BOOL)finalizeObject
{
  uint64_t v3 = [(NSMutableArray *)self->_memoryRegions count];
  if (v3 == 1)
  {
    v5 = [(NSMutableArray *)self->_memoryRegions firstObject];
    [v5 setMemoryObject:v5];
    rangeList = self->_rangeList;
    self->_rangeList = 0;

    processMemoryRegions = self->_processMemoryRegions;
    self->_processMemoryRegions = 0;

    memoryRegions = self->_memoryRegions;
    self->_memoryRegions = 0;
  }
  else
  {
    if (+[FPFootprint isSharingAnalysisDisabled]) {
      int v4 = +[FPFootprint breakDownPhysFootprint];
    }
    else {
      int v4 = 0;
    }
    sub_21E862F8C((uint64_t)self, v4);
  }
  return v3 != 1;
}

- (unsigned)totalRegions
{
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    LODWORD(v3) = 1;
  }
  else
  {
    uint64_t v3 = [(NSMutableArray *)self->_memoryRegions count];
    if (v3 == 1)
    {
      int v4 = [(NSMutableArray *)self->_memoryRegions firstObject];
      LODWORD(v3) = [v4 totalRegions];
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((*((unsigned char *)self + 8) & 1) == 0 || self->_rangeList)
  {
    _os_assert_log();
    id result = (id)_os_crash();
    __break(1u);
  }
  else
  {
    int v4 = objc_alloc_init(FPMemoryObject);
    v4->_dirtySize = self->_dirtySize;
    v4->_swappedSize = self->_swappedSize;
    v4->_cleanSize = self->_cleanSize;
    v4->_wiredSize = self->_wiredSize;
    v4->_reclaimableSize = self->_reclaimableSize;
    objc_storeStrong((id *)&v4->_memoryRegions, self->_memoryRegions);
    char v5 = *((unsigned char *)v4 + 8) & 0xFE | *((unsigned char *)self + 8) & 1;
    *((unsigned char *)v4 + 8) = v5;
    *((unsigned char *)v4 + 8) = v5 & 0xFD | *((unsigned char *)self + 8) & 2;
    v4->_ownerPid = self->_ownerPid;
    processMemoryRegions = v4->_processMemoryRegions;
    v4->_processMemoryRegions = 0;

    return v4;
  }
  return result;
}

- (BOOL)couldHaveProcessView
{
  return [(NSMutableDictionary *)self->_processMemoryRegions count] || self->_ownerPid != -1;
}

- (id)viewForProcess:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = self;
  if ([(NSMutableDictionary *)v5->_processMemoryRegions count])
  {
    processMemoryRegions = v5->_processMemoryRegions;
    v7 = [NSNumber numberWithInt:[v4 pid]];
    v8 = [(NSMutableDictionary *)processMemoryRegions objectForKeyedSubscript:v7];

    if (!v8) {
      goto LABEL_19;
    }
    v9 = objc_alloc_init(FPMemoryObject);

    v9->_ownerPid = v5->_ownerPid;
    uint64_t v10 = [v4 pageSize];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          sub_21E862D48((uint64_t)v9, *(void **)(*((void *)&v18 + 1) + 8 * i), v10, 0);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    sub_21E862F8C((uint64_t)v9, [v4 breakDownPhysFootprint:v18]);
  }
  else
  {
    v9 = v5;
    if ((*((unsigned char *)v5 + 8) & 2) != 0)
    {
      v9 = (FPMemoryObject *)[(FPMemoryObject *)v5 copy];

      *((unsigned char *)v9 + 8) |= 4u;
    }
  }
  if (v5->_ownerPid != -1 && [v4 pid] != v5->_ownerPid)
  {
    if (v9 == v5)
    {
      v9 = (FPMemoryObject *)[(FPMemoryObject *)v5 copy];
    }
    v9->_dirtySize = 0;
    v9->_swappedSize = 0;
    v9->_cleanSize += v5->_swappedSize + v5->_dirtySize;
  }
  char v5 = v9;
LABEL_19:
  v16 = v5;

  return v16;
}

- (BOOL)containsFakeRegion
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_memoryRegions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isFake", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)name
{
  v2 = sub_21E8634E4((uint64_t)self);
  uint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)detailedName
{
  v2 = sub_21E8634E4((uint64_t)self);
  uint64_t v3 = [v2 detailedName];

  return (NSString *)v3;
}

- (NSString)fullName
{
  v2 = sub_21E8634E4((uint64_t)self);
  uint64_t v3 = [v2 fullName];

  return (NSString *)v3;
}

- (BOOL)verbose
{
  v2 = [(NSMutableArray *)self->_memoryRegions firstObject];
  char v3 = [v2 verbose];

  return v3;
}

- (NSDictionary)auxData
{
  v2 = [(NSMutableArray *)self->_memoryRegions firstObject];
  char v3 = [v2 auxData];

  return (NSDictionary *)v3;
}

- (NSDictionary)detailedAuxData
{
  v2 = [(NSMutableArray *)self->_memoryRegions firstObject];
  char v3 = [v2 detailedAuxData];

  return (NSDictionary *)v3;
}

- (NSString)auxDataName
{
  v2 = [(NSMutableArray *)self->_memoryRegions firstObject];
  char v3 = [v2 auxDataName];

  return (NSString *)v3;
}

- (NSString)detailedAuxDataName
{
  v2 = [(NSMutableArray *)self->_memoryRegions firstObject];
  char v3 = [v2 detailedAuxDataName];

  return (NSString *)v3;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (unint64_t)wiredSize
{
  return self->_wiredSize;
}

- (NSArray)memoryRegions
{
  return &self->_memoryRegions->super;
}

- (int)ownerPid
{
  return self->_ownerPid;
}

- (void)setOwnerPid:(int)a3
{
  self->_ownerPid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeList, 0);
  objc_storeStrong((id *)&self->_processMemoryRegions, 0);

  objc_storeStrong((id *)&self->_memoryRegions, 0);
}

@end