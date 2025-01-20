@interface VSTextPreProcessor
- (VSTextPreProcessor)initWithContentsOfPath:(id)a3 languageIdentifier:(id)a4;
- (id)processedTextFromString:(id)a3;
- (void)dealloc;
@end

@implementation VSTextPreProcessor

- (id)processedTextFromString:(id)a3
{
  v3 = (__CFString *)a3;
  CFIndex v5 = [a3 length];
  NSUInteger v6 = [(NSArray *)self->_rules count];
  tokenizer = self->_tokenizer;
  if (tokenizer)
  {
    v19.location = 0;
    v19.CFIndex length = v5;
    CFStringTokenizerSetString(tokenizer, v3, v19);
  }
  else
  {
    CFStringRef languageID = (const __CFString *)self->_languageID;
    CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (languageID)
    {
      CFLocaleRef v17 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], languageID);
      v20.location = 0;
      v20.CFIndex length = v5;
      self->_tokenizer = CFStringTokenizerCreate(v16, v3, v20, 0, v17);
      if (v17) {
        CFRelease(v17);
      }
    }
    else
    {
      v21.location = 0;
      v21.CFIndex length = v5;
      self->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, v21, 0, 0);
    }
  }
  uint64_t v8 = 0;
  v9 = 0;
  CurrentTokenRange.location = 0;
  CurrentTokenRange.CFIndex length = 0;
  while (CFStringTokenizerAdvanceToNextToken(self->_tokenizer))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(self->_tokenizer);
    if (v6)
    {
      unint64_t v10 = 1;
      do
      {
        uint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](self->_rules, "objectAtIndex:", v10 - 1, CurrentTokenRange.location), "matchedString:forTokenInRange:", v3, &CurrentTokenRange);
        v12 = (void *)v11;
        if (v10 >= v6) {
          break;
        }
        ++v10;
      }
      while (!v11);
      if (v11)
      {
        if (!v9) {
          v9 = (void *)[(__CFString *)v3 mutableCopy];
        }
        objc_msgSend(v9, "replaceCharactersInRange:withString:", CurrentTokenRange.location - v8, CurrentTokenRange.length, v12);
        CFIndex length = CurrentTokenRange.length;
        uint64_t v8 = length + v8 - [v12 length];
      }
    }
  }
  if (v9) {
    return v9;
  }
  return v3;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSTextPreProcessor;
  [(VSTextPreProcessor *)&v4 dealloc];
}

- (VSTextPreProcessor)initWithContentsOfPath:(id)a3 languageIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  NSUInteger v6 = [(VSTextPreProcessor *)self init];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfFile:a3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v17 = a4;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [[VSTextPreProcessorRule alloc] initWithDictionaryRepresentation:v13];
            if (!v14)
            {

              goto LABEL_17;
            }
            v15 = v14;
            if (!v10) {
              unint64_t v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
            }
            [(NSArray *)v10 addObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      if (v10)
      {
        v6->_rules = v10;
        v6->_CFStringRef languageID = (NSString *)v17;
        return v6;
      }
    }
    else
    {
LABEL_17:
    }
    return 0;
  }
  return v6;
}

@end