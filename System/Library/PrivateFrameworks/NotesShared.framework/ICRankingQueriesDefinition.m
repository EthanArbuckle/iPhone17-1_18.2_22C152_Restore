@interface ICRankingQueriesDefinition
+ (unint64_t)bucketOfTimeInterval:(double)a3;
+ (unint64_t)maxCountOfVariantsForCountOfTokens:(unint64_t)a3;
+ (unint64_t)modificationDateBucketForSearchableItem:(id)a3;
+ (unint64_t)relevanceBitFieldForSearchableItem:(id)a3;
- (ICRankingQueriesDefinition)initWithExpandedTokens:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5;
- (ICRankingQueriesDefinition)initWithSearchString:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5;
- (NSArray)expandedTokens;
- (NSArray)rankingQueries;
- (NSArray)rankingQueryDescriptors;
- (NSMutableDictionary)matchingDescriptorsCache;
- (NSString)rankingQueryFlags;
- (double)rankingScoreForSearchableItem:(id)a3;
- (id)highlightInfoForSearchableItem:(id)a3;
- (id)matchingDescriptorsForBitFields:(unint64_t)a3;
- (int64_t)rankingQueryType;
- (void)addDescriptor:(id)a3 intoSearchResultHighlightInfoFieldElement:(id)a4;
- (void)setExpandedTokens:(id)a3;
- (void)setMatchingDescriptorsCache:(id)a3;
- (void)setRankingQueryFlags:(id)a3;
- (void)setRankingQueryType:(int64_t)a3;
@end

@implementation ICRankingQueriesDefinition

- (ICRankingQueriesDefinition)initWithExpandedTokens:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICRankingQueriesDefinition;
  v11 = [(ICRankingQueriesDefinition *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expandedTokens, a3);
    v12->_rankingQueryType = a4;
    objc_storeStrong((id *)&v12->_rankingQueryFlags, a5);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    matchingDescriptorsCache = v12->_matchingDescriptorsCache;
    v12->_matchingDescriptorsCache = v13;
  }
  return v12;
}

- (ICRankingQueriesDefinition)initWithSearchString:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 arrayWithObjects:&v15 count:1];
  v16[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  v13 = [(ICRankingQueriesDefinition *)self initWithExpandedTokens:v12 rankingQueryType:a4 rankingQueryFlags:v9];
  return v13;
}

