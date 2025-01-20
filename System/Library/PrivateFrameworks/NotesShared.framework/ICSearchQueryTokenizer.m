@interface ICSearchQueryTokenizer
+ (NLTokenizer)tokenizer;
+ (id)_expandedTokensForSearchQuerySegmentArray:(id)a3 searchString:(id)a4 language:(id)a5;
+ (id)_queryTokensForSearchString:(id)a3 language:(id)a4;
+ (id)connectorCharacterSet;
+ (id)expandedTokensForSearchString:(id)a3 language:(id)a4;
+ (id)nonConnectorCharacterSet;
+ (id)spellChecker;
+ (id)spellCheckerGuessesForSearchString:(id)a3 inRange:(_NSRange)a4 language:(id)a5;
+ (id)tokensFromString:(id)a3 language:(id)a4;
+ (void)_combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:(id)a3 searchString:(id)a4;
+ (void)_insertConnectorAndDividerSegmentsIntoMutableTokenArray:(id)a3 searchString:(id)a4;
+ (void)_sortMutableSearchQueryTokensInPlace:(id)a3;
@end

@implementation ICSearchQueryTokenizer

+ (id)expandedTokensForSearchString:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E4F1CA20];
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 preferredLocalizations];
    v11 = [v10 firstObject];
    id v7 = [v8 canonicalLocaleIdentifierFromString:v11];
  }
  v12 = [a1 _queryTokensForSearchString:v6 language:v7];
  [a1 _sortMutableSearchQueryTokensInPlace:v12];
  [a1 _insertConnectorAndDividerSegmentsIntoMutableTokenArray:v12 searchString:v6];
  [a1 _combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:v12 searchString:v6];
  v13 = [a1 _expandedTokensForSearchQuerySegmentArray:v12 searchString:v6 language:v7];

  return v13;
}

+ (id)tokensFromString:(id)a3 language:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _queryTokensForSearchString:v6 language:a4];
  [a1 _sortMutableSearchQueryTokensInPlace:v7];
  [a1 _insertConnectorAndDividerSegmentsIntoMutableTokenArray:v7 searchString:v6];
  [a1 _combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:v7 searchString:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "segmentString", (void)v17);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];
  return v15;
}

+ (id)_queryTokensForSearchString:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7) {
    goto LABEL_12;
  }
  id v9 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v11 = [v10 preferredLocalizations];
  uint64_t v12 = [v11 firstObject];
  id v7 = [v9 canonicalLocaleIdentifierFromString:v12];

  if (v7)
  {
LABEL_12:
    v13 = [a1 tokenizer];

    if (v13)
    {
      v14 = [a1 tokenizer];
      objc_sync_enter(v14);
      v15 = [a1 tokenizer];
      [v15 setLanguage:v7];

      v16 = [a1 tokenizer];
      [v16 setString:v6];

      long long v17 = [a1 tokenizer];
      uint64_t v18 = [v6 length];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __63__ICSearchQueryTokenizer__queryTokensForSearchString_language___block_invoke;
      v24 = &unk_1E64A7438;
      id v25 = v6;
      id v26 = v8;
      objc_msgSend(v17, "enumerateTokensInRange:usingBlock:", 0, v18, &v21);

      objc_sync_exit(v14);
    }
  }
  if (!objc_msgSend(v8, "count", v21, v22, v23, v24))
  {
    long long v19 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:]([ICSearchQuerySegment alloc], "initWithSegmentString:range:type:isExpandable:", v6, 0, [v6 length], 0, 0);
    [v8 addObject:v19];
  }
  return v8;
}

void __63__ICSearchQueryTokenizer__queryTokensForSearchString_language___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  BOOL v7 = (a4 & 7) == 0;
  id v8 = [ICSearchQuerySegment alloc];
  id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  uint64_t v10 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v8, "initWithSegmentString:range:type:isExpandable:", v9, a2, a3, 0, v7);

  [*(id *)(a1 + 40) addObject:v10];
}

+ (void)_sortMutableSearchQueryTokensInPlace:(id)a3
{
}

uint64_t __63__ICSearchQueryTokenizer__sortMutableSearchQueryTokensInPlace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 segmentRange];
  unint64_t v6 = [v4 segmentRange];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

