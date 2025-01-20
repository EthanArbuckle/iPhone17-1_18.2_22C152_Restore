@interface WBSCompletionQuery
+ (id)recentAndSuggestedCompletionStringsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 literalSearch:(id)a5;
+ (int64_t)currentQueryID;
- (BOOL)_bagOfWordsContainsString:(id)a3;
- (BOOL)isForLastSearch;
- (NSArray)queryItems;
- (NSArray)querySuggestions;
- (NSString)canonicalQueryString;
- (NSString)parsecFeedbackQueryIdentifier;
- (NSString)profileIdentifierToFilterResults;
- (NSString)queryString;
- (NSString)queryStringBeforeRewriting;
- (NSString)rewrittenQueryStringFromParsec;
- (NSString)searchSuggestionProviderIdentifier;
- (NSURLRequest)parsecSearchRequest;
- (WBSCompletionQuery)init;
- (WBSCompletionQuery)initWithNewQueryString:(id)a3 queryBeforeRewriting:(id)a4;
- (WBSCompletionQuery)initWithQueryString:(id)a3;
- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4;
- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4 triggerEvent:(unint64_t)a5;
- (WBSCompletionQuery)initWithQueryString:(id)a3 triggerEvent:(unint64_t)a4;
- (duration<long)parsecLatency;
- (duration<long)searchSuggestionProviderLatency;
- (id).cxx_construct;
- (id)_bagOfWords;
- (id)_initWithQueryString:(id)a3 queryID:(int64_t)a4 timestamp:()time_point<std:(std:()std:(1000000000>>>)a5 :(unint64_t)a6 ratio<1 :(unint64_t)a7 chrono::duration<long)long :chrono::steady_clock indexInFeedbackArray:triggerEvent:;
- (id)_rangesOfMatchedTextInString:(id)a3 offset:(unint64_t)a4;
- (id)description;
- (id)rangesOfMatchedTextInTitle:(id)a3 displayOnlyAddress:(id)a4;
- (id)rangesToHighlightInSearchSuggestion:(id)a3;
- (int64_t)queryID;
- (time_point<std::chrono::steady_clock,)timestamp;
- (unint64_t)indexInFeedbackArray;
- (unint64_t)triggerEvent;
- (void)setForLastSearch:(BOOL)a3;
- (void)setIndexInFeedbackArray:(unint64_t)a3;
- (void)setParsecFeedbackQueryIdentifier:(id)a3;
- (void)setParsecLatency:(duration<long)long;
- (void)setParsecSearchRequest:(id)a3;
- (void)setProfileIdentifierToFilterResults:(id)a3;
- (void)setQueryItems:(id)a3;
- (void)setQuerySuggestions:(id)a3;
- (void)setRewrittenQueryStringFromParsec:(id)a3;
- (void)setSearchSuggestionProviderIdentifier:(id)a3;
- (void)setSearchSuggestionProviderLatency:(duration<long)long;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation WBSCompletionQuery

+ (int64_t)currentQueryID
{
  return atomic_load(&_currentQueryID);
}

- (WBSCompletionQuery)init
{
  return 0;
}

- (id)_initWithQueryString:(id)a3 queryID:(int64_t)a4 timestamp:()time_point<std:(std:()std:(1000000000>>>)a5 :(unint64_t)a6 ratio<1 :(unint64_t)a7 chrono::duration<long)long :chrono::steady_clock indexInFeedbackArray:triggerEvent:
{
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSCompletionQuery;
  v13 = [(WBSCompletionQuery *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    queryString = v13->_queryString;
    v13->_queryString = (NSString *)v14;

    v13->_queryID = a4;
    v13->_timestamp = a5;
    v13->_indexInFeedbackArray = a6;
    v13->_triggerEvent = a7;
    v16 = v13;
  }

  return v13;
}

- (WBSCompletionQuery)initWithQueryString:(id)a3
{
  return [(WBSCompletionQuery *)self initWithNewQueryString:a3 queryBeforeRewriting:0];
}

- (WBSCompletionQuery)initWithNewQueryString:(id)a3 queryBeforeRewriting:(id)a4
{
  id v6 = a3;
  v7 = (id *)a4;
  v8 = [(WBSCompletionQuery *)self initWithQueryString:v6 queryID:atomic_fetch_add((atomic_ullong *volatile)&_currentQueryID, 1uLL) + 1];
  if (v8)
  {
    uint64_t v9 = [v7 queryString];
    queryStringBeforeRewriting = v8->_queryStringBeforeRewriting;
    v8->_queryStringBeforeRewriting = (NSString *)v9;

    if (v7)
    {
      objc_storeStrong((id *)&v8->_cachedBagOfWords, v7[1]);
      objc_storeStrong((id *)&v8->_profileIdentifierToFilterResults, v7[7]);
    }
    v11 = v8;
  }

  return v8;
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 triggerEvent:(unint64_t)a4
{
  return [(WBSCompletionQuery *)self initWithQueryString:a3 queryID:atomic_fetch_add((atomic_ullong *volatile)&_currentQueryID, 1uLL) + 1 triggerEvent:a4];
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4
{
  return [(WBSCompletionQuery *)self initWithQueryString:a3 queryID:a4 triggerEvent:1];
}

- (WBSCompletionQuery)initWithQueryString:(id)a3 queryID:(int64_t)a4 triggerEvent:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(WBSCompletionQuery *)self _initWithQueryString:v8 queryID:a4 timestamp:std::chrono::steady_clock::now().__d_.__rep_ indexInFeedbackArray:0x7FFFFFFFFFFFFFFFLL triggerEvent:a5];

  return v9;
}

- (NSString)canonicalQueryString
{
  uint64_t v2 = 64;
  if (!self->_queryStringBeforeRewriting) {
    uint64_t v2 = 32;
  }
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p string = \"%@\">", v5, self, self->_queryString];;

  return v6;
}

