@interface PRTypologyRecord
+ (id)currentTypologyRecord;
+ (id)openTypologyRecordWithString:(id)a3 range:(_NSRange)a4 languageObject:(id)a5 languages:(id)a6 topLanguages:(id)a7 autocorrect:(BOOL)a8 initialCapitalize:(BOOL)a9 autocapitalize:(BOOL)a10 keyEventArray:(id)a11 appIdentifier:(id)a12 selectedRangeValue:(id)a13;
+ (void)resetTypologyRecords;
+ (void)setTypologyRecordsLimit:(unint64_t)a3;
+ (void)writeTypologyRecords;
- (PRTypologyRecord)initWithString:(id)a3 offset:(unint64_t)a4 range:(_NSRange)a5 languageObject:(id)a6 languages:(id)a7 topLanguages:(id)a8 autocorrect:(BOOL)a9 initialCapitalize:(BOOL)a10 autocapitalize:(BOOL)a11 keyEventArray:(id)a12 appIdentifier:(id)a13 selectedRangeValue:(id)a14;
- (id)dictionaryRepresentation;
- (void)addCandidate:(id)a3;
- (void)addCorrection:(id)a3;
- (void)closeTypologyRecordWithResults:(id)a3;
- (void)dealloc;
@end

@implementation PRTypologyRecord

- (PRTypologyRecord)initWithString:(id)a3 offset:(unint64_t)a4 range:(_NSRange)a5 languageObject:(id)a6 languages:(id)a7 topLanguages:(id)a8 autocorrect:(BOOL)a9 initialCapitalize:(BOOL)a10 autocapitalize:(BOOL)a11 keyEventArray:(id)a12 appIdentifier:(id)a13 selectedRangeValue:(id)a14
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v23.receiver = self;
  v23.super_class = (Class)PRTypologyRecord;
  v20 = [(PRTypologyRecord *)&v23 init];
  if (v20)
  {
    uint64_t v21 = [a3 copy];
    v20->_offset = a4;
    v20->_string = (NSString *)v21;
    v20->_range.NSUInteger location = location;
    v20->_range.NSUInteger length = length;
    v20->_langObj = (PRLanguage *)[a6 copy];
    v20->_languages = (NSArray *)[a7 copy];
    v20->_appIdentifier = (NSString *)[a13 copy];
    v20->_selectedRangeValue = (NSValue *)[a14 copy];
    v20->_topLanguages = (NSArray *)[a8 copy];
    v20->_keyEventArray = (NSArray *)[a12 copy];
    v20->_typologyCorrections = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v20->_typologyCandidates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v20->_autocorrect = a9;
    v20->_initialCapitalize = a10;
    v20->_autocapitalize = a11;
    v20->_isOpen = 1;
    v20->_openTime = CFAbsoluteTimeGetCurrent();
  }
  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRTypologyRecord;
  [(PRTypologyRecord *)&v3 dealloc];
}

+ (id)openTypologyRecordWithString:(id)a3 range:(_NSRange)a4 languageObject:(id)a5 languages:(id)a6 topLanguages:(id)a7 autocorrect:(BOOL)a8 initialCapitalize:(BOOL)a9 autocapitalize:(BOOL)a10 keyEventArray:(id)a11 appIdentifier:(id)a12 selectedRangeValue:(id)a13
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v19 = [a3 length];
  if (openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue__onceToken != -1) {
    dispatch_once(&openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue__onceToken, &__block_literal_global_163);
  }
  v20 = 0;
  if ((_enabledLogTypes & 0x400) != 0 && _typologyRecords && _typologyRecordsSerialQueue && v19)
  {
    unint64_t v21 = location - 64;
    if (location < 0x40) {
      unint64_t v21 = 0;
    }
    unint64_t v22 = length + location + 64;
    if (v22 >= v19 || v21 >= v22) {
      unint64_t v22 = v19;
    }
    unint64_t v24 = v22 - v21;
    if (v24 >= 0x400) {
      unint64_t v24 = 1024;
    }
    if (v21 >= v19) {
      unint64_t v25 = v19 - 1;
    }
    else {
      unint64_t v25 = v21;
    }
    if (v24 + v25 <= v19) {
      unint64_t v26 = v24;
    }
    else {
      unint64_t v26 = v19 - v25;
    }
    BYTE2(v28) = a10;
    LOWORD(v28) = __PAIR16__(a9, a8);
    v20 = -[PRTypologyRecord initWithString:offset:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:]([PRTypologyRecord alloc], "initWithString:offset:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:", objc_msgSend(a3, "substringWithRange:", v25, v26), v25, location, length, a5, a6, a7, v28, a11, a12, a13);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke_2;
    block[3] = &unk_2640EF4B0;
    block[4] = v20;
    dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
  }
  return v20;
}

dispatch_queue_t __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke()
{
  _typologyRecords = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.typologyRecordsSerialQueue", 0);
  _typologyRecordsSerialQueue = (uint64_t)result;
  return result;
}

unint64_t __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke_2(uint64_t a1)
{
  [(id)_typologyRecords addObject:*(void *)(a1 + 32)];
  for (unint64_t result = [(id)_typologyRecords count];
        result > _numTypologyRecords;
        unint64_t result = [(id)_typologyRecords count])
  {
    [(id)_typologyRecords removeObjectAtIndex:0];
  }
  return result;
}