+ (void)_insertConnectorAndDividerSegmentsIntoMutableTokenArray:(id)a3 searchString:(id)a4
{
  id v58 = a3;
  id v6 = a4;
  if ([v58 count] && objc_msgSend(v6, "length"))
  {
    BOOL v7 = [v58 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 segmentRange];

    unint64_t v9 = 0;
    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [a1 nonConnectorCharacterSet];
      uint64_t v11 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v10, 4, 0, v8);
      uint64_t v13 = v12;

      uint64_t v14 = v8 - (v11 + v13);
      BOOL v15 = v11 == 0x7FFFFFFFFFFFFFFFLL;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v11 + v13;
      }
      if (!v15) {
        uint64_t v8 = v14;
      }
      if (v8)
      {
        long long v17 = [ICSearchQuerySegment alloc];
        uint64_t v18 = objc_msgSend(v6, "substringWithRange:", v16, v8);
        unint64_t v9 = 1;
        long long v19 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v17, "initWithSegmentString:range:type:isExpandable:", v18, v16, v8, 1, 0);

        [v58 insertObject:v19 atIndex:0];
      }
      else
      {
        unint64_t v9 = 0;
      }
    }
    if (v9 < [v58 count])
    {
      long long v20 = &off_1E64A3000;
      do
      {
        uint64_t v21 = [v58 objectAtIndexedSubscript:v9];
        if ([v21 segmentRange] == 0x7FFFFFFFFFFFFFFFLL)
        {

          uint64_t v22 = v58;
        }
        else
        {
          v23 = [v58 objectAtIndexedSubscript:v9];
          uint64_t v24 = [v23 type];

          uint64_t v22 = v58;
          if (!v24)
          {
            id v25 = [v58 objectAtIndexedSubscript:v9];
            uint64_t v26 = [v25 segmentRange];
            unint64_t v28 = v26 + v27;

            if (v9 >= [v58 count] - 1)
            {
              if (v28 < [v6 length])
              {
                unint64_t v30 = [v6 length];
                goto LABEL_25;
              }
LABEL_28:
              uint64_t v31 = 0;
            }
            else
            {
              v29 = [v58 objectAtIndexedSubscript:v9 + 1];
              unint64_t v30 = [v29 segmentRange];

LABEL_25:
              uint64_t v31 = 0;
              if (v30 != 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v32 = v30 - v28;
                if (v30 >= v28)
                {
                  if (v30 > [v6 length]) {
                    goto LABEL_28;
                  }
                  if (v30 == v28)
                  {
                    v33 = (ICSearchQuerySegment *)objc_msgSend(objc_alloc((Class)v20[282]), "initWithSegmentString:range:type:isExpandable:", &stru_1F1F2FFF8, v28, v30 - v28, 2, 0);
                    [v58 insertObject:v33 atIndex:v9 + 1];
                    uint64_t v31 = 1;
                    goto LABEL_48;
                  }
                  id v57 = a1;
                  v34 = [a1 nonConnectorCharacterSet];
                  unint64_t v35 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v34, 0, v28, v30 - v28);

                  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    id v36 = objc_alloc((Class)v20[282]);
                    v37 = objc_msgSend(v6, "substringWithRange:", v28, v30 - v28);
                    v33 = (ICSearchQuerySegment *)objc_msgSend(v36, "initWithSegmentString:range:type:isExpandable:", v37, v28, v32, 1, 0);

                    [v58 insertObject:v33 atIndex:v9 + 1];
                    uint64_t v31 = 1;
                    a1 = v57;
                    goto LABEL_48;
                  }
                  if (v35 == v28)
                  {
                    uint64_t v31 = 0;
                  }
                  else
                  {
                    id v38 = objc_alloc((Class)v20[282]);
                    v39 = objc_msgSend(v6, "substringWithRange:", v28, v35 - v28);
                    v40 = objc_msgSend(v38, "initWithSegmentString:range:type:isExpandable:", v39, v28, v35 - v28, 1, 0);

                    [v58 insertObject:v40 atIndex:v9 + 1];
                    uint64_t v31 = 1;
                  }
                  v41 = [v57 nonConnectorCharacterSet];
                  uint64_t v42 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v41, 4, v28, v30 - v28);
                  uint64_t v44 = v43;

                  unint64_t v45 = v42 + v44;
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    unint64_t v46 = v30 - v45;
                    if (v46)
                    {
                      v47 = [ICSearchQuerySegment alloc];
                      v48 = objc_msgSend(v6, "substringWithRange:", v45, v46);
                      v49 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v47, "initWithSegmentString:range:type:isExpandable:", v48, v45, v46, 1, 0);

                      uint64_t v50 = 1;
                      if (v35 != v28) {
                        uint64_t v50 = 2;
                      }
                      [v58 insertObject:v49 atIndex:v50 + v9];
                      ++v31;
                    }
                  }
                  a1 = v57;
                  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    long long v20 = &off_1E64A3000;
                  }
                  else
                  {
                    long long v20 = &off_1E64A3000;
                    if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      BOOL v51 = v45 > v35;
                      unint64_t v52 = v45 - v35;
                      if (v51)
                      {
                        v53 = [ICSearchQuerySegment alloc];
                        v54 = objc_msgSend(v6, "substringWithRange:", v35, v52);
                        v55 = v53;
                        long long v20 = &off_1E64A3000;
                        v33 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v55, "initWithSegmentString:range:type:isExpandable:", v54, v35, v52, 2, 0);

                        uint64_t v56 = 1;
                        if (v35 != v28) {
                          uint64_t v56 = 2;
                        }
                        [v58 insertObject:v33 atIndex:v56 + v9];
                        ++v31;
LABEL_48:
                      }
                    }
                  }
                }
              }
            }
            v9 += v31 + 1;
            uint64_t v22 = v58;
            continue;
          }
        }
        ++v9;
      }
      while (v9 < [v22 count]);
    }
  }
}

