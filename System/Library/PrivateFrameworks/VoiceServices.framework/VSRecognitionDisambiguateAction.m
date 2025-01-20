@interface VSRecognitionDisambiguateAction
- (BOOL)_keywordIndexChanged;
- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4;
- (__VSRecognitionDisambiguationContext)_disambiguationContext;
- (id)_actionForEmptyResults;
- (id)_keywords;
- (id)ambiguousValuesForClassIdentifier:(id)a3;
- (id)knownValueForClassIdentifier:(id)a3;
- (id)knownValuesForClassIdentifier:(id)a3;
- (id)repeatedSpokenFeedbackString;
- (id)sequenceTag;
- (int)completionType;
- (void)dealloc;
- (void)setAmbiguousValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5;
- (void)setKeywords:(id)a3;
- (void)setKnownValue:(id)a3 phoneticValue:(id)a4 forClassIdentifier:(id)a5;
- (void)setKnownValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5;
- (void)setRepeatedSpokenFeedbackString:(id)a3;
- (void)setSequenceTag:(id)a3;
@end

@implementation VSRecognitionDisambiguateAction

- (id)_actionForEmptyResults
{
  if ([(NSString *)self->_repeatedSpokenFeedbackString length]) {
    [(VSRecognitionAction *)self setSpokenFeedbackString:self->_repeatedSpokenFeedbackString];
  }
  return self;
}

- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4
{
  CFStringRef v7 = [(VSRecognitionRecognizeAction *)self modelIdentifier];
  result = [(VSRecognitionDisambiguateAction *)self _disambiguationContext];
  if (result)
  {
    v9 = result;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v7) {
      CFStringRef v11 = v7;
    }
    else {
      CFStringRef v11 = @"_default";
    }
    return (__VSRecognition *)_VSRecognitionCreate(v10, v11, v9, (long long *)a3, (uint64_t)a4);
  }
  return result;
}

- (__VSRecognitionDisambiguationContext)_disambiguationContext
{
  if (!self->_context
    && [(NSString *)self->super._modelIdentifier length]
    && [(NSString *)self->_sequenceTag length]
    && [(NSMutableDictionary *)self->_knownValues count]
    && [(NSMutableDictionary *)self->_ambiguousValues count])
  {
    self->_context = VSRecognitionDisambiguationContextCreate(*MEMORY[0x263EFFB08], self->super._modelIdentifier, self->_sequenceTag, (CFDictionaryRef)self->_knownValues, self->_knownPhoneticValues, self->_ambiguousValues, self->_ambiguousPhoneticValues);
  }
  return (__VSRecognitionDisambiguationContext *)self->_context;
}

- (void)setKeywords:(id)a3
{
  keywords = self->super._keywords;
  if (keywords != a3)
  {

    self->super._keywords = (NSArray *)a3;
  }
}

- (BOOL)_keywordIndexChanged
{
  return 0;
}

- (id)_keywords
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id result = self->super._keywords;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    ambiguousValues = self->_ambiguousValues;
    if (ambiguousValues) {
      CFDictionaryApplyFunction((CFDictionaryRef)ambiguousValues, (CFDictionaryApplierFunction)_AddAmbiguousKeywords, v4);
    }
    knownValues = self->_knownValues;
    if (knownValues) {
      CFDictionaryApplyFunction((CFDictionaryRef)knownValues, (CFDictionaryApplierFunction)_AddKnownKeywords, v4);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v4);
          }
          [(NSArray *)v5 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v9 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
    self->super._keywords = v5;

    return self->super._keywords;
  }
  return result;
}

