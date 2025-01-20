@interface AXElement(CACElement)
+ (id)wordsFromString:()CACElement;
+ (uint64_t)_trimMutableString:()CACElement toMaxWordCount:;
+ (uint64_t)doesArrayOfWords:()CACElement containArrayOfArrayWords:;
- (id)_combinationsFromTitle:()CACElement isCarPlayConnected:;
- (id)englishFunctionWords;
- (id)recognitionStrings;
- (uint64_t)cacPerformExcapeAction;
- (uint64_t)isVisuallyEqual:()CACElement;
@end

@implementation AXElement(CACElement)

+ (id)wordsFromString:()CACElement
{
  v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  v5 = +[CACPreferences sharedPreferences];
  CFLocaleRef v6 = CFLocaleCreate(0, (CFLocaleIdentifier)[v5 bestLocaleIdentifier]);

  v12.length = [(__CFString *)v3 length];
  v12.location = 0;
  v7 = CFStringTokenizerCreate(0, v3, v12, 0, 0);
  if (v6) {
    CFRelease(v6);
  }
  while (CFStringTokenizerAdvanceToNextToken(v7))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
    if (CurrentTokenRange.location != -1)
    {
      v9 = -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      [v4 addObject:v9];
    }
  }
  if (v7) {
    CFRelease(v7);
  }

  return v4;
}

+ (uint64_t)_trimMutableString:()CACElement toMaxWordCount:
{
  v5 = a3;
  CFLocaleRef v6 = +[CACPreferences sharedPreferences];
  CFLocaleRef v7 = CFLocaleCreate(0, (CFLocaleIdentifier)[v6 bestLocaleIdentifier]);

  v13.length = [(__CFString *)v5 length];
  v13.location = 0;
  CFStringTokenizerRef v8 = CFStringTokenizerCreate(0, v5, v13, 0, 0);
  if (v7) {
    CFRelease(v7);
  }
  if (!CFStringTokenizerAdvanceToNextToken(v8))
  {
LABEL_8:
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_10;
    }
LABEL_9:
    CFRelease(v8);
    goto LABEL_10;
  }
  unint64_t v9 = 0;
  while (1)
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
    if (CurrentTokenRange.location != -1 && v9 >= a4) {
      break;
    }
    ++v9;
    if (!CFStringTokenizerAdvanceToNextToken(v8)) {
      goto LABEL_8;
    }
  }
  -[__CFString deleteCharactersInRange:](v5, "deleteCharactersInRange:", CurrentTokenRange.location + CurrentTokenRange.length, [(__CFString *)v5 length] - (CurrentTokenRange.location + CurrentTokenRange.length));
  uint64_t v11 = 1;
  if (v8) {
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

+ (uint64_t)doesArrayOfWords:()CACElement containArrayOfArrayWords:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v8;
      uint64_t v27 = v7;
      do
      {
        uint64_t v12 = v10;
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        CFRange v13 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        uint64_t v14 = objc_msgSend(v5, "count", v24);
        uint64_t v15 = [v13 count];
        uint64_t v16 = v14 - v15;
        if (v14 <= v15)
        {
          uint64_t v10 = v12;
        }
        else
        {
          uint64_t v17 = v15;
          uint64_t v10 = v8;
          if (v15 >= 1)
          {
            uint64_t v26 = v12;
            uint64_t v18 = 0;
            uint64_t v29 = v16 + 1;
            do
            {
              uint64_t v19 = 0;
              while (1)
              {
                v20 = [v5 objectAtIndexedSubscript:v18 + v19];
                v21 = [v13 objectAtIndexedSubscript:v19];
                char v22 = [v20 isEqualToString:v21];

                if ((v22 & 1) == 0) {
                  break;
                }
                if (v17 == ++v19)
                {
                  uint64_t v10 = v8;
                  goto LABEL_16;
                }
              }
              ++v18;
            }
            while (v18 != v29);
            uint64_t v10 = v26;
LABEL_16:
            uint64_t v9 = v25;
            uint64_t v7 = v27;
          }
        }
        ++v8;
        ++v11;
      }
      while (v11 != v7);
      uint64_t v8 = v24 + v7;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)recognitionStrings
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [a1 userInputLabels];
  uint64_t v3 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v8 = +[CACDisplayManager sharedManager];
        uint64_t v9 = a1;
        uint64_t v10 = objc_msgSend(a1, "_combinationsFromTitle:isCarPlayConnected:", v7, objc_msgSend(v8, "carPlayConnected"));

        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              if ([v15 length]) {
                [v2 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v12);
        }

        a1 = v9;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v4);
  }

  if ([a1 hasAnyTraits:*MEMORY[0x263F21B68]])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v16 = [a1 uiElement];
    uint64_t v17 = [v16 stringWithAXAttribute:5043];
    uint64_t v18 = +[CACDisplayManager sharedManager];
    uint64_t v19 = objc_msgSend(a1, "_combinationsFromTitle:isCarPlayConnected:", v17, objc_msgSend(v18, "carPlayConnected"));

    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * k);
          if ([v24 length]
            && (![v2 count] || (objc_msgSend(v2, "containsObject:", v24) & 1) == 0))
          {
            [v2 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v21);
    }
  }
  if (![v2 count] && objc_msgSend(a1, "eligibleForIconVision"))
  {
    uint64_t v25 = [a1 uiElement];
    uint64_t v26 = [v25 arrayWithAXAttribute:2315];

    uint64_t v27 = [MEMORY[0x263F21518] sharedInstance];
    v28 = [v27 classifyImages:v26 withTimeout:0.5];

    if ([v28 length]) {
      [v2 addObject:v28];
    }
  }
  if ([a1 hasAnyTraits:*MEMORY[0x263F21B58]])
  {
    uint64_t v29 = [a1 uiElement];
    long long v30 = [v29 arrayWithAXAttribute:2239];
    [v2 addObjectsFromArray:v30];
  }
  return v2;
}

