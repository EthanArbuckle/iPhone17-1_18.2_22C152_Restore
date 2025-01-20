@interface PSIWordEmbeddingMatch
+ (BOOL)supportsSecureCoding;
- (NSString)extendedWord;
- (NSString)word;
- (PSIWordEmbeddingMatch)initWithCoder:(id)a3;
- (PSIWordEmbeddingMatch)initWithWord:(id)a3 extendedWord:(id)a4 score:(double)a5;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSIWordEmbeddingMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedWord, 0);
  objc_storeStrong((id *)&self->_word, 0);
}

- (double)score
{
  return self->_score;
}

- (NSString)extendedWord
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)word
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  word = self->_word;
  id v5 = a3;
  [v5 encodeObject:word forKey:@"word"];
  [v5 encodeObject:self->_extendedWord forKey:@"extendedWord"];
  [v5 encodeDouble:@"score" forKey:self->_score];
}

- (PSIWordEmbeddingMatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSIWordEmbeddingMatch;
  id v5 = [(PSIWordEmbeddingMatch *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"word"];
    word = v5->_word;
    v5->_word = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedWord"];
    extendedWord = v5->_extendedWord;
    v5->_extendedWord = (NSString *)v8;

    [v4 decodeDoubleForKey:@"score"];
    v5->_score = v10;
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ <- %@ (%f)", self->_word, self->_extendedWord, *(void *)&self->_score];
}

- (PSIWordEmbeddingMatch)initWithWord:(id)a3 extendedWord:(id)a4 score:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSIWordEmbeddingMatch;
  v11 = [(PSIWordEmbeddingMatch *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_word, a3);
    objc_storeStrong((id *)&v12->_extendedWord, a4);
    v12->_score = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end