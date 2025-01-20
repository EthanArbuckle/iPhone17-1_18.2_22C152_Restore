@interface REContentRankingResult
- (BOOL)valid;
- (double)negativePolarity;
- (double)positivePolarity;
- (double)unbiasedNegativePolarity;
- (double)unbiasedPositivePolarity;
- (int)unknownCount;
- (void)setNegativePolarity:(double)a3;
- (void)setPositivePolarity:(double)a3;
- (void)setUnbiasedNegativePolarity:(double)a3;
- (void)setUnbiasedPositivePolarity:(double)a3;
- (void)setUnknownCount:(int)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation REContentRankingResult

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (double)positivePolarity
{
  return self->_positivePolarity;
}

- (void)setPositivePolarity:(double)a3
{
  self->_positivePolarity = a3;
}

- (double)negativePolarity
{
  return self->_negativePolarity;
}

- (void)setNegativePolarity:(double)a3
{
  self->_negativePolarity = a3;
}

- (int)unknownCount
{
  return self->_unknownCount;
}

- (void)setUnknownCount:(int)a3
{
  self->_unknownCount = a3;
}

- (double)unbiasedPositivePolarity
{
  return self->_unbiasedPositivePolarity;
}

- (void)setUnbiasedPositivePolarity:(double)a3
{
  self->_unbiasedPositivePolarity = a3;
}

- (double)unbiasedNegativePolarity
{
  return self->_unbiasedNegativePolarity;
}

- (void)setUnbiasedNegativePolarity:(double)a3
{
  self->_unbiasedNegativePolarity = a3;
}

@end