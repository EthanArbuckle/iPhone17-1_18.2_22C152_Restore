@interface FPMemoryCategory
- (FPMemoryCategory)init;
- (unint64_t)totalCleanSize;
- (unint64_t)totalDirtySize;
- (unint64_t)totalReclaimableSize;
- (unint64_t)totalSwappedSize;
- (unint64_t)totalWiredSize;
- (unsigned)totalRegions;
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
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)FPMemoryCategory;
    self = [(FPMemoryCategory *)&v2 init];
    if (self)
    {
      self->_isSummary = 0;
      *(_OWORD *)&self->_totalDirtySize = 0u;
      *(_OWORD *)&self->_totalCleanSize = 0u;
      self->_totalWiredSize = 0;
    }
  }
  return self;
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