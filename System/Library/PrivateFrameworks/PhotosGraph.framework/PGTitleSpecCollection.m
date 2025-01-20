@interface PGTitleSpecCollection
+ (PGTitleSpecCollection)collectionWithSpecPools:(id)a3;
- (NSArray)specPools;
- (PGTitleSpecCollection)initWithSpecPools:(id)a3;
- (id)_allPossibleTitlesWithMomentNodes:(id)a3 forHighlight:(BOOL)a4 argumentEvaluationContext:(id)a5;
- (id)allPossibleTitlesWithHighlightMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)allPossibleTitlesWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)description;
@end

@implementation PGTitleSpecCollection

- (void).cxx_destruct
{
}

- (NSArray)specPools
{
  return self->_specPools;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecCollection;
  v4 = [(PGTitleSpecCollection *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ \n\tspecPools %@", v4, self->_specPools];

  return v5;
}

- (id)_allPossibleTitlesWithMomentNodes:(id)a3 forHighlight:(BOOL)a4 argumentEvaluationContext:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F1CA80] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = self->_specPools;
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v13 = [v12 specs];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              if (v6) {
                [*(id *)(*((void *)&v24 + 1) + 8 * j) setInsertNonBreakableSpace:1];
              }
              v19 = [v18 titleWithMomentNodes:v8 argumentEvaluationContext:v9];
              if (v19) {
                [v10 addObject:v19];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }
      }
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  return v10;
}

- (id)allPossibleTitlesWithHighlightMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return [(PGTitleSpecCollection *)self _allPossibleTitlesWithMomentNodes:a3 forHighlight:1 argumentEvaluationContext:a4];
}

- (id)allPossibleTitlesWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return [(PGTitleSpecCollection *)self _allPossibleTitlesWithMomentNodes:a3 forHighlight:0 argumentEvaluationContext:a4];
}

- (PGTitleSpecCollection)initWithSpecPools:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGTitleSpecCollection;
  BOOL v6 = [(PGTitleSpecCollection *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specPools, a3);
  }

  return v7;
}

+ (PGTitleSpecCollection)collectionWithSpecPools:(id)a3
{
  id v3 = a3;
  v4 = [[PGTitleSpecCollection alloc] initWithSpecPools:v3];

  return v4;
}

@end