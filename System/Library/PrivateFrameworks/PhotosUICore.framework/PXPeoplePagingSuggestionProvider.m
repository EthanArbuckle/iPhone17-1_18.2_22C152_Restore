@interface PXPeoplePagingSuggestionProvider
- (BOOL)hasNextSuggestions;
- (BOOL)hasPreviousSuggestions;
- (NSArray)currentSuggestions;
- (NSMutableArray)unvisitedSuggestions;
- (NSMutableArray)visitedSuggestions;
- (PXPeoplePagingSuggestionProvider)init;
- (id)nextSuggestionsWithPageLimit:(int64_t)a3;
- (id)previousSuggestions;
- (void)appendSuggestionArray:(id)a3;
- (void)removeAllSuggestions;
- (void)removeSuggestions:(id)a3;
- (void)setCurrentSuggestions:(id)a3;
- (void)setUnvisitedSuggestions:(id)a3;
- (void)setVisitedSuggestions:(id)a3;
@end

@implementation PXPeoplePagingSuggestionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedSuggestions, 0);
  objc_storeStrong((id *)&self->_unvisitedSuggestions, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
}

- (void)setVisitedSuggestions:(id)a3
{
}

- (NSMutableArray)visitedSuggestions
{
  return self->_visitedSuggestions;
}

- (void)setUnvisitedSuggestions:(id)a3
{
}

- (NSMutableArray)unvisitedSuggestions
{
  return self->_unvisitedSuggestions;
}

- (void)setCurrentSuggestions:(id)a3
{
}

- (NSArray)currentSuggestions
{
  return self->_currentSuggestions;
}

- (void)removeAllSuggestions
{
  [(PXPeoplePagingSuggestionProvider *)self setCurrentSuggestions:0];
  v3 = [(PXPeoplePagingSuggestionProvider *)self visitedSuggestions];
  [v3 removeAllObjects];

  id v4 = [(PXPeoplePagingSuggestionProvider *)self unvisitedSuggestions];
  [v4 removeAllObjects];
}

- (void)removeSuggestions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPeoplePagingSuggestionProvider *)self currentSuggestions];
  v6 = (void *)[v5 mutableCopy];
  [v6 removeObjectsInArray:v4];
  uint64_t v7 = [v6 count];
  v25 = v5;
  if (v7 != [v5 count])
  {
    if (v7) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    [(PXPeoplePagingSuggestionProvider *)self setCurrentSuggestions:v8];
  }
  v24 = v6;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = self;
  obuint64_t j = [(PXPeoplePagingSuggestionProvider *)self visitedSuggestions];
  uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v30 = [v10 count];
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              uint64_t v18 = [v17 count];
              if (v18)
              {
                uint64_t v19 = v18;
                v20 = (void *)[v17 mutableCopy];
                [v20 removeObjectsInArray:v4];
                uint64_t v21 = [v20 count];
                if (v21)
                {
                  if (v19 != v21) {
                    [v17 removeObjectsInArray:v4];
                  }
                }
                else
                {
                  [v11 addObject:v17];
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }

        if ([v11 count]) {
          [v12 removeObjectsInArray:v11];
        }
        if (v30 && ![v12 count]) {
          [v26 addObject:v12];
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }

  if ([v26 count])
  {
    v22 = [(PXPeoplePagingSuggestionProvider *)v23 visitedSuggestions];
    [v22 removeObjectsInArray:v26];
  }
}

- (void)appendSuggestionArray:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = (void *)[v6 mutableCopy];
    v5 = [(PXPeoplePagingSuggestionProvider *)self unvisitedSuggestions];
    [v5 addObject:v4];
  }
}

