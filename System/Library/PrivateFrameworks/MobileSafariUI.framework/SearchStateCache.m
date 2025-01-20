@interface SearchStateCache
- (SearchStateCache)init;
- (id)_cacheQueryForTabDocument:(id)a3;
- (id)cachedCompletionListForTabDocument:(id)a3;
- (int64_t)idOfParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3;
- (void)cacheAcceptanceOfCompletionItem:(id)a3 withCompletionList:(id)a4 forTabDocument:(id)a5;
- (void)cacheSearchQueryID:(int64_t)a3 forTab:(id)a4;
- (void)clearParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3;
- (void)removeCachedSearchStateForTabDocument:(id)a3;
@end

@implementation SearchStateCache

- (SearchStateCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchStateCache;
  v2 = [(SearchStateCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    cache = v2->_cache;
    v2->_cache = (NSMapTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)cacheAcceptanceOfCompletionItem:(id)a3 withCompletionList:(id)a4 forTabDocument:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v25 originalURLString];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v25;
      v13 = [v12 url];
      v10 = [v13 absoluteString];

      v14 = [v12 domainName];

      uint64_t v15 = [v14 isEqualToString:@"web_answer"];
LABEL_12:
      uint64_t v19 = 0;
      goto LABEL_13;
    }
    v10 = 0;
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  id v11 = v25;
  if ([v11 goesToURL])
  {
    v10 = [v11 string];
  }
  else
  {
    v16 = [v11 string];
    v17 = +[SearchQueryBuilder searchQueryBuilderWithQuery:forPrivateBrowsing:](SearchQueryBuilder, "searchQueryBuilderWithQuery:forPrivateBrowsing:", v16, [v9 isPrivateBrowsingEnabled]);
    v18 = [v17 searchURL];
    v10 = [v18 absoluteString];
  }
  uint64_t v15 = 0;
  uint64_t v19 = 1;
LABEL_13:
  if ([v10 length] || v15)
  {
    [v8 cacheCurrentCompletionsAfterAcceptanceOfCompletionItem:v25];
    v20 = [(SearchStateCache *)self _cacheQueryForTabDocument:v9];
    [v20 setCompletionList:v8];
    if ([v10 length])
    {
      v21 = [MEMORY[0x1E4F29088] componentsWithString:v10];
      v22 = [v21 host];
      v23 = objc_msgSend(v22, "safari_domainFromHost");
      [v20 setDestinationTLD:v23];
    }
    else
    {
      [v20 setDestinationTLD:0];
    }
    [v20 setDidOriginateFromSearchSuggestion:v19];
    [v20 setDidOriginateFromMultipartWebAnswer:v15];
    if ([v8 hasParsecResults])
    {
      v24 = [v8 query];
      objc_msgSend(v20, "setParsecQueryID:", objc_msgSend(v24, "queryID"));
    }
    else
    {
      [v20 setParsecQueryID:0];
    }
  }
}

- (id)_cacheQueryForTabDocument:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SearchStateItem);
  v6 = [MEMORY[0x1E4F1C9C8] date];
  [(SearchStateItem *)v5 setCacheDate:v6];

  [(NSMapTable *)self->_cache setObject:v5 forKey:v4];
  return v5;
}

- (void)cacheSearchQueryID:(int64_t)a3 forTab:(id)a4
{
  id v5 = [(SearchStateCache *)self _cacheQueryForTabDocument:a4];
  [v5 setParsecQueryID:a3];
  [v5 setDidOriginateFromSearchSuggestion:1];
}

- (void)removeCachedSearchStateForTabDocument:(id)a3
{
}

- (void)clearParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_cache objectForKey:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 setDidOriginateFromSearchSuggestion:0];
    [v4 setParsecQueryID:0];
    uint64_t v3 = v4;
  }
}

- (int64_t)idOfParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_cache objectForKey:a3];
  id v4 = v3;
  if (v3 && [v3 didOriginateFromSearchSuggestion]) {
    int64_t v5 = [v4 parsecQueryID];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)cachedCompletionListForTabDocument:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSMapTable *)self->_cache objectForKey:v4];
  v6 = [v4 URL];
  objc_super v7 = [v6 host];
  id v8 = objc_msgSend(v7, "safari_domainFromHost");

  id v9 = [v5 cacheDate];
  [v9 timeIntervalSinceNow];
  if (v10 <= -480.0)
  {
  }
  else
  {
    if ([v5 didOriginateFromMultipartWebAnswer])
    {

LABEL_6:
      v13 = [v5 completionList];
      goto LABEL_8;
    }
    id v11 = [v5 destinationTLD];
    int v12 = objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", v11);

    if (v12) {
      goto LABEL_6;
    }
  }
  [(SearchStateCache *)self removeCachedSearchStateForTabDocument:v4];
  v13 = 0;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
}

@end