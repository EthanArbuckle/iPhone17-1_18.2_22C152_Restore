@interface PSSearchOperation
+ (__CFStringTokenizer)_wordBoundaryTokenizer;
- (BOOL)_searchEntries:(id)a3 forQuery:(id)a4;
- (BOOL)_systemLanguageHasContinuousScript;
- (BOOL)isNewQuery;
- (NSSet)rootEntries;
- (NSString)query;
- (PSSearchOperation)initWithSearchQuery:(id)a3 rootEntries:(id)a4;
- (PSSearchOperationDelegate)delegate;
- (PSSearchResults)currentResults;
- (id)_filterEntriesMatchingQuery:(id)a3 forQuery:(id)a4;
- (id)debugDescription;
- (id)description;
- (void)_didCancel;
- (void)dealloc;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setNewQuery:(BOOL)a3;
@end

@implementation PSSearchOperation

- (PSSearchOperation)initWithSearchQuery:(id)a3 rootEntries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSSearchOperation;
  v8 = [(PSSearchOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    query = v8->_query;
    v8->_query = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    rootEntries = v8->_rootEntries;
    v8->_rootEntries = (NSSet *)v11;
  }
  return v8;
}

- (void)dealloc
{
  [(PSSearchOperation *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PSSearchOperation;
  [(PSSearchOperation *)&v3 dealloc];
}

- (void)_didCancel
{
  objc_super v3 = [(PSSearchOperation *)self delegate];
  [v3 searchOperationDidCancel:self];

  [(PSSearchOperation *)self setDelegate:0];
}

- (void)main
{
  if ([(PSSearchOperation *)self isCancelled]) {
    goto LABEL_7;
  }
  objc_super v3 = objc_alloc_init(PSSearchResults);
  currentResults = self->_currentResults;
  self->_currentResults = v3;

  v5 = [(PSSearchOperation *)self delegate];
  [v5 searchOperationDidBegin:self];

  if (![(NSString *)self->_query length]) {
    goto LABEL_6;
  }
  if (![(PSSearchOperation *)self _searchEntries:self->_rootEntries forQuery:self->_query]|| ([(PSSearchOperation *)self isNewQuery], ([(PSSearchOperation *)self isCancelled] & 1) != 0))
  {
LABEL_7:
    [(PSSearchOperation *)self _didCancel];
    return;
  }
  id v6 = [(PSSearchOperation *)self delegate];
  [v6 searchOperation:self configureSearchResults:self->_currentResults];

  [(PSSearchOperation *)self isNewQuery];
LABEL_6:
  if ([(PSSearchOperation *)self isCancelled]) {
    goto LABEL_7;
  }
  id v8 = [(PSSearchOperation *)self delegate];
  id v7 = [(PSSearchOperation *)self currentResults];
  [v8 searchOperationDidFinish:self withResults:v7];
}

- (BOOL)_searchEntries:(id)a3 forQuery:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PSSearchOperation *)self isCancelled])
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [(PSSearchOperation *)self delegate];
    if (v9)
    {
      v10 = [(PSSearchOperation *)self delegate];
      id v11 = [v10 searchOperation:self filteredEntriesForEntries:v6];
    }
    else
    {
      id v11 = v6;
    }

    v12 = [(PSSearchOperation *)self _filterEntriesMatchingQuery:v11 forQuery:v7];
    currentResults = self->_currentResults;
    objc_super v14 = [v12 allObjects];
    [(PSSearchResults *)currentResults addEntries:v14];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "childEntries", (void)v22);
          if ([v20 count]
            && ![(PSSearchOperation *)self _searchEntries:v20 forQuery:v7])
          {

            BOOL v8 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 1;
LABEL_17:
  }
  return v8;
}

+ (__CFStringTokenizer)_wordBoundaryTokenizer
{
  if (_wordBoundaryTokenizer_onceToken != -1) {
    dispatch_once(&_wordBoundaryTokenizer_onceToken, &__block_literal_global_20);
  }
  return (__CFStringTokenizer *)_wordBoundaryTokenizer_tokenizer;
}

void __43__PSSearchOperation__wordBoundaryTokenizer__block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFLocaleRef v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v3.location = 0;
  v3.length = 0;
  _wordBoundaryTokenizer_tokenizer = (uint64_t)CFStringTokenizerCreate(v0, 0, v3, 4uLL, v1);
}

- (BOOL)_systemLanguageHasContinuousScript
{
  if (_systemLanguageHasContinuousScript_onceToken != -1) {
    dispatch_once(&_systemLanguageHasContinuousScript_onceToken, &__block_literal_global_5);
  }
  return _systemLanguageHasContinuousScript_systemLanguageIsContinuous;
}

void __55__PSSearchOperation__systemLanguageHasContinuousScript__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  CFLocaleRef v1 = [v0 objectForKey:*MEMORY[0x1E4F1C438]];
  v2 = [v1 lowercaseString];

  _systemLanguageHasContinuousScript_systemLanguageIsContinuous = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [&unk_1EFB74318 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(&unk_1EFB74318);
        }
        if ([v2 isEqualToString:*(void *)(*((void *)&v7 + 1) + 8 * v6)]) {
          _systemLanguageHasContinuousScript_systemLanguageIsContinuous = 1;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1EFB74318 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_filterEntriesMatchingQuery:(id)a3 forQuery:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v5 = (__CFString *)a4;
  uint64_t v6 = +[PSSearchOperation _wordBoundaryTokenizer];
  v28.length = [(__CFString *)v5 length];
  v28.location = 0;
  CFStringTokenizerSetString(v6, v5, v28);
  long long v7 = [MEMORY[0x1E4F1CA48] array];
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    if (CurrentTokenRange.location != -1 && CurrentTokenRange.length)
    {
      long long v9 = -[__CFString substringWithRange:](v5, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      long long v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      char v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

      if ((v11 & 1) == 0)
      {
        if ([(PSSearchOperation *)self _systemLanguageHasContinuousScript])
        {
          uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name CONTAINS[cd] %@", v9];
          v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY keywords CONTAINS[cd] %@", v9];
        }
        else
        {
          objc_super v14 = NSString;
          id v15 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v9];
          uint64_t v16 = [v14 stringWithFormat:@".*\\b%@.*", v15];

          uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name MATCHES[cd] %@", v16];
          v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY keywords MATCHES[cd] %@", v16];
        }
        uint64_t v17 = (void *)MEMORY[0x1E4F28BA0];
        v26[0] = v12;
        v26[1] = v13;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
        v19 = [v17 orPredicateWithSubpredicates:v18];

        [v7 addObject:v19];
      }
    }
  }
  if ([v7 count])
  {
    v20 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
    v21 = v24;
    long long v22 = [v24 filteredSetUsingPredicate:v20];
  }
  else
  {
    long long v22 = [MEMORY[0x1E4F1CAD0] set];
    v21 = v24;
  }

  return v22;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PSSearchOperation;
  uint64_t v4 = [(PSSearchOperation *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ query: \"%@\", new query: %d", v4, self->_query, self->_newQuery];

  return v5;
}

- (id)debugDescription
{
  uint64_t v3 = [(PSSearchOperation *)self description];
  uint64_t v4 = [v3 stringByAppendingFormat:@", current results: %@", self->_currentResults];

  return v4;
}

- (NSString)query
{
  return self->_query;
}

- (NSSet)rootEntries
{
  return self->_rootEntries;
}

- (PSSearchResults)currentResults
{
  return (PSSearchResults *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)isNewQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (PSSearchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSearchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_rootEntries, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end