- (void)setAmbiguousValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9 = [a3 count];
  ambiguousValues = self->_ambiguousValues;
  if (v9)
  {
    if (!ambiguousValues)
    {
      ambiguousValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_ambiguousValues = ambiguousValues;
    }
    [(NSMutableDictionary *)ambiguousValues setObject:a3 forKey:a5];
    if ([a4 count] == v9)
    {
      ambiguousPhoneticValues = self->_ambiguousPhoneticValues;
      if (!ambiguousPhoneticValues)
      {
        ambiguousPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_ambiguousPhoneticValues = ambiguousPhoneticValues;
      }
      [(NSMutableDictionary *)ambiguousPhoneticValues setObject:a4 forKey:a5];
    }
  }
  else
  {
    [(NSMutableDictionary *)ambiguousValues removeObjectForKey:a5];
    long long v12 = self->_ambiguousPhoneticValues;
    [(NSMutableDictionary *)v12 removeObjectForKey:a5];
  }
}

- (id)ambiguousValuesForClassIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_ambiguousValues objectForKey:a3];
}

- (void)setKnownValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9 = [a3 count];
  knownValues = self->_knownValues;
  if (v9)
  {
    if (!knownValues)
    {
      knownValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_knownValues = knownValues;
    }
    [(NSMutableDictionary *)knownValues setObject:a3 forKey:a5];
    uint64_t v11 = [a4 count];
    knownPhoneticValues = self->_knownPhoneticValues;
    if (v11)
    {
      if (!knownPhoneticValues)
      {
        knownPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_knownPhoneticValues = knownPhoneticValues;
      }
      [(NSMutableDictionary *)knownPhoneticValues setObject:a4 forKey:a5];
      return;
    }
  }
  else
  {
    [(NSMutableDictionary *)knownValues removeObjectForKey:a5];
    knownPhoneticValues = self->_knownPhoneticValues;
  }
  [(NSMutableDictionary *)knownPhoneticValues removeObjectForKey:a5];
}

- (id)knownValuesForClassIdentifier:(id)a3
{
  v3 = (void *)[(NSMutableDictionary *)self->_knownValues objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v3;
  }
  id v4 = (void *)MEMORY[0x263EFF8C0];
  return (id)[v4 arrayWithObject:v3];
}

- (void)setKnownValue:(id)a3 phoneticValue:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9 = [a3 length];
  knownValues = self->_knownValues;
  if (v9)
  {
    if (!knownValues)
    {
      knownValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_knownValues = knownValues;
    }
    [(NSMutableDictionary *)knownValues setObject:a3 forKey:a5];
    uint64_t v11 = [a4 length];
    knownPhoneticValues = self->_knownPhoneticValues;
    if (v11)
    {
      if (!knownPhoneticValues)
      {
        knownPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_knownPhoneticValues = knownPhoneticValues;
      }
      [(NSMutableDictionary *)knownPhoneticValues setObject:a4 forKey:a5];
      return;
    }
  }
  else
  {
    [(NSMutableDictionary *)knownValues removeObjectForKey:a5];
    knownPhoneticValues = self->_knownPhoneticValues;
  }
  [(NSMutableDictionary *)knownPhoneticValues removeObjectForKey:a5];
}

- (id)knownValueForClassIdentifier:(id)a3
{
  v3 = (void *)[(NSMutableDictionary *)self->_knownValues objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v3;
  }
  return (id)[v3 lastObject];
}

- (void)setSequenceTag:(id)a3
{
  sequenceTag = self->_sequenceTag;
  if (sequenceTag != a3)
  {

    self->_sequenceTag = (NSString *)a3;
  }
}

- (id)sequenceTag
{
  return self->_sequenceTag;
}

- (id)repeatedSpokenFeedbackString
{
  return self->_repeatedSpokenFeedbackString;
}

- (void)setRepeatedSpokenFeedbackString:(id)a3
{
  repeatedSpokenFeedbackString = self->_repeatedSpokenFeedbackString;
  if (repeatedSpokenFeedbackString != a3)
  {

    self->_repeatedSpokenFeedbackString = (NSString *)a3;
  }
}

- (int)completionType
{
  return 2;
}

- (void)dealloc
{
  context = self->_context;
  if (context) {
    CFRelease(context);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionDisambiguateAction;
  [(VSRecognitionRecognizeAction *)&v4 dealloc];
}

@end