- (NSArray)rankingQueryDescriptors
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  rankingQueryDescriptors = self->_rankingQueryDescriptors;
  if (!rankingQueryDescriptors)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v5 = [MEMORY[0x1E4F837D8] rankingQueryFieldsForGenericHighlighting];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v93 objects:v107 count:16];
    v7 = &off_1E64A3000;
    v70 = v4;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v94 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          v12 = [ICRankingQueryDescriptor alloc];
          v13 = [(ICRankingQueriesDefinition *)self expandedTokens];
          int64_t v14 = [(ICRankingQueriesDefinition *)self rankingQueryType];
          id v15 = [(ICRankingQueriesDefinition *)self rankingQueryFlags];
          objc_super v16 = [(ICRankingQueryDescriptor *)v12 initWithQueryFields:v11 expandedTokens:v13 rankingQueryType:v14 rankingQueryFlags:v15 purpose:0];

          v7 = &off_1E64A3000;
          id v4 = v70;
          [v70 addObject:v16];
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v93 objects:v107 count:16];
      }
      while (v8);
    }

    v17 = objc_opt_class();
    v18 = [(ICRankingQueriesDefinition *)self expandedTokens];
    uint64_t v19 = objc_msgSend(v17, "maxCountOfVariantsForCountOfTokens:", objc_msgSend(v18, "count"));

    unint64_t v72 = v19;
    if (v19)
    {
      long long v87 = 0uLL;
      long long v88 = 0uLL;
      long long v85 = 0uLL;
      long long v86 = 0uLL;
      obuint64_t j = [MEMORY[0x1E4F837D8] rankingQueryFieldsForWordSpecificHighlighting];
      uint64_t v66 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
      if (v66)
      {
        uint64_t v65 = *(void *)v86;
        unint64_t v20 = 0x1E4F1C000uLL;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v86 != v65)
            {
              uint64_t v22 = v21;
              objc_enumerationMutation(obj);
              uint64_t v21 = v22;
            }
            uint64_t v67 = v21;
            uint64_t v74 = *(void *)(*((void *)&v85 + 1) + 8 * v21);
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v68 = [(ICRankingQueriesDefinition *)self expandedTokens];
            uint64_t v71 = [v68 countByEnumeratingWithState:&v81 objects:v104 count:16];
            if (v71)
            {
              uint64_t v69 = *(void *)v82;
              do
              {
                uint64_t v23 = 0;
                do
                {
                  if (*(void *)v82 != v69) {
                    objc_enumerationMutation(v68);
                  }
                  v24 = *(void **)(*((void *)&v81 + 1) + 8 * v23);
                  uint64_t v25 = [v24 count];
                  uint64_t v73 = v23;
                  if ([v24 count] > v72)
                  {
                    v26 = os_log_create("com.apple.notes", "SearchIndexer");
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v38 = [v24 count];
                      *(_DWORD *)buf = 134218240;
                      uint64_t v101 = v38;
                      __int16 v102 = 2048;
                      unint64_t v103 = v72;
                      _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "Observed %lu variants for token, but we only allow %lu.", buf, 0x16u);
                    }

                    uint64_t v25 = v72;
                  }
                  v27 = self;
                  if (v25)
                  {
                    uint64_t v28 = 0;
                    v75 = v24;
                    do
                    {
                      id v76 = objc_alloc((Class)v7[273]);
                      v29 = [v24 objectAtIndexedSubscript:v28];
                      v98 = v29;
                      v30 = [*(id *)(v20 + 2424) arrayWithObjects:&v98 count:1];
                      v99 = v30;
                      v31 = [*(id *)(v20 + 2424) arrayWithObjects:&v99 count:1];
                      uint64_t v32 = [(ICRankingQueriesDefinition *)v27 rankingQueryType];
                      [(ICRankingQueriesDefinition *)v27 rankingQueryFlags];
                      v33 = v27;
                      uint64_t v34 = v25;
                      v36 = unint64_t v35 = v20;
                      v37 = (void *)[v76 initWithQueryFields:v74 expandedTokens:v31 rankingQueryType:v32 rankingQueryFlags:v36 purpose:0];

                      unint64_t v20 = v35;
                      uint64_t v25 = v34;
                      v27 = v33;

                      v24 = v75;
                      v7 = &off_1E64A3000;
                      [v70 addObject:v37];

                      ++v28;
                    }
                    while (v25 != v28);
                  }
                  uint64_t v23 = v73 + 1;
                }
                while (v73 + 1 != v71);
                uint64_t v71 = [v68 countByEnumeratingWithState:&v81 objects:v104 count:16];
              }
              while (v71);
            }

            uint64_t v21 = v67 + 1;
          }
          while (v67 + 1 != v66);
          uint64_t v66 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
        }
        while (v66);
      }
    }
    else
    {
      long long v91 = 0uLL;
      long long v92 = 0uLL;
      long long v89 = 0uLL;
      long long v90 = 0uLL;
      obuint64_t j = [MEMORY[0x1E4F837D8] rankingQueryFieldsForWordSpecificHighlighting];
      uint64_t v39 = [obj countByEnumeratingWithState:&v89 objects:v106 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v90;
        do
        {
          for (uint64_t j = 0; j != v40; ++j)
          {
            if (*(void *)v90 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v43 = *(void *)(*((void *)&v89 + 1) + 8 * j);
            v44 = [ICRankingQueryDescriptor alloc];
            v45 = [(ICRankingQueriesDefinition *)self expandedTokens];
            int64_t v46 = [(ICRankingQueriesDefinition *)self rankingQueryType];
            v47 = [(ICRankingQueriesDefinition *)self rankingQueryFlags];
            int64_t v48 = v46;
            v7 = &off_1E64A3000;
            v49 = [(ICRankingQueryDescriptor *)v44 initWithQueryFields:v43 expandedTokens:v45 rankingQueryType:v48 rankingQueryFlags:v47 purpose:0];

            [v4 addObject:v49];
          }
          uint64_t v40 = [obj countByEnumeratingWithState:&v89 objects:v106 count:16];
        }
        while (v40);
      }
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v50 = [MEMORY[0x1E4F837D8] rankingQueryFieldsForSorting];
    uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v97 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v52; ++k)
        {
          if (*(void *)v78 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v77 + 1) + 8 * k);
          id v56 = objc_alloc((Class)v7[273]);
          v57 = [(ICRankingQueriesDefinition *)self expandedTokens];
          int64_t v58 = [(ICRankingQueriesDefinition *)self rankingQueryType];
          v59 = [(ICRankingQueriesDefinition *)self rankingQueryFlags];
          v60 = (void *)[v56 initWithQueryFields:v55 expandedTokens:v57 rankingQueryType:v58 rankingQueryFlags:v59 purpose:1];

          v7 = &off_1E64A3000;
          [v70 addObject:v60];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v77 objects:v97 count:16];
      }
      while (v52);
    }

    v61 = (NSArray *)[v70 copy];
    v62 = self->_rankingQueryDescriptors;
    self->_rankingQueryDescriptors = v61;

    rankingQueryDescriptors = self->_rankingQueryDescriptors;
  }
  return rankingQueryDescriptors;
}

