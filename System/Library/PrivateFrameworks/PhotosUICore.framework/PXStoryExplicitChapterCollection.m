@interface PXStoryExplicitChapterCollection
- (BOOL)containsChapterBeginningWithAsset:(id)a3;
- (NSArray)chapters;
- (NSDictionary)chapterIndexesByIdentifier;
- (NSSet)chapterBeginningAssetlocalIdentifiers;
- (PXStoryExplicitChapterCollection)initWithAssets:(id)a3 configuration:(id)a4;
- (id)chapterAtIndex:(int64_t)a3;
- (id)chapterContainingAsset:(id)a3;
- (int64_t)indexOfChapterWithIdentifier:(id)a3;
- (int64_t)numberOfChapters;
- (void)addChapterWithAssetRange:(_NSRange)a3 configuration:(id)a4;
- (void)addChapterWithAssetUUIDs:(id)a3 configuration:(id)a4;
@end

@implementation PXStoryExplicitChapterCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterBeginningAssetlocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_chapterIndexesByIdentifier, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_initializedAssets, 0);
  objc_storeStrong((id *)&self->_initializedChapters, 0);
}

- (NSSet)chapterBeginningAssetlocalIdentifiers
{
  return self->_chapterBeginningAssetlocalIdentifiers;
}

- (NSDictionary)chapterIndexesByIdentifier
{
  return self->_chapterIndexesByIdentifier;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (id)chapterContainingAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [a3 uuid];
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(PXStoryExplicitChapterCollection *)self chapters];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 assetUUIDs];
          int v11 = [v10 containsObject:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)containsChapterBeginningWithAsset:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryExplicitChapterCollection *)self chapterBeginningAssetlocalIdentifiers];
  id v6 = [v4 uuid];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (int64_t)indexOfChapterWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryExplicitChapterCollection *)self chapterIndexesByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int64_t v7 = [v6 integerValue];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)chapterAtIndex:(int64_t)a3
{
  id v4 = [(PXStoryExplicitChapterCollection *)self chapters];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfChapters
{
  v2 = [(PXStoryExplicitChapterCollection *)self chapters];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)addChapterWithAssetUUIDs:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  int64_t v7 = (void (**)(id, void *))a4;
  if (![v6 count]) {
    PXAssertGetLog();
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  v9 = [_PXStoryExplicitChapter alloc];
  v10 = [v6 objectAtIndexedSubscript:0];
  int v11 = [(_PXStoryExplicitChapter *)v9 initWithFirstAssetUUID:v10 assetUUIDs:v8];

  v7[2](v7, v11);
  [(NSMutableArray *)self->_initializedChapters addObject:v11];
}

- (void)addChapterWithAssetRange:(_NSRange)a3 configuration:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (location < (uint64_t)(location + length))
  {
    *(void *)&long long v9 = 138412290;
    long long v14 = v9;
    do
    {
      v10 = -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_initializedAssets, "objectAtIndexedSubscript:", location, v14);
      int v11 = [(PXDisplayAssetFetchResult *)self->_initializedAssets objectAtIndexedSubscript:location];
      v12 = [v11 uuid];

      if (!v12) {
        PXAssertGetLog();
      }
      [v8 addObject:v12];

      ++location;
      --length;
    }
    while (length);
  }
  if ([v8 count])
  {
    long long v13 = (void *)[v8 copy];
    [(PXStoryExplicitChapterCollection *)self addChapterWithAssetUUIDs:v13 configuration:v7];
  }
}

- (PXStoryExplicitChapterCollection)initWithAssets:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, PXStoryExplicitChapterCollection *))a4;
  long long v9 = [(PXStoryExplicitChapterCollection *)self init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    initializedChapters = v9->_initializedChapters;
    v9->_initializedChapters = v10;

    objc_storeStrong((id *)&v9->_initializedAssets, a3);
    v8[2](v8, v9);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = v9->_initializedChapters;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __65__PXStoryExplicitChapterCollection_initWithAssets_configuration___block_invoke;
    v29 = &unk_1E5DCA6E8;
    id v30 = v12;
    id v31 = v13;
    id v15 = v13;
    id v16 = v12;
    [(NSMutableArray *)v14 enumerateObjectsUsingBlock:&v26];
    uint64_t v17 = [(NSMutableArray *)v9->_initializedChapters copy];
    chapters = v9->_chapters;
    v9->_chapters = (NSArray *)v17;

    uint64_t v19 = [v15 copy];
    chapterIndexesByIdentifier = v9->_chapterIndexesByIdentifier;
    v9->_chapterIndexesByIdentifier = (NSDictionary *)v19;

    uint64_t v21 = [v16 copy];
    chapterBeginningAssetlocalIdentifiers = v9->_chapterBeginningAssetlocalIdentifiers;
    v9->_chapterBeginningAssetlocalIdentifiers = (NSSet *)v21;

    v23 = v9->_initializedChapters;
    v9->_initializedChapters = 0;

    initializedAssets = v9->_initializedAssets;
    v9->_initializedAssets = 0;
  }
  return v9;
}

void __65__PXStoryExplicitChapterCollection_initWithAssets_configuration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = [v5 firstAssetUUID];
  [*(id *)(a1 + 32) addObject:v9];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = *(void **)(a1 + 40);
  id v8 = [v5 identifier];

  [v7 setObject:v6 forKeyedSubscript:v8];
}

@end