- (id)_bagOfWords
{
  cachedBagOfWords = self->_cachedBagOfWords;
  if (!cachedBagOfWords)
  {
    v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = 64;
    if (!self->_queryStringBeforeRewriting) {
      uint64_t v5 = 32;
    }
    id v6 = *(id *)((char *)&self->super.isa + v5);
    uint64_t v7 = [v6 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__WBSCompletionQuery__bagOfWords__block_invoke;
    v12[3] = &unk_1E5C8E478;
    id v8 = v4;
    id v13 = v8;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v12);
    uint64_t v9 = (NSSet *)[v8 copy];
    v10 = self->_cachedBagOfWords;
    self->_cachedBagOfWords = v9;

    cachedBagOfWords = self->_cachedBagOfWords;
  }
  return cachedBagOfWords;
}

void __33__WBSCompletionQuery__bagOfWords__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = objc_msgSend(v10, "safari_stringByTrimmingWhitespace");
  if ([v3 length])
  {
    if (objc_msgSend(v3, "safari_containsCJKCharacters"))
    {
      for (unint64_t i = 0; i < [v3 length]; ++i)
      {
        uint64_t v5 = objc_msgSend(v3, "substringWithRange:", i, 1);
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = [v5 lowercaseString];
        [v6 addObject:v7];
      }
    }
    else
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v3 lowercaseString];
      [v8 addObject:v9];
    }
  }
}

- (BOOL)_bagOfWordsContainsString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(WBSCompletionQuery *)self _bagOfWords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", v4, 8)
          && v10 == [v9 length])
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)rangesToHighlightInSearchSuggestion:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = 64;
  if (!self->_queryStringBeforeRewriting) {
    uint64_t v5 = 32;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  uint64_t v7 = objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
  id v8 = [v7 lowercaseString];

  if (v4 && [v8 length])
  {
    if (objc_msgSend(v4, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", v8, 8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = [v4 length];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __58__WBSCompletionQuery_rangesToHighlightInSearchSuggestion___block_invoke;
      objc_super v18 = &unk_1E5C8E4A0;
      v19 = self;
      id v12 = v10;
      id v20 = v12;
      objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, &v15);
      long long v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, objc_msgSend(v4, "length") - v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    }
  }
  else
  {
    long long v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __58__WBSCompletionQuery_rangesToHighlightInSearchSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = objc_msgSend(v7, "safari_stringByTrimmingWhitespace");
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v23 = [v7 lowercaseString];

    if (objc_msgSend(v23, "safari_containsCJKCharacters"))
    {
      for (unint64_t i = 0; i < [v23 length]; ++i)
      {
        uint64_t v11 = objc_msgSend(v23, "substringWithRange:", i, 1);
        id v12 = [*(id *)(a1 + 32) _bagOfWords];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          long long v14 = *(void **)(a1 + 40);
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3 + i, 1);
          [v14 addObject:v15];
        }
      }
    }
    else
    {
      uint64_t v17 = [v23 length];
      if (v17)
      {
        objc_super v18 = v23;
        while (1)
        {
          v19 = *(void **)(a1 + 32);
          id v20 = [v18 substringToIndex:v17];
          LOBYTE(v19) = [v19 _bagOfWordsContainsString:v20];

          if (v19) {
            break;
          }
          --v17;
          objc_super v18 = v23;
          if (!v17) {
            goto LABEL_15;
          }
        }
      }
      objc_super v18 = v23;
LABEL_15:
      if (v17 != [v18 length])
      {
        v21 = *(void **)(a1 + 40);
        v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17 + a3, a4 - v17);
        [v21 addObject:v22];
      }
    }
    uint64_t v16 = v23;
  }
  else
  {
    uint64_t v16 = v7;
  }
}

