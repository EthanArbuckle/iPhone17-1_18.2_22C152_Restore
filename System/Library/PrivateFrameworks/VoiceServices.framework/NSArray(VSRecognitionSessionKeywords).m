@interface NSArray(VSRecognitionSessionKeywords)
- (id)_scrambledKeywordsAndAddToSet:()VSRecognitionSessionKeywords;
- (void)_nextKeywordUsingCursors:()VSRecognitionSessionKeywords;
@end

@implementation NSArray(VSRecognitionSessionKeywords)

- (void)_nextKeywordUsingCursors:()VSRecognitionSessionKeywords
{
  Value = (char *)CFDictionaryGetValue(theDict, key);
  unint64_t v6 = [key count];
  v7 = 0;
  if (v6 <= (unint64_t)Value) {
    Value = 0;
  }
  if ((unint64_t)Value < v6)
  {
    v7 = (void *)[key objectAtIndex:Value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = (void *)[v7 _nextKeywordUsingCursors:theDict];
    }
    CFDictionarySetValue(theDict, key, Value + 1);
  }
  return v7;
}

- (id)_scrambledKeywordsAndAddToSet:()VSRecognitionSessionKeywords
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v6 = [a1 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a1);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 _scrambledKeywordsAndAddToSet:a3];
          v13 = v5;
        }
        else
        {
          [v5 addObject:v11];
          v13 = a3;
          uint64_t v12 = (uint64_t)v11;
        }
        [v13 addObject:v12];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  if (v6)
  {
    uint64_t v14 = 0;
    do
    {
      [v5 exchangeObjectAtIndex:v14 withObjectAtIndex:random() % v6 + v14];
      ++v14;
      --v6;
    }
    while (v6);
  }
  return v5;
}

@end