@interface UIDictationMultilingualResults
- (BOOL)isEqual:(id)a3;
- (NSArray)phrases;
- (NSString)dominantLanguage;
- (UIDictationMultilingualResults)initWithCoder:(id)a3;
- (UIDictationMultilingualResults)initWithPhrases:(id)a3 dominantLanguage:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDominantLanguage:(id)a3;
- (void)setPhrases:(id)a3;
@end

@implementation UIDictationMultilingualResults

- (UIDictationMultilingualResults)initWithPhrases:(id)a3 dominantLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationMultilingualResults;
  v8 = [(UIDictationMultilingualResults *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    dominantLanguage = v8->_dominantLanguage;
    v8->_dominantLanguage = (NSString *)v11;
  }
  return v8;
}

- (UIDictationMultilingualResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationMultilingualResults;
  v5 = [(UIDictationMultilingualResults *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"phrases"];
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dominantLanguage"];
    dominantLanguage = v5->_dominantLanguage;
    v5->_dominantLanguage = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  phrases = self->_phrases;
  id v5 = a3;
  [v5 encodeObject:phrases forKey:@"phrases"];
  [v5 encodeObject:self->_dominantLanguage forKey:@"dominantLanguage"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDictationMultilingualResults *)self dominantLanguage];
  id v6 = [v4 dominantLanguage];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(UIDictationMultilingualResults *)self phrases];
    v8 = [v4 phrases];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(UIDictationMultilingualResults *)self dominantLanguage];
  uint64_t v4 = [v3 hash];
  id v5 = [(UIDictationMultilingualResults *)self phrases];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(UIDictationMultilingualResults);
  id v5 = (void *)[(NSArray *)self->_phrases copy];
  [(UIDictationMultilingualResults *)v4 setPhrases:v5];

  unint64_t v6 = (void *)[(NSString *)self->_dominantLanguage copy];
  [(UIDictationMultilingualResults *)v4 setDominantLanguage:v6];

  return v4;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (NSString)dominantLanguage
{
  return self->_dominantLanguage;
}

- (void)setDominantLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantLanguage, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end