- (id)_combinationsFromTitle:()CACElement isCarPlayConnected:
{
  uint64_t v5 = (void *)MEMORY[0x263EFF9B0];
  uint64_t v6 = a3;
  uint64_t v7 = [v5 orderedSet];
  uint64_t v8 = &stru_26EB332F0;
  if (v6) {
    uint64_t v8 = v6;
  }
  uint64_t v9 = v8;

  uint64_t v10 = +[CACPreferences sharedPreferences];
  uint64_t v11 = [v10 bestLocaleIdentifier];

  if (+[CACLocaleUtilities isSameLangaugeFromLocaleIdentifier:v11 secondLocaleIdentifier:@"en"])
  {
    long long v41 = v11;
    uint64_t v12 = [(__CFString *)v9 cac_stringByPreparingForAX];
    uint64_t v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v14 = [v12 componentsSeparatedByCharactersInSet:v13];

    long long v44 = v14;
    uint64_t v15 = [v14 count];
    [v7 addObject:v12];
    if (v15 >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 3;
      if (a4) {
        uint64_t v17 = v15;
      }
      uint64_t v42 = v17;
      uint64_t v43 = v15;
      while (1)
      {
        uint64_t v45 = v16;
        uint64_t v18 = (void *)MEMORY[0x263F089D8];
        uint64_t v19 = v15 - v16;
        uint64_t v20 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v16, v19);
        uint64_t v21 = [v44 objectsAtIndexes:v20];
        uint64_t v22 = [v21 componentsJoinedByString:@" "];
        v23 = [v18 stringWithString:v22];

        if (v45)
        {
          if (!a4) {
            break;
          }
        }
        uint64_t v24 = (void *)[v23 copy];
        [v7 addObject:v24];

        if (v19 >= v42) {
          uint64_t v19 = v42;
        }
        if ((v19 & 0x8000000000000000) == 0)
        {
          do
          {
            [MEMORY[0x263F21668] _trimMutableString:v23 toMaxWordCount:v19];
            uint64_t v25 = [MEMORY[0x263F08708] whitespaceCharacterSet];
            uint64_t v26 = [v23 rangeOfCharacterFromSet:v25];

            if (v26 == 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
            {
              v28 = [a1 englishFunctionWords];
              uint64_t v29 = [v23 lowercaseString];
              char v30 = [v28 containsObject:v29];

              if (v30) {
                continue;
              }
            }
            long long v31 = [MEMORY[0x263F08708] whitespaceCharacterSet];
            long long v32 = [v23 stringByTrimmingCharactersInSet:v31];
            [v7 addObject:v32];
          }
          while (v19-- > 0);
        }

        uint64_t v16 = v45 + 1;
        uint64_t v15 = v43;
        if (v45 + 1 == v43) {
          goto LABEL_27;
        }
      }
    }
LABEL_27:
    long long v34 = v12;
    long long v37 = [v12 componentsSeparatedByString:@" "];
    long long v38 = [v37 firstObject];

    if ([v7 containsObject:v38])
    {
      long long v39 = [MEMORY[0x263EFF9B0] orderedSet];
      [v39 addObject:v38];
      [v39 unionOrderedSet:v7];

      uint64_t v7 = v39;
    }
    uint64_t v11 = v41;
  }
  else
  {
    long long v34 = [MEMORY[0x263F089D8] stringWithString:v9];
    uint64_t v35 = 4;
    do
    {
      [MEMORY[0x263F21668] _trimMutableString:v34 toMaxWordCount:v35];
      long long v36 = (void *)[v34 copy];
      [v7 addObject:v36];

      --v35;
    }
    while (v35);
  }

  return v7;
}

- (id)englishFunctionWords
{
  if (englishFunctionWords_onceToken != -1) {
    dispatch_once(&englishFunctionWords_onceToken, &__block_literal_global_309);
  }
  v0 = (void *)englishFunctionWords___wordSet;
  return v0;
}

- (uint64_t)isVisuallyEqual:()CACElement
{
  id v4 = a3;
  if ([v4 isEqual:v4])
  {
    uint64_t v5 = [a1 userInputLabels];
    uint64_t v6 = [v4 userInputLabels];
    if ([v5 isEqualToArray:v6] && (v5 || !v6) && (!v5 || v6))
    {
      [a1 visibleFrame];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [v4 visibleFrame];
      v23.origin.x = v15;
      v23.origin.y = v16;
      v23.size.width = v17;
      v23.size.height = v18;
      v22.origin.x = v8;
      v22.origin.y = v10;
      v22.size.width = v12;
      v22.size.height = v14;
      if (CGRectEqualToRect(v22, v23))
      {
        uint64_t v19 = 1;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v20 = CACLogElementEvaluation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[AXElement(CACElement) isVisuallyEqual:](v20);
      }
    }
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = 0;
LABEL_15:

  return v19;
}

- (uint64_t)cacPerformExcapeAction
{
  return [a1 performAction:2013];
}

- (void)isVisuallyEqual:()CACElement .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "Discovered new critera for object. VisibleFrame: %lu", (uint8_t *)&v1, 0xCu);
}

@end