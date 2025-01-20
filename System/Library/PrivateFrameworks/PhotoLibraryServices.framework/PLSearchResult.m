@interface PLSearchResult
- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3;
- (BOOL)isImplicitlyTokenized;
- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3;
- (BOOL)isSinglePersonOrPetResult;
- (NSArray)contentStrings;
- (NSArray)lookupIdentifiers;
- (NSArray)matchRanges;
- (NSArray)searchTokens;
- (NSString)groupDescription;
- (NSString)keyAssetUUID;
- (NSString)owningContentString;
- (NSString)transientToken;
- (PLSearchResult)initWithGroupResult:(id)a3;
- (PSIGroupResult)groupResult;
- (id)matchRangesAtIndex:(int64_t)a3;
- (id)tokensAtIndex:(int64_t)a3;
- (int64_t)categoryAtIndex:(int64_t)a3;
- (unint64_t)assetCount;
- (unint64_t)categoryMask;
- (unint64_t)groupCount;
- (unint64_t)type;
@end

@implementation PLSearchResult

- (void).cxx_destruct
{
}

- (PSIGroupResult)groupResult
{
  return self->_groupResult;
}

- (BOOL)isSinglePersonOrPetResult
{
  uint64_t v3 = [(PLSearchResult *)self categoryMask];
  if (v3 > 0x7FFFFFFFFFFFFLL)
  {
    if (v3 == 0x8000000000000) {
      goto LABEL_7;
    }
    uint64_t v4 = 0x10000000000000;
  }
  else
  {
    if (v3 == 128) {
      goto LABEL_7;
    }
    uint64_t v4 = 0x4000000000000;
  }
  if (v3 != v4)
  {
    [(PLSearchResult *)self type];
    return 0;
  }
LABEL_7:
  if ([(PLSearchResult *)self type] != 1) {
    return 0;
  }
  v5 = [(PLSearchResult *)self lookupIdentifiers];
  BOOL v6 = [v5 count] == 1;

  return v6;
}

- (BOOL)isImplicitlyTokenized
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(PLSearchResult *)self groupResult];
  unsigned int v5 = [v4 hasDateFilterFromImplicitToken];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v6 = [(PLSearchResult *)self searchTokens];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 belongsToSearchText])
        {
          v12 = (void *)MEMORY[0x1E4F29238];
          uint64_t v13 = [v11 rangeInSearchText];
          v15 = objc_msgSend(v12, "valueWithRange:", v13, v14);
          if (([v3 containsObject:v15] & 1) == 0)
          {
            [v3 addObject:v15];
            if (v8)
            {

              LOBYTE(v7) = 1;
              goto LABEL_15;
            }
            uint64_t v8 = 1;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v7;
}

- (BOOL)isMatchedByIdentifierAtIndex:(int64_t)a3
{
  return [(PSIGroupResult *)self->_groupResult isMatchedByIdentifierAtIndex:a3];
}

- (BOOL)isContentStringTextSearchableAtIndex:(int64_t)a3
{
  return [(PSIGroupResult *)self->_groupResult isContentStringTextSearchableAtIndex:a3];
}

- (id)matchRangesAtIndex:(int64_t)a3
{
  return [(PSIGroupResult *)self->_groupResult matchRangesAtIndex:a3];
}

- (id)tokensAtIndex:(int64_t)a3
{
  return [(PSIGroupResult *)self->_groupResult tokensAtIndex:a3];
}

- (int64_t)categoryAtIndex:(int64_t)a3
{
  return [(PSIGroupResult *)self->_groupResult categoryAtIndex:a3];
}

- (unint64_t)groupCount
{
  return [(PSIGroupResult *)self->_groupResult groupCount];
}

- (NSString)owningContentString
{
  return [(PSIGroupResult *)self->_groupResult owningContentString];
}

- (NSString)groupDescription
{
  return (NSString *)[(PSIGroupResult *)self->_groupResult debugDescription];
}

- (unint64_t)assetCount
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PLSearchResult.m", 65, @"%@: %s must be subclassed", v6, "-[PLSearchResult assetCount]" object file lineNumber description];

  return 0;
}

- (NSString)keyAssetUUID
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PLSearchResult.m", 60, @"%@: %s must be subclassed", v6, "-[PLSearchResult keyAssetUUID]" object file lineNumber description];

  return 0;
}

- (NSString)transientToken
{
  return [(PSIGroupResult *)self->_groupResult transientToken];
}

- (NSArray)matchRanges
{
  return [(PSIGroupResult *)self->_groupResult groupsMatchRanges];
}

- (NSArray)lookupIdentifiers
{
  return [(PSIGroupResult *)self->_groupResult lookupIdentifiers];
}

- (NSArray)contentStrings
{
  return [(PSIGroupResult *)self->_groupResult contentStrings];
}

- (NSArray)searchTokens
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(PSIGroupResult *)self->_groupResult groupsSearchTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)categoryMask
{
  if (![(PSIGroupResult *)self->_groupResult groupCount]) {
    return 0;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  do
    v4 |= PLSearchIndexCategoryMaskForCategory([(PSIGroupResult *)self->_groupResult categoryAtIndex:v3++]);
  while (v3 < [(PSIGroupResult *)self->_groupResult groupCount]);
  return v4;
}

- (unint64_t)type
{
  return 0;
}

- (PLSearchResult)initWithGroupResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchResult;
  uint64_t v6 = [(PLSearchResult *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupResult, a3);
  }

  return v7;
}

@end