+ (id)currentTypologyRecord
{
  v2 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  uint64_t v12 = 0;
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords) {
      BOOL v3 = _typologyRecordsSerialQueue == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__PRTypologyRecord_currentTypologyRecord__block_invoke;
      block[3] = &unk_2640EF830;
      block[4] = &v7;
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
      v2 = (void *)v8[5];
    }
  }
  id v4 = v2;
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __41__PRTypologyRecord_currentTypologyRecord__block_invoke(uint64_t a1)
{
  id result = (id)[(id)_typologyRecords lastObject];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addCorrection:(id)a3
{
  if (self->_isOpen) {
    [(NSMutableArray *)self->_typologyCorrections addObject:a3];
  }
}

- (void)addCandidate:(id)a3
{
  if (self->_isOpen) {
    [(NSMutableArray *)self->_typologyCandidates addObject:a3];
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  string = self->_string;
  if (string) {
    [v3 setObject:string forKey:@"StringToCheck"];
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_offset), @"Offset");
  [v4 setObject:NSStringFromRange(self->_range) forKey:@"Range"];
  selectedRangeValue = self->_selectedRangeValue;
  if (selectedRangeValue)
  {
    v38.NSUInteger location = [(NSValue *)selectedRangeValue rangeValue];
    [v4 setObject:NSStringFromRange(v38) forKey:@"SelectedRange"];
  }
  langObuint64_t j = self->_langObj;
  if (langObj) {
    objc_msgSend(v4, "setObject:forKey:", -[PRLanguage identifier](langObj, "identifier"), @"Language");
  }
  languages = self->_languages;
  if (languages) {
    [v4 setObject:languages forKey:@"Languages"];
  }
  topLanguages = self->_topLanguages;
  if (topLanguages) {
    [v4 setObject:topLanguages forKey:@"TopLanguages"];
  }
  appIdentifier = self->_appIdentifier;
  if (appIdentifier) {
    [v4 setObject:appIdentifier forKey:@"AppIdentifier"];
  }
  keyEventArray = self->_keyEventArray;
  if (keyEventArray) {
    objc_msgSend(v4, "setObject:forKey:", -[NSArray description](keyEventArray, "description"), @"KeyEventArray");
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_autocorrect), @"Autocorrect");
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_initialCapitalize), @"InitialCapitalize");
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_autocapitalize), @"Autocapitalize");
  typologyCorrections = self->_typologyCorrections;
  if (typologyCorrections && [(NSMutableArray *)typologyCorrections count])
  {
    v13 = (void *)[MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v14 = self->_typologyCorrections;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v16);
    }
    [v4 setObject:v13 forKey:@"Corrections"];
  }
  typologyCandidates = self->_typologyCandidates;
  if (typologyCandidates && [(NSMutableArray *)typologyCandidates count])
  {
    v20 = (void *)[MEMORY[0x263EFF980] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v21 = self->_typologyCandidates;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
    [v4 setObject:v20 forKey:@"Candidates"];
  }
  if (!self->_isOpen) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_closeTime - self->_openTime), @"Time");
  }
  return v4;
}

+ (void)writeTypologyRecords
{
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords) {
      BOOL v3 = _typologyRecordsSerialQueue == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      uint64_t v4 = v2;
      uint64_t v5 = [(id)_NSSpellingDictDirectoryPath2() stringByAppendingPathComponent:@"typology.plist"];
      uint64_t v8 = 0;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__PRTypologyRecord_writeTypologyRecords__block_invoke;
      block[3] = &unk_2640EF4B0;
      block[4] = v4;
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
      v6 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:100 options:0 error:&v8];
      if (v6) {
        [v6 writeToFile:v5 options:1 error:&v8];
      }
      else {
        NSLog((NSString *)@"typology error: %@", v8);
      }
    }
  }
}

uint64_t __40__PRTypologyRecord_writeTypologyRecords__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = (void *)_typologyRecords;
  uint64_t result = [(id)_typologyRecords countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "dictionaryRepresentation"));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)resetTypologyRecords
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", objc_msgSend((id)_NSSpellingDictDirectoryPath2(), "stringByAppendingPathComponent:", @"typology.plist"), 0);
  if ((_enabledLogTypes & 0x400) != 0)
  {
    uint64_t v2 = _typologyRecordsSerialQueue;
    if (_typologyRecords && _typologyRecordsSerialQueue != 0)
    {
      dispatch_sync(v2, &__block_literal_global_212);
    }
  }
}

uint64_t __40__PRTypologyRecord_resetTypologyRecords__block_invoke()
{
  return [(id)_typologyRecords removeAllObjects];
}

+ (void)setTypologyRecordsLimit:(unint64_t)a3
{
  _numTypologyRecords = a3;
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords) {
      BOOL v3 = _typologyRecordsSerialQueue == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, &__block_literal_global_214);
    }
  }
}

unint64_t __44__PRTypologyRecord_setTypologyRecordsLimit___block_invoke()
{
  for (unint64_t result = [(id)_typologyRecords count];
        result > _numTypologyRecords;
        unint64_t result = [(id)_typologyRecords count])
  {
    [(id)_typologyRecords removeObjectAtIndex:0];
  }
  return result;
}

- (void)closeTypologyRecordWithResults:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_results = (NSArray *)[a3 copy];
    self->_isOpen = 0;
  }
}

@end