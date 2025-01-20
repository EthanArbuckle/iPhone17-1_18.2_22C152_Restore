@interface ICSearchResultsQuery
+ (id)queryForClassifiedImages;
- (BOOL)modernResultsOnly;
- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5;
- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5 attributes:(id)a6;
- (ICSearchResultsQuery)initWithQueryString:(id)a3 rankingQueriesDefinition:(id)a4 modernResultsOnly:(BOOL)a5;
- (NSArray)attributes;
- (NSString)queryString;
- (id)attributesToFetch;
- (id)newSearchQueryContext;
- (id)newSearchQueryWithContext:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setQueryString:(id)a3;
@end

@implementation ICSearchResultsQuery

- (ICSearchResultsQuery)initWithQueryString:(id)a3 rankingQueriesDefinition:(id)a4 modernResultsOnly:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSearchResultsQuery;
  v10 = [(ICSearchQuery *)&v13 initWithRankingQueriesDefinition:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queryString, a3);
    v11->_modernResultsOnly = a5;
  }

  return v11;
}

- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5
{
  return [(ICSearchResultsQuery *)self initWithQueryString:a3 externalRankingQueries:a4 modernResultsOnly:a5 attributes:0];
}

- (ICSearchResultsQuery)initWithQueryString:(id)a3 externalRankingQueries:(id)a4 modernResultsOnly:(BOOL)a5 attributes:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ICSearchResultsQuery;
  objc_super v13 = [(ICSearchQuery *)&v16 initWithExternalRankingQueries:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queryString, a3);
    v14->_modernResultsOnly = a5;
    objc_storeStrong((id *)&v14->_attributes, a6);
  }

  return v14;
}

- (id)attributesToFetch
{
  attributes = self->_attributes;
  if (attributes)
  {
    v3 = attributes;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ICSearchResultsQuery;
    v3 = [(ICSearchQuery *)&v5 attributesToFetch];
  }
  return v3;
}

- (id)newSearchQueryContext
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F23830]);
  v4 = [(ICSearchQuery *)self rankingQueries];
  [v3 setRankingQueries:v4];

  return v3;
}

- (id)newSearchQueryWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F23828];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(ICSearchResultsQuery *)self queryString];
  v8 = (void *)[v6 initWithQueryString:v7 context:v5];

  return v8;
}

+ (id)queryForClassifiedImages
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = [ICSearchResultsQuery alloc];
  uint64_t v3 = *MEMORY[0x1E4F23288];
  v8[0] = *MEMORY[0x1E4F23258];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F23320];
  v8[2] = *MEMORY[0x1E4F232D0];
  v8[3] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  id v6 = [(ICSearchResultsQuery *)v2 initWithQueryString:@"*==*" externalRankingQueries:0 modernResultsOnly:0 attributes:v5];

  return v6;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end