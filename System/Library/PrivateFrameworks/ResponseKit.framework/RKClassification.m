@interface RKClassification
- (NSArray)customResponses;
- (NSArray)matchedRanges;
- (NSArray)sentenceEntities;
- (NSString)language;
- (NSString)taggedText;
- (RKClassification)init;
- (int)isSensitive;
- (unint64_t)gender;
- (unint64_t)sentenceType;
- (void)setCustomResponses:(id)a3;
- (void)setGender:(unint64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setMatchedRanges:(id)a3;
- (void)setSensitive:(int)a3;
- (void)setSentenceEntities:(id)a3;
- (void)setSentenceType:(unint64_t)a3;
- (void)setTaggedText:(id)a3;
@end

@implementation RKClassification

- (RKClassification)init
{
  v3.receiver = self;
  v3.super_class = (Class)RKClassification;
  result = [(RKClassification *)&v3 init];
  if (result) {
    result->_sentenceType = 0;
  }
  return result;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLanguage:(id)a3
{
}

- (unint64_t)sentenceType
{
  return self->_sentenceType;
}

- (void)setSentenceType:(unint64_t)a3
{
  self->_sentenceType = a3;
}

- (int)isSensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(int)a3
{
  self->_sensitive = a3;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
}

- (NSArray)customResponses
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCustomResponses:(id)a3
{
}

- (NSString)taggedText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTaggedText:(id)a3
{
}

- (NSArray)sentenceEntities
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentenceEntities:(id)a3
{
}

- (NSArray)matchedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMatchedRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedRanges, 0);
  objc_storeStrong((id *)&self->_sentenceEntities, 0);
  objc_storeStrong((id *)&self->_taggedText, 0);
  objc_storeStrong((id *)&self->_customResponses, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end