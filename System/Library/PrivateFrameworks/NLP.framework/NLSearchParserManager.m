@interface NLSearchParserManager
+ (NLSearchParserManager)defaultManager;
+ (id)availableLanguages;
- (NLSearchParserManager)initWithLocale:(id)a3 context:(id)a4 options:(id)a5;
- (NLSearchParserManager)initWithOptions:(id)a3;
- (id)tokenizeAndEnumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)dealloc;
- (void)enumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)enumerateDateRangeAttributedParseForOptions:(id)a3 withBlock:(id)a4;
- (void)enumerateSearchSuggestions:(id)a3 options:(id)a4 withBlock:(id)a5;
@end

@implementation NLSearchParserManager

+ (NLSearchParserManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_7);
  }
  return (NLSearchParserManager *)defaultManager___DefaultManager;
}

NLSearchParserManager *__39__NLSearchParserManager_defaultManager__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v1 = @"contextIdentifier";
  v2[0] = @"com.apple.NLP";
  result = -[NLSearchParserManager initWithOptions:]([NLSearchParserManager alloc], "initWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:&v1 count:1]);
  defaultManager___DefaultManager = (uint64_t)result;
  return result;
}

+ (id)availableLanguages
{
  CFArrayRef v2 = NLSearchParserCopyAvailableLanguages();

  return v2;
}

- (NLSearchParserManager)initWithOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NLSearchParserManager;
  if ([(NLSearchParserManager *)&v4 init]) {
    NLSearchParserCreate();
  }
  return 0;
}

- (NLSearchParserManager)initWithLocale:(id)a3 context:(id)a4 options:(id)a5
{
  v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  v9 = v8;
  if (a3) {
    [v8 setObject:a3 forKey:@"locale"];
  }
  if (a4) {
    [v9 setObject:a4 forKey:@"contextIdentifier"];
  }

  return [(NLSearchParserManager *)self initWithOptions:v9];
}

- (void)enumerateDateRangeAttributedParseForOptions:(id)a3 withBlock:(id)a4
{
  if ([a3 valueForKey:@"startDateQuery"]
    && [a3 valueForKey:@"startDateQuery"]
    && [a3 valueForKey:@"endDateQuery"])
  {
    if ([a3 valueForKey:@"endDateQuery"])
    {
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x2020000000;
      char v9 = 0;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke;
      v7[3] = &unk_1E5B37048;
      v7[4] = self;
      v7[5] = a3;
      v7[6] = a4;
      v7[7] = v8;
      [(NLSearchParserManager *)self enumerateSearchSuggestions:0 options:a3 withBlock:v7];
      _Block_object_dispose(v8, 8);
    }
  }
}

void __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = __Block_byref_object_copy__17;
  v11[4] = __Block_byref_object_dispose__17;
  uint64_t v12 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28E78] stringWithString:a2];
  v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_87;
  v10[3] = &unk_1E5B37020;
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  v10[4] = a2;
  v10[5] = v8;
  v10[6] = v11;
  v10[7] = v9;
  [v6 enumerateAttributedParsesForQuery:a2 options:v7 withBlock:v10];
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    *a3 = 1;
  }
  _Block_object_dispose(v11, 8);
}

void __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_87(void *a1, void *a2, unsigned char *a3)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  uint64_t v6 = [a2 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_2;
  v7[3] = &unk_1E5B36FF8;
  v7[4] = a1[4];
  v7[5] = v8;
  v7[6] = a1[6];
  v7[7] = a3;
  objc_msgSend(a2, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v7);
  if (!objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "length"))
  {
    (*(void (**)(void))(a1[5] + 16))();
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
      *a3 = 1;
    }
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __79__NLSearchParserManager_enumerateDateRangeAttributedParseForOptions_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 count];
  if (result)
  {
    v11 = (void *)[a2 objectForKey:@"dateType"];
    if ([v11 intValue] == 41
      || (uint64_t result = [v11 intValue], result == 42)
      || !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4), &stru_1EF7CF078, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  *a5 = **(unsigned char **)(a1 + 56);
  return result;
}

