@interface PRLexicon
+ (PRLexicon)lexiconWithLexicon:(const void *)a3;
+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4;
+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5;
+ (PRLexicon)lexiconWithName:(id)a3 words:(id)a4;
- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4;
- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4;
- (NSString)name;
- (PRLexicon)initWithLexicon:(const void *)a3;
- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4;
- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5;
- (PRLexicon)initWithName:(id)a3 words:(id)a4;
- (_LXLexicon)lexicon;
- (id)createCursor;
- (id)description;
- (id)stringForTokenID:(unsigned int)a3;
- (unsigned)tokenIDForString:(id)a3;
- (void)dealloc;
- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateEntriesForString:(id)a3 usingBlock:(id)a4;
@end

@implementation PRLexicon

- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = 0;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:");
  id v10 = objc_alloc(NSDictionary);
  if (v5) {
    uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", *MEMORY[0x263F51310], MEMORY[0x263EFFA88], *MEMORY[0x263F51308], v9, *MEMORY[0x263F51318], a4, *MEMORY[0x263F512F8], 0);
  }
  else {
    uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", *MEMORY[0x263F51308], v9, *MEMORY[0x263F51318], a4, *MEMORY[0x263F512F8], 0, v18, v19);
  }
  v12 = (PRLexicon *)v11;
  uint64_t v13 = LXLexiconCreate();
  if (v13)
  {
    v14 = (const void *)v13;
    v20.receiver = self;
    v20.super_class = (Class)PRLexicon;
    v15 = [(PRLexicon *)&v20 init];
    if (v15)
    {
      v15->_localization = (NSString *)[a3 copy];
      v15->_unigramsPath = (NSString *)[a4 copy];
      v15->_lexicon = v14;
    }
    else
    {
      CFRelease(v14);
    }
    self = v12;
  }
  else
  {
    if (a4) {
      NSLog((NSString *)@"Lexicon creation for %@:%@ failed: %@", a3, a4, v21);
    }
    else {
      NSLog((NSString *)@"Lexicon creation for %@ failed: %@", a3, v21, v17);
    }

    v15 = 0;
  }

  return v15;
}

- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4
{
  return [(PRLexicon *)self initWithLocalization:a3 unigramsPath:a4 cachedOnly:0];
}

- (PRLexicon)initWithLexicon:(const void *)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRLexicon;
    v4 = [(PRLexicon *)&v7 init];
    BOOL v5 = v4;
    if (v4)
    {
      v4->_localization = (NSString *)@"External";
      v4->_lexicon = CFRetain(a3);
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (PRLexicon)initWithName:(id)a3 words:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  id v7 = objc_alloc(NSDictionary);
  v8 = (PRLexicon *)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, *MEMORY[0x263F51320], 0);
  if (!a3 || !a4) {
    goto LABEL_14;
  }
  uint64_t Mutable = LXLexiconCreateMutable();
  if (!Mutable)
  {
    NSLog((NSString *)@"Lexicon creation for %@ failed: %@", a3, cf);
LABEL_14:

    v12 = 0;
    goto LABEL_17;
  }
  id v10 = (const void *)Mutable;
  v22.receiver = self;
  v22.super_class = (Class)PRLexicon;
  uint64_t v11 = [(PRLexicon *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_localization = (NSString *)@"External";
    v11->_name = (NSString *)[a3 copy];
    v12->_lexicon = v10;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [a4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(a4);
          }
          LXLexiconAdd();
        }
        uint64_t v14 = [a4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else
  {
    CFRelease(v10);
  }
  self = v8;
LABEL_17:

  return v12;
}

+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5
{
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithLocalization:a3 unigramsPath:a4 cachedOnly:a5];
  return (PRLexicon *)v5;
}

+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithLocalization:a3 unigramsPath:a4];
  return (PRLexicon *)v4;
}

+ (PRLexicon)lexiconWithLexicon:(const void *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithLexicon:a3];
  return (PRLexicon *)v3;
}

+ (PRLexicon)lexiconWithName:(id)a3 words:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithName:a3 words:a4];
  return (PRLexicon *)v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PRLexicon;
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%@(%@"), -[PRLexicon description](&v6, sel_description), self->_localization;
  v4 = v3;
  if (self->_unigramsPath) {
    [v3 appendFormat:@":%@", self->_unigramsPath];
  }
  if (self->_name) {
    [v4 appendFormat:@":%@", self->_name];
  }
  objc_msgSend(v4, "appendFormat:", @"(%p"), self->_lexicon);
  [v4 appendString:@""]);
  return v4;
}

