@interface WBSPasswordOrderedSetWordList
- (BOOL)isSensitive;
- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWords:(id)a5;
- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWordsArray:(id)a5;
- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4;
@end

@implementation WBSPasswordOrderedSetWordList

- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWords:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WBSPasswordOrderedSetWordList;
  v9 = [(WBSPasswordWordList *)&v14 initWithIdentifier:a3];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    words = v9->_words;
    v9->_words = (NSOrderedSet *)v10;

    v9->_sensitive = a4;
    v12 = v9;
  }

  return v9;
}

- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWordsArray:(id)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CAA0];
  id v9 = a3;
  uint64_t v10 = [v8 orderedSetWithArray:a5];
  v11 = [(WBSPasswordOrderedSetWordList *)self initWithIdentifier:v9 isSensitive:v6 orderedWords:v10];

  return v11;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  id v13 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  NSUInteger v7 = [(NSOrderedSet *)self->_words indexOfObject:v13];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v8 = v7 + 1;
    id v9 = [WBSPasswordWordListEntry alloc];
    BOOL sensitive = self->_sensitive;
    v11 = [(WBSPasswordWordList *)self identifier];
    v12 = [(WBSPasswordWordListEntry *)v9 initWithWord:v13 isSensitive:sensitive wordListIdentifier:v11 guessesRequired:v8];

    v6[2](v6, v12);
  }
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (void).cxx_destruct
{
}

@end