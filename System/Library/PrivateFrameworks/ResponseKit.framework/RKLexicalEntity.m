@interface RKLexicalEntity
- (NSString)internalWord;
- (NSString)language;
- (NSString)lemma;
- (NSString)partOfSpeech;
- (NSString)string;
- (NSString)tokenType;
- (NSString)word;
- (_NSRange)tokenRange;
- (id)description;
- (void)setInternalWord:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLemma:(id)a3;
- (void)setPartOfSpeech:(id)a3;
- (void)setString:(id)a3;
- (void)setTokenRange:(_NSRange)a3;
- (void)setTokenType:(id)a3;
@end

@implementation RKLexicalEntity

- (id)description
{
  v3 = NSString;
  v4 = [(RKLexicalEntity *)self string];
  v5 = [(RKLexicalEntity *)self language];
  v6 = [(RKLexicalEntity *)self partOfSpeech];
  v7 = [(RKLexicalEntity *)self lemma];
  if (v7)
  {
    v8 = [(RKLexicalEntity *)self lemma];
    v9 = [v3 stringWithFormat:@"%@{%@,%@,%@}", v4, v5, v6, v8];
  }
  else
  {
    v9 = [v3 stringWithFormat:@"%@{%@,%@,%@}", v4, v5, v6, &stru_26C8AEFC8];
  }

  return v9;
}

- (NSString)word
{
  v3 = [(RKLexicalEntity *)self internalWord];

  if (!v3)
  {
    v4 = [(RKLexicalEntity *)self lemma];
    if (v4)
    {
      v5 = [(RKLexicalEntity *)self lemma];
      [(RKLexicalEntity *)self setInternalWord:v5];
    }
    else
    {
      v5 = [(RKLexicalEntity *)self string];
      v6 = [v5 lowercaseString];
      [(RKLexicalEntity *)self setInternalWord:v6];
    }
  }

  return [(RKLexicalEntity *)self internalWord];
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
}

- (NSString)tokenType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokenType:(id)a3
{
}

- (NSString)partOfSpeech
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPartOfSpeech:(id)a3
{
}

- (NSString)lemma
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLemma:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLanguage:(id)a3
{
}

- (_NSRange)tokenRange
{
  objc_copyStruct(v4, &self->_tokenRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTokenRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_tokenRange, &v3, 16, 1, 0);
}

- (NSString)internalWord
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalWord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWord, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lemma, 0);
  objc_storeStrong((id *)&self->_partOfSpeech, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end