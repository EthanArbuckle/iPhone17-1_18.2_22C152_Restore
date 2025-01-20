@interface _PSCNAutocompleteFeedbackImpressionStatistics
- (int64_t)countTapped;
- (int64_t)countUsed;
- (int64_t)highestRankTapped;
- (int64_t)highestRankUsed;
- (int64_t)lowestRankTapped;
- (int64_t)lowestRankUsed;
- (int64_t)totalRankTapped;
- (int64_t)totalRankUsed;
- (void)setCountTapped:(int64_t)a3;
- (void)setCountUsed:(int64_t)a3;
- (void)setHighestRankTapped:(int64_t)a3;
- (void)setHighestRankUsed:(int64_t)a3;
- (void)setLowestRankTapped:(int64_t)a3;
- (void)setLowestRankUsed:(int64_t)a3;
- (void)setTotalRankTapped:(int64_t)a3;
- (void)setTotalRankUsed:(int64_t)a3;
@end

@implementation _PSCNAutocompleteFeedbackImpressionStatistics

- (int64_t)countTapped
{
  return self->_countTapped;
}

- (void)setCountTapped:(int64_t)a3
{
  self->_countTapped = a3;
}

- (int64_t)totalRankTapped
{
  return self->_totalRankTapped;
}

- (void)setTotalRankTapped:(int64_t)a3
{
  self->_totalRankTapped = a3;
}

- (int64_t)highestRankTapped
{
  return self->_highestRankTapped;
}

- (void)setHighestRankTapped:(int64_t)a3
{
  self->_highestRankTapped = a3;
}

- (int64_t)lowestRankTapped
{
  return self->_lowestRankTapped;
}

- (void)setLowestRankTapped:(int64_t)a3
{
  self->_lowestRankTapped = a3;
}

- (int64_t)countUsed
{
  return self->_countUsed;
}

- (void)setCountUsed:(int64_t)a3
{
  self->_countUsed = a3;
}

- (int64_t)totalRankUsed
{
  return self->_totalRankUsed;
}

- (void)setTotalRankUsed:(int64_t)a3
{
  self->_totalRankUsed = a3;
}

- (int64_t)highestRankUsed
{
  return self->_highestRankUsed;
}

- (void)setHighestRankUsed:(int64_t)a3
{
  self->_highestRankUsed = a3;
}

- (int64_t)lowestRankUsed
{
  return self->_lowestRankUsed;
}

- (void)setLowestRankUsed:(int64_t)a3
{
  self->_lowestRankUsed = a3;
}

@end