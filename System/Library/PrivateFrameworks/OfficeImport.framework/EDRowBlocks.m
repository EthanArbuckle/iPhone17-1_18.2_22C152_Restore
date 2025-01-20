@interface EDRowBlocks
- (BOOL)spaceForRowNumber:(unsigned int)a3 rowBlock:(id)a4;
- (Class)classForFormulaType:(unsigned __int8)a3;
- (EDCellHeader)cellWithRowNumber:(unsigned int)a3 columnNumber:(int)a4;
- (EDRowBlocks)initWithWorksheet:(id)a3;
- (NSString)description;
- (id)fileNameForPersistingRowBlocks;
- (id)fileNameForPersistingRowBlocksWithIndex:(unint64_t)a3;
- (id)formulas;
- (id)rowBlockAtIndex:(unint64_t)a3;
- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4;
- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4 createIfNil:(BOOL)a5;
- (unint64_t)expectedIndexOfRowBlockForRowNumber:(unsigned int)a3;
- (unint64_t)indexOfRowBlockForRowNumber:(unsigned int)a3;
- (unint64_t)rowBlockCount;
- (unsigned)formulaTypeForFormula:(id)a3;
- (unsigned)maxPopulatedColumn;
- (unsigned)maxPopulatedRow;
- (void)dealloc;
- (void)load;
- (void)lock;
- (void)removeRowBlockAtIndex:(unint64_t)a3;
- (void)save;
- (void)unlock;
- (void)updateMaxPopulatedRow:(unsigned int)a3 column:(unsigned int)a4;
@end

@implementation EDRowBlocks

- (EDRowBlocks)initWithWorksheet:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EDRowBlocks;
  v6 = [(EDRowBlocks *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mWorksheet, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRowBlocks = v7->mRowBlocks;
    v7->mRowBlocks = v8;

    v10 = objc_alloc_init(EDCollection);
    mFormulas = v7->mFormulas;
    v7->mFormulas = v10;

    v12 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    mSaveLoadLock = v7->mSaveLoadLock;
    v7->mSaveLoadLock = v12;

    *(void *)&v7->mMaxPopulatedRow = 0;
    v7->mLockCount = 0;
    v14 = [v5 processors];
    [v14 markObject:v7 processor:objc_opt_class()];
  }
  return v7;
}

- (void)lock
{
  v3 = +[OITSUFlushingManager sharedManager];
  [v3 removeObject:self];

  [(NSRecursiveLock *)self->mSaveLoadLock lock];
  int mLockCount = self->mLockCount;
  if (!mLockCount)
  {
    [(EDRowBlocks *)self load];
    int mLockCount = self->mLockCount;
  }
  self->int mLockCount = mLockCount + 1;
  mSaveLoadLock = self->mSaveLoadLock;
  [(NSRecursiveLock *)mSaveLoadLock unlock];
}

- (void)load
{
  v3 = +[OITSUFlushingManager sharedManager];
  [v3 removeObject:self];

  [(NSRecursiveLock *)self->mSaveLoadLock lock];
  if (self->mFileName)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:self->mFileName];
    unint64_t v5 = [v4 length];
    BOOL v6 = v4 != 0;
    if (v4)
    {
      unint64_t v7 = v5;
      uint64_t v8 = 0;
      uint64_t v17 = 0;
      if (v5 >= 8)
      {
        [v4 getBytes:&v17 length:8];
        uint64_t v8 = v17;
      }
      unint64_t v9 = v8 + 8;
      if (v9 >= v7) {
        unint64_t v10 = v7;
      }
      else {
        unint64_t v10 = v9;
      }
      unint64_t v11 = 8;
      unint64_t v16 = 8;
      if (v10 >= 9)
      {
        do
        {
          v12 = objc_alloc_init(EDRowBlock);
          [(EDRowBlock *)v12 unarchiveFromData:v4 offset:&v16];
          [(NSMutableArray *)self->mRowBlocks addObject:v12];

          unint64_t v11 = v16;
        }
        while (v16 < v10);
      }
      while (v11 < v7)
      {
        unsigned __int8 v15 = 0;
        objc_msgSend(v4, "getBytes:range:", &v15);
        ++v16;
        id v13 = objc_alloc_init([(EDRowBlocks *)self classForFormulaType:v15]);
        [v13 unarchiveFromData:v4 offset:&v16];
        [(EDCollection *)self->mFormulas addObject:v13];

        unint64_t v11 = v16;
      }
    }
    TCRemoveFileSecurely(self->mFileName);
    mFileName = self->mFileName;
    self->mFileName = 0;
  }
  else
  {
    v4 = 0;
    BOOL v6 = 1;
  }
  [(NSRecursiveLock *)self->mSaveLoadLock unlock];
  if (!v6) {
    +[TCMessageException raise:TCUnknownProblemMessage];
  }
}

- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4 createIfNil:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v8 && [v8 minRowNumber] <= v6)
  {
    if ([(EDRowBlocks *)self spaceForRowNumber:v6 rowBlock:v9])
    {
      id v13 = v9;
      goto LABEL_19;
    }
    unint64_t v11 = -[EDRowBlocks rowBlockAtIndex:](self, "rowBlockAtIndex:", [v9 index] + 1);
    if (!v11)
    {
      id v13 = +[EDRowBlock rowBlock];
      objc_msgSend(v13, "setIndex:", -[NSMutableArray count](self->mRowBlocks, "count"));
      [(NSMutableArray *)self->mRowBlocks addObject:v13];
      goto LABEL_18;
    }
    if ([(EDRowBlocks *)self spaceForRowNumber:v6 rowBlock:v11])
    {
      id v13 = v11;
      goto LABEL_18;
    }
  }
  unint64_t v10 = [(EDRowBlocks *)self expectedIndexOfRowBlockForRowNumber:v6];
  unint64_t v11 = [(EDRowBlocks *)self rowBlockAtIndex:v10];
  if (v11)
  {
    if ([(EDRowBlocks *)self spaceForRowNumber:v6 rowBlock:v11])
    {
      id v12 = v11;
LABEL_17:
      id v13 = v12;
      unint64_t v11 = v12;
      goto LABEL_18;
    }
    if (!v5)
    {
      id v13 = 0;
      goto LABEL_18;
    }
    if ([v11 maxRowNumber] < v6) {
      ++v10;
    }
LABEL_13:
    unint64_t v14 = [(NSMutableArray *)self->mRowBlocks count];
    if (v10 < v14)
    {
      unint64_t v15 = v10;
      do
      {
        unint64_t v16 = [(NSMutableArray *)self->mRowBlocks objectAtIndex:v15];
        [v16 incrementIndex];

        ++v15;
      }
      while (v14 != v15);
    }
    uint64_t v17 = +[EDRowBlock rowBlock];

    [v17 setIndex:v10];
    [(NSMutableArray *)self->mRowBlocks insertObject:v17 atIndex:v10];
    id v12 = v17;
    goto LABEL_17;
  }
  if (v5) {
    goto LABEL_13;
  }
  id v13 = 0;
  unint64_t v11 = 0;
LABEL_18:

LABEL_19:
  return v13;
}

- (unint64_t)expectedIndexOfRowBlockForRowNumber:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(EDRowBlocks *)self rowBlockCount]) {
    return 0;
  }
  int64_t v5 = [(EDRowBlocks *)self rowBlockCount] - 1;
  if (v5 < 0) {
    return 0;
  }
  int64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = v6 + v5;
    uint64_t v8 = v6 + v5 < 0 != __OFADD__(v6, v5) ? v7 + 1 : v6 + v5;
    unint64_t v9 = v8 >> 1;
    unint64_t v10 = [(EDRowBlocks *)self rowBlockAtIndex:v8 >> 1];
    unsigned int v11 = [v10 minRowNumber];
    unsigned int v12 = [v10 maxRowNumber];
    if (v11 <= v3 && v12 >= v3) {
      break;
    }
    if (v11 <= v3) {
      int64_t v6 = v9 + 1;
    }
    else {
      int64_t v5 = v9 - 1;
    }

    if (v6 > v5) {
      goto LABEL_18;
    }
  }