- (void)enumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5
{
  if (a4)
  {
    if ([a4 objectForKeyedSubscript:@"locale"]) {
      NLSearchParserSetLocale((uint64_t)self->_parser, (const __CFLocale *)[a4 objectForKeyedSubscript:@"locale"]);
    }
    if ([a4 objectForKeyedSubscript:@"date"]) {
      NLSearchParserSetDate((uint64_t)self->_parser, (CFTypeRef)[a4 objectForKeyedSubscript:@"date"]);
    }
    if ([a4 objectForKeyedSubscript:@"customResourceDirectory"]) {
      NLSearchParserSetCustomResourceDirectory((uint64_t)self->_parser, (const __CFURL *)[a4 objectForKeyedSubscript:@"customResourceDirectory"]);
    }
    if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"includeFutureDates"), "BOOLValue"))NLSearchParserSetFutureDates((uint64_t)self->_parser, 1); {
  }
    }
  NLSearchParserSetString((uint64_t)self->_parser, (const __CFString *)a3);
  NLSearchParserCopyParseWithOptions();
}

uint64_t __77__NLSearchParserManager_enumerateAttributedParsesForQuery_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 valueForKey:@"kNLDateComponents"];
  uint64_t v8 = [a2 valueForKey:@"kNLStartDateComponents"];
  char v9 = (void *)[a2 valueForKey:@"kNLEndDateComponents"];
  v10 = (void *)[a2 valueForKey:@"kNLFrequencyDateComponents"];
  v11 = (void *)[a2 valueForKey:@"kNLDateType"];
  uint64_t v12 = [a2 valueForKey:@"kNLDateModifier"];
  uint64_t v13 = [a2 valueForKey:@"kNLDisplayDate"];
  v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v15 = v14;
  if (!v13 || !(v7 | v8))
  {
    uint64_t result = [v11 intValue];
    if (result != 42) {
      return result;
    }
    v18 = @"dateType";
    v19 = v15;
    v20 = v11;
    goto LABEL_23;
  }
  [v14 setObject:v13 forKey:@"displayDateString"];
  if (v7) {
    uint64_t v7 = (uint64_t)dateComponentsForDate((void *)v7);
  }
  if (v8) {
    uint64_t v8 = (uint64_t)dateComponentsForDate((void *)v8);
  }
  if (v9)
  {
    id v16 = dateComponentsForDate(v9);
    if (v10) {
      goto LABEL_9;
    }
LABEL_29:
    id v17 = 0;
    if (!v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v16 = 0;
  if (!v10) {
    goto LABEL_29;
  }
LABEL_9:
  id v17 = dateComponentsForDate(v10);
  if (v8) {
LABEL_10:
  }
    [v15 setObject:v8 forKey:@"startDateComponents"];
LABEL_11:
  if (v16) {
    [v15 setObject:v16 forKey:@"endDateComponents"];
  }
  if (v7) {
    [v15 setObject:v7 forKey:@"dateComponents"];
  }
  if (v10) {
    [v15 setObject:v17 forKey:@"frequencyDateComponents"];
  }
  if (v11) {
    [v15 setObject:v11 forKey:@"dateType"];
  }
  if (!v12) {
    goto LABEL_24;
  }
  v18 = @"dateModifier";
  v19 = v15;
  v20 = (void *)v12;
LABEL_23:
  [v19 setObject:v20 forKey:v18];
LABEL_24:
  v22 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return objc_msgSend(v22, "setAttributes:range:", v15, a3, a4);
}

- (id)tokenizeAndEnumerateAttributedParsesForQuery:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 && [a3 length])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke_2;
    v11[3] = &unk_1E5B37098;
    v11[4] = a5;
    [(NLSearchParserManager *)self enumerateAttributedParsesForQuery:a3 options:a4 withBlock:v11];
  }
  else if (a4 && [a4 objectForKey:@"startDateQuery"])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke;
    v12[3] = &unk_1E5B37098;
    v12[4] = a5;
    [(NLSearchParserManager *)self enumerateDateRangeAttributedParseForOptions:a4 withBlock:v12];
  }
  return v9;
}

uint64_t __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__NLSearchParserManager_tokenizeAndEnumerateAttributedParsesForQuery_options_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSearchSuggestions:(id)a3 options:(id)a4 withBlock:(id)a5
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  parser = self->_parser;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__NLSearchParserManager_enumerateSearchSuggestions_options_withBlock___block_invoke;
  v6[3] = &unk_1E5B370C0;
  v6[4] = a5;
  v6[5] = v7;
  NLSearchParserEnumerateSuggestions((uint64_t)parser, (uint64_t)a3, (const __CFDictionary *)a4, (uint64_t)v6);
  _Block_object_dispose(v7, 8);
}

uint64_t __70__NLSearchParserManager_enumerateSearchSuggestions_options_withBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)dealloc
{
  parser = self->_parser;
  if (parser) {
    CFRelease(parser);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLSearchParserManager;
  [(NLSearchParserManager *)&v4 dealloc];
}

@end