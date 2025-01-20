@interface SABinaryLoadInfoToDisplay
- (BOOL)isInKernelAddressSpace;
- (BOOL)isZerothAndOnlySegment;
- (id)debugDescription;
- (id)exclave;
- (unint64_t)highestOffset;
- (void)setHighestOffset:(unint64_t)a3;
- (void)setIsZerothAndOnlySegment:(BOOL)a3;
@end

@implementation SABinaryLoadInfoToDisplay

- (BOOL)isInKernelAddressSpace
{
  return self->_isInKernelAddressSpace;
}

- (id)exclave
{
  return self->_exclave;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SABinaryLoadInfoToDisplay;
  v4 = [(SABinaryLoadInfo *)&v7 debugDescription];
  v5 = (void *)[v3 initWithFormat:@"%@, ho:0x%llx, z:%d", v4, self->_highestOffset, self->_isZerothAndOnlySegment];

  return v5;
}

- (unint64_t)highestOffset
{
  return self->_highestOffset;
}

- (void)setHighestOffset:(unint64_t)a3
{
  self->_highestOffset = a3;
}

- (BOOL)isZerothAndOnlySegment
{
  return self->_isZerothAndOnlySegment;
}

- (void)setIsZerothAndOnlySegment:(BOOL)a3
{
  self->_isZerothAndOnlySegment = a3;
}

- (void).cxx_destruct
{
}

@end