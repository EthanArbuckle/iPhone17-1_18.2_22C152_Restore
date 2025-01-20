@interface PSIGroupAggregate
- (BOOL)_verifySortedGroupIdsUnique;
- (BOOL)pushGroup:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4;
- (NSArray)searchTokens;
- (NSString)transientToken;
- (PSIGroup)filenameGroupInAggregate;
- (PSIGroupAggregate)initWithSearchTokens:(id)a3 groupResultsQueue:(id)a4;
- (_NSRange)_rangeOfString:(id)a3 inGroup:(id)a4 useNormalizedString:(BOOL)a5 extendingSearchRange:(BOOL)a6 matchingFullToken:(BOOL)a7 excludingRanges:(id)a8;
- (__CFArray)_newSortedGroupIds;
- (id)aggregateItemWithSearchToken:(id)a3 rangeMatchingToken:(id)a4 group:(id)a5;
- (id)newGroupResult;
- (id)newGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4;
- (void)pop;
- (void)setTransientToken:(id)a3;
@end

@implementation PSIGroupAggregate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameGroupInAggregate, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_groupResultsQueue, 0);
  objc_storeStrong((id *)&self->_aggregateItemPool, 0);
  objc_storeStrong((id *)&self->_aggregatedGroupIds, 0);
  objc_storeStrong((id *)&self->_groupAggregateItems, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
}

- (PSIGroup)filenameGroupInAggregate
{
  return self->_filenameGroupInAggregate;
}

- (void)setTransientToken:(id)a3
{
}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (id)newGroupResult
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_groupAggregateItems count];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([(PSIGroupAggregate *)self _verifySortedGroupIdsUnique])
    {
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v41 = self;
      obuint64_t j = self->_groupAggregateItems;
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v44 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v52 != v44) {
              objc_enumerationMutation(obj);
            }
            v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v10 = objc_msgSend(v9, "group", v41);
            v11 = [v9 rangeMatchingToken];
            uint64_t v12 = [v5 count];
            uint64_t v13 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, v12, 1280, &__block_literal_global_110268);
            if (v13 == v12
              || ([v5 objectAtIndex:v13],
                  v14 = objc_claimAutoreleasedReturnValue(),
                  char v15 = [v10 isEqual:v14],
                  v14,
                  (v15 & 1) == 0))
            {
              [v5 insertObject:v10 atIndex:v13];
              v17 = [PSIGroupResultGroupSnapshot alloc];
              v18 = [v9 searchToken];
              v16 = [(PSIGroupResultGroupSnapshot *)v17 initWithGroup:v10 token:v18];

              [v46 insertObject:v16 atIndex:v13];
              if (!v11) {
                goto LABEL_14;
              }
LABEL_13:
              [(PSIGroupResultGroupSnapshot *)v16 addMatchRange:v11];
              goto LABEL_14;
            }
            v16 = [v46 objectAtIndexedSubscript:v13];
            if (v11) {
              goto LABEL_13;
            }
LABEL_14:
            v19 = [v9 searchToken];
            [(PSIGroupResultGroupSnapshot *)v16 addToken:v19];
          }
          uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v7);
      }

      v20 = v41;
      v21 = [(NSMutableArray *)v41->_groupAggregateItems lastObject];
      v22 = [v21 assetIds];

      v23 = [v21 collectionIds];

      v24 = [[PSIGroupResult alloc] initWithQueue:v41->_groupResultsQueue];
      [(PSIGroupResult *)v24 setGroups:v46];
      [(PSIGroupResult *)v24 setAssetIds:v22];
      [(PSIGroupResult *)v24 setCollectionIds:v23];
      if ([(NSMutableArray *)v41->_groupAggregateItems count] == 1
        && ([v21 group],
            v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = PLSearchIndexCategoryIsMutuallyExclusive((int)[v25 category]),
            v25,
            v26))
      {
        v27 = [v21 group];
        -[PSIGroupResult setDedupingSkippedCategory:](v24, "setDedupingSkippedCategory:", [v27 category]);
      }
      else
      {
        if (![(PSIGroupResult *)v24 containsFilterSearchTokens])
        {
LABEL_38:

          return v24;
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v28 = v20->_groupAggregateItems;
        uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          id obja = v21;
          v45 = v24;
          uint64_t v31 = 0;
          v27 = 0;
          uint64_t v32 = *(void *)v48;
          while (2)
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v48 != v32) {
                objc_enumerationMutation(v28);
              }
              v34 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              v35 = [v34 searchToken];
              char v36 = [v35 isFilterTypeToken];

              if ((v36 & 1) == 0)
              {
                id v37 = v34;

                if (v31)
                {

                  v27 = 0;
                  v21 = obja;
                  v24 = v45;
                  goto LABEL_36;
                }
                v27 = v37;
                uint64_t v31 = 1;
              }
            }
            uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v30) {
              continue;
            }
            break;
          }

          v24 = v45;
          if (!v27)
          {
            v21 = obja;
            goto LABEL_37;
          }
          v38 = [v27 group];
          int IsMutuallyExclusive = PLSearchIndexCategoryIsMutuallyExclusive((int)[v38 category]);

          v21 = obja;
          if (!IsMutuallyExclusive) {
            goto LABEL_37;
          }
          v28 = [v27 group];
          [(PSIGroupResult *)v45 setDedupingSkippedCategory:[(NSMutableArray *)v28 category]];
        }
        else
        {
          v27 = 0;
        }
