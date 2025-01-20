@interface RKUtilities
+ (BOOL)RKRepairStringNeeded:(id)a3;
+ (BOOL)isDeviceSupportedForLSTMBasedLanguageIdentification:(id)a3;
+ (BOOL)isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:(id)a3;
+ (BOOL)isLanguageSupportedBySmartPunctuation:(id)a3;
+ (BOOL)isLanguageSupportedForLemmatization:(id)a3;
+ (BOOL)isLanguageSupportedForPartOfSpeech:(id)a3;
+ (BOOL)prefixInArray:(id)a3 withArray:(id)a4;
+ (BOOL)suffixInArray:(id)a3 withArray:(id)a4;
+ (BOOL)tokenInArray:(id)a3 withArray:(id)a4;
+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3;
+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:(id)a3;
+ (id)getDeviceModel;
+ (id)normalizeForPersonalization:(id)a3;
+ (id)removeEmoji:(id)a3;
+ (id)removeMultipleWhitespaces:(id)a3;
+ (id)stripDiacritics:(id)a3;
+ (id)stripEmojiSkinTones:(id)a3;
+ (id)stripPunctuations:(id)a3;
@end

@implementation RKUtilities

+ (id)stripPunctuations:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 punctuationCharacterSet];
  v6 = (void *)[v5 mutableCopy];

  v7 = (void *)[v4 mutableCopy];
  [v6 addCharactersInString:@"‚„…‘’“”•–—˜›«¬¯±·»"];
  stripCharacterSet(v7, v6);
  v8 = [MEMORY[0x263F08708] symbolCharacterSet];
  stripCharacterSet(v7, v8);

  return v7;
}

+ (id)removeMultipleWhitespaces:(id)a3
{
  id v3 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6;
  v7[4] = __Block_byref_object_dispose__6;
  id v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__RKUtilities_removeMultipleWhitespaces___block_invoke;
  block[3] = &unk_2642D2068;
  block[4] = v7;
  if (removeMultipleWhitespaces__onceRegexToken != -1) {
    dispatch_once(&removeMultipleWhitespaces__onceRegexToken, block);
  }
  id v4 = objc_msgSend((id)removeMultipleWhitespaces__regexMultipleWhitespaces, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @" ");
  _Block_object_dispose(v7, 8);

  return v4;
}

void __41__RKUtilities_removeMultipleWhitespaces___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\s+" options:1 error:&obj];
  objc_storeStrong((id *)(v1 + 40), obj);
  id v3 = (void *)removeMultipleWhitespaces__regexMultipleWhitespaces;
  removeMultipleWhitespaces__regexMultipleWhitespaces = v2;
}

+ (id)stripEmojiSkinTones:(id)a3
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:a3];
  stripEmojiSkinTones(v3);

  return v3;
}

+ (id)normalizeForPersonalization:(id)a3
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:a3];
  CFStringLowercase(v3, 0);
  id v4 = v3;
  if (normalizeWhitespace_onceToken != -1) {
    dispatch_once(&normalizeWhitespace_onceToken, &__block_literal_global_163);
  }
  CFStringTrimWhitespace(v4);
  uint64_t v5 = [(__CFString *)v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      uint64_t v7 = -[__CFString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", normalizeWhitespace_sWhitespaceCharacterSet, 4, 0, v6);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0) {
        break;
      }
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = -[__CFString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", normalizeWhitespace_sNonWhitespaceCharacterSet, 4, 0, v7);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0) {
        break;
      }
      uint64_t v6 = v12;
      [(__CFString *)v4 replaceCharactersInRange:v12 + v13, v10 + v11 - (v12 + v13), @" " withString];
    }
    while (v6);
  }

  v15 = [MEMORY[0x263F08708] punctuationCharacterSet];
  stripCharacterSet(v4, v15);

  v16 = v4;
  uint64_t v17 = [(__CFString *)v16 length];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
    do
    {
      UniChar chars = 0;
      __int16 v21 = [(__CFString *)v16 characterAtIndex:v19];
      if ((unsigned __int16)(v21 + 255) <= 0x5Du)
      {
        UniChar chars = v21 + 288;
        CFStringRef v22 = CFStringCreateWithCharactersNoCopy(0, &chars, 1, v20);
        -[__CFString replaceCharactersInRange:withString:](v16, "replaceCharactersInRange:withString:", v19, 1, v22);
        CFRelease(v22);
      }
      ++v19;
    }
    while (v18 != v19);
  }

  stripDiacritics(v16);
  stripEmojiSkinTones(v16);

  return v16;
}

