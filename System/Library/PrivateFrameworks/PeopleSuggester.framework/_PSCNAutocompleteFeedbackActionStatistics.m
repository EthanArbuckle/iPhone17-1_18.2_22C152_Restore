@interface _PSCNAutocompleteFeedbackActionStatistics
- (int64_t)countTappedSuggestions;
- (int64_t)countTimesVendedSuggestions;
- (int64_t)countUsedSuggestions;
- (int64_t)countVendedSuggestions;
- (void)setCountTappedSuggestions:(int64_t)a3;
- (void)setCountTimesVendedSuggestions:(int64_t)a3;
- (void)setCountUsedSuggestions:(int64_t)a3;
- (void)setCountVendedSuggestions:(int64_t)a3;
@end

@implementation _PSCNAutocompleteFeedbackActionStatistics

- (int64_t)countTimesVendedSuggestions
{
  return self->_countTimesVendedSuggestions;
}

- (void)setCountTimesVendedSuggestions:(int64_t)a3
{
  self->_countTimesVendedSuggestions = a3;
}

- (int64_t)countVendedSuggestions
{
  return self->_countVendedSuggestions;
}

- (void)setCountVendedSuggestions:(int64_t)a3
{
  self->_countVendedSuggestions = a3;
}

- (int64_t)countTappedSuggestions
{
  return self->_countTappedSuggestions;
}

- (void)setCountTappedSuggestions:(int64_t)a3
{
  self->_countTappedSuggestions = a3;
}

- (int64_t)countUsedSuggestions
{
  return self->_countUsedSuggestions;
}

- (void)setCountUsedSuggestions:(int64_t)a3
{
  self->_countUsedSuggestions = a3;
}

@end