LABEL_36:
      }
LABEL_37:

      goto LABEL_38;
    }
  }
  return 0;
}

uint64_t __35__PSIGroupAggregate_newGroupResult__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareToGroup:");
}

- (id)newGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSIGroupAggregate *)self newGroupResult];
  if (v6)
  {
    v9 = [[PSIGroupResultGroupSnapshot alloc] initWithDateFilter:v6 datedTokens:v7];
    v10 = [v8 groups];
    v11 = [v10 arrayByAddingObject:v9];
    [v8 setGroups:v11];
  }
  return v8;
}

- (__CFArray)_newSortedGroupIds
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFIndex v4 = [(NSMutableArray *)self->_groupAggregateItems count];
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PSIGroupAggregate.m" lineNumber:338 description:@"expect nonempty aggregate"];
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_groupAggregateItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "group", (void)v14);
        CFArrayAppendValue(Mutable, (const void *)[v11 groupId]);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v20.location = 0;
  v20.length = v4;
  CFArraySortValues(Mutable, v20, (CFComparatorFunction)PSIRowIDCompare_110276, 0);
  return Mutable;
}

- (BOOL)_verifySortedGroupIdsUnique
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  uint64_t v3 = [(PSIGroupAggregate *)self _newSortedGroupIds];
  uint64_t v4 = [(NSMutableArray *)self->_aggregatedGroupIds count];
  aggregatedGroupIds = self->_aggregatedGroupIds;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PSIGroupAggregate__verifySortedGroupIdsUnique__block_invoke;
  v9[3] = &unk_1E58745F0;
  v9[4] = &v10;
  uint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](aggregatedGroupIds, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, v4, 1280, v9);
  if (*((unsigned char *)v11 + 24)) {
    [(NSMutableArray *)self->_aggregatedGroupIds insertObject:v3 atIndex:v6];
  }
  CFRelease(v3);
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __48__PSIGroupAggregate__verifySortedGroupIdsUnique__block_invoke(uint64_t a1, void *a2, void *a3)
{
  CFArrayRef v6 = a2;
  CFArrayRef v7 = a3;
  CFIndex Count = CFArrayGetCount(v6);
  CFIndex v9 = CFArrayGetCount(v7);
  if (Count >= v9)
  {
    if (Count <= v9)
    {
      if (Count < 1)
      {
LABEL_15:
        uint64_t v3 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      else
      {
        CFIndex v10 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
          uint64_t v12 = CFArrayGetValueAtIndex(v7, v10);
          uint64_t v13 = ValueAtIndex > v12 ? 1 : v3;
          uint64_t v3 = ValueAtIndex < v12 ? -1 : v13;
          if (ValueAtIndex != v12) {
            break;
          }
          if (Count == ++v10) {
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = -1;
  }

  return v3;
}

- (id)aggregateItemWithSearchToken:(id)a3 rangeMatchingToken:(id)a4 group:(id)a5
{
  aggregateItemPool = self->_aggregateItemPool;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(NSMutableArray *)aggregateItemPool lastObject];
  if (v12)
  {
    uint64_t v13 = (PSIGroupAggregateItem *)v12;
    [(NSMutableArray *)self->_aggregateItemPool removeLastObject];
  }
  else
  {
    uint64_t v13 = objc_alloc_init(PSIGroupAggregateItem);
  }
  [(PSIGroupAggregateItem *)v13 setSearchToken:v11];

  [(PSIGroupAggregateItem *)v13 setRangeMatchingToken:v10];
  [(PSIGroupAggregateItem *)v13 setGroup:v9];

  return v13;
}

- (void)pop
{
  id v6 = [(NSMutableArray *)self->_groupAggregateItems lastObject];
  uint64_t v3 = [v6 group];
  if ([v3 category] == 2100)
  {
    unint64_t v4 = self->_filenameGroupCount - 1;
    self->_filenameGroupCFIndex Count = v4;
    if (!v4)
    {
      filenameGroupInAggregate = self->_filenameGroupInAggregate;
      self->_filenameGroupInAggregate = 0;
    }
  }
  [v6 reset];
  [(NSMutableArray *)self->_aggregateItemPool addObject:v6];
  [(NSMutableArray *)self->_groupAggregateItems removeLastObject];
}

- (BOOL)pushGroup:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [(NSMutableArray *)self->_groupAggregateItems count];
  if (v8 >= [(NSArray *)self->_searchTokens count])
  {
    long long v16 = PLSearchIndexGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v17 = [(NSArray *)self->_searchTokens count];
      *(_DWORD *)buf = 134218240;
      unint64_t v190 = v8;
      __int16 v191 = 2048;
      NSUInteger v192 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "groupAggregateItemCount(%lu) is greater than or equal to the number of tokens(%lu)", buf, 0x16u);
    }
    BOOL v18 = 0;
    goto LABEL_338;
  }
  BOOL v164 = a4;
  id v9 = [(NSMutableArray *)self->_groupAggregateItems lastObject];
  CFArrayRef v10 = [v9 assetIds];

  CFArrayRef v181 = [v9 collectionIds];

  uint64_t v11 = [v7 assetIds];
  uint64_t v12 = [v7 collectionIds];
  uint64_t v13 = [(NSArray *)self->_searchTokens objectAtIndexedSubscript:v8];
  long long v14 = [v13 wordEmbeddingMatch];

  CFArrayRef v166 = (CFArrayRef)v14;
  if (v14)
  {
    id v15 = [v13 wordEmbeddingMatch];
    id v177 = [v15 word];
  }
  else
  {
    id v15 = [v13 normalizedText];
    id v177 = v15;
  }

  v174 = v9;
  id v175 = v7;
  CFArrayRef v172 = (const __CFArray *)v12;
  CFArrayRef v173 = (const __CFArray *)v11;
  CFArrayRef theArray = v10;
  v176 = v13;
  obuint64_t j = a3;
  if (!v8)
  {
    CFIndex v33 = 0;
    CFIndex v34 = 0;
    CFIndex v35 = 0;
    CFArrayRef v178 = 0;
    v23 = 0;
    int v37 = 0;
    int v36 = 1;
    goto LABEL_177;
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  uint64_t v19 = self->_groupAggregateItems;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v184 objects:v188 count:16];
  if (!v20)
  {

    goto LABEL_28;
  }
  uint64_t v21 = v20;
  v22 = v19;
  v168 = self;
  v23 = 0;
  uint64_t v24 = *(void *)v185;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v185 != v24) {
        objc_enumerationMutation(v22);
      }
      int v26 = *(void **)(*((void *)&v184 + 1) + 8 * i);
      v27 = [v26 group];
      uint64_t v28 = [v27 groupId];
      uint64_t v29 = [v7 groupId];

      if (v28 == v29)
      {
        uint64_t v30 = [v26 rangeMatchingToken];
        if (!v30)
        {
          BOOL v18 = 0;
LABEL_336:

          goto LABEL_337;
        }
        uint64_t v31 = (void *)v30;
        if (v23) {
          id v32 = v23;
        }
        else {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        v23 = v32;

        [v23 addObject:v31];
      }
    }
    uint64_t v21 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v184 objects:v188 count:16];
  }
  while (v21);

  self = v168;
  CFArrayRef v10 = theArray;
  if (v23)
  {
    if ([v177 length])
    {
      CFIndex v33 = 0;
      CFIndex v34 = 0;
      CFIndex v35 = 0;
      CFArrayRef v178 = 0;
      int v36 = 1;
      int v37 = 1;
      goto LABEL_177;
    }
    goto LABEL_190;
  }
