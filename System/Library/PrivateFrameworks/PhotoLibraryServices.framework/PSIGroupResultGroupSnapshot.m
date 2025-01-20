@interface PSIGroupResultGroupSnapshot
- (BOOL)isDateFilterFromFullSearchText;
- (BOOL)isDateFilterFromImplicitToken;
- (BOOL)isDateFilterPartiallyFromFullSearchText;
- (NSArray)datedTokens;
- (NSArray)groupRanges;
- (NSArray)matchRanges;
- (NSArray)tokens;
- (NSString)contentString;
- (NSString)lookupIdentifier;
- (NSString)normalizedString;
- (PSIDateFilter)dateFilter;
- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5;
- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 normalizedString:(id)a4 token:(id)a5 category:(signed __int16)a6 lookupIdentifier:(id)a7 dateFilter:(id)a8 groupId:(unint64_t)a9 owningGroupId:(unint64_t)a10 groupRanges:(id)a11 datedTokens:(id)a12;
- (PSIGroupResultGroupSnapshot)initWithDateFilter:(id)a3 datedTokens:(id)a4;
- (PSIGroupResultGroupSnapshot)initWithGroup:(id)a3 token:(id)a4;
- (signed)category;
- (unint64_t)groupId;
- (unint64_t)owningGroupId;
- (void)addMatchRange:(id)a3;
- (void)addToken:(id)a3;
@end

@implementation PSIGroupResultGroupSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datedTokens, 0);
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_groupRanges, 0);
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_matchRanges, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (signed)category
{
  return self->_category;
}

- (NSArray)datedTokens
{
  return self->_datedTokens;
}

- (PSIDateFilter)dateFilter
{
  return self->_dateFilter;
}

- (NSArray)groupRanges
{
  return self->_groupRanges;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (NSString)normalizedString
{
  return self->_normalizedString;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (NSArray)matchRanges
{
  return &self->_matchRanges->super;
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (BOOL)isDateFilterFromImplicitToken
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_datedTokens;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "belongsToSearchText", (void)v8)
          && ![v6 isFullTextToken])
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)isDateFilterPartiallyFromFullSearchText
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_datedTokens;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isFullTextToken", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isDateFilterFromFullSearchText
{
  if ([(NSArray *)self->_datedTokens count] != 1) {
    return 0;
  }
  uint64_t v3 = [(NSArray *)self->_datedTokens firstObject];
  char v4 = [v3 isFullTextToken];

  return v4;
}

- (void)addMatchRange:(id)a3
{
}

- (void)addToken:(id)a3
{
}

- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  long long v10 = [PSIGroupResultGroupSnapshot alloc];
  long long v11 = [(PSIGroupResultGroupSnapshot *)v10 initWithContentString:v9 normalizedString:0 token:0 category:v5 lookupIdentifier:v8 dateFilter:0 groupId:0 owningGroupId:0 groupRanges:0 datedTokens:MEMORY[0x1E4F1CBF0]];

  return v11;
}

- (PSIGroupResultGroupSnapshot)initWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PSIGroupResultGroupSnapshot alloc];
  id v9 = [v7 displayString];
  long long v10 = [(PSIGroupResultGroupSnapshot *)v8 initWithContentString:v9 normalizedString:0 token:0 category:1102 lookupIdentifier:0 dateFilter:v7 groupId:0 owningGroupId:0 groupRanges:0 datedTokens:v6];

  return v10;
}

- (PSIGroupResultGroupSnapshot)initWithGroup:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 tokenRangesCount];
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      long long v11 = (void *)MEMORY[0x1E4F29238];
      uint64_t v12 = [v6 tokenRangeAtIndex:i];
      v14 = objc_msgSend(v11, "valueWithRange:", v12, v13);
      [v9 addObject:v14];
    }
  }
  v15 = [v6 contentString];
  v16 = [v6 normalizedString];
  uint64_t v17 = [v6 category];
  v18 = [v6 lookupIdentifier];
  uint64_t v19 = [v6 groupId];
  uint64_t v20 = [v6 owningGroupId];
  v21 = [(PSIGroupResultGroupSnapshot *)self initWithContentString:v15 normalizedString:v16 token:v7 category:v17 lookupIdentifier:v18 dateFilter:0 groupId:v19 owningGroupId:v20 groupRanges:v9 datedTokens:MEMORY[0x1E4F1CBF0]];

  return v21;
}

- (PSIGroupResultGroupSnapshot)initWithContentString:(id)a3 normalizedString:(id)a4 token:(id)a5 category:(signed __int16)a6 lookupIdentifier:(id)a7 dateFilter:(id)a8 groupId:(unint64_t)a9 owningGroupId:(unint64_t)a10 groupRanges:(id)a11 datedTokens:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  id v22 = a11;
  id v23 = a12;
  v40.receiver = self;
  v40.super_class = (Class)PSIGroupResultGroupSnapshot;
  v24 = [(PSIGroupResultGroupSnapshot *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    contentString = v24->_contentString;
    v24->_contentString = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    normalizedString = v24->_normalizedString;
    v24->_normalizedString = (NSString *)v27;

    uint64_t v29 = [v20 copy];
    lookupIdentifier = v24->_lookupIdentifier;
    v24->_lookupIdentifier = (NSString *)v29;

    if (v19)
    {
      v31 = [MEMORY[0x1E4F1CA48] arrayWithObject:v19];
    }
    else
    {
      v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    tokens = v24->_tokens;
    v24->_tokens = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    matchRanges = v24->_matchRanges;
    v24->_matchRanges = v33;

    uint64_t v35 = [v21 copy];
    dateFilter = v24->_dateFilter;
    v24->_dateFilter = (PSIDateFilter *)v35;

    v24->_category = a6;
    v24->_groupId = a9;
    v24->_owningGroupId = a10;
    if (v22) {
      v37 = v22;
    }
    else {
      v37 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v24->_groupRanges, v37);
    objc_storeStrong((id *)&v24->_datedTokens, a12);
  }

  return v24;
}

@end