+ (void)_combineConnectorAndTokensAndRemoveDividersInPlaceForMutableTokenArray:(id)a3 searchString:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  if ([v23 count] && objc_msgSend(v23, "count"))
  {
    unint64_t v6 = 0;
    do
    {
      BOOL v7 = [v23 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 type];

      if (v8 == 2)
      {
        [v23 removeObjectAtIndex:v6];
        unint64_t v9 = v23;
      }
      else
      {
        unint64_t v10 = v6;
        unint64_t v9 = v23;
        while (1)
        {
          uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
          uint64_t v12 = [v11 type];

          if (v12 == 2) {
            break;
          }
          BOOL v13 = ++v10 >= [v23 count];
          unint64_t v9 = v23;
          if (v13) {
            goto LABEL_14;
          }
        }
        unint64_t v9 = v23;
LABEL_14:
        if (v10 - 1 > v6)
        {
          uint64_t v14 = [v23 objectAtIndexedSubscript:v6];
          uint64_t v15 = [v14 segmentRange];

          uint64_t v16 = [v23 objectAtIndexedSubscript:v10 - 1];
          uint64_t v17 = [v16 segmentRange];
          uint64_t v19 = v18 - v15 + v17;

          long long v20 = [ICSearchQuerySegment alloc];
          uint64_t v21 = objc_msgSend(v5, "substringWithRange:", v15, v19);
          uint64_t v22 = -[ICSearchQuerySegment initWithSegmentString:range:type:isExpandable:](v20, "initWithSegmentString:range:type:isExpandable:", v21, v15, v19, 0, 0);

          objc_msgSend(v23, "removeObjectsInRange:", v6, v10 - v6);
          [v23 insertObject:v22 atIndex:v6];

          unint64_t v9 = v23;
        }
        ++v6;
      }
    }
    while (v6 < [v9 count]);
  }
}