- (void)dealloc
{
  lexicon = self->_lexicon;
  if (lexicon) {
    CFRelease(lexicon);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRLexicon;
  [(PRLexicon *)&v4 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (_LXLexicon)lexicon
{
  return (_LXLexicon *)self->_lexicon;
}

- (id)createCursor
{
  v3 = [PRLexiconCursor alloc];
  return [(PRLexiconCursor *)v3 initWithLexicon:self];
}

- (void)enumerateEntriesForString:(id)a3 usingBlock:(id)a4
{
  id v6 = [(PRLexicon *)self createCursor];
  [v6 advanceWithString:a3];
  [v6 enumerateEntriesUsingBlock:a4];
}

- (unsigned)tokenIDForString:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__PRLexicon_tokenIDForString___block_invoke;
  v5[3] = &unk_2640EFAD8;
  v5[4] = a3;
  v5[5] = &v6;
  [(PRLexicon *)self enumerateEntriesForString:a3 usingBlock:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__PRLexicon_tokenIDForString___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a5 = 1;
  }
  return result;
}

- (id)stringForTokenID:(unsigned int)a3
{
  uint64_t v3 = LXLexiconCopyEntryForTokenID();
  if (v3)
  {
    objc_super v4 = (const void *)v3;
    BOOL v5 = (void *)LXEntryCopyString();
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = 0xC03E000000000000;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PRLexicon_getProbabilityForString_probability___block_invoke;
  v8[3] = &unk_2640EFBC8;
  v8[4] = a3;
  v8[5] = &v9;
  v8[6] = &v13;
  [(PRLexicon *)self enumerateEntriesForString:a3 usingBlock:v8];
  int v5 = *((unsigned __int8 *)v14 + 24);
  if (a4 && *((unsigned char *)v14 + 24)) {
    *a4 = v10[3];
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __49__PRLexicon_getProbabilityForString_probability___block_invoke(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (result)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xC03E000000000000;
  id v7 = -[PRLexicon stringForTokenID:](self, "stringForTokenID:");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__PRLexicon_getProbabilityForTokenID_probability___block_invoke;
  v11[3] = &unk_2640EFBF0;
  unsigned int v12 = a3;
  v11[4] = &v13;
  v11[5] = &v17;
  [(PRLexicon *)self enumerateEntriesForString:v7 usingBlock:v11];
  int v8 = *((unsigned __int8 *)v18 + 24);
  if (a4 && *((unsigned char *)v18 + 24)) {
    *a4 = v14[3];
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __50__PRLexicon_getProbabilityForTokenID_probability___block_invoke(uint64_t result, double a2, uint64_t a3, int a4, uint64_t a5, unsigned char *a6)
{
  if (*(_DWORD *)(result + 48) == a4)
  {
    *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = [(PRLexicon *)self createCursor];
  [v8 advanceWithString:a3];
  [v8 enumerateCompletions:a4 usingBlock:a5];
}

- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  id v8 = [(PRLexicon *)self createCursor];
  [v8 advanceWithString:a3];
  [v8 enumerateCompletionEntries:a4 usingBlock:a5];
}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 withBlock:(id)a5
{
  long long v6 = *(_OWORD *)(MEMORY[0x263EFFEE8] + 16);
  *(_OWORD *)&callBacks.version = *MEMORY[0x263EFFEE8];
  *(_OWORD *)&callBacks.release = v6;
  [(PRLexicon *)self lexicon];
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  id v8 = [[PRLexiconCorrectionCursor alloc] initWithCursor:RootCursor replacementsCount:0 insertionsCount:0 deletionsCount:0 transpositionsCount:0 advancementLength:0];
  id v34 = a3;
  unint64_t v38 = [a3 length];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 1;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))heapCorrectionCursorCompare;
  BOOL v9 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &callBacks, 0);
  CFBinaryHeapAddValue(v9, v8);
  CFRelease(RootCursor);

  heap = v9;
  v28 = v40;
  v29 = v39;
  v30 = v41;
  while (!*((unsigned char *)v43 + 24) && CFBinaryHeapGetCount(heap) >= 1)
  {
    CFBinaryHeapGetCount(heap);
    id v10 = (id)CFBinaryHeapGetMinimum(heap);
    unint64_t v11 = objc_msgSend(v10, "advancementLength", v28, v29, v30);
    uint64_t v12 = [v10 totalEdits];
    uint64_t v13 = (const void *)[v10 cursor];
    CFBinaryHeapRemoveMinimumValue(heap);
    if (v11 < v38)
    {
      uint64_t v14 = [v34 rangeOfComposedCharacterSequenceAtIndex:v11];
      uint64_t v16 = v15;
      unint64_t v33 = v14;
      v35 = (__CFString *)objc_msgSend(v34, "substringWithRange:");
      if (!v12 && v11) {
        goto LABEL_14;
      }
      [v34 substringFromIndex:v11];
      uint64_t v17 = (const void *)LXCursorCreateByAdvancing();
      if (!v17) {
        goto LABEL_14;
      }
LABEL_13:
      v40[8] = MEMORY[0x263EF8330];
      v40[9] = 3221225472;
      v41[0] = __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke;
      v41[1] = &unk_2640EFC18;
      v41[2] = v10;
      v41[3] = v34;
      v41[4] = a5;
      v41[5] = v50;
      v41[6] = &v42;
      v41[7] = a4;
      LXCursorEnumerateEntries();
      CFRelease(v17);
      goto LABEL_14;
    }
    if (!v12 && v11)
    {
      BOOL v36 = 0;
      uint64_t v16 = 0;
      v35 = &stru_26C1C71A8;
      unint64_t v33 = v38;
      goto LABEL_23;
    }
    uint64_t v17 = CFRetain(v13);
    uint64_t v16 = 0;
    v35 = &stru_26C1C71A8;
    unint64_t v33 = v38;
    if (v17) {
      goto LABEL_13;
    }
LABEL_14:
    BOOL v18 = v12 == 0;
    BOOL v36 = v12 != 0;
    if (v11 >= v38 || v12) {
      goto LABEL_22;
    }
    uint64_t v19 = (const void *)LXCursorCreateByAdvancing();
    if (v19)
    {
      char v20 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v19, [v10 replacementsCount], objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount"), objc_msgSend(v10, "transpositionsCount"), objc_msgSend(v10, "advancementLength") + v16);
      CFBinaryHeapAddValue(heap, v20);
      ++v47[3];

      CFRelease(v19);
    }
    if (![v10 replacementsCount])
    {
      v39[5] = MEMORY[0x263EF8330];
      v39[6] = 3221225472;
      v40[0] = __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_2;
      v40[1] = &unk_2640EFC40;
      v40[2] = v34;
      v40[3] = v10;
      v40[6] = v16;
      v40[7] = heap;
      v40[4] = &v46;
      v40[5] = v33;
      LXCursorEnumerateChildren();
    }
    if ([v10 deletionsCount])
    {
      BOOL v18 = 1;
LABEL_22:
      if (!v18) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    v26 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v13, [v10 replacementsCount], objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount") + 1, objc_msgSend(v10, "transpositionsCount"), objc_msgSend(v10, "advancementLength") + v16);
    CFBinaryHeapAddValue(heap, v26);
    ++v47[3];

LABEL_23:
    if (v11 + 1 < v38 && ![v10 transpositionsCount] && v33 + v16 < v38)
    {
      uint64_t v21 = objc_msgSend(v34, "rangeOfComposedCharacterSequenceAtIndex:");
      uint64_t v23 = v22;
      objc_msgSend((id)objc_msgSend(v34, "substringWithRange:", v21, v22), "stringByAppendingString:", v35);
      v24 = (const void *)LXCursorCreateByAdvancing();
      if (v24)
      {
        uint64_t v25 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v24, [v10 replacementsCount], objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount"), objc_msgSend(v10, "transpositionsCount") + 1, v23 + v16 + objc_msgSend(v10, "advancementLength"));
        CFBinaryHeapAddValue(heap, v25);
        ++v47[3];

        CFRelease(v24);
      }
    }
LABEL_29:
    char v27 = v11 > v38 || v36;
    if ((v27 & 1) == 0 && ![v10 insertionsCount])
    {
      v39[0] = __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_3;
      v39[1] = &unk_2640EFC68;
      v39[2] = v10;
      v39[3] = &v46;
      v39[4] = heap;
      LXCursorEnumerateChildren();
    }
  }
  CFRelease(heap);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  LXEntryGetTokenID();
  char MetaFlags = LXEntryGetMetaFlags();
  LXEntryGetProbability();
  double v7 = v6;
  [*(id *)(a1 + 32) errorType];
  if ((MetaFlags & 0xC2) == 0)
  {
    id v8 = (void *)LXEntryCopyString();
    if (v8)
    {
      BOOL v9 = v8;
      if ((unint64_t)[v8 length] >= 3
        && ([*(id *)(a1 + 40) isEqualToString:v9] & 1) == 0)
      {
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v7);
        if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(a1 + 72))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          *a3 = 1;
        }
      }
      CFRelease(v9);
    }
  }
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_super v4 = (const void *)LXCursorCopyTraversedCharacters();
  if (([*(id *)(a1 + 32) hasPrefix:v4] & 1) == 0)
  {
    int v5 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", a2, [*(id *)(a1 + 40) replacementsCount] + 1, objc_msgSend(*(id *)(a1 + 40), "replacementsCount"), objc_msgSend(*(id *)(a1 + 40), "deletionsCount"), objc_msgSend(*(id *)(a1 + 40), "transpositionsCount"), *(void *)(a1 + 64) + objc_msgSend(*(id *)(a1 + 40), "advancementLength"));
    CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 72), v5);
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  CFRelease(v4);
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", a2, [*(id *)(a1 + 32) replacementsCount] + 1, objc_msgSend(*(id *)(a1 + 32), "replacementsCount"), objc_msgSend(*(id *)(a1 + 32), "deletionsCount"), objc_msgSend(*(id *)(a1 + 32), "transpositionsCount"), objc_msgSend(*(id *)(a1 + 32), "advancementLength"));
  CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 48), v3);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

@end