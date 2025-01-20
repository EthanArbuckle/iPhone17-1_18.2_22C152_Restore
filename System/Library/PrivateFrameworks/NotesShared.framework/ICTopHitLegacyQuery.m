@interface ICTopHitLegacyQuery
- (BOOL)modernResultsOnly;
- (ICTopHitLegacyQuery)initWithQueryString:(id)a3 keyboardLanguage:(id)a4;
- (NSString)highlightString;
- (NSString)keyboardLanguage;
- (NSString)queryString;
- (double)timeoutInterval;
- (id)newSearchQueryContext;
- (id)newSearchQueryWithContext:(id)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setQueryString:(id)a3;
@end

@implementation ICTopHitLegacyQuery

- (ICTopHitLegacyQuery)initWithQueryString:(id)a3 keyboardLanguage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICTopHitLegacyQuery;
  v9 = [(ICSearchQuery *)&v12 initWithExternalRankingQueries:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queryString, a3);
    objc_storeStrong((id *)&v10->_keyboardLanguage, a4);
    v10->_modernResultsOnly = 1;
  }

  return v10;
}

- (double)timeoutInterval
{
  return 0.75;
}

- (id)newSearchQueryContext
{
  return 0;
}

- (id)newSearchQueryWithContext:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  v6 = [v5 preferredLocalizations];
  id v7 = [v6 firstObject];
  id v8 = [v4 canonicalLocaleIdentifierFromString:v7];

  uint64_t v9 = [(ICTopHitLegacyQuery *)self keyboardLanguage];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = v8;
  }
  id v12 = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F23888]);
  v14 = [(ICTopHitLegacyQuery *)self queryString];
  v15 = [(ICSearchQuery *)self attributesToFetch];
  v16 = (void *)[v13 initWithSearchString:v14 keyboardLanguage:v12 attributes:v15 hitCount:2];

  return v16;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (NSString)highlightString
{
  return self->_highlightString;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_highlightString, 0);
}

@end