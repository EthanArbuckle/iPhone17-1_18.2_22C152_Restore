@interface TopicalityAnonymousFeaturesForAttribute
- (TopicalityAnonymousFeaturesForAttribute)init;
- (int64_t)countAttributeBigramMatch;
- (int64_t)countAttributeBigramPrefixMatch;
- (int64_t)countAttributeNgramMatch;
- (int64_t)countAttributeNgramPrefixMatch;
- (int64_t)countAttributeQUPrefixMatch;
- (int64_t)countAttributeQUTokenMatch;
- (int64_t)countAttributeUnigramMatch;
- (int64_t)countAttributeUnigramPrefixMatch;
- (void)setCountAttributeBigramMatch:(int64_t)a3;
- (void)setCountAttributeBigramPrefixMatch:(int64_t)a3;
- (void)setCountAttributeNgramMatch:(int64_t)a3;
- (void)setCountAttributeNgramPrefixMatch:(int64_t)a3;
- (void)setCountAttributeQUPrefixMatch:(int64_t)a3;
- (void)setCountAttributeQUTokenMatch:(int64_t)a3;
- (void)setCountAttributeUnigramMatch:(int64_t)a3;
- (void)setCountAttributeUnigramPrefixMatch:(int64_t)a3;
@end

@implementation TopicalityAnonymousFeaturesForAttribute

- (TopicalityAnonymousFeaturesForAttribute)init
{
  v3.receiver = self;
  v3.super_class = (Class)TopicalityAnonymousFeaturesForAttribute;
  result = [(TopicalityAnonymousFeaturesForAttribute *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_countAttributeBigramPrefixMatch = 0u;
    *(_OWORD *)&result->_countAttributeQUPrefixMatch = 0u;
    *(_OWORD *)&result->_countAttributeBigramMatch = 0u;
    *(_OWORD *)&result->_countAttributeQUTokenMatch = 0u;
  }
  return result;
}

- (int64_t)countAttributeQUTokenMatch
{
  return self->_countAttributeQUTokenMatch;
}

- (void)setCountAttributeQUTokenMatch:(int64_t)a3
{
  self->_countAttributeQUTokenMatch = a3;
}

- (int64_t)countAttributeUnigramMatch
{
  return self->_countAttributeUnigramMatch;
}

- (void)setCountAttributeUnigramMatch:(int64_t)a3
{
  self->_countAttributeUnigramMatch = a3;
}

- (int64_t)countAttributeBigramMatch
{
  return self->_countAttributeBigramMatch;
}

- (void)setCountAttributeBigramMatch:(int64_t)a3
{
  self->_countAttributeBigramMatch = a3;
}

- (int64_t)countAttributeNgramMatch
{
  return self->_countAttributeNgramMatch;
}

- (void)setCountAttributeNgramMatch:(int64_t)a3
{
  self->_countAttributeNgramMatch = a3;
}

- (int64_t)countAttributeQUPrefixMatch
{
  return self->_countAttributeQUPrefixMatch;
}

- (void)setCountAttributeQUPrefixMatch:(int64_t)a3
{
  self->_countAttributeQUPrefixMatch = a3;
}

- (int64_t)countAttributeUnigramPrefixMatch
{
  return self->_countAttributeUnigramPrefixMatch;
}

- (void)setCountAttributeUnigramPrefixMatch:(int64_t)a3
{
  self->_countAttributeUnigramPrefixMatch = a3;
}

- (int64_t)countAttributeBigramPrefixMatch
{
  return self->_countAttributeBigramPrefixMatch;
}

- (void)setCountAttributeBigramPrefixMatch:(int64_t)a3
{
  self->_countAttributeBigramPrefixMatch = a3;
}

- (int64_t)countAttributeNgramPrefixMatch
{
  return self->_countAttributeNgramPrefixMatch;
}

- (void)setCountAttributeNgramPrefixMatch:(int64_t)a3
{
  self->_countAttributeNgramPrefixMatch = a3;
}

@end