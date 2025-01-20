@interface TSTTableTile
- (NSArray)rowInfos;
- (TSTTableTile)initWithContext:(id)a3;
- (TSTTableTile)initWithRows:(id)a3 context:(id)a4;
- (id)description;
- (id)packageLocator;
- (unint64_t)flushableSize;
- (unsigned)maxColumn;
- (unsigned)maxRow;
- (unsigned)numCells;
- (unsigned)numRows;
- (void)dealloc;
- (void)i_upgradeTileRowInfosWithDataStore:(id)a3;
@end

@implementation TSTTableTile

- (TSTTableTile)initWithRows:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)TSTTableTile;
  v5 = [(TSPObject *)&v29 initWithContext:a4];
  v6 = v5;
  if (v5)
  {
    v5->mMaxColumn = 0;
    v5->mMaxRow = 0;
    v5->mNumCells = 0;
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    if (a3)
    {
      v8 = (NSMutableArray *)[v7 initWithArray:a3];
      v6->mRowInfos = v8;
      [(NSMutableArray *)v8 makeObjectsPerformSelector:sel_setOwner_ withObject:v6];
      v6->mNumRows = [a3 count];
      v6->mMaxRow = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      mRowInfos = v6->mRowInfos;
      uint64_t v10 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(mRowInfos);
            }
            unsigned int v14 = *(unsigned __int16 *)(*(void *)(*((void *)&v30 + 1) + 8 * i) + 536);
            if (v14 > v6->mMaxRow) {
              v6->mMaxRow = v14;
            }
          }
          uint64_t v11 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v11);
      }
      v6->mMaxColumn = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v15 = v6->mRowInfos;
      uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16, 56);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            if (*(_WORD *)(v20 + 538))
            {
              if (!*(unsigned char *)(v20 + 541)) {
                TSTTableTileRowInfoRecalculateMaxTileColumnIndex(*(void *)(*((void *)&v30 + 1) + 8 * j));
              }
              unsigned int v21 = *(unsigned __int8 *)(v20 + 540);
              if (v21 != 255 && v21 > v6->mMaxColumn) {
                v6->mMaxColumn = v21;
              }
            }
          }
          uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v17);
      }
      v6->mNumCells = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v22 = *(Class *)((char *)&v6->super.super.isa + v28);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v22);
            }
            v6->mNumCells += *(_WORD *)(*(void *)(*((void *)&v30 + 1) + 8 * k) + 538);
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v24);
      }
    }
    else
    {
      v6->mRowInfos = (NSMutableArray *)[v7 initWithCapacity:32];
      v6->mNumRows = 0;
    }
  }
  return v6;
}

- (TSTTableTile)initWithContext:(id)a3
{
  return [(TSTTableTile *)self initWithRows:0 context:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableTile;
  [(TSTTableTile *)&v3 dealloc];
}

- (unint64_t)flushableSize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mRowInfos = self->mRowInfos;
  uint64_t v3 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 8;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v10;
  unint64_t v6 = 8;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(mRowInfos);
      }
      v6 += TSTTableTileRowInfoFlushableSize(*(void *)(*((void *)&v9 + 1) + 8 * i));
    }
    uint64_t v4 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v6;
}

- (id)packageLocator
{
  return @"Tables/Tile";
}

- (unsigned)maxColumn
{
  return self->mMaxColumn;
}

- (unsigned)maxRow
{
  return self->mMaxRow;
}

- (unsigned)numCells
{
  return self->mNumCells;
}

- (unsigned)numRows
{
  return self->mNumRows;
}

- (NSArray)rowInfos
{
  return &self->mRowInfos->super;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p %hu rows / %hu cells>", NSStringFromClass(v4), self, self->mNumRows, self->mNumCells];
}

- (void)i_upgradeTileRowInfosWithDataStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(TSPObject *)self willModifyForUpgrade];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mRowInfos = self->mRowInfos;
  uint64_t v6 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mRowInfos);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "i_upgradeWithDataStore:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)mRowInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end