- (NSArray)rankingQueries
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  rankingQueries = self->_rankingQueries;
  if (!rankingQueries)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(ICRankingQueriesDefinition *)self rankingQueryDescriptors];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) rankingQuery];
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (NSArray *)[v4 copy];
    v12 = self->_rankingQueries;
    self->_rankingQueries = v11;

    rankingQueries = self->_rankingQueries;
  }
  return rankingQueries;
}

+ (unint64_t)maxCountOfVariantsForCountOfTokens:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F837D8] rankingQueryLimit];
  v5 = [MEMORY[0x1E4F837D8] rankingQueryFieldsForGenericHighlighting];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [MEMORY[0x1E4F837D8] rankingQueryFieldsForSorting];
  uint64_t v8 = [v7 count];

  unint64_t v9 = v4 - (v6 + v8);
  id v10 = [MEMORY[0x1E4F837D8] rankingQueryFieldsForWordSpecificHighlighting];
  unint64_t v11 = [v10 count];

  return vcvtmd_u64_f64((double)v9 / (double)v11 / (double)a3);
}

- (id)highlightInfoForSearchableItem:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v20 = v4;
  -[ICRankingQueriesDefinition matchingDescriptorsForBitFields:](self, "matchingDescriptorsForBitFields:", [(id)objc_opt_class() relevanceBitFieldForSearchableItem:v4]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        if (![v7 purpose])
        {
          uint64_t v8 = [v7 displayedMatchedFields];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v9 = [&unk_1F1F62B68 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v26 != v11) {
                  objc_enumerationMutation(&unk_1F1F62B68);
                }
                uint64_t v13 = [*(id *)(*((void *)&v25 + 1) + 8 * i) unsignedIntegerValue];
                if ((v13 & v8) != 0)
                {
                  uint64_t v14 = v13;
                  long long v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v13];
                  id v16 = [v5 objectForKeyedSubscript:v15];

                  if (!v16)
                  {
                    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    long long v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v14];
                    [v5 setObject:v16 forKeyedSubscript:v17];
                  }
                  [(ICRankingQueriesDefinition *)self addDescriptor:v7 intoSearchResultHighlightInfoFieldElement:v16];
                }
              }
              uint64_t v10 = [&unk_1F1F62B68 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v10);
          }
        }
        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  v18 = (void *)[v5 copy];

  return v18;
}

