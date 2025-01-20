@interface SearchBarSearchResults
- (NSArray)resultSets;
- (SearchBarSearchResults)init;
- (id)copy;
- (id)filteredResultsWithBackfill:(int64_t)a3;
- (void)addResultSet:(id)a3 withMaxCount:(unint64_t)a4;
- (void)setResultSets:(id)a3;
@end

@implementation SearchBarSearchResults

- (SearchBarSearchResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchBarSearchResults;
  v2 = [(SearchBarSearchResults *)&v6 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init((Class)NSArray);
    resultSets = v2->_resultSets;
    v2->_resultSets = v3;
  }
  return v2;
}

- (id)filteredResultsWithBackfill:(int64_t)a3
{
  if (self->_resultSets)
  {
    id v39 = objc_alloc_init((Class)NSMutableArray);
    NSUInteger v5 = [(NSArray *)self->_resultSets count];
    v35[1] = v35;
    v36 = (char *)&v35[-2 * v5];
    bzero(v36, 16 * v5);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v35[0] = self;
    objc_super v6 = self->_resultSets;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v7)
    {
      id v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v48;
      v37 = v36 + 8;
      do
      {
        v11 = 0;
        v38 = v9;
        v12 = &v37[16 * (void)v9];
        do
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v11);
          v14 = [v13 results];
          v15 = (char *)[v14 count];

          v16 = (char *)[v13 count];
          if (v15 >= v16) {
            v17 = v16;
          }
          else {
            v17 = v15;
          }
          *((void *)v12 - 1) = v17;
          *(void *)v12 = v15 - v17;
          v12 += 16;
          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
        v9 = (char *)v11 + (void)v38;
      }
      while (v8);
    }

    uint64_t v18 = v35[0];
    if (a3 >= 1)
    {
      v19 = v36 + 8;
      do
      {
        if (![*(id *)(v18 + 8) count]) {
          break;
        }
        unint64_t v20 = 0;
        char v21 = 1;
        v22 = (uint64_t *)v19;
        do
        {
          uint64_t v23 = *v22;
          if (*v22) {
            BOOL v24 = a3 < 1;
          }
          else {
            BOOL v24 = 1;
          }
          if (!v24)
          {
            char v21 = 0;
            ++*(v22 - 1);
            uint64_t *v22 = v23 - 1;
            --a3;
          }
          ++v20;
          v22 += 2;
        }
        while (v20 < (unint64_t)[*(id *)(v18 + 8) count]);
      }
      while ((v21 & 1) == 0 && a3 >= 1);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v38 = (char *)*(id *)(v18 + 8);
    id v25 = [v38 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v25)
    {
      id v26 = v25;
      v27 = 0;
      uint64_t v28 = *(void *)v44;
      do
      {
        v29 = 0;
        v37 = v27;
        v30 = &v36[16 * (void)v27];
        do
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v38);
          }
          uint64_t v31 = *(void *)v30;
          v30 += 16;
          v32 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)v29) results];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10049C600;
          v40[3] = &unk_1012EBE48;
          uint64_t v42 = v31;
          id v41 = v39;
          [v32 enumerateObjectsUsingBlock:v40];

          v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        id v26 = [v38 countByEnumeratingWithState:&v43 objects:v51 count:16];
        v27 = (char *)v29 + (void)v37;
      }
      while (v26);
    }
  }
  else
  {
    id v39 = 0;
  }
  id v33 = v39;

  return v33;
}

- (void)addResultSet:(id)a3 withMaxCount:(unint64_t)a4
{
  resultSets = self->_resultSets;
  id v7 = a3;
  id v11 = +[NSMutableArray arrayWithArray:resultSets];
  id v8 = [[SearchBarSearchResultSet alloc] initWithResults:v7 maxCount:a4];

  [v11 addObject:v8];
  v9 = (NSArray *)[v11 copy];
  uint64_t v10 = self->_resultSets;
  self->_resultSets = v9;
}

- (id)copy
{
  v3 = objc_alloc_init(SearchBarSearchResults);
  [(SearchBarSearchResults *)v3 setResultSets:self->_resultSets];
  return v3;
}

- (NSArray)resultSets
{
  return self->_resultSets;
}

- (void)setResultSets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end