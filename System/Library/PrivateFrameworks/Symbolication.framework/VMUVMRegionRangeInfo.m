@interface VMUVMRegionRangeInfo
- (VMUVMRegionRangeInfo)init;
- (_VMURange)range;
- (unint64_t)address;
- (unint64_t)size;
- (unint64_t)stackIdentifier;
- (unsigned)userTag;
- (void)setAddress:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStackIdentifier:(unint64_t)a3;
- (void)setUserTag:(unsigned int)a3;
@end

@implementation VMUVMRegionRangeInfo

- (VMUVMRegionRangeInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)VMUVMRegionRangeInfo;
  result = [(VMUVMRegionRangeInfo *)&v3 init];
  if (result) {
    result->stackIdentifier = -1;
  }
  return result;
}

- (_VMURange)range
{
  unint64_t size = self->size;
  unint64_t address = self->address;
  result.length = size;
  result.location = address;
  return result;
}

- (unint64_t)address
{
  return self->address;
}

- (void)setAddress:(unint64_t)a3
{
  self->unint64_t address = a3;
}

- (unint64_t)size
{
  return self->size;
}

- (void)setSize:(unint64_t)a3
{
  self->unint64_t size = a3;
}

- (unint64_t)stackIdentifier
{
  return self->stackIdentifier;
}

- (void)setStackIdentifier:(unint64_t)a3
{
  self->stackIdentifier = a3;
}

- (unsigned)userTag
{
  return self->userTag;
}

- (void)setUserTag:(unsigned int)a3
{
  self->userTag = a3;
}

@end