LABEL_18:
  if (v7 >= 2)
  {
    unint64_t v14 = [(EDRowBlocks *)self rowBlockAtIndex:v9 - 1];
    if ([(EDRowBlocks *)self spaceForRowNumber:v3 rowBlock:v14]) {
      --v9;
    }
  }
  return v9;
}

- (unint64_t)rowBlockCount
{
  return [(NSMutableArray *)self->mRowBlocks count];
}

- (id)rowBlockAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mRowBlocks count] <= a3)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [(NSMutableArray *)self->mRowBlocks objectAtIndex:a3];
  }
  return v5;
}

- (void)updateMaxPopulatedRow:(unsigned int)a3 column:(unsigned int)a4
{
  if (self->mMaxPopulatedRow < a3) {
    self->mMaxPopulatedRow = a3;
  }
  if (self->mMaxPopulatedColumn < a4) {
    self->mMaxPopulatedColumn = a4;
  }
}

- (BOOL)spaceForRowNumber:(unsigned int)a3 rowBlock:(id)a4
{
  id v5 = a4;
  int64_t v6 = v5;
  BOOL v7 = v5
    && [v5 minRowNumber] <= a3
    && [v6 maxRowNumber] >= a3;

  return v7;
}

- (void)unlock
{
  [(NSRecursiveLock *)self->mSaveLoadLock lock];
  int v3 = self->mLockCount - 1;
  self->int mLockCount = v3;
  if (!v3)
  {
    v4 = +[OITSUFlushingManager sharedManager];
    [v4 addObject:self];
  }
  mSaveLoadLock = self->mSaveLoadLock;
  [(NSRecursiveLock *)mSaveLoadLock unlock];
}

- (id)formulas
{
  return self->mFormulas;
}

- (unsigned)maxPopulatedRow
{
  return self->mMaxPopulatedRow;
}

- (void)dealloc
{
  mFileName = self->mFileName;
  if (mFileName) {
    TCRemoveFileSecurely(mFileName);
  }
  v4.receiver = self;
  v4.super_class = (Class)EDRowBlocks;
  [(EDRowBlocks *)&v4 dealloc];
}

- (EDCellHeader)cellWithRowNumber:(unsigned int)a3 columnNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int64_t v6 = [(EDRowBlocks *)self rowBlockForRowNumber:*(void *)&a3 currentRowBlock:0];
  uint64_t v7 = [v6 rowInfoWithRowNumber:v5];
  if (v7) {
    uint64_t v8 = (EDCellHeader *)[v6 cellWithColumnNumber:v4 rowInfo:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)rowBlockForRowNumber:(unsigned int)a3 currentRowBlock:(id)a4
{
  uint64_t v4 = [(EDRowBlocks *)self rowBlockForRowNumber:*(void *)&a3 currentRowBlock:a4 createIfNil:0];
  return v4;
}

- (void)removeRowBlockAtIndex:(unint64_t)a3
{
}

- (unint64_t)indexOfRowBlockForRowNumber:(unsigned int)a3
{
  unint64_t v4 = [(EDRowBlocks *)self expectedIndexOfRowBlockForRowNumber:*(void *)&a3];
  uint64_t v5 = [(EDRowBlocks *)self rowBlockAtIndex:v4];
  if (v5) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = -1;
  }

  return v6;
}