- (double)rankingScoreForSearchableItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[ICRankingQueriesDefinition matchingDescriptorsForBitFields:](self, "matchingDescriptorsForBitFields:", [(id)objc_opt_class() relevanceBitFieldForSearchableItem:v4]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 purpose] == 1)
        {
          v12 = [v4 attributeSet];
          objc_msgSend(v11, "rankingScoreForSearchResultType:", objc_msgSend(v12, "ic_searchResultType"));
          double v9 = v9 + v13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

+ (unint64_t)modificationDateBucketForSearchableItem:(id)a3
{
  id v4 = [a3 attributeSet];
  id v5 = [v4 contentModificationDate];

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  unint64_t v9 = [a1 bucketOfTimeInterval:v8];
  return v9;
}

+ (unint64_t)relevanceBitFieldForSearchableItem:(id)a3
{
  v3 = [a3 attributeSet];
  unint64_t v4 = objc_msgSend(v3, "ic_relevance");

  return v4;
}

- (void)addDescriptor:(id)a3 intoSearchResultHighlightInfoFieldElement:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  uint64_t v6 = 2 * ((unint64_t)([v5 rankingQueryType] - 1) < 2);
  double v7 = [v5 tokens];

  double v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
  id v9 = [v11 objectForKeyedSubscript:v8];

  if (v9)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
  [v11 setObject:v9 forKeyedSubscript:v10];

  if (v7) {
LABEL_3:
  }
    [v9 addObjectsFromArray:v7];
LABEL_4:
}

- (id)matchingDescriptorsForBitFields:(unint64_t)a3
{
  id v5 = [(ICRankingQueriesDefinition *)self matchingDescriptorsCache];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  double v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3)
    {
      id v9 = [(ICRankingQueriesDefinition *)self rankingQueryDescriptors];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        unint64_t v11 = 0;
        do
        {
          if (((1 << v11) & a3) >> v11)
          {
            v12 = [(ICRankingQueriesDefinition *)self rankingQueryDescriptors];
            double v13 = [v12 objectAtIndexedSubscript:v11];
            [v8 addObject:v13];
          }
          ++v11;
          uint64_t v14 = [(ICRankingQueriesDefinition *)self rankingQueryDescriptors];
          unint64_t v15 = [v14 count];
        }
        while (v11 < v15);
      }
    }
    double v7 = (void *)[v8 copy];
    long long v16 = [(ICRankingQueriesDefinition *)self matchingDescriptorsCache];
    long long v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v16 setObject:v7 forKeyedSubscript:v17];
  }
  return v7;
}

+ (unint64_t)bucketOfTimeInterval:(double)a3
{
  if (a3 <= 0.0) {
    return 2;
  }
  double v3 = ceil(log(a3) * 1.28617347 + -6.14189718);
  if (v3 <= 2.0) {
    return 2;
  }
  else {
    return (unint64_t)v3;
  }
}

- (NSArray)expandedTokens
{
  return self->_expandedTokens;
}

- (void)setExpandedTokens:(id)a3
{
}

- (int64_t)rankingQueryType
{
  return self->_rankingQueryType;
}

- (void)setRankingQueryType:(int64_t)a3
{
  self->_rankingQueryType = a3;
}

- (NSString)rankingQueryFlags
{
  return self->_rankingQueryFlags;
}

- (void)setRankingQueryFlags:(id)a3
{
}

- (NSMutableDictionary)matchingDescriptorsCache
{
  return self->_matchingDescriptorsCache;
}

- (void)setMatchingDescriptorsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDescriptorsCache, 0);
  objc_storeStrong((id *)&self->_rankingQueryFlags, 0);
  objc_storeStrong((id *)&self->_expandedTokens, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_rankingQueryDescriptors, 0);
}

@end