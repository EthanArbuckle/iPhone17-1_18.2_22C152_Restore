@interface ICSearchQueryParser
+ (id)_queryStringForSingleTokenString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5 queryFlags:(id)a6;
+ (id)prefixMatchingQueryStringForSearchString:(id)a3 enableSpellCheckSPI:(BOOL)a4 languageForSpellchecking:(id)a5 expandedTokens:(id *)a6;
+ (id)queryStringForExpandedTokens:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5;
+ (id)queryStringForSearchString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5;
@end

@implementation ICSearchQueryParser

+ (id)_queryStringForSingleTokenString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5 queryFlags:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F837D8] stringByEscapingSearchString:v9];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14;
  v29 = __Block_byref_object_dispose__14;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F837D8] queryFields];
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __89__ICSearchQueryParser__queryStringForSingleTokenString_queryFields_matchType_queryFlags___block_invoke;
  v20 = &unk_1E64A5CB0;
  id v13 = v12;
  id v21 = v13;
  id v14 = v11;
  unsigned __int8 v24 = a5;
  id v22 = v14;
  v23 = &v25;
  [v10 enumerateObjectsUsingBlock:&v17];
  v15 = objc_msgSend((id)v26[5], "componentsJoinedByString:", @" || ", v17, v18, v19, v20);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __89__ICSearchQueryParser__queryStringForSingleTokenString_queryFields_matchType_queryFlags___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3) {
    v4 = *(__CFString **)(a1 + 40);
  }
  else {
    v4 = &stru_1F1F2FFF8;
  }
  v5 = v4;
  switch(*(unsigned char *)(a1 + 56))
  {
    case 0:
      [NSString stringWithFormat:@"%@=\"%@\"%@", v10, *(void *)(a1 + 32), v5];
      goto LABEL_10;
    case 1:
      [NSString stringWithFormat:@"%@=\"%@*\"%@", v10, *(void *)(a1 + 32), v5];
      goto LABEL_10;
    case 2:
      if (v3)
      {
        v6 = NSString;
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%3.3d", 66);
        v8 = [v6 stringWithFormat:@"f%@", v7];
      }
      else
      {
        v8 = &stru_1F1F2FFF8;
      }
      id v9 = [NSString stringWithFormat:@"%@=\"%@*\"%@%@", v10, *(void *)(a1 + 32), v5, v8];

      if (!v9) {
        break;
      }
      goto LABEL_11;
    case 3:
      [NSString stringWithFormat:@"%@=\"*%@*\"%@", v10, *(void *)(a1 + 32), v5];
      id v9 = LABEL_10:;
      if (v9)
      {
LABEL_11:
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
      }
      break;
    default:
      break;
  }
}

+ (id)queryStringForSearchString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5
{
  return (id)[a1 _queryStringForSingleTokenString:a3 queryFields:a4 matchType:a5 queryFlags:@"cwdt"];
}

+ (id)queryStringForExpandedTokens:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v11 count])
        {
          unint64_t v13 = 0;
          do
          {
            id v14 = [v11 objectAtIndexedSubscript:v13];
            if (v13) {
              uint64_t v15 = 0;
            }
            else {
              uint64_t v15 = v5;
            }
            v16 = [a1 _queryStringForSingleTokenString:v14 queryFields:v9 matchType:v15 queryFlags:@"cwd"];
            [v12 addObject:v16];

            ++v13;
          }
          while (v13 < [v11 count]);
        }
        uint64_t v17 = NSString;
        uint64_t v18 = [v12 componentsJoinedByString:@" || "];
        v19 = [v17 stringWithFormat:@"(%@)", v18];

        [v24 addObject:v19];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v25);
  }

  v20 = [v24 componentsJoinedByString:@" && "];

  return v20;
}

+ (id)prefixMatchingQueryStringForSearchString:(id)a3 enableSpellCheckSPI:(BOOL)a4 languageForSpellchecking:(id)a5 expandedTokens:(id *)a6
{
  BOOL v8 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v13 = [v12 BOOLForKey:*MEMORY[0x1E4F83898]];

  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = !v8;
  }
  if (v14)
  {
    id v20 = v10;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v21[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    uint64_t v17 = [a1 queryStringForSearchString:v10 queryFields:0 matchType:1];
  }
  else
  {
    v16 = +[ICSearchQueryTokenizer expandedTokensForSearchString:v10 language:v11];
    uint64_t v17 = [a1 queryStringForExpandedTokens:v16 queryFields:0 matchType:1];
  }
  uint64_t v18 = (void *)v17;
  if (a6) {
    *a6 = v16;
  }

  return v18;
}

@end