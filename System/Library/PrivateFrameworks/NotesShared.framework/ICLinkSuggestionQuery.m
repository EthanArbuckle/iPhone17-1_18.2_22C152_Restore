@interface ICLinkSuggestionQuery
- (BOOL)includeNotes;
- (BOOL)includeWebsites;
- (ICLinkSuggestionQuery)initWithQueryString:(id)a3;
- (ICLinkSuggestionQuery)initWithQueryString:(id)a3 includeNotes:(BOOL)a4 includeWebsites:(BOOL)a5;
- (NSString)queryString;
- (id)attributesToFetch;
- (id)newSearchQueryContext;
- (id)newSearchQueryWithContext:(id)a3;
- (void)setIncludeNotes:(BOOL)a3;
- (void)setIncludeWebsites:(BOOL)a3;
- (void)setQueryString:(id)a3;
@end

@implementation ICLinkSuggestionQuery

- (ICLinkSuggestionQuery)initWithQueryString:(id)a3
{
  return [(ICLinkSuggestionQuery *)self initWithQueryString:a3 includeNotes:1 includeWebsites:1];
}

- (ICLinkSuggestionQuery)initWithQueryString:(id)a3 includeNotes:(BOOL)a4 includeWebsites:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLinkSuggestionQuery;
  v9 = [(ICSearchQuery *)&v12 initWithExternalRankingQueries:0];
  if (v9)
  {
    v10 = +[ICSearchQueryOperation prefixMatchingQueryStringTitleForSearchString:v8];
    [(ICLinkSuggestionQuery *)v9 setQueryString:v10];

    [(ICLinkSuggestionQuery *)v9 setIncludeNotes:v6];
    [(ICLinkSuggestionQuery *)v9 setIncludeWebsites:v5];
  }

  return v9;
}

- (id)newSearchQueryContext
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v2 setDisableBlockingOnIndex:1];
  return v2;
}

- (id)newSearchQueryWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F23828];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(ICLinkSuggestionQuery *)self queryString];
  id v8 = (void *)[v6 initWithQueryString:v7 queryContext:v5];

  return v8;
}

- (id)attributesToFetch
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F22C60];
  v7[0] = *MEMORY[0x1E4F836C0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F22C58];
  v7[2] = *MEMORY[0x1E4F22CE8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F23500];
  v7[4] = *MEMORY[0x1E4F22F38];
  v7[5] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  return v5;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (BOOL)includeNotes
{
  return self->_includeNotes;
}

- (void)setIncludeNotes:(BOOL)a3
{
  self->_includeNotes = a3;
}

- (BOOL)includeWebsites
{
  return self->_includeWebsites;
}

- (void)setIncludeWebsites:(BOOL)a3
{
  self->_includeWebsites = a3;
}

- (void).cxx_destruct
{
}

@end