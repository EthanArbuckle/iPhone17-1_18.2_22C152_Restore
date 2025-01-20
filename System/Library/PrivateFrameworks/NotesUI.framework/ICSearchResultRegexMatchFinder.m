@interface ICSearchResultRegexMatchFinder
+ (BOOL)textCheckingResultsAreValid:(id)a3;
+ (id)matchesForToken:(id)a3 inDocument:(id)a4 checkPrefixBeforeFallingBack:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (ICSearchResultRegexMatchFinder)initWithPrefixMatchingTokens:(id)a3 substringMatchingTokens:(id)a4 searchString:(id)a5;
- (ICSearchResultRegexMatchFinder)initWithSearchString:(id)a3;
- (NSRegularExpression)fallbackRegex;
- (NSRegularExpression)normalRegex;
- (NSSet)prefixMatchingTokens;
- (NSSet)substringMatchingTokens;
- (NSString)searchString;
- (id)firstMatchInDocumentWithGlobalFallback:(id)a3;
- (id)matchesInDocumentWithPerTokenFallback:(id)a3;
- (unint64_t)hash;
- (void)setFallbackRegex:(id)a3;
- (void)setNormalRegex:(id)a3;
- (void)setPrefixMatchingTokens:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSubstringMatchingTokens:(id)a3;
@end

@implementation ICSearchResultRegexMatchFinder

- (ICSearchResultRegexMatchFinder)initWithSearchString:(id)a3
{
  return [(ICSearchResultRegexMatchFinder *)self initWithPrefixMatchingTokens:0 substringMatchingTokens:0 searchString:a3];
}

- (ICSearchResultRegexMatchFinder)initWithPrefixMatchingTokens:(id)a3 substringMatchingTokens:(id)a4 searchString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ICSearchResultRegexMatchFinder;
  v11 = [(ICSearchResultRegexMatchFinder *)&v31 init];
  if (v11)
  {
    v12 = v8;
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v13 = [v12 setByAddingObject:v10];
    prefixMatchingTokens = v11->_prefixMatchingTokens;
    v11->_prefixMatchingTokens = (NSSet *)v13;

    if (!v8) {
    v15 = v9;
    }
    if (!v9)
    {
      v15 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v16 = [v15 setByAddingObject:v10];
    substringMatchingTokens = v11->_substringMatchingTokens;
    v11->_substringMatchingTokens = (NSSet *)v16;

    if (!v9) {
    objc_storeStrong((id *)&v11->_searchString, a5);
    }
    v18 = (void *)MEMORY[0x1E4F28FD8];
    v19 = [(NSSet *)v11->_prefixMatchingTokens allObjects];
    v20 = [(NSSet *)v11->_substringMatchingTokens allObjects];
    uint64_t v21 = objc_msgSend(v18, "ic_regexForPrefixMatchingTokens:substringMatchingTokens:", v19, v20);
    normalRegex = v11->_normalRegex;
    v11->_normalRegex = (NSRegularExpression *)v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v24 = [(NSSet *)v11->_prefixMatchingTokens allObjects];
    [v23 addObjectsFromArray:v24];

    v25 = [(NSSet *)v11->_substringMatchingTokens allObjects];
    [v23 addObjectsFromArray:v25];

    v26 = (void *)MEMORY[0x1E4F28FD8];
    v27 = [v23 allObjects];
    uint64_t v28 = objc_msgSend(v26, "ic_regexForSearchStrings:", v27);
    fallbackRegex = v11->_fallbackRegex;
    v11->_fallbackRegex = (NSRegularExpression *)v28;
  }
  return v11;
}