- (unsigned)maxPopulatedColumn
{
  return self->mMaxPopulatedColumn;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDRowBlocks;
  v2 = [(EDRowBlocks *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSaveLoadLock, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
  objc_storeStrong((id *)&self->mRowBlocks, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
}

- (id)fileNameForPersistingRowBlocksWithIndex:(unint64_t)a3
{
  uint64_t v5 = [(EDSheet *)self->mWorksheet workbook];
  unint64_t v6 = [v5 fileName];

  if ([v6 length])
  {
    uint64_t v7 = [v6 lastPathComponent];
    uint64_t v8 = [@"_" stringByAppendingFormat:@"%@_", v7];
  }
  else
  {
    uint64_t v8 = @"_";
  }
  unint64_t v9 = [(EDSheet *)self->mWorksheet workbook];
  uint64_t v10 = [v9 indexOfSheet:self->mWorksheet];

  if (v10 != -1)
  {
    uint64_t v11 = [(__CFString *)v8 stringByAppendingFormat:@"Sheet%li_", v10 + 1];

    uint64_t v8 = (__CFString *)v11;
  }
  unsigned int v12 = [(EDSheet *)self->mWorksheet name];
  id v13 = [v12 string];
  unint64_t v14 = [(__CFString *)v8 stringByAppendingString:v13];

  unint64_t v15 = [(EDSheet *)self->mWorksheet workbook];
  unint64_t v16 = [v15 temporaryDirectory];
  uint64_t v17 = objc_msgSend(v14, "stringByAppendingFormat:", @"_%lu", a3);
  v18 = [v16 stringByAppendingPathComponent:v17];

  v19 = [v18 stringByAppendingPathExtension:@"ed"];

  return v19;
}

- (id)fileNameForPersistingRowBlocks
{
  int v3 = [MEMORY[0x263F08850] defaultManager];
  for (i = -[EDRowBlocks fileNameForPersistingRowBlocksWithIndex:](self, "fileNameForPersistingRowBlocksWithIndex:", -[EDRowBlocks(Private) fileNameForPersistingRowBlocks]::index);
        [v3 fileExistsAtPath:i];
        i = (void *)v5)
  {
    ++-[EDRowBlocks(Private) fileNameForPersistingRowBlocks]::index;
    uint64_t v5 = -[EDRowBlocks fileNameForPersistingRowBlocksWithIndex:](self, "fileNameForPersistingRowBlocksWithIndex:");
  }
  return i;
}

- (void)save
{
  [(NSRecursiveLock *)self->mSaveLoadLock lock];
  if (self->mLockCount || self->mFileName)
  {
    id v3 = 0;
    char v4 = 1;
  }
  else
  {
    unint64_t v6 = [(EDRowBlocks *)self fileNameForPersistingRowBlocks];
    mFileName = self->mFileName;
    self->mFileName = v6;

    id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
    while ([(EDRowBlocks *)self rowBlockCount])
    {
      uint64_t v8 = [(EDRowBlocks *)self rowBlockAtIndex:0];
      [v8 archiveByAppendingToMutableData:v3];

      [(NSMutableArray *)self->mRowBlocks removeObjectAtIndex:0];
    }
    uint64_t v11 = [v3 length];
    objc_msgSend(v3, "replaceBytesInRange:withBytes:length:", 0, 0, &v11, 8);
    while ([(EDCollection *)self->mFormulas count])
    {
      unint64_t v9 = [(EDCollection *)self->mFormulas objectAtIndex:0];
      unsigned __int8 v10 = 0;
      unsigned __int8 v10 = [(EDRowBlocks *)self formulaTypeForFormula:v9];
      [v3 appendBytes:&v10 length:1];
      [v9 archiveByAppendingToMutableData:v3];
      [(EDCollection *)self->mFormulas removeObjectAtIndex:0];
    }
    char v4 = [v3 writeToFile:self->mFileName atomically:1];
  }
  [(NSRecursiveLock *)self->mSaveLoadLock unlock];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(EDSheet *)self->mWorksheet workbook];
    [v5 outOfMemoryDetected];
  }
}

- (unsigned)formulaTypeForFormula:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v4) = 2;
  }
  else
  {
    objc_opt_class();
    uint64_t v4 = objc_opt_isKindOfClass() & 1;
  }

  return v4;
}

- (Class)classForFormulaType:(unsigned __int8)a3
{
  id v3 = objc_opt_class();
  return (Class)v3;
}

@end