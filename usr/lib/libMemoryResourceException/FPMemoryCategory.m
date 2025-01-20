@interface FPMemoryCategory
- (BOOL)verbose;
- (FPMemoryCategory)init;
- (NSDictionary)auxData;
- (NSString)auxDataFullName;
- (NSString)detailedName;
- (NSString)fullName;
- (NSString)name;
- (id)initSummary:(BOOL)a3;
- (unint64_t)totalCleanSize;
- (unint64_t)totalDirtySize;
- (unint64_t)totalReclaimableSize;
- (unint64_t)totalSwappedSize;
- (unint64_t)totalWiredSize;
- (unsigned)totalRegions;
- (void)addMemoryObject:(id)a3;
- (void)setTotalCleanSize:(unint64_t)a3;
- (void)setTotalDirtySize:(unint64_t)a3;
- (void)setTotalReclaimableSize:(unint64_t)a3;
- (void)setTotalRegions:(unsigned int)a3;
- (void)setTotalSwappedSize:(unint64_t)a3;
- (void)setTotalWiredSize:(unint64_t)a3;
@end

@implementation FPMemoryCategory

- (FPMemoryCategory)init
{
  return (FPMemoryCategory *)[(FPMemoryCategory *)self initSummary:0];
}

- (id)initSummary:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPMemoryCategory;
  id result = [(FPMemoryCategory *)&v5 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((_OWORD *)result + 2) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((void *)result + 8) = 0;
  }
  return result;
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    v4 = [(FPMemoryObject *)self->_firstMemoryObject name];
    objc_super v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }

  return name;
}

- (NSString)detailedName
{
  if (self->_isSummary)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(FPMemoryObject *)self->_firstMemoryObject detailedName];
  }

  return (NSString *)v2;
}

- (NSString)fullName
{
  if (self->_isSummary) {
    [(FPMemoryCategory *)self name];
  }
  else {
  v2 = [(FPMemoryObject *)self->_firstMemoryObject fullName];
  }

  return (NSString *)v2;
}

- (BOOL)verbose
{
  return [(FPMemoryObject *)self->_firstMemoryObject verbose];
}

- (NSDictionary)auxData
{
  v3 = [(FPMemoryObject *)self->_firstMemoryObject auxData];
  v4 = v3;
  if (self->_isSummary)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FPMemoryObject *)self->_firstMemoryObject detailedAuxData];
    if (v4)
    {
      uint64_t v6 = [v4 fp_mergeWithData:v5 forceAggregate:1];

      id v5 = (id)v6;
    }
  }

  return (NSDictionary *)v5;
}

- (NSString)auxDataFullName
{
  v3 = [(FPMemoryObject *)self->_firstMemoryObject auxDataName];
  v4 = v3;
  if (self->_isSummary)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(FPMemoryObject *)self->_firstMemoryObject detailedAuxDataName];
    if ([v6 length]) {
      id v7 = (id)[[NSString alloc] initWithFormat:@"%@ %@", v4, v6];
    }
    else {
      id v7 = v4;
    }
    id v5 = v7;
  }

  return (NSString *)v5;
}

- (void)addMemoryObject:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_firstMemoryObject)
  {
    objc_storeStrong((id *)&self->_firstMemoryObject, a3);
    id v5 = v6;
  }
  self->_totalDirtySize += [v5 dirtySize];
  self->_totalSwappedSize += [v6 swappedSize];
  self->_totalCleanSize += [v6 cleanSize];
  self->_totalReclaimableSize += [v6 reclaimableSize];
  self->_totalWiredSize += [v6 wiredSize];
  self->_totalRegions += [v6 totalRegions];
}

- (unint64_t)totalDirtySize
{
  return self->_totalDirtySize;
}

- (void)setTotalDirtySize:(unint64_t)a3
{
  self->_totalDirtySize = a3;
}

- (unint64_t)totalSwappedSize
{
  return self->_totalSwappedSize;
}

- (void)setTotalSwappedSize:(unint64_t)a3
{
  self->_totalSwappedSize = a3;
}

- (unint64_t)totalCleanSize
{
  return self->_totalCleanSize;
}

- (void)setTotalCleanSize:(unint64_t)a3
{
  self->_totalCleanSize = a3;
}

- (unint64_t)totalReclaimableSize
{
  return self->_totalReclaimableSize;
}

- (void)setTotalReclaimableSize:(unint64_t)a3
{
  self->_totalReclaimableSize = a3;
}

- (unint64_t)totalWiredSize
{
  return self->_totalWiredSize;
}

- (void)setTotalWiredSize:(unint64_t)a3
{
  self->_totalWiredSize = a3;
}

- (unsigned)totalRegions
{
  return self->_totalRegions;
}

- (void)setTotalRegions:(unsigned int)a3
{
  self->_totalRegions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstMemoryObject, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end