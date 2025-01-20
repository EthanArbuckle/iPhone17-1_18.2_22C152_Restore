@interface ICRankingQueryDescriptor
- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 displayedMatchedFields:(unint64_t)a7 purpose:(unint64_t)a8;
- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 purpose:(unint64_t)a7;
- (NSArray)expandedTokens;
- (NSArray)queryFields;
- (NSArray)tokens;
- (NSString)rankingQuery;
- (NSString)rankingQueryFlags;
- (double)rankingScoreForSearchResultType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rankingQueryForQueryField:(id)a3 tokenString:(id)a4;
- (int64_t)rankingQueryType;
- (unint64_t)displayedMatchedFields;
- (unint64_t)purpose;
- (void)setRankingQuery:(id)a3;
@end

@implementation ICRankingQueryDescriptor

- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 purpose:(unint64_t)a7
{
  return [(ICRankingQueryDescriptor *)self initWithQueryFields:a3 expandedTokens:a4 rankingQueryType:a5 rankingQueryFlags:a6 displayedMatchedFields:0 purpose:a7];
}

- (ICRankingQueryDescriptor)initWithQueryFields:(id)a3 expandedTokens:(id)a4 rankingQueryType:(int64_t)a5 rankingQueryFlags:(id)a6 displayedMatchedFields:(unint64_t)a7 purpose:(unint64_t)a8
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ICRankingQueryDescriptor;
  v17 = [(ICRankingQueryDescriptor *)&v23 init];
  v18 = v17;
  if (v17)
  {
    p_queryFields = (id *)&v17->_queryFields;
    objc_storeStrong((id *)&v17->_queryFields, a3);
    objc_storeStrong((id *)&v18->_expandedTokens, a4);
    v18->_rankingQueryType = a5;
    objc_storeStrong((id *)&v18->_rankingQueryFlags, a6);
    v18->_displayedMatchedFields = a7;
    v18->_purpose = a8;
    if (!a7)
    {
      if (([*p_queryFields containsObject:@"_ICItemDisplayName"] & 1) != 0
        || ([*p_queryFields containsObject:*MEMORY[0x1E4F22CE8]] & 1) != 0)
      {
        uint64_t v20 = 1;
      }
      else if (([*p_queryFields containsObject:*MEMORY[0x1E4F22B30]] & 1) != 0 {
             || ([*p_queryFields containsObject:*MEMORY[0x1E4F22B18]] & 1) != 0)
      }
      {
        uint64_t v20 = 4;
      }
      else
      {
        if (![*p_queryFields containsObject:*MEMORY[0x1E4F235F8]]) {
          goto LABEL_10;
        }
        uint64_t v20 = 2;
      }
      v18->_displayedMatchedFields |= v20;
    }
  }
LABEL_10:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ICRankingQueryDescriptor *)self queryFields];
  v6 = [(ICRankingQueryDescriptor *)self expandedTokens];
  int64_t v7 = [(ICRankingQueryDescriptor *)self rankingQueryType];
  v8 = [(ICRankingQueryDescriptor *)self rankingQueryFlags];
  v9 = objc_msgSend(v4, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:displayedMatchedFields:purpose:", v5, v6, v7, v8, -[ICRankingQueryDescriptor displayedMatchedFields](self, "displayedMatchedFields"), -[ICRankingQueryDescriptor purpose](self, "purpose"));

  return v9;
}

- (NSString)rankingQuery
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  rankingQuery = self->_rankingQuery;
  if (!rankingQuery)
  {
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = [(ICRankingQueryDescriptor *)self expandedTokens];
    uint64_t v26 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v39;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = v4;
          v5 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v28 = v5;
          uint64_t v7 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v29 = *(void *)v35;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v35 != v29) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * v9);
                long long v30 = 0u;
                long long v31 = 0u;
                long long v32 = 0u;
                long long v33 = 0u;
                v11 = [(ICRankingQueryDescriptor *)self queryFields];
                uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v42 count:16];
                if (v12)
                {
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v31;
                  do
                  {
                    uint64_t v15 = 0;
                    do
                    {
                      if (*(void *)v31 != v14) {
                        objc_enumerationMutation(v11);
                      }
                      id v16 = [(ICRankingQueryDescriptor *)self rankingQueryForQueryField:*(void *)(*((void *)&v30 + 1) + 8 * v15) tokenString:v10];
                      [v6 addObject:v16];

                      ++v15;
                    }
                    while (v13 != v15);
                    uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  }
                  while (v13);
                }

                ++v9;
              }
              while (v9 != v8);
              uint64_t v8 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v8);
          }

          v17 = NSString;
          v18 = [v6 componentsJoinedByString:@" || "];
          v19 = [v17 stringWithFormat:@"(%@)", v18];

          [v25 addObject:v19];
          uint64_t v4 = v27 + 1;
        }
        while (v27 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v26);
    }

    uint64_t v20 = [v25 componentsJoinedByString:@" || "];
    v21 = self->_rankingQuery;
    self->_rankingQuery = v20;

    rankingQuery = self->_rankingQuery;
  }
  return rankingQuery;
}

