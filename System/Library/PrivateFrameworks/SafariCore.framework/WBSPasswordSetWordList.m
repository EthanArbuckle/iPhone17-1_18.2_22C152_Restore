@interface WBSPasswordSetWordList
- (WBSPasswordSetWordList)initWithIdentifier:(id)a3 words:(id)a4;
- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4;
@end

@implementation WBSPasswordSetWordList

- (WBSPasswordSetWordList)initWithIdentifier:(id)a3 words:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordSetWordList;
  v7 = [(WBSPasswordWordList *)&v12 initWithIdentifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    words = v7->_words;
    v7->_words = (NSSet *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([(NSSet *)self->_words containsObject:v12])
  {
    NSUInteger v7 = [(NSSet *)self->_words count];
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7 >> 1;
    }
    v9 = [WBSPasswordWordListEntry alloc];
    v10 = [(WBSPasswordWordList *)self identifier];
    v11 = [(WBSPasswordWordListEntry *)v9 initWithWord:v12 isSensitive:0 wordListIdentifier:v10 guessesRequired:v8];

    v6[2](v6, v11);
  }
}

- (void).cxx_destruct
{
}

@end