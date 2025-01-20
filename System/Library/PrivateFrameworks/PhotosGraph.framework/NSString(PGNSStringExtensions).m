@interface NSString(PGNSStringExtensions)
- (id)_pg_stringByRemovingRegExPattern:()PGNSStringExtensions;
- (id)pg_stringByRemovingDates;
- (id)pg_stringByRemovingParentheses;
- (id)pg_stringByTrailingCharactersInSet:()PGNSStringExtensions options:;
- (uint64_t)pg_stringByRemovingParenthesesAndBrackets;
- (unint64_t)pg_levenshteinDistanceToString:()PGNSStringExtensions;
@end

@implementation NSString(PGNSStringExtensions)

- (unint64_t)pg_levenshteinDistanceToString:()PGNSStringExtensions
{
  id v4 = a3;
  if ([a1 isEqualToString:v4])
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = [a1 length];
    uint64_t v7 = [v4 length];
    unint64_t v5 = v7;
    if (v6)
    {
      if (v7)
      {
        uint64_t v8 = v7 + 1;
        BOOL v9 = v7 == -1;
        v10 = malloc_type_calloc(v7 + 1, 8uLL, 0x100004000313F17uLL);
        v11 = malloc_type_calloc(v5 + 1, 8uLL, 0x100004000313F17uLL);
        if (!v9)
        {
          uint64_t v12 = 0;
          do
          {
            v10[v12] = v12;
            ++v12;
          }
          while (v8 != v12);
        }
        unint64_t v13 = 0;
        if (v5 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v5;
        }
        unint64_t v28 = v5;
        unint64_t v29 = v6 - 1;
        if (v6 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v6;
        }
        do
        {
          unint64_t v16 = v13 + 1;
          void *v11 = v13 + 1;
          v17 = a1;
          int v18 = objc_msgSend(a1, "characterAtIndex:", v13, v28);
          uint64_t v19 = 0;
          do
          {
            int v20 = [v4 characterAtIndex:v19];
            v21 = &v11[v19];
            unint64_t v22 = *v21 + 1;
            uint64_t v23 = v19 + 1;
            unint64_t v24 = v10[v19];
            uint64_t v25 = v10[v19 + 1];
            if (v18 != v20) {
              ++v24;
            }
            if (v22 >= v25 + 1) {
              unint64_t v22 = v25 + 1;
            }
            if (v22 >= v24) {
              unint64_t v22 = v24;
            }
            v21[1] = v22;
            ++v19;
          }
          while (v14 != v23);
          if (v13 >= v29) {
            v26 = v10;
          }
          else {
            v26 = v11;
          }
          if (v13 < v29) {
            v11 = v10;
          }
          ++v13;
          v10 = v26;
          a1 = v17;
        }
        while (v16 != v15);
        unint64_t v5 = v11[v28];
        free(v26);
        free(v11);
      }
      else
      {
        unint64_t v5 = v6;
      }
    }
  }

  return v5;
}

- (id)pg_stringByTrailingCharactersInSet:()PGNSStringExtensions options:
{
  id v6 = a3;
  if (!a4 || (a4 & 4) != 0)
  {
    id v7 = [a1 stringByTrimmingCharactersInSet:v6];
  }
  else
  {
    id v7 = a1;
    if (a4)
    {
      uint64_t v8 = [v6 invertedSet];
      uint64_t v9 = [v7 rangeOfCharacterFromSet:v8];

      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = &stru_1F283BC78;
      }
      else
      {
        v10 = [v7 substringFromIndex:v9];
      }

      id v7 = v10;
    }
    if ((a4 & 2) != 0)
    {
      v11 = [v6 invertedSet];
      uint64_t v12 = [v7 rangeOfCharacterFromSet:v11 options:4];

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v13 = &stru_1F283BC78;
      }
      else
      {
        unint64_t v13 = [v7 substringToIndex:v12 + 1];
      }

      id v7 = v13;
    }
  }

  return v7;
}

- (id)pg_stringByRemovingDates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:8 error:0];
  v3 = objc_msgSend(v2, "matchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  if ([v3 count])
  {
    id v4 = (void *)[v1 mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v5 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) range];
          objc_msgSend(v4, "replaceCharactersInRange:withString:", v10, v11, &stru_1F283BC78);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v13 = objc_msgSend(v4, "pg_stringByTrailingCharactersInSet:options:", v12, 3);

    id v1 = (id)v13;
  }

  return v1;
}

- (id)_pg_stringByRemovingRegExPattern:()PGNSStringExtensions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v26 = 0;
  unint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:a3 options:0 error:&v26];
  id v6 = v26;
  if (v6)
  {
    uint64_t v7 = +[PGLogging sharedLogging];
    uint64_t v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Error when creating regex pattern: %@", buf, 0xCu);
    }

    id v9 = v4;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    if ([v10 count])
    {
      uint64_t v11 = (void *)[v4 mutableCopy];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v12 = objc_msgSend(v10, "reverseObjectEnumerator", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) range];
            objc_msgSend(v11, "replaceCharactersInRange:withString:", v17, v18, &stru_1F283BC78);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v14);
      }

      uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v20 = objc_msgSend(v11, "pg_stringByTrailingCharactersInSet:options:", v19, 3);

      id v4 = (id)v20;
    }
    id v9 = v4;
  }
  return v9;
}

- (id)pg_stringByRemovingParentheses
{
  id v1 = objc_msgSend(a1, "_pg_stringByRemovingRegExPattern:", @" \\([^()]*\\)");
  v2 = objc_msgSend(v1, "_pg_stringByRemovingRegExPattern:", @" \\(.*?\\)");

  return v2;
}

- (uint64_t)pg_stringByRemovingParenthesesAndBrackets
{
  return objc_msgSend(a1, "_pg_stringByRemovingRegExPattern:", @"(\\[.*?\\])|(\\(.*?\\))");
}

@end