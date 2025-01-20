@interface CACEmojiManager
+ (id)sharedManager;
+ (void)resetSharedManager;
- (BOOL)isEmoji:(id)a3;
- (CACEmojiManager)initWithLocaleIdentifier:(id)a3;
- (EMFEmojiLocaleData)emojiLocaleData;
- (EMFEmojiPreferences)emojiPreferences;
- (NSString)localeIdentifier;
- (id)emojiStringsFromEmojiTokens:(id)a3 skinToneFilter:(int)a4;
- (id)emojiTokenUsingPrefixApproachForText:(id)a3 skinToneFilter:(int)a4;
- (id)emojisForText:(id)a3 skinToneFilter:(int)a4;
- (id)relatedEmojisForEmoji:(id)a3 skinToneFilter:(int)a4;
- (id)stringByReplacingEmojisWithDescriptions:(id)a3;
- (int64_t)countOfEmojisInString:(id)a3;
- (void)enumerateEmojisInText:(id)a3 skinToneFilter:(int)a4 usingBlock:(id)a5;
- (void)setEmojiLocaleData:(id)a3;
- (void)setEmojiPreferences:(id)a3;
- (void)willInsertStringPotentiallyContainingEmojis:(id)a3;
@end

@implementation CACEmojiManager

+ (id)sharedManager
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sSharedEmojiManager)
  {
    v3 = +[CACPreferences sharedPreferences];
    v4 = [v3 bestLocaleIdentifier];

    v5 = [[CACEmojiManager alloc] initWithLocaleIdentifier:v4];
    v6 = (void *)sSharedEmojiManager;
    sSharedEmojiManager = (uint64_t)v5;
  }
  objc_sync_exit(v2);

  v7 = (void *)sSharedEmojiManager;
  return v7;
}

+ (void)resetSharedManager
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)sSharedEmojiManager;
  sSharedEmojiManager = 0;

  objc_sync_exit(obj);
}

- (CACEmojiManager)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (NSString *)[v4 copy];
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v6;
  }
  else
  {
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = (NSString *)@"en-US";
  }

  v14.receiver = self;
  v14.super_class = (Class)CACEmojiManager;
  v8 = [(CACEmojiManager *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F3B4F0] emojiLocaleDataWithLocaleIdentifier:v8->_localeIdentifier];
    emojiLocaleData = v8->_emojiLocaleData;
    v8->_emojiLocaleData = (EMFEmojiLocaleData *)v9;

    v11 = (EMFEmojiPreferences *)objc_alloc_init(MEMORY[0x263F3B4F8]);
    emojiPreferences = v8->_emojiPreferences;
    v8->_emojiPreferences = v11;

    [(EMFEmojiPreferences *)v8->_emojiPreferences readEmojiDefaults];
  }

  return v8;
}

- (void)enumerateEmojisInText:(id)a3 skinToneFilter:(int)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    emojiLocaleData = self->_emojiLocaleData;
    uint64_t v11 = [v8 length];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __67__CACEmojiManager_enumerateEmojisInText_skinToneFilter_usingBlock___block_invoke;
    v17 = &unk_264D11BA0;
    v20 = &v22;
    v18 = self;
    int v21 = v6;
    id v12 = v9;
    id v19 = v12;
    -[EMFEmojiLocaleData enumerateSearchResultsInText:range:options:searchType:usingBlock:](emojiLocaleData, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v8, 0, v11, 17, 1, &v14);
    if (!*((unsigned char *)v23 + 24))
    {
      v13 = -[CACEmojiManager emojiTokenUsingPrefixApproachForText:skinToneFilter:](self, "emojiTokenUsingPrefixApproachForText:skinToneFilter:", v8, v6, v14, v15, v16, v17, v18);
      if (v13) {
        (*((void (**)(id, void *, void, uint64_t))v12 + 2))(v12, v13, 0, [v8 length]);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
}

void __67__CACEmojiManager_enumerateEmojisInText_skinToneFilter_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  id v3 = [*(id *)(a1 + 32) emojiStringsFromEmojiTokens:a2 skinToneFilter:*(unsigned int *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)emojisForText:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  v42 = self;
  emojiLocaleData = self->_emojiLocaleData;
  uint64_t v8 = [v5 length];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __48__CACEmojiManager_emojisForText_skinToneFilter___block_invoke;
  v61[3] = &unk_264D11BC8;
  id v9 = v6;
  id v62 = v9;
  v38 = v5;
  -[EMFEmojiLocaleData enumerateSearchResultsInText:range:options:searchType:usingBlock:](emojiLocaleData, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v5, 0, v8, 17, 1, v61);
  v10 = [MEMORY[0x263EFF980] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v11 = v9;
  uint64_t v43 = [v11 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v43)
  {
    id v39 = v11;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v11);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        if ((unint64_t)[v11 count] <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = a4;
        }
        uint64_t v15 = [(CACEmojiManager *)v42 emojiStringsFromEmojiTokens:v13 skinToneFilter:v14];
        if ([v10 count])
        {
          uint64_t v44 = i;
          uint64_t v16 = [v10 count];
          if (v16)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              v18 = [v10 objectAtIndex:j];
              long long v49 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              id v19 = v15;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v50;
                do
                {
                  for (uint64_t k = 0; k != v21; ++k)
                  {
                    if (*(void *)v50 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = [v18 stringByAppendingString:*(void *)(*((void *)&v49 + 1) + 8 * k)];
                    [v10 addObject:v24];
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
                }
                while (v21);
              }
            }
          }
          objc_msgSend(v10, "removeObjectsInRange:", 0, v16);
          id v11 = v39;
          uint64_t i = v44;
        }
        else
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v25 = v15;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v54;
            do
            {
              for (uint64_t m = 0; m != v27; ++m)
              {
                if (*(void *)v54 != v28) {
                  objc_enumerationMutation(v25);
                }
                [v10 addObject:*(void *)(*((void *)&v53 + 1) + 8 * m)];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }
            while (v27);
          }
        }
      }
      uint64_t v43 = [v11 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v43);
  }

  v30 = [(CACEmojiManager *)v42 emojiTokenUsingPrefixApproachForText:v38 skinToneFilter:0];
  v31 = v30;
  if (v30)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v63 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v46;
      do
      {
        for (uint64_t n = 0; n != v33; ++n)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v45 + 1) + 8 * n);
          if (([v10 containsObject:v36] & 1) == 0) {
            [v10 addObject:v36];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v63 count:16];
      }
      while (v33);
    }
  }

  return v10;
}