- (id)rangesOfMatchedTextInTitle:(id)a3 displayOnlyAddress:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  uint64_t v6 = 64;
  if (!self->_queryStringBeforeRewriting) {
    uint64_t v6 = 32;
  }
  id v29 = *(id *)((char *)&self->super.isa + v6);
  id v7 = objc_msgSend(v29, "safari_stringByTrimmingWhitespace");
  id v8 = [v7 lowercaseString];

  if (![v8 length])
  {
    uint64_t v17 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = [v31 lowercaseString];
  int v10 = [v9 hasPrefix:v8];

  uint64_t v11 = [v32 lowercaseString];
  id v12 = [v11 substringFromIndex:1];
  int v13 = [v12 hasPrefix:v8];

  if ((v10 | v13) != 1)
  {
    v30 = [(WBSCompletionQuery *)self _rangesOfMatchedTextInString:v31 offset:0];
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    objc_super v18 = [v32 componentsSeparatedByString:@"."];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v24 = [(WBSCompletionQuery *)self _rangesOfMatchedTextInString:v23 offset:v20];
          [v16 addObjectsFromArray:v24];
          uint64_t v25 = [v23 length];

          v20 += v25 + 1;
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    id v26 = objc_alloc(MEMORY[0x1E4F97EE0]);
    v27 = (void *)[v16 copy];
    uint64_t v17 = (void *)[v26 initWithFirst:v30 second:v27];

    goto LABEL_20;
  }
  if (!v10)
  {
    v30 = (void *)MEMORY[0x1E4F1CBF0];
    if (v13) {
      goto LABEL_7;
    }
LABEL_18:
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  long long v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, objc_msgSend(v8, "length"));
  v39[0] = v14;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

  if (!v13) {
    goto LABEL_18;
  }
LABEL_7:
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1, objc_msgSend(v8, "length"));
  v38 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];

LABEL_19:
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:v30 second:v16];
LABEL_20:

LABEL_21:
  return v17;
}

- (id)_rangesOfMatchedTextInString:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v6 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__WBSCompletionQuery__rangesOfMatchedTextInString_offset___block_invoke;
  v12[3] = &unk_1E5C8E4C8;
  void v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  unint64_t v14 = a4;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 3, v12);
  int v10 = (void *)[v9 copy];

  return v10;
}

void __58__WBSCompletionQuery__rangesOfMatchedTextInString_offset___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v21 = [v5 lowercaseString];

    if (objc_msgSend(v21, "safari_containsCJKCharacters"))
    {
      for (unint64_t i = 0; i < [v21 length]; ++i)
      {
        id v9 = objc_msgSend(v21, "substringWithRange:", i, 1);
        int v10 = [*(id *)(a1 + 32) _bagOfWords];
        int v11 = [v10 containsObject:v9];

        if (v11)
        {
          id v12 = *(void **)(a1 + 40);
          id v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3 + i + *(void *)(a1 + 48), 1);
          [v12 addObject:v13];
        }
      }
    }
    else
    {
      uint64_t v15 = [v21 length];
      if (v15)
      {
        while (1)
        {
          uint64_t v16 = [*(id *)(a1 + 32) _bagOfWords];
          uint64_t v17 = [v21 substringToIndex:v15];
          char v18 = [v16 containsObject:v17];

          if (v18) {
            break;
          }
          if (!--v15) {
            goto LABEL_14;
          }
        }
        uint64_t v19 = *(void **)(a1 + 40);
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(void *)(a1 + 48) + a3, v15);
        [v19 addObject:v20];
      }
    }
LABEL_14:
    unint64_t v14 = v21;
  }
  else
  {
    unint64_t v14 = v5;
  }
}

