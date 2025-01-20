@interface EDWorkbook
+ (id)impliedColorMap;
- (BOOL)isOutOfMemoryDetected;
- (EDWorkbook)init;
- (EDWorkbook)initWithFileName:(id)a3 andStringOptimization:(BOOL)a4;
- (EDWorkbook)initWithStringOptimization:(BOOL)a3;
- (id)activeSheet;
- (id)bulletBlips;
- (id)dateBaseDate;
- (id)description;
- (id)escherDrawingGroup;
- (id)fileName;
- (id)mappingContext;
- (id)processors;
- (id)resources;
- (id)sheetAtIndex:(unint64_t)a3;
- (id)sheetAtIndex:(unint64_t)a3 loadIfNeeded:(BOOL)a4;
- (id)temporaryDirectory;
- (id)visibleRange;
- (id)warnings;
- (id)workbookName;
- (int)dateBase;
- (unint64_t)activeSheetIndex;
- (unint64_t)indexOfSheet:(id)a3;
- (unint64_t)indexOfSheetWithName:(id)a3;
- (unint64_t)sheetCount;
- (unsigned)legacyDateBase;
- (void)addOtherResources:(id)a3;
- (void)addSheet:(id)a3;
- (void)applyProcessors;
- (void)dealloc;
- (void)outOfMemoryDetected;
- (void)reduceMemoryIfPossible;
- (void)removeSheetAtIndex:(unint64_t)a3;
- (void)removeWorksheetAtIndex:(unsigned int)a3;
- (void)setActiveSheet:(id)a3;
- (void)setActiveSheetIndex:(unint64_t)a3;
- (void)setDateBase:(int)a3;
- (void)setEscherDrawingGroup:(id)a3;
- (void)setMappingContext:(id)a3;
- (void)setResources:(id)a3;
- (void)setTemporaryDirectory:(id)a3;
- (void)setVisibleRange:(id)a3;
@end

@implementation EDWorkbook

- (EDWorkbook)initWithFileName:(id)a3 andStringOptimization:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [(EDWorkbook *)self initWithStringOptimization:v4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mFileName, a3);
  }

  return v9;
}

- (EDWorkbook)initWithStringOptimization:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDWorkbook;
  BOOL v4 = [(OCDDocument *)&v20 init];
  if (v4)
  {
    v5 = [[EDResources alloc] initWithStringOptimization:v3];
    mResources = v4->mResources;
    v4->mResources = v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mOtherResources = v4->mOtherResources;
    v4->mOtherResources = v7;

    v9 = [[EDProcessors alloc] initWithWorkbook:v4];
    mProcessors = v4->mProcessors;
    v4->mProcessors = v9;

    v11 = objc_alloc_init(EDWarnings);
    mWarnings = v4->mWarnings;
    v4->mWarnings = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSheets = v4->mSheets;
    v4->mSheets = v13;

    v15 = objc_alloc_init(ECMappingContext);
    mMappingContext = v4->mMappingContext;
    v4->mMappingContext = v15;

    v4->mDateBase = 2;
    v4->mActiveSheetIndex = -1;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBulletBlips = v4->mBulletBlips;
    v4->mBulletBlips = v17;

    v4->mIsOutOfMemoryConditionDetected = 0;
  }
  return v4;
}

- (void)setTemporaryDirectory:(id)a3
{
  v5 = (NSString *)a3;
  if (self->mTemporaryDirectory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mTemporaryDirectory, a3);
    v5 = v6;
  }
}

- (id)processors
{
  return self->mProcessors;
}

- (id)resources
{
  return self->mResources;
}

- (void)setDateBase:(int)a3
{
  self->mDateBase = a3;
}

- (void)setActiveSheetIndex:(unint64_t)a3
{
  self->mActiveSheetIndex = a3;
}

- (void)addSheet:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->mSheets addObject:v4];
  }
}

- (int)dateBase
{
  return self->mDateBase;
}

- (unint64_t)sheetCount
{
  return [(NSMutableArray *)self->mSheets count];
}

- (id)sheetAtIndex:(unint64_t)a3 loadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(EDWorkbook *)self sheetCount] <= a3)
  {
    v8 = 0;
  }
  else
  {
    id v7 = [(NSMutableArray *)self->mSheets objectAtIndex:a3];
    v8 = v7;
    if (v4 && ([v7 isLoaded] & 1) == 0) {
      [v8 load];
    }
  }
  return v8;
}

- (id)sheetAtIndex:(unint64_t)a3
{
  return [(EDWorkbook *)self sheetAtIndex:a3 loadIfNeeded:1];
}

- (id)workbookName
{
  return [(NSString *)self->mFileName lastPathComponent];
}

- (void)dealloc
{
  uint64_t v3 = [(NSMutableArray *)self->mSheets count];
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->mSheets objectAtIndex:v4];
      [v5 teardown];

      ++v4;
    }
    while (v3 != v4);
  }
  [(EDProcessors *)self->mProcessors removeAllObjects];
  v6.receiver = self;
  v6.super_class = (Class)EDWorkbook;
  [(EDWorkbook *)&v6 dealloc];
}

- (id)mappingContext
{
  return self->mMappingContext;
}

- (unint64_t)indexOfSheet:(id)a3
{
  id v4 = a3;
  if (v4) {
    unint64_t v5 = [(NSMutableArray *)self->mSheets indexOfObject:v4];
  }
  else {
    unint64_t v5 = -1;
  }

  return v5;
}

- (id)warnings
{
  return self->mWarnings;
}

- (void)addOtherResources:(id)a3
{
}

