@interface PXMemoryEntryInfo
+ (int64_t)compareMemoryInfo:(id)a3 byRelevanceScoreToMemoryInfo:(id)a4;
+ (int64_t)compareMemoryInfo:(id)a3 toMemoryInfo:(id)a4;
- (NSArray)memories;
- (NSDate)endDate;
- (NSDate)representativeDate;
- (NSDate)startDate;
- (PXMemoryEntryInfo)initWithMemories:(id)a3;
- (PXMemoryEntryInfo)initWithSortedMemories:(id)a3;
- (id)description;
- (id)entryByAddingMemory:(id)a3;
- (id)entryByRemovingMemory:(id)a3;
- (id)entryByReplacingMemoryInfoAtIndex:(int64_t)a3 withMemoryInfo:(id)a4;
- (int64_t)compare:(id)a3;
- (unint64_t)indexOfMemory:(id)a3;
@end

@implementation PXMemoryEntryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_memories, 0);
  objc_storeStrong((id *)&self->_representativeDate, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)memories
{
  return self->_memories;
}

- (NSDate)representativeDate
{
  return self->_representativeDate;
}

- (id)entryByReplacingMemoryInfoAtIndex:(int64_t)a3 withMemoryInfo:(id)a4
{
  id v7 = a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXMemoryEntryInfo.m", 177, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
  }
  if ([(NSArray *)self->_memories count] <= a3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXMemoryEntryInfo.m", 178, @"Invalid parameter not satisfying: %@", @"index < [_memories count]" object file lineNumber description];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_memories, "count"));
  [v8 removeIndex:a3];
  v9 = [(NSArray *)self->_memories objectsAtIndexes:v8];
  v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v10 count];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PXMemoryEntryInfo_entryByReplacingMemoryInfoAtIndex_withMemoryInfo___block_invoke;
  v16[3] = &unk_1E5DC6AA0;
  v16[4] = self;
  objc_msgSend(v10, "insertObject:atIndex:", v7, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v11, 1024, v16));
  v12 = [[PXMemoryEntryInfo alloc] initWithSortedMemories:v10];

  return v12;
}

uint64_t __70__PXMemoryEntryInfo_entryByReplacingMemoryInfoAtIndex_withMemoryInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareMemoryInfo:v5 toMemoryInfo:v4];

  return v6;
}

- (id)entryByRemovingMemory:(id)a3
{
  id v4 = self;
  uint64_t v5 = [(PXMemoryEntryInfo *)v4 indexOfMemory:a3];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, -[NSArray count](v4->_memories, "count"));
    [v7 removeIndex:v6];
    v8 = [(NSArray *)v4->_memories objectsAtIndexes:v7];
    v9 = [[PXMemoryEntryInfo alloc] initWithSortedMemories:v8];

    id v4 = v9;
  }
  return v4;
}

- (id)entryByAddingMemory:(id)a3
{
  id v4 = +[PXMemoryInfo memoryInfoWithMemory:a3];
  memories = self->_memories;
  uint64_t v6 = [(NSArray *)memories count];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__PXMemoryEntryInfo_entryByAddingMemory___block_invoke;
  v11[3] = &unk_1E5DC6AA0;
  v11[4] = self;
  uint64_t v7 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](memories, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v6, 1024, v11);
  v8 = (void *)[(NSArray *)self->_memories mutableCopy];
  [v8 insertObject:v4 atIndex:v7];
  v9 = [[PXMemoryEntryInfo alloc] initWithSortedMemories:v8];

  return v9;
}

uint64_t __41__PXMemoryEntryInfo_entryByAddingMemory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareMemoryInfo:v5 toMemoryInfo:v4];

  return v6;
}

