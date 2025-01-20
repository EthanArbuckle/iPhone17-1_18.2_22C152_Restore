@interface RKMessageIntentRecognizer
+ (id)getRangesOfKeywords:(id)a3 forMessage:(id)a4;
+ (id)sharedManager;
- (RKMessageIntentRecognizer)init;
- (id)copyAttributedTokensForMessage:(id)a3 conversationTurns:(id)a4 metadata:(id)a5 languageID:(id)a6;
- (void)dealloc;
- (void)getMessageIntentRecognizer:(id)a3;
@end

@implementation RKMessageIntentRecognizer

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__RKMessageIntentRecognizer_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, block);
  }
  v2 = (void *)sharedManager_sharedMessageIntentManager;

  return v2;
}

uint64_t __42__RKMessageIntentRecognizer_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedMessageIntentManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (RKMessageIntentRecognizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RKMessageIntentRecognizer;
  v2 = [(RKMessageIntentRecognizer *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)_localeMessageIntentRecognizer;
    _localeMessageIntentRecognizer = (uint64_t)v3;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RKMessageIntentRecognizer;
  [(RKMessageIntentRecognizer *)&v2 dealloc];
}

- (void)getMessageIntentRecognizer:(id)a3
{
  id v3 = (__CFString *)a3;
  v4 = [(id)_localeMessageIntentRecognizer objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = [(id)_localeMessageIntentRecognizer objectForKeyedSubscript:v3];
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v7 = Mutable;
    if (!v3) {
      id v3 = @"en";
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F57490], v3);
    v5 = (void *)NLMessageIntentRecognizerCreate();
    CFRelease(v7);
    if (v5) {
      [(id)_localeMessageIntentRecognizer setObject:v5 forKeyedSubscript:v3];
    }
  }

  return v5;
}

+ (id)getRangesOfKeywords:(id)a3 forMessage:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v20 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "substringFromIndex:", v9, v20);
        uint64_t v14 = [v13 rangeOfString:v12];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = v14;
          uint64_t v17 = v15;
          v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v14 + v9, v15);
          [v20 addObject:v18];

          v9 += v17 + v16;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  return v20;
}

- (id)copyAttributedTokensForMessage:(id)a3 conversationTurns:(id)a4 metadata:(id)a5 languageID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:a6];
  [(RKMessageIntentRecognizer *)self getMessageIntentRecognizer:v13];
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (v11)
  {
    v30 = v13;
    id v31 = v12;
    id v32 = v10;
    uint64_t v16 = [v11 count];
    if (v16 >= 1)
    {
      uint64_t v17 = v16;
      CFIndex v18 = 0;
      v19 = &stru_26C8AEFC8;
      while (1)
      {
        id v20 = [v11 objectAtIndexedSubscript:v18];
        [v20 timestamp];

        [v20 text];
        [v20 senderId];

        v21 = (const void *)NLMessageConversationTurnCreate();
        CFArrayInsertValueAtIndex(Mutable, v18, v21);
        long long v22 = [v20 text];
        long long v23 = [v22 stringByAppendingString:v19];

        if (!v23) {
          break;
        }
        v19 = [@" " stringByAppendingString:v23];

        if (v21) {
          goto LABEL_6;
        }
LABEL_7:

        if (v17 == ++v18) {
          goto LABEL_14;
        }
      }
      v19 = @" ";
      if (!v21) {
        goto LABEL_7;
      }
LABEL_6:
      CFRelease(v21);
      goto LABEL_7;
    }
    v19 = &stru_26C8AEFC8;
LABEL_14:

    id v12 = v31;
    id v10 = v32;
    v13 = v30;
  }
  else
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v25 = CFDateCreate(v14, Current);
    v26 = (const void *)NLMessageConversationTurnCreate();
    CFRelease(v25);
    CFArrayInsertValueAtIndex(Mutable, 0, v26);
    if (v26) {
      CFRelease(v26);
    }
  }
  uint64_t v27 = (const void *)NLMessageConversationCreate();
  v28 = (void *)NLMessageIntentRecognizerCopyTopNIntentCandidates();
  if (v27) {
    CFRelease(v27);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }

  return v28;
}

@end