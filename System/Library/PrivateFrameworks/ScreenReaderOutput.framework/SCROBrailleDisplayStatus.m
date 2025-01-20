@interface SCROBrailleDisplayStatus
- (NSData)aggregatedData;
- (NSData)realData;
- (NSData)virtualData;
- (int)virtualAlignment;
- (int64_t)masterStatusCellIndex;
- (void)setAggregatedData:(id)a3;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setRealData:(id)a3;
- (void)setVirtualAlignment:(int)a3;
- (void)setVirtualData:(id)a3;
@end

@implementation SCROBrailleDisplayStatus

- (NSData)realData
{
  return self->_realData;
}

- (void)setRealData:(id)a3
{
}

- (NSData)virtualData
{
  return self->_virtualData;
}

- (void)setVirtualData:(id)a3
{
}

- (NSData)aggregatedData
{
  return self->_aggregatedData;
}

- (void)setAggregatedData:(id)a3
{
}

- (int)virtualAlignment
{
  return self->_virtualAlignment;
}

- (void)setVirtualAlignment:(int)a3
{
  self->_virtualAlignment = a3;
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  self->_masterStatusCellIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedData, 0);
  objc_storeStrong((id *)&self->_virtualData, 0);

  objc_storeStrong((id *)&self->_realData, 0);
}

@end