- (unint64_t)indexOfMemory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  memories = self->_memories;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PXMemoryEntryInfo_indexOfMemory___block_invoke;
  v9[3] = &unk_1E5DC6AC8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSArray *)memories enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __35__PXMemoryEntryInfo_indexOfMemory___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [a2 assetCollection];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (PXMemoryEntryInfo)initWithSortedMemories:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXMemoryEntryInfo;
  id v5 = [(PXMemoryEntryInfo *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    memories = v5->_memories;
    v5->_memories = (NSArray *)v6;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v8 = v5->_memories;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    id v24 = v4;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v26;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v11;
        v16 = v12;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v8);
          }
          v17 = [*(id *)(*((void *)&v25 + 1) + 8 * v14) assetCollection];
          v18 = [v17 creationDate];

          uint64_t v12 = [v18 earlierDate:v16];

          uint64_t v11 = [v18 laterDate:v15];

          ++v14;
          uint64_t v15 = v11;
          v16 = v12;
        }
        while (v10 != v14);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    startDate = v5->_startDate;
    v5->_startDate = v12;
    v20 = v12;

    endDate = v5->_endDate;
    v5->_endDate = v11;
    v22 = v11;

    objc_storeStrong((id *)&v5->_representativeDate, v5->_startDate);
    id v4 = v24;
  }

  return v5;
}

- (PXMemoryEntryInfo)initWithMemories:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PXMemoryEntryInfo_initWithMemories___block_invoke;
  v8[3] = &unk_1E5DC6AA0;
  id v4 = self;
  uint64_t v9 = v4;
  id v5 = [a3 sortedArrayUsingComparator:v8];
  uint64_t v6 = [(PXMemoryEntryInfo *)v4 initWithSortedMemories:v5];

  return v6;
}

uint64_t __38__PXMemoryEntryInfo_initWithMemories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareMemoryInfo:v5 toMemoryInfo:v4];

  return v6;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)PXMemoryEntryInfo;
  id v4 = [(PXMemoryEntryInfo *)&v16 description];
  id v5 = [v3 stringWithFormat:@"<%@ startDate:%@ endDate:%@, memories:\r", v4, self->_startDate, self->_endDate];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_memories;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"\t%@\r", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  [v5 appendString:@"\r>"];
  return v5;
}

- (int64_t)compare:(id)a3
{
  startDate = self->_startDate;
  id v4 = [a3 startDate];
  int64_t v5 = [(NSDate *)startDate compare:v4];

  return v5;
}

+ (int64_t)compareMemoryInfo:(id)a3 byRelevanceScoreToMemoryInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 assetCollection];
  uint64_t v7 = [v5 assetCollection];

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v6 relevanceScoreAtDate:v8];
  double v10 = v9;
  [v7 relevanceScoreAtDate:v8];
  if (v10 > v11) {
    int64_t v12 = -1;
  }
  else {
    int64_t v12 = v10 < v11;
  }

  return v12;
}

+ (int64_t)compareMemoryInfo:(id)a3 toMemoryInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PXMemoriesFeedSettings sharedInstance];
  int v8 = [v7 rankMemoriesByRelevanceScore];

  if (!v8)
  {
    double v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v11 = [v10 BOOLForKey:@"PXSortMemoriesByCreationDateOnly"];

    int64_t v12 = [v6 assetCollection];

    long long v13 = [v5 assetCollection];

    int v14 = [v12 isUserCreated];
    unsigned int v15 = [v13 isUserCreated];
    if (v11)
    {
LABEL_4:
      objc_super v16 = [v13 creationDate];
      v17 = [v12 creationDate];
      int64_t v9 = [v16 compare:v17];

LABEL_5:
      if (!v9)
      {
        uint64_t v18 = [v12 localIdentifier];
        v19 = [v13 localIdentifier];
        int64_t v9 = [v18 compare:v19];
      }
      goto LABEL_22;
    }
    if ((v14 | v15))
    {
      if (v14) {
        int v20 = v15 ^ 1;
      }
      else {
        int v20 = v15;
      }
      uint64_t v21 = (uint64_t)((unint64_t)(v14 & (v15 ^ 1)) << 63) >> 63;
      if (!v14) {
        uint64_t v21 = v15;
      }
      if (v20) {
        int64_t v9 = v21;
      }
      else {
        int64_t v9 = 0;
      }
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    [v12 score];
    double v23 = v22;
    [v13 score];
    if (v23 <= v24)
    {
      if (v23 >= v24) {
        goto LABEL_4;
      }
      int64_t v9 = 1;
    }
    else
    {
      int64_t v9 = -1;
    }
LABEL_22:
    id v5 = v13;
    id v6 = v12;
    goto LABEL_23;
  }
  int64_t v9 = [(id)objc_opt_class() compareMemoryInfo:v6 byRelevanceScoreToMemoryInfo:v5];
LABEL_23:

  return v9;
}

@end