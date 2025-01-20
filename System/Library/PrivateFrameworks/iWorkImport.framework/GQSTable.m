@interface GQSTable
- (BOOL)alwaysPutReadCellsInArray;
- (BOOL)isCounting;
- (BOOL)isStreaming;
- (GQSTable)initWithStreaming:(BOOL)a3 table:(id)a4;
- (id)currentOverlapCell;
- (id)lastCellRead;
- (id)table;
- (int64_t)column;
- (int64_t)row;
- (void)dealloc;
- (void)incrementCellPosition;
- (void)setAlwaysPutReadCellsInArray:(BOOL)a3;
- (void)setCurrentOverlapCell:(id)a3;
- (void)setIsCountingCount:(BOOL)a3;
- (void)setLastCellRead:(id)a3;
- (void)skipCells:(int64_t)a3;
@end

@implementation GQSTable

- (GQSTable)initWithStreaming:(BOOL)a3 table:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GQSTable;
  result = [(GQSTable *)&v7 init];
  if (result)
  {
    result->mIsStreaming = a3;
    result->mTable = (GQDTTable *)a4;
    result->mAlwaysPutReadCellsInArray = !a3;
    result->mCellCount = 1;
    result->mIsCounting = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQSTable;
  [(GQSTable *)&v3 dealloc];
}

- (id)currentOverlapCell
{
  return self->mCurrentOverlapCell;
}

- (void)setCurrentOverlapCell:(id)a3
{
  id v5 = a3;

  self->mCurrentOverlapCell = (GQDTOverlapCell *)a3;
}

- (id)lastCellRead
{
  return self->mLastCellRead;
}

- (void)setLastCellRead:(id)a3
{
  mLastCellRead = self->mLastCellRead;
  if (mLastCellRead != a3)
  {

    self->mLastCellRead = (GQDTCell *)a3;
  }
}

- (BOOL)isStreaming
{
  return self->mIsStreaming;
}

- (id)table
{
  return self->mTable;
}

- (BOOL)alwaysPutReadCellsInArray
{
  return self->mAlwaysPutReadCellsInArray;
}

- (void)setAlwaysPutReadCellsInArray:(BOOL)a3
{
  self->mAlwaysPutReadCellsInArray = a3;
}

- (int64_t)row
{
  return self->mCellCount / 256;
}

- (int64_t)column
{
  if (self->mCellCount <= 0) {
    return -(uint64_t)-LOBYTE(self->mCellCount);
  }
  else {
    return self->mCellCount;
  }
}

- (void)skipCells:(int64_t)a3
{
  if (self->mIsCounting) {
    self->mCellCount += a3;
  }
}

- (void)incrementCellPosition
{
}

- (void)setIsCountingCount:(BOOL)a3
{
  self->mIsCounting = a3;
}

- (BOOL)isCounting
{
  return self->mIsCounting;
}

@end