+ (id)stripDiacritics:(id)a3
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:a3];
  stripDiacritics(v3);

  return v3;
}

+ (BOOL)isLanguageSupportedByNSLinguisticTaggerForLanguageIdentification:(id)a3
{
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"ms", @"ca", @"id", @"vi", 0);
  char v6 = [v5 containsObject:v4] ^ 1;

  return v6;
}

+ (BOOL)isLanguageSupportedForLemmatization:(id)a3
{
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"en", @"es", @"pt", @"de", @"it", @"ru", @"tr", @"fr", @"ar", @"he", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)isLanguageSupportedForPartOfSpeech:(id)a3
{
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"en", @"es", @"pt", @"de", @"it", @"ru", @"tr", @"fr", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)isLanguageSupportedBySmartPunctuation:(id)a3
{
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"en", 0);
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)removeEmoji:(id)a3
{
  id v3 = (__CFString *)a3;
  if (CEMStringContainsEmoji())
  {
    CFStringGetLength(v3);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__6;
    uint64_t v18 = __Block_byref_object_dispose__6;
    id v19 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9 = v3;
    CEMEnumerateEmojiTokensInStringWithBlock();
    uint64_t v4 = v11[3];
    uint64_t v5 = [(__CFString *)v9 length];
    char v6 = -[__CFString substringWithRange:](v9, "substringWithRange:", v4, v5 - v11[3]);
    [(id)v15[5] appendString:v6];
    uint64_t v7 = (__CFString *)(id)v15[5];

    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v7 = v3;
  }

  return v7;
}

void __27__RKUtilities_removeEmoji___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, a3 - v8);
  [v7 appendString:v9];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + a4;
}

+ (BOOL)tokenInArray:(id)a3 withArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "containsString:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)prefixInArray:(id)a3 withArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "hasPrefix:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)suffixInArray:(id)a3 withArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "hasSuffix:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)getDeviceModel
{
  if (getDeviceModel_onceToken != -1) {
    dispatch_once(&getDeviceModel_onceToken, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)getDeviceModel_deviceModelName;

  return v2;
}

void __29__RKUtilities_getDeviceModel__block_invoke()
{
  uint64_t v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v0 = v1;
  }
  else {
    v0 = &stru_26C8AEFC8;
  }
  objc_storeStrong((id *)&getDeviceModel_deviceModelName, v0);
}

+ (BOOL)isDeviceSupportedForLSTMBasedLanguageIdentification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (isDeviceSupportedForLSTMBasedLanguageIdentification__onceToken != -1) {
    dispatch_once(&isDeviceSupportedForLSTMBasedLanguageIdentification__onceToken, &__block_literal_global_63);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)isDeviceSupportedForLSTMBasedLanguageIdentification__preH8;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "hasPrefix:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

uint64_t __67__RKUtilities_isDeviceSupportedForLSTMBasedLanguageIdentification___block_invoke()
{
  isDeviceSupportedForLSTMBasedLanguageIdentification__preH8 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26C8EC560];

  return MEMORY[0x270F9A758]();
}

+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 UTF8String];
  uloc_addLikelySubtags();
  id v4 = [NSString stringWithUTF8String:v6];

  return v4;
}