+ (id)_expandedTokensForSearchQuerySegmentArray:(id)a3 searchString:(id)a4 language:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a4;
  id v8 = a5;
  if (!v8)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA20];
    unint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v11 = [v10 preferredLocalizations];
    uint64_t v12 = [v11 firstObject];
    id v8 = [v9 canonicalLocaleIdentifierFromString:v12];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v14 = +[ICRankingQueriesDefinition maxCountOfVariantsForCountOfTokens:](ICRankingQueriesDefinition, "maxCountOfVariantsForCountOfTokens:", [v7 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  if (v14 <= 1) {
    unint64_t v15 = 1;
  }
  else {
    unint64_t v15 = v14;
  }
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    unint64_t v20 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v21 = 0;
      uint64_t v34 = v18;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * v21);
        if ([v22 isExpandable])
        {
          if (v8)
          {
            uint64_t v23 = [v22 segmentRange];
            id v25 = objc_msgSend(a1, "spellCheckerGuessesForSearchString:inRange:language:", v36, v23, v24, v8);
          }
          else
          {
            uint64_t v27 = [v22 segmentString];
            uint64_t v42 = v27;
            [*(id *)(v20 + 2424) arrayWithObjects:&v42 count:1];
            id v28 = v16;
            unint64_t v30 = v29 = v20;
            id v25 = (void *)[v30 mutableCopy];

            unint64_t v20 = v29;
            id v16 = v28;
            id v8 = 0;
            uint64_t v18 = v34;
          }
          if ([v25 count] > v15) {
            objc_msgSend(v25, "removeObjectsInRange:", v15, objc_msgSend(v25, "count") - v15);
          }
          uint64_t v26 = [v25 copy];
        }
        else
        {
          id v25 = [v22 segmentString];
          v41 = v25;
          uint64_t v26 = [*(id *)(v20 + 2424) arrayWithObjects:&v41 count:1];
        }
        uint64_t v31 = (void *)v26;
        [v13 addObject:v26];

        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v18);
  }

  unint64_t v32 = (void *)[v13 copy];
  return v32;
}

+ (id)spellCheckerGuessesForSearchString:(id)a3 inRange:(_NSRange)a4 language:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v47 = a5;
  unint64_t v45 = v9;
  unint64_t v10 = objc_msgSend(v9, "substringWithRange:", location, length);
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
  id v12 = [a1 spellChecker];
  objc_sync_enter(v12);
  id obj = v12;
  if ([v12 spellServer:0 findMisspelledWordInString:v10 language:v47 wordCount:0 countOnly:0] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    unint64_t v14 = (id *)getPRAppIdentifierKeySymbolLoc_ptr;
    uint64_t v51 = getPRAppIdentifierKeySymbolLoc_ptr;
    if (!getPRAppIdentifierKeySymbolLoc_ptr)
    {
      unint64_t v15 = (void *)ProofReaderLibrary();
      v49[3] = (uint64_t)dlsym(v15, "PRAppIdentifierKey");
      getPRAppIdentifierKeySymbolLoc_ptr = v49[3];
      unint64_t v14 = (id *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v14)
    {
      dlerror();
      abort_report_np();
LABEL_43:
      __break(1u);
    }
    id v16 = *v14;
    id v52 = v16;
    uint64_t v17 = ICNotesAppBundleIdentifier();
    v53[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    id v13 = objc_msgSend(v12, "spellServer:suggestContextualGuessDictionariesForWordRange:inString:language:options:", 0, location, length, v45, v47, v18);
  }
  objc_sync_exit(v12);

  if ([v13 count])
  {
    uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v20 = [v19 BOOLForKey:*MEMORY[0x1E4F83890]];

    if ([v13 count])
    {
      unint64_t v21 = 0;
      char v22 = v20 ^ 1;
      double v23 = 2.22507386e-308;
      do
      {
        uint64_t v24 = [v13 objectAtIndexedSubscript:v21];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v26 = [v13 objectAtIndexedSubscript:v21];
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x2020000000;
          uint64_t v27 = (void *)getPRGuessKeySymbolLoc_ptr;
          uint64_t v51 = getPRGuessKeySymbolLoc_ptr;
          if (!getPRGuessKeySymbolLoc_ptr)
          {
            id v28 = (void *)ProofReaderLibrary();
            v49[3] = (uint64_t)dlsym(v28, "PRGuessKey");
            getPRGuessKeySymbolLoc_ptr = v49[3];
            uint64_t v27 = (void *)v49[3];
          }
          _Block_object_dispose(&v48, 8);
          if (!v27) {
            goto LABEL_40;
          }
          unint64_t v29 = [v26 objectForKeyedSubscript:*v27];

          unint64_t v30 = [v13 objectAtIndexedSubscript:v21];
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x2020000000;
          uint64_t v31 = (void *)getPRScoreKeySymbolLoc_ptr;
          uint64_t v51 = getPRScoreKeySymbolLoc_ptr;
          if (!getPRScoreKeySymbolLoc_ptr)
          {
            unint64_t v32 = (void *)ProofReaderLibrary();
            v49[3] = (uint64_t)dlsym(v32, "PRScoreKey");
            getPRScoreKeySymbolLoc_ptr = v49[3];
            uint64_t v31 = (void *)v49[3];
          }
          _Block_object_dispose(&v48, 8);
          if (!v31)
          {
LABEL_40:
            __35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
            goto LABEL_43;
          }
          v33 = [v30 objectForKeyedSubscript:*v31];
          [v33 doubleValue];
          double v35 = v34;

          if (!v21) {
            double v23 = v35;
          }
          unint64_t v36 = [v11 count];
          if (v35 + 30.0 < v23 || v36 > 0xF) {
            char v38 = v22;
          }
          else {
            char v38 = 0;
          }
          if (v38)
          {

            break;
          }
          if ((objc_msgSend(v29, "isEqualToString:", v10, v35 + 30.0) & 1) == 0) {
            objc_msgSend(v11, "ic_addNonNilObject:", v29);
          }
        }
        ++v21;
      }
      while (v21 < [v13 count]);
    }
  }
  id v39 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ((unint64_t)[v11 count] >= 2)
  {
    unint64_t v40 = 1;
    do
    {
      v41 = [v11 objectAtIndexedSubscript:v40];
      unint64_t v42 = [v41 length];
      BOOL v43 = v42 < [v10 length];

      if (v43) {
        [v39 addIndex:v40];
      }
      ++v40;
    }
    while (v40 < [v11 count]);
  }
  [v11 removeObjectsAtIndexes:v39];

  return v11;
}

