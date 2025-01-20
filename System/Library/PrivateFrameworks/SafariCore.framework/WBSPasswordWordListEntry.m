@interface WBSPasswordWordListEntry
- (BOOL)isSensitive;
- (NSString)word;
- (NSString)wordListIdentifier;
- (WBSPasswordWordListEntry)initWithWord:(id)a3 isSensitive:(BOOL)a4 wordListIdentifier:(id)a5 guessesRequired:(unint64_t)a6;
- (id)description;
- (unint64_t)guessesRequired;
@end

@implementation WBSPasswordWordListEntry

- (WBSPasswordWordListEntry)initWithWord:(id)a3 isSensitive:(BOOL)a4 wordListIdentifier:(id)a5 guessesRequired:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSPasswordWordListEntry;
  v12 = [(WBSPasswordWordListEntry *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    word = v12->_word;
    v12->_word = (NSString *)v13;

    v12->_sensitive = a4;
    uint64_t v15 = [v11 copy];
    wordListIdentifier = v12->_wordListIdentifier;
    v12->_wordListIdentifier = (NSString *)v15;

    v12->_guessesRequired = a6;
    v17 = v12;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = @"YES";
  if (!self->_sensitive) {
    v7 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; word = \"%@\"; sensitive = %@; wordListIdentifier = \"%@\"; guessesRequired = %lu>",
    v5,
    self,
    self->_word,
    v7,
    self->_wordListIdentifier,
  v8 = self->_guessesRequired);

  return v8;
}

- (NSString)word
{
  return self->_word;
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (NSString)wordListIdentifier
{
  return self->_wordListIdentifier;
}

- (unint64_t)guessesRequired
{
  return self->_guessesRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordListIdentifier, 0);
  objc_storeStrong((id *)&self->_word, 0);
}

@end