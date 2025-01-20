@interface SlalomWriteOperation
- (id)description;
- (unsigned)blockNumber;
- (unsigned)offsets;
- (unsigned)serviceCode;
- (void)setBlockNumber:(unsigned __int16)a3;
- (void)setOffsets:(unsigned __int16)a3;
- (void)setServiceCode:(unsigned __int16)a3;
@end

@implementation SlalomWriteOperation

- (id)description
{
  return (id)[NSString stringWithFormat:@"Service Code : %04X - Block number : %04X - offsets %04X", -[SlalomWriteOperation serviceCode](self, "serviceCode"), -[SlalomWriteOperation blockNumber](self, "blockNumber"), -[SlalomWriteOperation offsets](self, "offsets")];
}

- (unsigned)serviceCode
{
  return self->serviceCode;
}

- (void)setServiceCode:(unsigned __int16)a3
{
  self->serviceCode = a3;
}

- (unsigned)blockNumber
{
  return self->blockNumber;
}

- (void)setBlockNumber:(unsigned __int16)a3
{
  self->blockNumber = a3;
}

- (unsigned)offsets
{
  return self->offsets;
}

- (void)setOffsets:(unsigned __int16)a3
{
  self->offsets = a3;
}

@end