+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = +[RKUtilities addLikelySubtagsForLocaleIdentifier:a3];
  id v4 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v3];
  uint64_t v5 = *MEMORY[0x263EFF508];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFF508]];
  uint64_t v7 = *MEMORY[0x263EFF540];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFF540]];
  BOOL v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v22[0] = v5;
    v22[1] = v7;
    v23[0] = v6;
    v23[1] = v8;
    long long v11 = NSDictionary;
    long long v12 = (void **)v23;
    long long v13 = v22;
    uint64_t v14 = 2;
LABEL_8:
    v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v20 = v5;
    __int16 v21 = v6;
    long long v11 = NSDictionary;
    long long v12 = &v21;
    long long v13 = &v20;
    uint64_t v14 = 1;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_9:
  uint64_t v16 = (void *)MEMORY[0x263EFF960];
  uint64_t v17 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v15];
  uint64_t v18 = [v16 canonicalLanguageIdentifierFromString:v17];

  return v18;
}

+ (BOOL)RKRepairStringNeeded:(id)a3
{
  id v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length]) {
    goto LABEL_5;
  }
  uint64_t v4 = [(__CFString *)v3 fastestEncoding];
  BOOL v5 = 0;
  if (v4 != 1 && v4 != 4)
  {
    if (CFStringGetCStringPtr(v3, 4u))
    {
LABEL_5:
      BOOL v5 = 0;
      goto LABEL_6;
    }
    CFStringRef v7 = v3;
    uint64_t v8 = (__CFString *)v7;
    if (v7)
    {
      memset(v27, 0, sizeof(v27));
      CFIndex Length = CFStringGetLength(v7);
      CFStringRef theString = v8;
      uint64_t v31 = 0;
      CFIndex v32 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      v29 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      }
      int64_t v33 = 0;
      int64_t v34 = 0;
      v30 = CStringPtr;
      if (Length >= 1)
      {
        uint64_t v12 = 0;
        int64_t v13 = 0;
        int64_t v14 = 0;
        UniChar v15 = 0;
        BOOL v5 = 1;
        uint64_t v16 = 64;
        while (1)
        {
          if ((unint64_t)v14 >= 4) {
            uint64_t v17 = 4;
          }
          else {
            uint64_t v17 = v14;
          }
          if (v32 <= v14)
          {
            if (v15 >> 10 == 54) {
              goto LABEL_37;
            }
            UniChar v18 = 0;
          }
          else
          {
            if (v29)
            {
              UniChar v18 = v29[v14 + v31];
            }
            else if (v30)
            {
              UniChar v18 = v30[v31 + v14];
            }
            else
            {
              if (v34 <= v14 || v13 > v14)
              {
                uint64_t v20 = -v17;
                uint64_t v21 = v17 + v12;
                uint64_t v22 = v16 - v17;
                int64_t v23 = v14 + v20;
                CFIndex v24 = v23 + 64;
                if (v23 + 64 >= v32) {
                  CFIndex v24 = v32;
                }
                int64_t v33 = v23;
                int64_t v34 = v24;
                v25.location = v23 + v31;
                if (v32 >= v22) {
                  uint64_t v26 = v22;
                }
                else {
                  uint64_t v26 = v32;
                }
                v25.length = v26 + v21;
                CFStringGetCharacters(theString, v25, (UniChar *)v27);
                int64_t v13 = v33;
              }
              UniChar v18 = *((_WORD *)v27 + v14 - v13);
            }
            if ((v15 >> 10 == 54) != (v18 >> 10 == 55)) {
              goto LABEL_37;
            }
          }
          BOOL v5 = ++v14 < Length;
          --v12;
          ++v16;
          UniChar v15 = v18;
          if (Length == v14) {
            goto LABEL_37;
          }
        }
      }
    }
    BOOL v5 = 0;
LABEL_37:
  }
LABEL_6:

  return v5;
}

@end