- (id)firstMatchInDocumentWithGlobalFallback:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (void *)MEMORY[0x1E4F28FD8];
    v6 = [(ICSearchResultRegexMatchFinder *)self searchString];
    v24[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v8 = objc_msgSend(v5, "ic_regexForSearchStrings:matchWordBoundaries:", v7, 1);

    id v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    id v10 = v9;
    if (!v9 || [v9 range] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)MEMORY[0x1E4F28FD8];
      v12 = [(ICSearchResultRegexMatchFinder *)self searchString];
      id v23 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      v14 = objc_msgSend(v11, "ic_regexForSearchStrings:matchWordBoundaries:", v13, 0);

      uint64_t v15 = objc_msgSend(v14, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

      id v10 = (void *)v15;
      if (!v15) {
        goto LABEL_8;
      }
    }
    if ([v10 range] == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      uint64_t v16 = [(ICSearchResultRegexMatchFinder *)self normalRegex];

      if (v16)
      {
        v17 = [(ICSearchResultRegexMatchFinder *)self normalRegex];
        uint64_t v18 = objc_msgSend(v17, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

        id v10 = (void *)v18;
      }
      if (!v10) {
        goto LABEL_10;
      }
    }
    if ([v10 range] == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_10:
      v19 = [(ICSearchResultRegexMatchFinder *)self fallbackRegex];

      if (v19)
      {
        v20 = [(ICSearchResultRegexMatchFinder *)self fallbackRegex];
        uint64_t v21 = objc_msgSend(v20, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

        id v10 = (void *)v21;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)matchesInDocumentWithPerTokenFallback:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v4 length])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = [(ICSearchResultRegexMatchFinder *)self prefixMatchingTokens];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [(id)objc_opt_class() matchesForToken:*(void *)(*((void *)&v24 + 1) + 8 * i) inDocument:v4 checkPrefixBeforeFallingBack:1];
          if (v11) {
            [v5 addObjectsFromArray:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = [(ICSearchResultRegexMatchFinder *)self substringMatchingTokens];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [(id)objc_opt_class() matchesForToken:*(void *)(*((void *)&v20 + 1) + 8 * j) inDocument:v4 checkPrefixBeforeFallingBack:0];
          if (v17) {
            [v5 addObjectsFromArray:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }
  }
  uint64_t v18 = (void *)[v5 copy];

  return v18;
}

+ (id)matchesForToken:(id)a3 inDocument:(id)a4 checkPrefixBeforeFallingBack:(BOOL)a5
{
  BOOL v5 = a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 length])
  {
    if (v5)
    {
      id v10 = (void *)MEMORY[0x1E4F28FD8];
      v19[0] = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v12 = objc_msgSend(v10, "ic_regexForSearchStrings:matchWordBoundaries:", v11, 1);

      uint64_t v13 = objc_msgSend(v12, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
      if ([a1 textCheckingResultsAreValid:v13])
      {

        if (v13) {
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28FD8];
    id v18 = v8;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    uint64_t v16 = objc_msgSend(v14, "ic_regexForSearchStrings:matchWordBoundaries:", v15, 0);

    uint64_t v13 = objc_msgSend(v16, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_9:

  return v13;
}

+ (BOOL)textCheckingResultsAreValid:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "range", (void)v10) != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    id v5 = ICDynamicCast();
    uint64_t v6 = [(ICSearchResultRegexMatchFinder *)self searchString];
    uint64_t v7 = [v5 searchString];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(ICSearchResultRegexMatchFinder *)self prefixMatchingTokens];
      id v9 = [v5 prefixMatchingTokens];
      if ([v8 isEqualToSet:v9])
      {
        long long v10 = [(ICSearchResultRegexMatchFinder *)self substringMatchingTokens];
        long long v11 = [v5 substringMatchingTokens];
        char v12 = [v10 isEqualToSet:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICSearchResultRegexMatchFinder *)self searchString];
  v22[0] = v3;
  id v4 = [(ICSearchResultRegexMatchFinder *)self prefixMatchingTokens];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  v22[1] = v5;
  uint64_t v6 = [(ICSearchResultRegexMatchFinder *)self substringMatchingTokens];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  v22[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v9 = (objc_class *)objc_opt_class();
  long long v10 = NSStringFromClass(v9);
  unint64_t v11 = [v10 hash];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v11 = ICHashWithObject(*(void **)(*((void *)&v18 + 1) + 8 * i)) - v11 + 32 * v11;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v14);
  }

  if (!v6) {
  if (!v4)
  }

  return v11;
}

- (NSRegularExpression)normalRegex
{
  return self->_normalRegex;
}

- (void)setNormalRegex:(id)a3
{
}

- (NSSet)prefixMatchingTokens
{
  return self->_prefixMatchingTokens;
}

- (void)setPrefixMatchingTokens:(id)a3
{
}

- (NSSet)substringMatchingTokens
{
  return self->_substringMatchingTokens;
}

- (void)setSubstringMatchingTokens:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSRegularExpression)fallbackRegex
{
  return self->_fallbackRegex;
}

- (void)setFallbackRegex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackRegex, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_substringMatchingTokens, 0);
  objc_storeStrong((id *)&self->_prefixMatchingTokens, 0);
  objc_storeStrong((id *)&self->_normalRegex, 0);
}

@end