uint64_t __48__CACEmojiManager_emojisForText_skinToneFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)stringByReplacingEmojisWithDescriptions:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = (id)[[NSString alloc] initWithString:v4];
  id v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v4, "length"));
  uint64_t v6 = [v4 length];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke;
  v15[3] = &unk_264D11BF0;
  id v7 = v5;
  id v16 = v7;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 258, v15);
  uint64_t v8 = [v7 length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke_2;
  v12[3] = &unk_264D11C18;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  uint64_t v14 = &v17;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void __59__CACEmojiManager_stringByReplacingEmojisWithDescriptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEmoji:"))
  {
    id v7 = (void *)MEMORY[0x263F3B508];
    uint64_t v8 = [*(id *)(a1 + 32) emojiLocaleData];
    id v9 = [v7 emojiTokenWithString:v14 localeData:v8];

    id v10 = [v9 nameForType:2];
    uint64_t v11 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "stringByReplacingCharactersInRange:withString:", objc_msgSend(*(id *)(a1 + 40), "length") - (a3 + a4), a4, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (id)relatedEmojisForEmoji:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(CACEmojiManager *)self stringByReplacingEmojisWithDescriptions:a3];
  id v7 = [(CACEmojiManager *)self emojisForText:v6 skinToneFilter:v4];

  return v7;
}

- (id)emojiTokenUsingPrefixApproachForText:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(EMFEmojiLocaleData *)self->_emojiLocaleData emojiTokensForText:a3 phoneticReading:0 options:17 searchType:1 includePrefixMatches:1];
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithoutModifiers", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [v8 allObjects];
    id v16 = [(CACEmojiManager *)self emojiStringsFromEmojiTokens:v15 skinToneFilter:v4];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)emojiStringsFromEmojiTokens:(id)a3 skinToneFilter:(int)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    id v23 = v7;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "supportsSkinToneVariants", v23))
        {
LABEL_17:
          id v13 = [v12 string];
          [v6 addObject:v13];
          goto LABEL_18;
        }
        if (a4)
        {
          if (a4 != 1) {
            goto LABEL_17;
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = [v12 skinToneVariants];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = [*(id *)(*((void *)&v25 + 1) + 8 * i) string];
                [v6 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v15);
            id v7 = v23;
          }
        }
        else
        {
          long long v19 = [(CACEmojiManager *)self emojiPreferences];
          id v13 = [v19 lastUsedVariantEmojiForEmoji:v12];

          long long v20 = [v13 string];
          [v6 addObject:v20];
        }
LABEL_18:

        ++v11;
      }
      while (v11 != v9);
      uint64_t v21 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }

  return v6;
}

- (void)willInsertStringPotentiallyContainingEmojis:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CACEmojiManager_willInsertStringPotentiallyContainingEmojis___block_invoke;
  v7[3] = &unk_264D11BF0;
  v7[4] = self;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v7);

  uint64_t v6 = [(CACEmojiManager *)self emojiPreferences];
  [v6 writeEmojiDefaults];
}

void __63__CACEmojiManager_willInsertStringPotentiallyContainingEmojis___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEmoji:"))
  {
    id v3 = (void *)MEMORY[0x263F3B508];
    id v4 = [*(id *)(a1 + 32) emojiLocaleData];
    uint64_t v5 = [v3 emojiTokenWithString:v7 localeData:v4];

    uint64_t v6 = [*(id *)(a1 + 32) emojiPreferences];
    [v6 didUseEmoji:v5];
  }
}

- (BOOL)isEmoji:(id)a3
{
  id v3 = a3;
  int v4 = [v3 characterAtIndex:0];
  if ((v4 & 0xFC00) == 0xD800) {
    BOOL v5 = ([v3 characterAtIndex:1] + (v4 << 10) - 56732672) >> 9 >= 0x15;
  }
  else {
    BOOL v5 = (v4 - 8448) >= 0x6C0;
  }
  BOOL v6 = !v5;

  return v6;
}

- (int64_t)countOfEmojisInString:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = [v4 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__CACEmojiManager_countOfEmojisInString___block_invoke;
  v8[3] = &unk_264D11C40;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __41__CACEmojiManager_countOfEmojisInString___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isEmoji:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (EMFEmojiLocaleData)emojiLocaleData
{
  return self->_emojiLocaleData;
}

- (void)setEmojiLocaleData:(id)a3
{
}

- (EMFEmojiPreferences)emojiPreferences
{
  return self->_emojiPreferences;
}

- (void)setEmojiPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_emojiLocaleData, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end