LABEL_28:
  if (v10) {
    CFIndex Count = CFArrayGetCount(v10);
  }
  else {
    CFIndex Count = 0;
  }
  if (!v173)
  {
    CFIndex v33 = 0;
    CFIndex v34 = 0;
    int v40 = 0;
    goto LABEL_102;
  }
  CFIndex v39 = CFArrayGetCount(v173);
  int v40 = 0;
  CFIndex v33 = 0;
  if (!Count)
  {
    CFIndex v34 = 0;
    goto LABEL_102;
  }
  uint64_t v41 = v39;
  CFIndex v34 = 0;
  if (!v39) {
    goto LABEL_102;
  }
  CFIndex v42 = 0;
  int v40 = 0;
  CFIndex v43 = 0;
  if (Count < 1)
  {
    CFArrayRef v179 = v10;
    goto LABEL_95;
  }
  CFArrayRef v179 = v10;
  if (v39 < 1) {
    goto LABEL_95;
  }
  uint64_t v44 = 0;
  v45 = 0;
  uint64_t v46 = 0;
  CFIndex v43 = 0;
  CFIndex v42 = 0;
  char v47 = 1;
  CFArrayRef v179 = v10;
  CFArrayRef v48 = v173;
  v169 = self;
  while (2)
  {
    if ((v47 & 1) == 0)
    {
      if (v46)
      {
        CFArrayRef v60 = v48;
        v58 = v45;
        CFIndex v57 = v42;
        uint64_t v56 = Count;
        CFArrayRef v59 = v179;
        goto LABEL_64;
      }
      if (!v45 || !v44) {
        goto LABEL_353;
      }
      goto LABEL_347;
    }
    if (!v45)
    {
      CFArrayRef v49 = v48;
      CFIndex v50 = v42;
      ValueAtIndex = CFArrayGetValueAtIndex(v179, v42);
      CFIndex v42 = v50;
      v45 = ValueAtIndex;
      CFArrayRef v48 = v49;
    }
    if (!v44)
    {
      CFArrayRef v52 = v48;
      CFIndex v53 = v42;
      long long v54 = CFArrayGetValueAtIndex(v48, v43);
      CFIndex v42 = v53;
      uint64_t v44 = v54;
      CFArrayRef v48 = v52;
    }
    BOOL v55 = v44 >= v45;
    if (v44 < v45) {
      uint64_t v56 = v41;
    }
    else {
      uint64_t v56 = Count;
    }
    if (v44 >= v45)
    {
      CFIndex v57 = v42;
    }
    else
    {
      uint64_t v41 = Count;
      CFIndex v57 = v43;
    }
    if (v44 >= v45)
    {
      v58 = v45;
    }
    else
    {
      CFIndex v43 = v42;
      v58 = v44;
    }
    if (v44 < v45) {
      uint64_t v44 = v45;
    }
    CFArrayRef v59 = v179;
    if (v55) {
      CFArrayRef v60 = v48;
    }
    else {
      CFArrayRef v60 = v179;
    }
    if (!v55) {
      CFArrayRef v59 = v48;
    }
    if (v44 < v58) {
      goto LABEL_343;
    }
    if (v56 < 9 || (unint64_t v61 = v44 - v58, log((double)v56) >= (double)v61))
    {
      uint64_t v46 = 8;
LABEL_64:
      char v47 = 1;
      CFArrayRef v179 = v59;
      if (v57 >= v56) {
        goto LABEL_79;
      }
LABEL_65:
      if (v43 >= v41) {
        goto LABEL_79;
      }
      if (!v46)
      {
        uint64_t v46 = -1;
        char v47 = 1;
LABEL_79:
        CFArrayRef v48 = v60;
        CFIndex Count = v56;
        CFIndex v42 = v57;
        v45 = v58;
        id v7 = v175;
        CFArrayRef v10 = theArray;
LABEL_80:
        int v40 = 0;
        self = v169;
        if (v42 >= Count || v43 >= v41) {
          goto LABEL_95;
        }
        continue;
      }
      if (v58)
      {
        if (v44)
        {
LABEL_69:
          if (v58 >= v44)
          {
            if (v58 <= v44)
            {
              int v40 = 1;
              goto LABEL_93;
            }
            uint64_t v44 = 0;
            ++v43;
          }
          else
          {
            v58 = 0;
            ++v57;
          }
          --v46;
          char v47 = 1;
          if (v57 >= v56) {
            goto LABEL_79;
          }
          goto LABEL_65;
        }
      }
      else
      {
        v58 = CFArrayGetValueAtIndex(v59, v57);
        if (v44) {
          goto LABEL_69;
        }
      }
      uint64_t v44 = CFArrayGetValueAtIndex(v60, v43);
      goto LABEL_69;
    }
    break;
  }
  if (!v58 || !v44) {
    goto LABEL_353;
  }
  v194.length = v56 - v57;
  v194.location = v57;
  CFIndex v62 = CFArrayBSearchValues(v59, v194, v44, (CFComparatorFunction)PSIRowIDCompare_110276, 0);
  CFArrayRef v179 = v59;
  if (v62 < v56)
  {
    CFIndex v160 = v62;
    v63 = CFArrayGetValueAtIndex(v59, v62);
    id v7 = v175;
    if (v44 == v63)
    {
      char v47 = 0;
      CFArrayRef v48 = v60;
      CFIndex Count = v56;
      uint64_t v46 = 8;
      v45 = v44;
      CFArrayRef v10 = theArray;
    }
    else
    {
      v45 = v63;
      CFArrayRef v10 = theArray;
      if (v44 >= v63) {
        goto LABEL_344;
      }
      uint64_t v46 = 0;
      char v47 = 1;
      CFArrayRef v48 = v60;
      CFIndex Count = v56;
    }
    CFIndex v42 = v160;
    goto LABEL_80;
  }
  int v40 = 0;