- (NSArray)tokens
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ICRankingQueryDescriptor *)self expandedTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];
  return (NSArray *)v9;
}

- (double)rankingScoreForSearchResultType:(unint64_t)a3
{
  double v5 = 0.0;
  if ([(ICRankingQueryDescriptor *)self purpose] != 1) {
    return v5;
  }
  if ([(ICRankingQueryDescriptor *)self displayedMatchedFields])
  {
    int64_t v7 = [(ICRankingQueryDescriptor *)self rankingQueryType];
    double v8 = 0.0;
    if (v7 != 2)
    {
      double v9 = 0.0625;
      if (a3 != 1) {
        double v9 = 0.0;
      }
      if (!a3) {
        double v9 = 0.5;
      }
      double v10 = 4.0;
      if (a3 != 1) {
        double v10 = 0.0;
      }
      BOOL v11 = a3 == 0;
      double v12 = 32.0;
      goto LABEL_23;
    }
    if (a3 == 1) {
      double v8 = 0.001953125;
    }
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x3F90000000000000;
LABEL_34:
    double v9 = *(double *)&v14;
LABEL_35:
    if (v13) {
      return v9;
    }
    else {
      return v8;
    }
  }
  if (([(ICRankingQueryDescriptor *)self displayedMatchedFields] & 2) != 0)
  {
    int64_t v7 = [(ICRankingQueryDescriptor *)self rankingQueryType];
    double v8 = 0.0;
    if (v7 != 2)
    {
      double v9 = 0.03125;
      if (a3 != 1) {
        double v9 = 0.0;
      }
      if (!a3) {
        double v9 = 0.25;
      }
      double v10 = 2.0;
      if (a3 != 1) {
        double v10 = 0.0;
      }
      BOOL v11 = a3 == 0;
      double v12 = 16.0;
LABEL_23:
      if (v11) {
        double v10 = v12;
      }
      if (!v7) {
        double v8 = v10;
      }
      BOOL v13 = v7 == 1;
      goto LABEL_35;
    }
    if (a3 == 1) {
      double v8 = 0.0009765625;
    }
    BOOL v13 = a3 == 0;
    uint64_t v14 = 0x3F80000000000000;
    goto LABEL_34;
  }
  if (([(ICRankingQueryDescriptor *)self displayedMatchedFields] & 4) != 0)
  {
    unint64_t v6 = [(ICRankingQueryDescriptor *)self rankingQueryType];
    if (v6 <= 2) {
      return dbl_1C3DD3450[v6];
    }
  }
  return v5;
}

- (id)rankingQueryForQueryField:(id)a3 tokenString:(id)a4
{
  id v6 = a3;
  int64_t v7 = [MEMORY[0x1E4F837D8] stringByEscapingSearchString:a4];
  if ([v7 length])
  {
    double v8 = [(ICRankingQueryDescriptor *)self rankingQueryFlags];
  }
  else
  {
    double v8 = &stru_1F1F2FFF8;
  }
  int64_t v9 = [(ICRankingQueryDescriptor *)self rankingQueryType];
  switch(v9)
  {
    case 2:
      [NSString stringWithFormat:@"%@=\"*%@*\"%@", v6, v7, v8];
      goto LABEL_9;
    case 1:
      BOOL v11 = NSString;
      double v12 = objc_msgSend(NSString, "stringWithFormat:", @"%3.3d", 66);
      double v10 = [v11 stringWithFormat:@"%@=\"%@*\"%@f%@", v6, v7, v8, v12];

      break;
    case 0:
      [NSString stringWithFormat:@"%@=\"%@*\"%@", v6, v7, v8];
      double v10 = LABEL_9:;
      break;
    default:
      double v10 = 0;
      break;
  }

  return v10;
}

- (void)setRankingQuery:(id)a3
{
}

- (NSArray)queryFields
{
  return self->_queryFields;
}

- (NSArray)expandedTokens
{
  return self->_expandedTokens;
}

- (int64_t)rankingQueryType
{
  return self->_rankingQueryType;
}

- (NSString)rankingQueryFlags
{
  return self->_rankingQueryFlags;
}

- (unint64_t)displayedMatchedFields
{
  return self->_displayedMatchedFields;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingQueryFlags, 0);
  objc_storeStrong((id *)&self->_expandedTokens, 0);
  objc_storeStrong((id *)&self->_queryFields, 0);
  objc_storeStrong((id *)&self->_rankingQuery, 0);
}

@end