+ (NLTokenizer)tokenizer
{
  if (tokenizer_s_onceTokenForTokenizer != -1) {
    dispatch_once(&tokenizer_s_onceTokenForTokenizer, &__block_literal_global_57);
  }
  v2 = (void *)tokenizer_s_tokenizer;
  return (NLTokenizer *)v2;
}

void __35__ICSearchQueryTokenizer_tokenizer__block_invoke()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getNLTokenizerClass_softClass;
  uint64_t v8 = getNLTokenizerClass_softClass;
  if (!getNLTokenizerClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getNLTokenizerClass_block_invoke;
    v4[3] = &unk_1E64A45A0;
    v4[4] = &v5;
    __getNLTokenizerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [[v1 alloc] initWithUnit:0];
  v3 = (void *)tokenizer_s_tokenizer;
  tokenizer_s_tokenizer = v2;
}

+ (id)spellChecker
{
  if (spellChecker_s_onceTokenForSpellChecker != -1) {
    dispatch_once(&spellChecker_s_onceTokenForSpellChecker, &__block_literal_global_59);
  }
  uint64_t v2 = (void *)spellChecker_s_spellChecker;
  return v2;
}

void __38__ICSearchQueryTokenizer_spellChecker__block_invoke()
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getAppleSpellClass_softClass;
  uint64_t v8 = getAppleSpellClass_softClass;
  if (!getAppleSpellClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getAppleSpellClass_block_invoke;
    v4[3] = &unk_1E64A45A0;
    v4[4] = &v5;
    __getAppleSpellClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  v3 = (void *)spellChecker_s_spellChecker;
  spellChecker_s_spellChecker = (uint64_t)v2;
}

+ (id)connectorCharacterSet
{
  if (connectorCharacterSet_s_onceTokenForConnectorCharacterSet != -1) {
    dispatch_once(&connectorCharacterSet_s_onceTokenForConnectorCharacterSet, &__block_literal_global_61_0);
  }
  id v2 = (void *)connectorCharacterSet_s_connectorCharacterSet;
  return v2;
}

void __47__ICSearchQueryTokenizer_connectorCharacterSet__block_invoke()
{
  uint64_t v0 = ;
  v1 = (void *)connectorCharacterSet_s_connectorCharacterSet;
  connectorCharacterSet_s_connectorCharacterSet = v0;
}

+ (id)nonConnectorCharacterSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICSearchQueryTokenizer_nonConnectorCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nonConnectorCharacterSet_s_onceTokenForNonConnectorCharacterSet != -1) {
    dispatch_once(&nonConnectorCharacterSet_s_onceTokenForNonConnectorCharacterSet, block);
  }
  id v2 = (void *)nonConnectorCharacterSet_s_nonConnectorCharacterSet;
  return v2;
}

void __50__ICSearchQueryTokenizer_nonConnectorCharacterSet__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connectorCharacterSet];
  uint64_t v1 = [v3 invertedSet];
  id v2 = (void *)nonConnectorCharacterSet_s_nonConnectorCharacterSet;
  nonConnectorCharacterSet_s_nonConnectorCharacterSet = v1;
}

@end