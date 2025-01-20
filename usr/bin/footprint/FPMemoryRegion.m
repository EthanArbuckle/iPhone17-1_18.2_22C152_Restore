@interface FPMemoryRegion
- (BOOL)containsFakeRegion;
- (BOOL)couldHaveProcessView;
- (BOOL)finalizeObject;
- (BOOL)verbose;
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
- (unint64_t)reclaimableSize;
- (unint64_t)swappedSize;
- (unint64_t)wiredSize;
- (unsigned)totalRegions;
- (void)setCleanSize:(unint64_t)a3;
- (void)setDetailedName:(id)a3;
- (void)setDirtySize:(unint64_t)a3;
- (void)setExtendedInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setReclaimableSize:(unint64_t)a3;
- (void)setSwappedSize:(unint64_t)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation FPMemoryRegion

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

- (unint64_t)wiredSize
{
  if (self)
  {
    if (*(unsigned char *)(self + 8)) {
      return *(void *)(self + 88);
    }
    else {
      return 0;
    }
  }
  return self;
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

- (NSString)fullName
{
  char v3 = self->_detailedName;
  v4 = v3;
  if (v3 && [(NSString *)v3 length]) {
    v5 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@ %@", self->_name, v4];
  }
  else {
    v5 = self->_name;
  }
  v6 = v5;

  return v6;
}

- (NSString)description
{
  unint64_t offset = self->_offset;
  v4 = [(FPMemoryRegion *)self fullName];
  if (offset)
  {
    unint64_t v5 = self->_offset;
    unint64_t start = self->_start;
    if (start == -1) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = self->_size + start;
    }
    v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    +[NSString stringWithFormat:@"%@ Offset %#llx [%#llx - %#llx](%@)", v4, v5, start, v7, v8];
  }
  else
  {
    unint64_t v9 = self->_start;
    if (v9 == -1) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = self->_size + v9;
    }
    v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    +[NSString stringWithFormat:@"%@ [%#llx - %#llx](%@)", v4, v9, v10, v8, v13];
  v11 = };

  return (NSString *)v11;
}

- (NSArray)memoryRegions
{
  v4 = self;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)containsFakeRegion
{
  if (self) {
    LOBYTE(self) = self->_user_tag == -1;
  }
  return (char)self;
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
  char v3 = objc_alloc_init(FPMemoryObject);
  v4 = v3;
  self->_memoryObject = v3;
  if (v3) {
    sub_100005698((uint64_t)v3, self, vm_kernel_page_size, 0);
  }

  return v4;
}

- (NSString)extendedInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100034910);
  if (qword_100034928[0] != -1) {
    dispatch_once(qword_100034928, &stru_1000290D8);
  }
  char v3 = [(id)qword_100034920 objectForKey:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100034910);

  return (NSString *)v3;
}

- (void)setExtendedInfo:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100034910);
  if (qword_100034928[0] != -1) {
    dispatch_once(qword_100034928, &stru_1000290D8);
  }
  [(id)qword_100034920 setObject:v4 forKey:self];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100034910);
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (void)setDirtySize:(unint64_t)a3
{
  self->_dirtySize = a3;
}

- (unint64_t)swappedSize
{
  return self->_swappedSize;
}

- (void)setSwappedSize:(unint64_t)a3
{
  self->_swappedSize = a3;
}

- (unint64_t)cleanSize
{
  return self->_cleanSize;
}

- (void)setCleanSize:(unint64_t)a3
{
  self->_cleanSize = a3;
}

- (unint64_t)reclaimableSize
{
  return self->_reclaimableSize;
}

- (void)setReclaimableSize:(unint64_t)a3
{
  self->_reclaimableSize = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrangeList, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_detailedName, 0);
}

@end