+ (id)recentAndSuggestedCompletionStringsByMergingRecentSearches:(id)a3 withSuggestions:(id)a4 literalSearch:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v7, "count", v9);
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v10];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke;
  v30[3] = &unk_1E5C8E4F0;
  id v12 = v9;
  id v31 = v12;
  uint64_t v33 = v10;
  id v13 = v11;
  id v32 = v13;
  [v7 enumerateObjectsUsingBlock:v30];
  uint64_t v14 = [v8 count];
  uint64_t v15 = (void *)[v13 copy];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_2;
  v24[3] = &unk_1E5C8E540;
  id v17 = v12;
  id v25 = v17;
  id v18 = v15;
  id v26 = v18;
  id v19 = v16;
  id v27 = v19;
  uint64_t v29 = v14;
  id v20 = v13;
  id v28 = v20;
  [v8 enumerateObjectsUsingBlock:v24];
  id v21 = [v20 keysSortedByValueUsingComparator:&__block_literal_global_24];
  v22 = [v21 arrayByAddingObjectsFromArray:v19];

  return v22;
}

void __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if ((objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
  {
    *(float *)&double v5 = (float)((float)((float)(unint64_t)(*(void *)(a1 + 48) - a3) * 0.9)
                          / (float)*(unint64_t *)(a1 + 48))
                  + 1.1;
    id v6 = [NSNumber numberWithFloat:v5];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

void __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 40) allKeys];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_3;
    v14[3] = &unk_1E5C8E518;
    id v7 = v5;
    id v15 = v7;
    id v8 = objc_msgSend(v6, "safari_firstObjectPassingTest:", v14);

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
      [v9 floatValue];
      float v11 = (float)(v10 + 1.0)
          + (float)((float)(unint64_t)(*(void *)(a1 + 64) - a3) / (float)*(unint64_t *)(a1 + 64));

      *(float *)&double v12 = v11;
      id v13 = [NSNumber numberWithFloat:v12];
      [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:v8];
    }
    else
    {
      [*(id *)(a1 + 48) addObject:v7];
    }
  }
}

uint64_t __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_isCaseInsensitiveEqualToString:", a2);
}

uint64_t __111__WBSCompletionQuery_recentAndSuggestedCompletionStringsByMergingRecentSearches_withSuggestions_literalSearch___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)isForLastSearch
{
  return self->_forLastSearch;
}

- (void)setForLastSearch:(BOOL)a3
{
  self->_forLastSearch = a3;
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setQueryItems:(id)a3
{
}

- (NSArray)querySuggestions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQuerySuggestions:(id)a3
{
}

- (NSString)profileIdentifierToFilterResults
{
  return self->_profileIdentifierToFilterResults;
}

- (void)setProfileIdentifierToFilterResults:(id)a3
{
}

- (NSString)queryStringBeforeRewriting
{
  return self->_queryStringBeforeRewriting;
}

- (NSString)rewrittenQueryStringFromParsec
{
  return self->_rewrittenQueryStringFromParsec;
}

- (void)setRewrittenQueryStringFromParsec:(id)a3
{
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (NSString)parsecFeedbackQueryIdentifier
{
  return self->_parsecFeedbackQueryIdentifier;
}

- (void)setParsecFeedbackQueryIdentifier:(id)a3
{
}

- (NSURLRequest)parsecSearchRequest
{
  return self->_parsecSearchRequest;
}

- (void)setParsecSearchRequest:(id)a3
{
}

- (time_point<std::chrono::steady_clock,)timestamp
{
  return self->_timestamp;
}

- (NSString)searchSuggestionProviderIdentifier
{
  return self->_searchSuggestionProviderIdentifier;
}

- (void)setSearchSuggestionProviderIdentifier:(id)a3
{
}

- (duration<long)searchSuggestionProviderLatency
{
  return self->_searchSuggestionProviderLatency;
}

- (void)setSearchSuggestionProviderLatency:(duration<long)long
{
  self->_searchSuggestionProviderLatency = a3;
}

- (duration<long)parsecLatency
{
  return self->_parsecLatency;
}

- (void)setParsecLatency:(duration<long)long
{
  self->_parsecLatency = a3;
}

- (unint64_t)indexInFeedbackArray
{
  return self->_indexInFeedbackArray;
}

- (void)setIndexInFeedbackArray:(unint64_t)a3
{
  self->_indexInFeedbackArray = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_parsecSearchRequest, 0);
  objc_storeStrong((id *)&self->_parsecFeedbackQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryStringFromParsec, 0);
  objc_storeStrong((id *)&self->_queryStringBeforeRewriting, 0);
  objc_storeStrong((id *)&self->_profileIdentifierToFilterResults, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_cachedBagOfWords, 0);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  return self;
}

@end