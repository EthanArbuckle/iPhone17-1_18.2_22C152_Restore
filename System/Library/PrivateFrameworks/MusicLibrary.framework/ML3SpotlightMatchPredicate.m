@interface ML3SpotlightMatchPredicate
+ (id)predicateWithProperties:(id)a3 searchString:(id)a4;
- (ML3SpotlightMatchPredicate)initWithSearchString:(id)a3 matchingProperties:(id)a4;
- (NSString)searchString;
- (id)SQLJoinClausesForClass:(Class)a3;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)dealloc;
@end

@implementation ML3SpotlightMatchPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchProperties, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return (id)[MEMORY[0x1E4F1CAA0] orderedSetWithObject:@"JOIN item_search USING (item_pid)"];
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_searchProperties)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"ML3SpotlightMatch(");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = self->_searchProperties;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      char v10 = 1;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          if ((v10 & 1) == 0) {
            [v6 appendString:@", "];
          }
          [v6 appendString:v12];
          char v10 = 0;
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        char v10 = 0;
      }
      while (v8);
    }

    [v6 appendString:@""]);
    [v5 appendString:v6];
  }
  else
  {
    v13 = [NSString stringWithFormat:@"ML3SpotlightMatch(%@, %@, %@, %@)", @"item_search.search_title", @"item_search.search_album", @"item_search.search_artist", @"item_search.search_composer"];
    [v5 appendString:v13];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightMatchPredicate;
  [(ML3SpotlightMatchPredicate *)&v2 dealloc];
}

- (ML3SpotlightMatchPredicate)initWithSearchString:(id)a3 matchingProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3SpotlightMatchPredicate;
  uint64_t v9 = [(ML3SpotlightMatchPredicate *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    objc_storeStrong((id *)&v10->_searchProperties, a4);
  }

  return v10;
}

+ (id)predicateWithProperties:(id)a3 searchString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[ML3SpotlightMatchPredicate alloc] initWithSearchString:v6 matchingProperties:v5];

  return v7;
}

@end