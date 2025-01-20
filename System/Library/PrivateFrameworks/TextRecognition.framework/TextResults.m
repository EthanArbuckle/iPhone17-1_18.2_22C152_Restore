@interface TextResults
- (NSArray)cols;
- (NSMutableArray)mutableCols;
- (TextResults)init;
- (id)transcriptionOfPath:(id)a3 tokenProcessingBlock:(id)a4;
- (unint64_t)colCount;
- (void)addColumn:(id)a3;
- (void)setCols:(id)a3;
- (void)setMutableCols:(id)a3;
- (void)sortCols;
@end

@implementation TextResults

- (TextResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)TextResults;
  v2 = [(TextResults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    mutableCols = v2->_mutableCols;
    v2->_mutableCols = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addColumn:(id)a3
{
  mutableCols = self->_mutableCols;
  if (mutableCols) {
    [(NSMutableArray *)mutableCols addObject:a3];
  }
}

- (NSArray)cols
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_mutableCols];
}

- (unint64_t)colCount
{
  return [(NSMutableArray *)self->_mutableCols count];
}

- (void)sortCols
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_mutableCols;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "sortRowsInAscendingOrder", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)transcriptionOfPath:(id)a3 tokenProcessingBlock:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, uint64_t, uint64_t))a4;
  long long v7 = [MEMORY[0x1E4F28E78] string];
  if ([v5 length])
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    v24 = v5;
    do
    {
      long long v10 = [(NSMutableArray *)self->_mutableCols objectAtIndexedSubscript:v9];
      uint64_t v29 = v9;
      uint64_t v11 = [v5 indexAtPosition:v9];
      v28 = v10;
      v27 = [v10 rows];
      v26 = [v27 objectAtIndexedSubscript:v11];
      uint64_t v12 = [v26 tokens];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v12;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v32 = *(void *)v34;
        do
        {
          uint64_t v15 = 0;
          uint64_t v30 = v8;
          uint64_t v16 = -v8;
          do
          {
            if (*(void *)v34 != v32) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
            if (v16 == v15) {
              v18 = &stru_1F38EED68;
            }
            else {
              v18 = @" ";
            }
            uint64_t v19 = [v7 length];
            uint64_t v20 = [(__CFString *)v18 length];
            v21 = [v17 string];
            [v7 appendFormat:@"%@%@", v18, v21];

            uint64_t v22 = [v7 length];
            if (v6) {
              v6[2](v6, v17, v20 + v19, v22 - (v20 + v19));
            }
            ++v15;
          }
          while (v14 != v15);
          uint64_t v8 = v14 + v30;
          uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v14);
      }

      uint64_t v9 = v29 + 1;
      id v5 = v24;
    }
    while (v29 + 1 < (unint64_t)[v24 length]);
  }

  return v7;
}

- (void)setCols:(id)a3
{
}

- (NSMutableArray)mutableCols
{
  return self->_mutableCols;
}

- (void)setMutableCols:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCols, 0);
  objc_storeStrong((id *)&self->_cols, 0);
}

@end