LABEL_93:
  CFIndex v42 = v57;
  id v7 = v175;
  self = v169;
  CFArrayRef v10 = theArray;
LABEL_95:
  if (v179 == v10) {
    CFIndex v64 = v42;
  }
  else {
    CFIndex v64 = v43;
  }
  if (v179 == v10) {
    CFIndex v34 = v43;
  }
  else {
    CFIndex v34 = v42;
  }
  CFIndex v33 = v64;
LABEL_102:
  int idx = v40;
  if (v181) {
    CFIndex v65 = CFArrayGetCount(v181);
  }
  else {
    CFIndex v65 = 0;
  }
  if (!v172)
  {
    CFIndex v35 = 0;
    CFArrayRef v178 = 0;
    int v67 = 0;
    goto LABEL_176;
  }
  CFIndex v66 = CFArrayGetCount(v172);
  int v67 = 0;
  CFIndex v35 = 0;
  if (!v65)
  {
    CFArrayRef v178 = 0;
    goto LABEL_176;
  }
  uint64_t v68 = v66;
  CFArrayRef v178 = 0;
  if (!v66) {
    goto LABEL_176;
  }
  CFIndex v157 = v34;
  CFIndex v161 = v33;
  CFIndex v69 = 0;
  int v67 = 0;
  CFIndex v70 = 0;
  if (v65 < 1)
  {
    CFArrayRef v180 = v181;
    goto LABEL_169;
  }
  CFArrayRef v180 = v181;
  if (v66 < 1) {
    goto LABEL_169;
  }
  v71 = 0;
  v72 = 0;
  uint64_t v73 = 0;
  CFIndex v70 = 0;
  CFIndex v69 = 0;
  char v74 = 1;
  CFArrayRef v180 = v181;
  CFArrayRef v75 = v172;
  v170 = self;
  while (2)
  {
    if ((v74 & 1) == 0)
    {
      if (v73)
      {
        CFArrayRef v87 = v75;
        v85 = v72;
        CFIndex v84 = v69;
        uint64_t v83 = v65;
        CFArrayRef v86 = v180;
        goto LABEL_138;
      }
      if (!v72 || !v71) {
        goto LABEL_353;
      }
LABEL_347:
      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
    }
    if (!v72)
    {
      CFArrayRef v76 = v75;
      CFIndex v77 = v69;
      v78 = CFArrayGetValueAtIndex(v180, v69);
      CFIndex v69 = v77;
      v72 = v78;
      CFArrayRef v75 = v76;
    }
    if (!v71)
    {
      CFArrayRef v79 = v75;
      CFIndex v80 = v69;
      v81 = CFArrayGetValueAtIndex(v75, v70);
      CFIndex v69 = v80;
      v71 = v81;
      CFArrayRef v75 = v79;
    }
    BOOL v82 = v71 >= v72;
    if (v71 < v72) {
      uint64_t v83 = v68;
    }
    else {
      uint64_t v83 = v65;
    }
    if (v71 >= v72)
    {
      CFIndex v84 = v69;
    }
    else
    {
      uint64_t v68 = v65;
      CFIndex v84 = v70;
    }
    if (v71 >= v72)
    {
      v85 = v72;
    }
    else
    {
      CFIndex v70 = v69;
      v85 = v71;
    }
    if (v71 < v72) {
      v71 = v72;
    }
    CFArrayRef v86 = v180;
    if (v82) {
      CFArrayRef v87 = v75;
    }
    else {
      CFArrayRef v87 = v180;
    }
    if (!v82) {
      CFArrayRef v86 = v75;
    }
    if (v71 < v85) {
      goto LABEL_343;
    }
    if (v83 >= 9)
    {
      unint64_t v88 = v71 - v85;
      if (log((double)v83) < (double)v88)
      {
        if (v85 && v71)
        {
          v195.length = v83 - v84;
          v195.location = v84;
          CFIndex v89 = CFArrayBSearchValues(v86, v195, v71, (CFComparatorFunction)PSIRowIDCompare_110276, 0);
          CFArrayRef v180 = v86;
          if (v89 >= v83)
          {
            int v67 = 0;
LABEL_167:
            CFIndex v69 = v84;
            id v7 = v175;
            self = v170;
            break;
          }
          CFAllocatorRef allocator = (CFAllocatorRef)v89;
          v90 = CFArrayGetValueAtIndex(v86, v89);
          id v7 = v175;
          if (v71 == v90)
          {
            char v74 = 0;
            CFArrayRef v75 = v87;
            CFIndex v65 = v83;
            uint64_t v73 = 8;
            v72 = v71;
            self = v170;
LABEL_164:
            CFIndex v69 = (CFIndex)allocator;
            goto LABEL_154;
          }
          v72 = v90;
          self = v170;
          if (v71 < v90)
          {
            uint64_t v73 = 0;
            char v74 = 1;
            CFArrayRef v75 = v87;
            CFIndex v65 = v83;
            goto LABEL_164;
          }
LABEL_344:
          __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
        }
LABEL_353:
        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
      }
    }
    uint64_t v73 = 8;
LABEL_138:
    char v74 = 1;
    CFArrayRef v180 = v86;
    if (v84 >= v83) {
      goto LABEL_153;
    }
    while (2)
    {
      if (v70 >= v68) {
        goto LABEL_153;
      }
      if (v73)
      {
        if (v85)
        {
          if (v71)
          {
LABEL_143:
            if (v85 >= v71)
            {
              if (v85 <= v71)
              {
                int v67 = 1;
                goto LABEL_167;
              }
              v71 = 0;
              ++v70;
            }
            else
            {
              v85 = 0;
              ++v84;
            }
            --v73;
            char v74 = 1;
            if (v84 >= v83) {
              goto LABEL_153;
            }
            continue;
          }
        }
        else
        {
          v85 = CFArrayGetValueAtIndex(v86, v84);
          if (v71) {
            goto LABEL_143;
          }
        }
        v71 = CFArrayGetValueAtIndex(v87, v70);
        goto LABEL_143;
      }
      break;
    }
    uint64_t v73 = -1;
    char v74 = 1;
LABEL_153:
    CFArrayRef v75 = v87;
    CFIndex v65 = v83;
    CFIndex v69 = v84;
    v72 = v85;
    id v7 = v175;
    self = v170;
LABEL_154:
    int v67 = 0;
    if (v69 < v65 && v70 < v68) {
      continue;
    }
    break;
  }
