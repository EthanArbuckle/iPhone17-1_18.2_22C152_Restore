@interface WiFiLexicon
- (BOOL)stringContainsUnwantedWords:(id)a3;
- (NSCharacterSet)tokenizationCharacterSet;
- (NSCharacterSet)tokenizationCharacterSetWithoutUpperCase;
- (NSMutableDictionary)stringCache;
- (NSSet)unwantedEnglishWords;
- (WiFiLexicon)init;
- (id)_tokenizeStringForSpecialCharacters:(id)a3;
- (void)dealloc;
- (void)setStringCache:(id)a3;
- (void)setTokenizationCharacterSet:(id)a3;
- (void)setTokenizationCharacterSetWithoutUpperCase:(id)a3;
- (void)setUnwantedEnglishWords:(id)a3;
@end

@implementation WiFiLexicon

- (void)dealloc
{
  lexiconEnglish = self->_lexiconEnglish;
  if (lexiconEnglish)
  {
    CFRelease(lexiconEnglish);
    self->_lexiconEnglish = 0;
  }
  lexiconUserLocale = self->_lexiconUserLocale;
  if (lexiconUserLocale)
  {
    CFRelease(lexiconUserLocale);
    self->_lexiconUserLocale = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiLexicon;
  [(WiFiLexicon *)&v5 dealloc];
}

- (WiFiLexicon)init
{
  v23.receiver = self;
  v23.super_class = (Class)WiFiLexicon;
  v2 = [(WiFiLexicon *)&v23 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    v4 = [v3 localeIdentifier];

    int v5 = [(__CFString *)v4 hasPrefix:@"en"];
    char v6 = v5;
    if (v5) {
      v7 = v4;
    }
    else {
      v7 = @"en";
    }
    v8 = v7;
    v2->_lexiconEnglish = (_LXLexicon *)_createLexiconWithLocale(v8);
    if ((v6 & 1) == 0) {
      v2->_lexiconUserLocale = (_LXLexicon *)_createLexiconWithLocale(v4);
    }
    v9 = (void *)MEMORY[0x1D9440170]();
    v10 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
    v11 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [(NSCharacterSet *)v10 formUnionWithCharacterSet:v11];

    v12 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
    [(NSCharacterSet *)v10 formUnionWithCharacterSet:v12];

    uint64_t v13 = [(NSCharacterSet *)v10 copy];
    tokenizationCharacterSetWithoutUpperCase = v2->_tokenizationCharacterSetWithoutUpperCase;
    v2->_tokenizationCharacterSetWithoutUpperCase = (NSCharacterSet *)v13;

    v15 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
    [(NSCharacterSet *)v10 formUnionWithCharacterSet:v15];

    tokenizationCharacterSet = v2->_tokenizationCharacterSet;
    v2->_tokenizationCharacterSet = v10;
    v17 = v10;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    stringCache = v2->_stringCache;
    v2->_stringCache = (NSMutableDictionary *)v18;

    v20 = [MEMORY[0x1E4F1CA80] set];
    [(NSSet *)v20 addObject:@"secure"];
    [(NSSet *)v20 addObject:@"private"];
    unwantedEnglishWords = v2->_unwantedEnglishWords;
    v2->_unwantedEnglishWords = v20;
  }
  return v2;
}

- (BOOL)stringContainsUnwantedWords:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  int v5 = [(WiFiLexicon *)self stringCache];
  char v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [(WiFiLexicon *)self stringCache];
    v8 = [v7 objectForKey:v4];
    char v9 = [v8 BOOLValue];
  }
  else
  {
    v10 = [(WiFiLexicon *)self unwantedEnglishWords];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke;
    v22[3] = &unk_1E69BCB28;
    id v11 = v4;
    id v23 = v11;
    v24 = &v25;
    [v10 enumerateObjectsUsingBlock:v22];

    if (*((unsigned char *)v26 + 24))
    {
      v12 = [(WiFiLexicon *)self stringCache];
      uint64_t v13 = [NSNumber numberWithBool:*((unsigned __int8 *)v26 + 24)];
      [v12 setObject:v13 forKey:v11];

      char v9 = *((unsigned char *)v26 + 24) != 0;
    }
    else
    {
      v14 = [(WiFiLexicon *)self _tokenizeStringForSpecialCharacters:v11];
      if ([v14 count])
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2;
        v19[3] = &unk_1E69BCB78;
        v19[4] = self;
        id v15 = v11;
        id v20 = v15;
        v21 = &v25;
        [v14 enumerateObjectsUsingBlock:v19];
        v16 = [(WiFiLexicon *)self stringCache];
        v17 = [NSNumber numberWithBool:*((unsigned __int8 *)v26 + 24)];
        [v16 setObject:v17 forKey:v15];

        char v9 = *((unsigned char *)v26 + 24) != 0;
      }
      else
      {
        char v9 = 0;
      }
    }
    v7 = v23;
  }

  _Block_object_dispose(&v25, 8);
  return v9;
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:")
    && (![v5 isEqualToString:@"secure"]
     || ([*(id *)(a1 + 32) localizedCaseInsensitiveContainsString:@"unsecured"] & 1) == 0))
  {
    NSLog(&cfstr_SFoundUnwanted.isa, "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke", v5, *(void *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = *(id *)(a1 + 40);
  LXLexiconEnumerateEntriesForString();
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v4 = v3;
    id v5 = *(id *)(a1 + 40);
    LXLexiconEnumerateEntriesForString();
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_3(void *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = (id)LXEntryCopyString();
  if ([v5 isEqualToString:a1[4]] && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog(&cfstr_SFoundUnwanted.isa, "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_3", a1[4], a1[5]);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_4(void *a1, uint64_t a2, unsigned char *a3)
{
  id v5 = (id)LXEntryCopyString();
  if ([v5 isEqualToString:a1[4]] && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog(&cfstr_SFoundUnwanted.isa, "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_4", a1[4], a1[5]);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_tokenizeStringForSpecialCharacters:(id)a3
{
  id v3 = a3;
  id v19 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 length])
  {
    context = (void *)MEMORY[0x1D9440170]();
    unint64_t v18 = [v3 length];
    unint64_t v4 = v18 - 2;
    if (v18 >= 2)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = v5 + 1;
        uint64_t v8 = [v3 characterAtIndex:v5 + 1];
        char v9 = [(WiFiLexicon *)self tokenizationCharacterSet];
        int v10 = [v9 characterIsMember:v8];

        if (v4 == v5 || v10)
        {
          unint64_t v11 = v18;
          if (v4 != v5) {
            unint64_t v11 = v5 + 1;
          }
          v12 = objc_msgSend(v3, "substringWithRange:", v6, v11 - v6);
          uint64_t v13 = [(WiFiLexicon *)self tokenizationCharacterSetWithoutUpperCase];
          v14 = [v12 stringByTrimmingCharactersInSet:v13];
          id v15 = [v14 lowercaseString];

          [v19 addObject:v15];
        }
        else
        {
          uint64_t v7 = v6;
        }
        ++v5;
        uint64_t v6 = v7;
      }
      while (v18 - 1 != v5);
    }
  }

  return v19;
}

- (NSCharacterSet)tokenizationCharacterSet
{
  return self->_tokenizationCharacterSet;
}

- (void)setTokenizationCharacterSet:(id)a3
{
}

- (NSCharacterSet)tokenizationCharacterSetWithoutUpperCase
{
  return self->_tokenizationCharacterSetWithoutUpperCase;
}

- (void)setTokenizationCharacterSetWithoutUpperCase:(id)a3
{
}

- (NSMutableDictionary)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
}

- (NSSet)unwantedEnglishWords
{
  return self->_unwantedEnglishWords;
}

- (void)setUnwantedEnglishWords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unwantedEnglishWords, 0);
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_tokenizationCharacterSetWithoutUpperCase, 0);

  objc_storeStrong((id *)&self->_tokenizationCharacterSet, 0);
}

@end