- (void)setVisibleRange:(id)a3
{
  unint64_t v5 = (EDReference *)a3;
  if (self->mVisibleRange != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->mVisibleRange, a3);
    unint64_t v5 = v6;
  }
}

- (EDWorkbook)init
{
  return [(EDWorkbook *)self initWithStringOptimization:0];
}

- (void)setResources:(id)a3
{
  unint64_t v5 = (EDResources *)a3;
  if (self->mResources != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->mResources, a3);
    unint64_t v5 = v6;
  }
}

- (id)fileName
{
  return self->mFileName;
}

- (id)temporaryDirectory
{
  mTemporaryDirectory = self->mTemporaryDirectory;
  if (!mTemporaryDirectory)
  {
    NSTemporaryDirectory();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = self->mTemporaryDirectory;
    self->mTemporaryDirectory = v4;

    mTemporaryDirectory = self->mTemporaryDirectory;
  }
  return mTemporaryDirectory;
}

- (id)dateBaseDate
{
  mDateBaseDate = self->mDateBaseDate;
  if (!mDateBaseDate)
  {
    int mDateBase = self->mDateBase;
    uint64_t v5 = 1904;
    if (mDateBase == 1) {
      uint64_t v5 = 1900;
    }
    if (mDateBase) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 1899;
    }
    if (mDateBase) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 30;
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v8 setDay:v7];
    if (mDateBase) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 12;
    }
    [v8 setMonth:v9];
    [v8 setYear:v6];
    id v10 = objc_alloc(MEMORY[0x263EFF8F0]);
    v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v12 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
    [v11 setTimeZone:v12];

    v13 = [v11 dateFromComponents:v8];
    v14 = self->mDateBaseDate;
    self->mDateBaseDate = v13;

    mDateBaseDate = self->mDateBaseDate;
  }
  return mDateBaseDate;
}

- (unsigned)legacyDateBase
{
  if (self->mDateBase == 2) {
    return 1904;
  }
  else {
    return 1900;
  }
}

- (id)visibleRange
{
  return self->mVisibleRange;
}

- (void)removeSheetAtIndex:(unint64_t)a3
{
  id v5 = [(EDWorkbook *)self sheetAtIndex:a3 loadIfNeeded:0];
  if (v5)
  {
    [v5 teardown];
    [(NSMutableArray *)self->mSheets removeObjectAtIndex:a3];
  }
}

- (unint64_t)indexOfSheetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->mSheets count];
  if (v5)
  {
    for (unint64_t i = 0; v5 != i; ++i)
    {
      uint64_t v7 = [(NSMutableArray *)self->mSheets objectAtIndex:i];
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 name];
        id v10 = [v9 string];

        if (v10 && ([v10 isEqual:v4] & 1) != 0)
        {

          goto LABEL_9;
        }
      }
    }
  }
  unint64_t i = -1;
LABEL_9:

  return i;
}

- (id)activeSheet
{
  if (self->mActiveSheetIndex == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[EDWorkbook sheetAtIndex:](self, "sheetAtIndex:");
  }
  return v2;
}

- (void)setActiveSheet:(id)a3
{
  self->mActiveSheetIndex = [(EDWorkbook *)self indexOfSheet:a3];
}

- (void)setMappingContext:(id)a3
{
  uint64_t v5 = (ECMappingContext *)a3;
  if (self->mMappingContext != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->mMappingContext, a3);
    uint64_t v5 = v6;
  }
}

- (void)applyProcessors
{
  [(EDProcessors *)self->mProcessors applyProcessorsWithSheet:0];
  [(EDProcessors *)self->mProcessors removeAllObjects];
  unint64_t v3 = [(EDWorkbook *)self sheetCount];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
      id v6 = [(EDWorkbook *)self sheetAtIndex:i loadIfNeeded:1];
  }
}

- (void)outOfMemoryDetected
{
  self->mIsOutOfMemoryConditionDetected = 1;
}

- (BOOL)isOutOfMemoryDetected
{
  return self->mIsOutOfMemoryConditionDetected;
}

- (id)bulletBlips
{
  return self->mBulletBlips;
}

+ (id)impliedColorMap
{
  v2 = objc_alloc_init(OADColorMap);
  [(OADColorMap *)v2 addDefaultMappings:1];
  return v2;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDWorkbook;
  v2 = [(EDWorkbook *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEscherDrawingGroup, 0);
  objc_storeStrong((id *)&self->mBulletBlips, 0);
  objc_storeStrong((id *)&self->mTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mDateBaseDate, 0);
  objc_storeStrong((id *)&self->mVisibleRange, 0);
  objc_storeStrong((id *)&self->mSheets, 0);
  objc_storeStrong((id *)&self->mWarnings, 0);
  objc_storeStrong((id *)&self->mMappingContext, 0);
  objc_storeStrong((id *)&self->mProcessors, 0);
  objc_storeStrong((id *)&self->mOtherResources, 0);
  objc_storeStrong((id *)&self->mResources, 0);
}

- (id)escherDrawingGroup
{
  return self->mEscherDrawingGroup;
}

- (void)setEscherDrawingGroup:(id)a3
{
}

- (void)reduceMemoryIfPossible
{
  unint64_t v3 = [(EDWorkbook *)self sheetCount];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [(EDWorkbook *)self sheetAtIndex:i loadIfNeeded:0];
      if ([v6 isLoaded]) {
        [v6 reduceMemoryIfPossible];
      }
    }
  }
}

- (unint64_t)activeSheetIndex
{
  return self->mActiveSheetIndex;
}

- (void)removeWorksheetAtIndex:(unsigned int)a3
{
}

@end