LABEL_169:
  if (v180 == v181) {
    CFIndex v35 = v69;
  }
  else {
    CFIndex v35 = v70;
  }
  if (v180 == v181) {
    CFArrayRef v91 = (const __CFArray *)v70;
  }
  else {
    CFArrayRef v91 = (const __CFArray *)v69;
  }
  CFArrayRef v178 = v91;
  CFIndex v34 = v157;
  CFIndex v33 = v161;
LABEL_176:
  v23 = 0;
  int v36 = 0;
  int v37 = 0;
  BOOL v18 = 0;
  if ((idx | v67) != 1) {
    goto LABEL_337;
  }
LABEL_177:
  CFIndex idxa = v35;
  CFIndex v162 = v33;
  if (![v177 length])
  {
    uint64_t v94 = 0;
LABEL_196:
    v165 = (NSMutableArray *)v94;
    v103 = [(PSIGroupAggregate *)self aggregateItemWithSearchToken:v176 rangeMatchingToken:v94 group:v7];
    if ((v37 | v36))
    {
      if (v37) {
        CFArrayRef v104 = v181;
      }
      else {
        CFArrayRef v104 = v172;
      }
      if (v37) {
        CFArrayRef v105 = theArray;
      }
      else {
        CFArrayRef v105 = v173;
      }
      CFTypeRef v106 = CFRetain(v105);
      CFTypeRef v107 = CFRetain(v104);
      goto LABEL_331;
    }
    CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    v171 = self;
    CFArrayRef v108 = v173;
    v159 = v103;
    CFIndex v109 = v34;
    if (theArray) {
      CFIndex v110 = CFArrayGetCount(theArray);
    }
    else {
      CFIndex v110 = 0;
    }
    CFIndex v111 = v162;
    if (v173)
    {
      CFIndex v112 = CFArrayGetCount(v173);
      if (v110)
      {
        CFIndex v113 = v112;
        if (v112)
        {
          if (v162 < v110 && v34 < v112)
          {
            v114 = 0;
            v115 = 0;
            char v116 = 0;
            uint64_t v117 = 8;
            while ((v116 & 1) != 0)
            {
              CFArrayRef v118 = theArray;
              if (!v115) {
                v115 = CFArrayGetValueAtIndex(theArray, v111);
              }
              if (!v114) {
                v114 = CFArrayGetValueAtIndex(v108, v109);
              }
              BOOL v119 = v114 >= v115;
              CFIndex v120 = v110;
              if (v114 < v115)
              {
                CFIndex v110 = v113;
                CFIndex v113 = v120;
              }
              CFIndex v121 = v111;
              if (v114 >= v115)
              {
                v122 = v115;
              }
              else
              {
                CFIndex v111 = v109;
                CFIndex v109 = v121;
                v122 = v114;
              }
              if (v114 < v115) {
                v114 = v115;
              }
              CFArrayRef v123 = v108;
              if (!v119)
              {
                CFArrayRef v108 = theArray;
                CFArrayRef v118 = v123;
              }
              if (v114 < v122) {
                goto LABEL_343;
              }
              CFIndex v125 = v109;
              CFArrayRef theArray = v118;
              if (v110 < 9 || (unint64_t v124 = (unsigned char *)v114 - (unsigned char *)v122, log((double)v110) >= (double)v124))
              {
                uint64_t v117 = 8;
LABEL_233:
                char v116 = 1;
                while (v111 < v110)
                {
                  if (v125 >= v113) {
                    break;
                  }
                  if (!v117)
                  {
                    CFIndex v109 = v125;
                    uint64_t v117 = -1;
                    char v116 = 1;
                    goto LABEL_251;
                  }
                  if (v122)
                  {
                    if (v114) {
                      goto LABEL_238;
                    }
                  }
                  else
                  {
                    v122 = CFArrayGetValueAtIndex(theArray, v111);
                    if (v114) {
                      goto LABEL_238;
                    }
                  }
                  v114 = CFArrayGetValueAtIndex(v108, v125);
LABEL_238:
                  if (v122 >= v114)
                  {
                    if (v122 <= v114)
                    {
                      if (Mutable) {
                        CFArrayGetCount(Mutable);
                      }
                      CFArrayAppendValue(Mutable, v122);
                      v122 = 0;
                      v114 = 0;
                      ++v111;
                      ++v125;
                      goto LABEL_248;
                    }
                    v114 = 0;
                    ++v125;
                  }
                  else
                  {
                    v122 = 0;
                    ++v111;
                  }
                  --v117;
LABEL_248:
                  char v116 = 1;
                }
                CFIndex v109 = v125;
LABEL_251:
                v115 = v122;
                goto LABEL_252;
              }
              if (!v122 || !v114) {
                goto LABEL_353;
              }
              v196.length = v110 - v111;
              v196.location = v111;
              CFIndex v126 = CFArrayBSearchValues(v118, v196, v114, (CFComparatorFunction)PSIRowIDCompare_110276, 0);
              if (v126 >= v110) {
                goto LABEL_262;
              }
              CFIndex v111 = v126;
              v127 = CFArrayGetValueAtIndex(v118, v126);
              if (v114 == v127)
              {
                char v116 = 0;
                uint64_t v117 = 8;
                v115 = v114;
              }
              else
              {
                v115 = v127;
                if (v114 >= v127) {
                  goto LABEL_344;
                }
                uint64_t v117 = 0;
                char v116 = 1;
              }
LABEL_252:
              if (v111 >= v110 || v109 >= v113) {
                goto LABEL_262;
              }
            }
            if (!v117)
            {
LABEL_345:
              if (!v115 || !v114) {
                goto LABEL_353;
              }
              goto LABEL_347;
            }
            v122 = v115;
            CFIndex v125 = v109;
            goto LABEL_233;
          }
        }
      }
    }
LABEL_262:
    CFArrayRef theArraya = CFArrayCreateMutable(allocatora, 0, 0);
    if (v181) {
      CFIndex v128 = CFArrayGetCount(v181);
    }
    else {
      CFIndex v128 = 0;
    }
    self = v171;
    CFArrayRef v129 = v172;
    v103 = v159;
    if (!v172
      || (CFIndex v130 = CFArrayGetCount(v172), !v128)
      || (uint64_t v131 = v130) == 0
      || (CFIndex v132 = idxa, idxa >= v128)
      || (uint64_t)v178 >= v130)
    {
      id v7 = v175;
LABEL_330:
      CFTypeRef v106 = Mutable;
      CFTypeRef v107 = theArraya;
LABEL_331:
      [v103 setAssetIds:v106];
      CFRelease(v106);
      [v103 setCollectionIds:v107];
      CFRelease(v107);
      [(NSMutableArray *)self->_groupAggregateItems addObject:v103];
      if ([v7 category] == 2100)
      {
        filenameGroupCFIndex Count = self->_filenameGroupCount;
        if (!filenameGroupCount)
        {
          objc_storeStrong((id *)&self->_filenameGroupInAggregate, obj);
          filenameGroupCFIndex Count = self->_filenameGroupCount;
        }
        self->_filenameGroupCFIndex Count = filenameGroupCount + 1;
      }

      BOOL v18 = 1;
      v22 = v165;
      goto LABEL_336;
    }
    v114 = 0;
    v115 = 0;
    char v133 = 0;
    uint64_t v134 = 8;
    while ((v133 & 1) != 0)
    {
      if (!v115)
      {
        CFIndex v135 = v132;
        v136 = CFArrayGetValueAtIndex(v181, v132);
        CFIndex v132 = v135;
        v115 = v136;
      }
      if (!v114)
      {
        CFIndex v137 = v132;
        v138 = CFArrayGetValueAtIndex(v129, (CFIndex)v178);
        CFIndex v132 = v137;
        v114 = v138;
      }
      BOOL v139 = v114 >= v115;
      if (v114 < v115) {
        uint64_t v140 = v131;
      }
      else {
        uint64_t v140 = v128;
      }
      if (v114 >= v115)
      {
        CFIndex v141 = v132;
      }
      else
      {
        uint64_t v131 = v128;
        CFIndex v141 = (CFIndex)v178;
      }
      if (v114 < v115) {
        CFArrayRef v142 = (const __CFArray *)v132;
      }
      else {
        CFArrayRef v142 = v178;
      }
      if (v114 < v115) {
        v143 = v114;
      }
      else {
        v143 = v115;
      }
      if (v114 < v115) {
        v114 = v115;
      }
      CFArrayRef v144 = v181;
      CFArrayRef v145 = v129;
      if (!v139)
      {
        CFArrayRef v129 = v181;
        CFArrayRef v144 = v145;
      }
      CFArrayRef v178 = v142;
      CFArrayRef v181 = v144;
      if (v114 < v143) {
LABEL_343:
      }
        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
      id v7 = v175;
      if (v140 < 9 || (unint64_t v146 = (unsigned char *)v114 - (unsigned char *)v143, log((double)v140) >= (double)v146))
      {
        uint64_t v134 = 8;
LABEL_298:
        char v133 = 1;
        CFIndex v147 = (CFIndex)v178;
        if (v141 < v140 && (uint64_t)v178 < v131)
        {
          while (1)
          {
            if (!v134)
            {
              CFArrayRef v178 = (CFArrayRef)v147;
              uint64_t v134 = -1;
              char v133 = 1;
              break;
            }
            if (v143)
            {
              if (v114) {
                goto LABEL_303;
              }
            }
            else
            {
              v143 = CFArrayGetValueAtIndex(v181, v141);
              if (v114) {
                goto LABEL_303;
              }
            }
            v114 = CFArrayGetValueAtIndex(v129, v147);
LABEL_303:
            if (v143 >= v114)
            {
              if (v143 <= v114)
              {
                if (theArraya) {
                  CFArrayGetCount(theArraya);
                }
                CFArrayAppendValue(theArraya, v143);
                v143 = 0;
                v114 = 0;
                ++v141;
                ++v147;
                goto LABEL_313;
              }
              v114 = 0;
              ++v147;
            }
            else
            {
              v143 = 0;
              ++v141;
            }
            --v134;
LABEL_313:
            char v133 = 1;
            if (v141 >= v140 || v147 >= v131)
            {
              CFArrayRef v178 = (CFArrayRef)v147;
              break;
            }
          }
        }
        CFIndex v128 = v140;
        CFIndex v132 = v141;
        v115 = v143;
        goto LABEL_318;
      }
      if (!v143 || !v114) {
        goto LABEL_353;
      }
      v197.length = v140 - v141;
      v197.location = v141;
      CFIndex v148 = CFArrayBSearchValues(v181, v197, v114, (CFComparatorFunction)PSIRowIDCompare_110276, 0);
      if (v148 >= v140) {
        goto LABEL_340;
      }
      CFIndex v149 = v148;
      v150 = CFArrayGetValueAtIndex(v181, v148);
      if (v114 == v150)
      {
        char v133 = 0;
        CFIndex v128 = v140;
        uint64_t v134 = 8;
        v115 = v114;
      }
      else
      {
        v115 = v150;
        if (v114 >= v150) {
          goto LABEL_344;
        }
        uint64_t v134 = 0;
        char v133 = 1;
        CFIndex v128 = v140;
      }
      CFIndex v132 = v149;
LABEL_318:
      if (v132 >= v128 || (uint64_t)v178 >= v131)
      {
        id v7 = v175;
LABEL_340:
        self = v171;
        v103 = v159;
        goto LABEL_330;
      }
    }
    if (!v134) {
      goto LABEL_345;
    }
    v143 = v115;
    CFIndex v141 = v132;
    uint64_t v140 = v128;
    goto LABEL_298;
  }
  uint64_t v92 = [v176 matchType];
  int IsUserControlled = v92 == 0;
  if (v92 && !v164)
  {
    if ([v176 userControlledCategoriesUseWildcard]) {
      int IsUserControlled = PLSearchIndexCategoryIsUserControlled((int)[v7 category]);
    }
    else {
      int IsUserControlled = 0;
    }
  }
  CFIndex v158 = v34;
  uint64_t v95 = [(PSIGroupAggregate *)self _rangeOfString:v177 inGroup:v7 useNormalizedString:v166 == 0 extendingSearchRange:1 matchingFullToken:IsUserControlled ^ 1u excludingRanges:v23];
  uint64_t v96 = v95;
  uint64_t v98 = v97;
  if (v92 != 2 || IsUserControlled == 1)
  {
    if (v95 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_190;
    }
LABEL_191:
    char v101 = IsUserControlled ^ 1;
    if (v92 != 2) {
      char v101 = 1;
    }
    if ((v101 & 1) == 0)
    {
      v102 = objc_msgSend(v7, "contentString", v96);
      uint64_t v98 = [v102 length];

      uint64_t v96 = 0;
    }
    uint64_t v94 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v96, v98);
    CFIndex v34 = v158;
    goto LABEL_196;
  }
  if (!v95)
  {
    v99 = [v7 normalizedString];
    uint64_t v100 = [v99 length];

    if (v98 == v100)
    {
      uint64_t v96 = 0;
      goto LABEL_191;
    }
  }
