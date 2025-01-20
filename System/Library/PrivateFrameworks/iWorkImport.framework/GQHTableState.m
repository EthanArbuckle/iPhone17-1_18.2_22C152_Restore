@interface GQHTableState
- (BOOL)splitTable;
- (GQHTableState)init;
- (double)currentTablePosition;
- (double)lastAttachmentPosition;
- (double)originalTableHeight;
- (id)table;
- (int)groupLevel;
- (int)prevColumnIndex;
- (int)prevRowIndex;
- (int64_t)nextSplitTableIndex;
- (void)addRowHeight:(float)a3;
- (void)cellCountInColumns;
- (void)dealloc;
- (void)setGroupLevel:(int)a3;
- (void)setLastAttachmentPosition:(double)a3;
- (void)setOriginalTableHeight:(double)a3;
- (void)setPrevRowIndex:(int)a3 columnIndex:(int)a4;
- (void)setSplitTable:(BOOL)a3;
- (void)setSplitTableIndex:(int64_t)a3;
- (void)setTable:(id)a3;
@end

@implementation GQHTableState

- (GQHTableState)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQHTableState;
  if ([(GQHTableState *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mCellCountInColumns = (void **)self->mCellCountInColumns;
  if (mCellCountInColumns)
  {
    v4 = *mCellCountInColumns;
    if (*mCellCountInColumns)
    {
      mCellCountInColumns[1] = v4;
      operator delete(v4);
    }
    operator delete();
  }
  v5.receiver = self;
  v5.super_class = (Class)GQHTableState;
  [(GQHTableState *)&v5 dealloc];
}

- (int)prevRowIndex
{
  return self->mPrevRowIndex;
}

- (int)prevColumnIndex
{
  return self->mPrevColumnIndex;
}

- (void)setPrevRowIndex:(int)a3 columnIndex:(int)a4
{
  self->mPrevRowIndex = a3;
  self->mPrevColumnIndex = a4;
}

- (id)table
{
  return self->mTable;
}

- (void)setTable:(id)a3
{
  objc_super v3 = (GQDTTable *)a3;
  id v5 = a3;

  self->mTable = v3;
  LODWORD(v3) = objc_msgSend(-[GQDTTable model](v3, "model"), "columnCount");
  mCellCountInColumns = (char **)self->mCellCountInColumns;
  __int16 v7 = 0;
  sub_34708(mCellCountInColumns, v3, &v7);
  self->mPrevRowIndex = -1;
  self->mPrevColumnIndex = (int)v3;
}

- (void)cellCountInColumns
{
  return self->mCellCountInColumns;
}

- (int)groupLevel
{
  return self->mGroupLevel;
}

- (void)setGroupLevel:(int)a3
{
  self->mGroupLevel = a3;
}

- (BOOL)splitTable
{
  return self->mSplitTable;
}

- (void)setSplitTable:(BOOL)a3
{
  self->mSplitTable = a3;
  self->mCurrentTablePosition = 0.0;
  self->mLastAttachmentPosition = 0.0;
}

- (void)setSplitTableIndex:(int64_t)a3
{
  self->mSplitTableIndex = a3;
}

- (int64_t)nextSplitTableIndex
{
  int64_t v2 = self->mSplitTableIndex + 1;
  self->mSplitTableIndex = v2;
  return v2;
}

- (double)currentTablePosition
{
  return self->mCurrentTablePosition;
}

- (void)addRowHeight:(float)a3
{
  self->mCurrentTablePosition = self->mCurrentTablePosition + a3;
}

- (double)lastAttachmentPosition
{
  return self->mLastAttachmentPosition;
}

- (void)setLastAttachmentPosition:(double)a3
{
  self->mLastAttachmentPosition = a3;
}

- (double)originalTableHeight
{
  return self->mOriginalTableHeight;
}

- (void)setOriginalTableHeight:(double)a3
{
  self->mOriginalTableHeight = a3;
}

@end