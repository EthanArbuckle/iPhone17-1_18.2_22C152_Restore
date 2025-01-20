@interface PRLexiconCursor
- (BOOL)hasChildren;
- (BOOL)hasEntries;
- (BOOL)isValid;
- (PRLexiconCursor)initWithLexicon:(id)a3;
- (double)prefixProbability;
- (double)terminationProbability;
- (void)_advance:(id)a3;
- (void)_enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4;
- (void)advanceWithString:(id)a3;
- (void)dealloc;
- (void)enumerateCompletionEntries:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateEntriesUsingBlock:(id)a3;
@end

@implementation PRLexiconCursor

- (PRLexiconCursor)initWithLexicon:(id)a3
{
  v3 = self;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRLexiconCursor;
    v3 = [(PRLexiconCursor *)&v7 init];
    if (v3)
    {
      v5 = (PRLexicon *)a3;
      v3->_lexicon = v5;
      [(PRLexicon *)v5 lexicon];
      v3->_cursor = (_LXCursor *)LXLexiconCreateRootCursor();
    }
  }
  return v3;
}

- (void)dealloc
{
  cursor = self->_cursor;
  if (cursor) {
    CFRelease(cursor);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRLexiconCursor;
  [(PRLexiconCursor *)&v4 dealloc];
}

- (void)_advance:(id)a3
{
  if (self->_cursor)
  {
    objc_super v4 = (_LXCursor *)LXCursorCreateByAdvancing();
    CFRelease(self->_cursor);
    self->_cursor = v4;
  }
}

- (void)advanceWithString:(id)a3
{
  if ([a3 length])
  {
    [(PRLexiconCursor *)self _advance:a3];
  }
}

- (BOOL)isValid
{
  return self->_cursor != 0;
}

- (BOOL)hasEntries
{
  cursor = self->_cursor;
  if (cursor) {
    LOBYTE(cursor) = LXCursorHasEntries() != 0;
  }
  return (char)cursor;
}

- (BOOL)hasChildren
{
  cursor = self->_cursor;
  if (cursor) {
    LOBYTE(cursor) = LXCursorHasChildren() != 0;
  }
  return (char)cursor;
}

- (double)prefixProbability
{
  cursor = self->_cursor;
  if (!cursor) {
    return -30.0;
  }
  MEMORY[0x270F46EE0](cursor, a2);
  return result;
}

- (double)terminationProbability
{
  cursor = self->_cursor;
  if (!cursor) {
    return -30.0;
  }
  MEMORY[0x270F46EE8](cursor, a2);
  return result;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 0;
  if (self->_cursor) {
    LXCursorEnumerateEntries();
  }
  _Block_object_dispose(v3, 8);
}

void __46__PRLexiconCursor_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    LXEntryGetTokenID();
    LXEntryGetMetaFlags();
    LXEntryGetProbability();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
}

- (void)_enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4
{
  if (self->_cursor)
  {
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v4[3] = 0;
    LXCursorEnumerateEntriesRecursively();
    _Block_object_dispose(v4, 8);
  }
}

uint64_t __52__PRLexiconCursor__enumerateCompletions_usingBlock___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  LXEntryGetTokenID();
  uint64_t result = LXEntryGetProbability();
  uint64_t v6 = *(void *)(a1[5] + 8);
  unint64_t v7 = *(void *)(v6 + 24);
  if (v7 >= a1[6])
  {
    *(void *)(v6 + 24) = v7 + 1;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(a1[4] + 16))();
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
    *a3 = 1;
  }
  return result;
}

- (void)enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4
{
  if (self->_cursor)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__PRLexiconCursor_enumerateCompletions_usingBlock___block_invoke;
    v4[3] = &unk_2640EFBA0;
    void v4[4] = a4;
    [(PRLexiconCursor *)self _enumerateCompletions:a3 usingBlock:v4];
  }
}

uint64_t __51__PRLexiconCursor_enumerateCompletions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char v5 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v5) {
    *a3 = 1;
  }
  return result;
}

- (void)enumerateCompletionEntries:(unint64_t)a3 usingBlock:(id)a4
{
  if (self->_cursor)
  {
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v4[3] = 0;
    LXCursorEnumerateEntriesRecursively();
    _Block_object_dispose(v4, 8);
  }
}

void __57__PRLexiconCursor_enumerateCompletionEntries_usingBlock___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = LXEntryCopyString();
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    LXEntryGetTokenID();
    LXEntryGetProbability();
    uint64_t v7 = *(void *)(a1[5] + 8);
    unint64_t v8 = *(void *)(v7 + 24);
    if (v8 >= a1[6])
    {
      *(void *)(v7 + 24) = v8 + 1;
    }
    else
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
    }
    if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

@end