- (id)nextSuggestionsWithPageLimit:(int64_t)a3
{
  v5 = [(PXPeoplePagingSuggestionProvider *)self currentSuggestions];
  id v6 = [(PXPeoplePagingSuggestionProvider *)self visitedSuggestions];
  uint64_t v7 = [(PXPeoplePagingSuggestionProvider *)self unvisitedSuggestions];
  v8 = [v7 firstObject];
  unint64_t v9 = [v8 count];
  if ([v5 count])
  {
    v10 = [v6 lastObject];
    id v11 = (void *)[v5 mutableCopy];
    if (v10)
    {
      [v10 addObject:v11];
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v12 addObject:v11];
      [v6 addObject:v12];
    }
    [(PXPeoplePagingSuggestionProvider *)self setCurrentSuggestions:MEMORY[0x1E4F1CBF0]];
  }
  if (!v8 || v9)
  {
    if (v9) {
      goto LABEL_11;
    }
    uint64_t v13 = 0;
LABEL_15:
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_16;
  }
  [v7 removeObjectAtIndex:0];
  uint64_t v13 = [v7 firstObject];

  unint64_t v9 = [v13 count];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObject:v14];

  if (!v9) {
    goto LABEL_15;
  }
  v8 = v13;
LABEL_11:
  if (v9 >= a3) {
    unint64_t v9 = a3;
  }
  uint64_t v15 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);
  objc_msgSend(v8, "removeObjectsInRange:", 0, v9);
  [(PXPeoplePagingSuggestionProvider *)self setCurrentSuggestions:v15];
  uint64_t v13 = v8;
LABEL_16:

  return v15;
}

- (id)previousSuggestions
{
  if ([(PXPeoplePagingSuggestionProvider *)self hasPreviousSuggestions])
  {
    v3 = [(PXPeoplePagingSuggestionProvider *)self visitedSuggestions];
    id v4 = [(PXPeoplePagingSuggestionProvider *)self unvisitedSuggestions];
    v5 = [(PXPeoplePagingSuggestionProvider *)self currentSuggestions];
    id v6 = [v3 lastObject];
    uint64_t v7 = [v6 count];
    if (!v7)
    {
      [v3 removeLastObject];
      [v4 removeAllObjects];
      uint64_t v8 = [v3 lastObject];

      v5 = 0;
      id v6 = (void *)v8;
    }
    unint64_t v9 = [v6 lastObject];
    [v6 removeObject:v9];
    uint64_t v10 = [v5 count];
    if (v7)
    {
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = [v4 firstObject];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 insertObject:v12 atIndex:0];
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v11);
        [v12 insertObjects:v5 atIndexes:v13];
      }
    }
    id v14 = (void *)[v9 copy];

    [(PXPeoplePagingSuggestionProvider *)self setCurrentSuggestions:v14];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v14;
}

- (BOOL)hasPreviousSuggestions
{
  v2 = [(PXPeoplePagingSuggestionProvider *)self visitedSuggestions];
  v3 = [v2 lastObject];
  id v4 = [v3 lastObject];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v6 = [v2 count];
    if (v6 < 2)
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v7 = [v2 objectAtIndexedSubscript:v6 - 2];

      BOOL v5 = [v7 count] != 0;
      id v4 = v7;
    }
  }

  return v5;
}

- (BOOL)hasNextSuggestions
{
  v2 = [(PXPeoplePagingSuggestionProvider *)self unvisitedSuggestions];
  v3 = [v2 firstObject];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else if ((unint64_t)[v2 count] < 2)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v5 = [v2 objectAtIndexedSubscript:1];

    BOOL v4 = [v5 count] != 0;
    v3 = v5;
  }

  return v4;
}

- (PXPeoplePagingSuggestionProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXPeoplePagingSuggestionProvider;
  v2 = [(PXPeoplePagingSuggestionProvider *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unvisitedSuggestions = v2->_unvisitedSuggestions;
    v2->_unvisitedSuggestions = v3;

    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visitedSuggestions = v2->_visitedSuggestions;
    v2->_visitedSuggestions = v5;
  }
  return v2;
}

@end