LABEL_190:
  BOOL v18 = 0;
LABEL_337:

  long long v16 = v174;
LABEL_338:

  return v18;
}

- (_NSRange)_rangeOfString:(id)a3 inGroup:(id)a4 useNormalizedString:(BOOL)a5 extendingSearchRange:(BOOL)a6 matchingFullToken:(BOOL)a7 excludingRanges:(id)a8
{
  BOOL v38 = a7;
  BOOL v40 = a6;
  id v41 = a3;
  id v11 = a4;
  id v39 = a8;
  if (a5) {
    [v11 normalizedString];
  }
  else {
  uint64_t v12 = [v11 contentString];
  }
  uint64_t v13 = [v12 length];
  uint64_t v14 = [v11 tokenRangesCount];
  if (!v14)
  {
LABEL_25:
    NSUInteger v35 = 0;
    uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  unint64_t v15 = v14;
  unint64_t v16 = 0;
  int v36 = v43;
  uint64_t v37 = v14 - 1;
  while (1)
  {
    int v17 = objc_msgSend(v11, "category", v36);
    unint64_t v18 = v16;
    if (v17 == 2100) {
      unint64_t v18 = (v37 + v16) % v15;
    }
    uint64_t v19 = [v11 tokenRangeAtIndex:v18];
    uint64_t v21 = v19;
    uint64_t v22 = v20;
    uint64_t v23 = v40 ? v13 - v19 : v20;
    uint64_t v24 = objc_msgSend(v12, "rangeOfString:options:range:", v41, 10, v19, v23);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v33 = v24;
    NSUInteger v35 = v25;
    if (v38)
    {
      unint64_t v26 = v21 + v22;
      unint64_t v27 = v24 + v25;
      if (v26 != v24 + v25 && v25 != v13)
      {
        unint64_t v28 = v16 + 1;
        if (v16 + 1 >= v15)
        {
LABEL_21:
          if (v27 < v26) {
            goto LABEL_24;
          }
        }
        else
        {
          while (1)
          {
            unint64_t v29 = [v11 tokenRangeAtIndex:v28];
            if (v27 >= v26 && v27 < v29) {
              break;
            }
            unint64_t v26 = v29 + v30;
            if (v15 == ++v28) {
              goto LABEL_21;
            }
          }
        }
      }
    }
    if (![v39 count]) {
      goto LABEL_26;
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v43[0] = __119__PSIGroupAggregate__rangeOfString_inGroup_useNormalizedString_extendingSearchRange_matchingFullToken_excludingRanges___block_invoke;
    v43[1] = &__block_descriptor_48_e15_B32__0_8Q16_B24l;
    v43[2] = v33;
    v43[3] = v35;
    if ([v39 indexOfObjectPassingTest:v42] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
LABEL_24:
    if (++v16 == v15) {
      goto LABEL_25;
    }
  }
  if (![v12 isEqualToString:v41]) {
    goto LABEL_24;
  }
  uint64_t v33 = [v12 rangeOfString:v41];
  NSUInteger v35 = v34;
LABEL_26:

  NSUInteger v31 = v33;
  NSUInteger v32 = v35;
  result.length = v32;
  result.location = v31;
  return result;
}

BOOL __119__PSIGroupAggregate__rangeOfString_inGroup_useNormalizedString_extendingSearchRange_matchingFullToken_excludingRanges___block_invoke(NSRange *a1, void *a2)
{
  v5.location = [a2 rangeValue];
  v5.length = v3;
  return NSIntersectionRange(a1[32], v5).length != 0;
}

- (PSIGroupAggregate)initWithSearchTokens:(id)a3 groupResultsQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSIGroupAggregate;
  id v9 = [(PSIGroupAggregate *)&v18 init];
  CFArrayRef v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchTokens, a3);
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    groupAggregateItems = v10->_groupAggregateItems;
    v10->_groupAggregateItems = (NSMutableArray *)v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aggregatedGroupIds = v10->_aggregatedGroupIds;
    v10->_aggregatedGroupIds = v13;

    unint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aggregateItemPool = v10->_aggregateItemPool;
    v10->_aggregateItemPool = v15;

    objc_storeStrong((id *)&v10->_groupResultsQueue, a4);
    v10->_filenameGroupCFIndex Count = 0;
  }

  return v10;
}

@end