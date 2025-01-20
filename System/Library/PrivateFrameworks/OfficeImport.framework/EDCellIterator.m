@interface EDCellIterator
- (EDCellHeader)adjacentCell:(int)a3;
- (EDCellHeader)adjacentCellLeft;
- (EDCellHeader)adjacentCellRight;
- (EDCellHeader)scanToRowNumber:(unsigned int)a3 columnNumber:(unsigned int)a4;
- (EDCellIterator)initWithWorksheet:(id)a3;
- (void)dealloc;
@end

@implementation EDCellIterator

- (EDCellIterator)initWithWorksheet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDCellIterator;
  v5 = [(EDCellIterator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 rowBlocks];
    mRowBlocks = v5->mRowBlocks;
    v5->mRowBlocks = (EDRowBlocks *)v6;

    v5->mCurrentRowInfoIndex = 0;
    *(void *)&v5->mCurrentCellIndex = 0xFFFFFFFF00000000;
    v5->mDesiredColumnNumber = -1;
  }

  return v5;
}

- (void)dealloc
{
  [(EDRowBlocks *)self->mRowBlocks unlock];
  v3.receiver = self;
  v3.super_class = (Class)EDCellIterator;
  [(EDCellIterator *)&v3 dealloc];
}

- (EDCellHeader)adjacentCellLeft
{
  return [(EDCellIterator *)self adjacentCell:0xFFFFFFFFLL];
}

- (EDCellHeader)adjacentCellRight
{
  return [(EDCellIterator *)self adjacentCell:1];
}

- (EDCellHeader)scanToRowNumber:(unsigned int)a3 columnNumber:(unsigned int)a4
{
  unsigned int mDesiredRowNumber = self->mDesiredRowNumber;
  if (mDesiredRowNumber > a3 && mDesiredRowNumber != -1) {
    return 0;
  }
  if (mDesiredRowNumber == a3)
  {
    unsigned int mDesiredColumnNumber = self->mDesiredColumnNumber;
    if (mDesiredColumnNumber > a4 && mDesiredColumnNumber != -1) {
      return 0;
    }
  }
  self->unsigned int mDesiredRowNumber = a3;
  self->unsigned int mDesiredColumnNumber = a4;
  mCurrentRowInfo = self->mCurrentRowInfo;
  if (!mCurrentRowInfo || mCurrentRowInfo->var1 < a3)
  {
    p_id mCurrentRowBlock = (id *)&self->mCurrentRowBlock;
    -[EDRowBlocks rowBlockForRowNumber:currentRowBlock:](self->mRowBlocks, "rowBlockForRowNumber:currentRowBlock:");
    id mCurrentRowBlock = (id)objc_claimAutoreleasedReturnValue();
    v12 = mCurrentRowBlock;
    if (mCurrentRowBlock != *p_mCurrentRowBlock)
    {
      objc_storeStrong((id *)&self->mCurrentRowBlock, mCurrentRowBlock);
      self->mCurrentRowInfoIndex = 0;
      self->mCurrentRowInfo = 0;
      id mCurrentRowBlock = self->mCurrentRowBlock;
    }
    unsigned int v13 = [mCurrentRowBlock rowCount];
    for (unsigned int i = self->mCurrentRowInfoIndex; i < v13; self->mCurrentRowInfoIndex = i)
    {
      v15 = (EDRowInfo *)objc_msgSend(*p_mCurrentRowBlock, "rowInfoAtIndex:");
      self->mCurrentRowInfo = v15;
      if (v15->var1 >= self->mDesiredRowNumber) {
        break;
      }
      unsigned int i = self->mCurrentRowInfoIndex + 1;
    }
    self->mCurrentCellIndex = 0;
    self->mCurrentCell = 0;

    mCurrentRowInfo = self->mCurrentRowInfo;
    if (!mCurrentRowInfo) {
      return 0;
    }
  }
  if (self->mDesiredRowNumber != mCurrentRowInfo->var1) {
    return 0;
  }
  mCurrentCell = self->mCurrentCell;
  if (mCurrentCell)
  {
    unsigned int v17 = self->mDesiredColumnNumber;
    if (v17 <= columnNumberForEDCell(mCurrentCell)) {
      goto LABEL_29;
    }
    mCurrentRowInfo = self->mCurrentRowInfo;
  }
  unsigned int var2 = mCurrentRowInfo->var2;
  for (unsigned int j = self->mCurrentCellIndex; j < var2; self->mCurrentCellIndex = j)
  {
    v20 = -[EDRowBlock cellAtIndex:rowInfo:](self->mCurrentRowBlock, "cellAtIndex:rowInfo:");
    self->mCurrentCell = v20;
    if (columnNumberForEDCell(v20) >= self->mDesiredColumnNumber) {
      break;
    }
    unsigned int j = self->mCurrentCellIndex + 1;
  }
LABEL_29:
  result = self->mCurrentCell;
  if (!result) {
    return result;
  }
  unsigned int v22 = self->mDesiredColumnNumber;
  if (v22 == columnNumberForEDCell(result)) {
    return self->mCurrentCell;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentRowBlock, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
}

- (EDCellHeader)adjacentCell:(int)a3
{
  if (self->mDesiredRowNumber == -1) {
    return 0;
  }
  unsigned int mDesiredColumnNumber = self->mDesiredColumnNumber;
  if (mDesiredColumnNumber == -1) {
    return 0;
  }
  mCurrentRowInfo = self->mCurrentRowInfo;
  if (!mCurrentRowInfo) {
    return 0;
  }
  if (mDesiredColumnNumber)
  {
    unsigned int mCurrentCellIndex = self->mCurrentCellIndex;
    if (a3 < 0 && !mCurrentCellIndex) {
      return 0;
    }
  }
  else
  {
    if (a3 < 0) {
      return 0;
    }
    unsigned int mCurrentCellIndex = self->mCurrentCellIndex;
  }
  if (mCurrentCellIndex + a3 >= mCurrentRowInfo->var2) {
    return 0;
  }
  v8 = -[EDRowBlock cellAtIndex:rowInfo:](self->mCurrentRowBlock, "cellAtIndex:rowInfo:");
  if (columnNumberForEDCell(v8) == self->mDesiredColumnNumber + a3) {
    return v8;
  }
  else {
    return 0;
  }
}

@end