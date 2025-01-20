@interface SearchStateItem
- (BOOL)didOriginateFromMultipartWebAnswer;
- (BOOL)didOriginateFromSearchSuggestion;
- (CompletionList)completionList;
- (NSDate)cacheDate;
- (NSString)destinationTLD;
- (int64_t)parsecQueryID;
- (void)setCacheDate:(id)a3;
- (void)setCompletionList:(id)a3;
- (void)setDestinationTLD:(id)a3;
- (void)setDidOriginateFromMultipartWebAnswer:(BOOL)a3;
- (void)setDidOriginateFromSearchSuggestion:(BOOL)a3;
- (void)setParsecQueryID:(int64_t)a3;
@end

@implementation SearchStateItem

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (void)setCacheDate:(id)a3
{
}

- (CompletionList)completionList
{
  return self->_completionList;
}

- (void)setCompletionList:(id)a3
{
}

- (NSString)destinationTLD
{
  return self->_destinationTLD;
}

- (void)setDestinationTLD:(id)a3
{
}

- (BOOL)didOriginateFromSearchSuggestion
{
  return self->_didOriginateFromSearchSuggestion;
}

- (void)setDidOriginateFromSearchSuggestion:(BOOL)a3
{
  self->_didOriginateFromSearchSuggestion = a3;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (BOOL)didOriginateFromMultipartWebAnswer
{
  return self->_didOriginateFromMultipartWebAnswer;
}

- (void)setDidOriginateFromMultipartWebAnswer:(BOOL)a3
{
  self->_didOriginateFromMultipartWebAnswer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationTLD, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
  objc_storeStrong((id *)&self->_cacheDate, 0);
}

@end