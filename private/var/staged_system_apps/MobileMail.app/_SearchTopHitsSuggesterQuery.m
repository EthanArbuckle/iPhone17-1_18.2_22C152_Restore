@interface _SearchTopHitsSuggesterQuery
- (void)cancel;
@end

@implementation _SearchTopHitsSuggesterQuery

- (void)cancel
{
  if (self) {
    self = (_SearchTopHitsSuggesterQuery *)self->_topHitsQuery;
  }
  [(_SearchTopHitsSuggesterQuery *)self cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantAnswersSuggestions, 0);
  objc_storeStrong((id *)&self->_topHitsSuggestions, 0);
  objc_storeStrong((id *)&self->_rankedSuggestions, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_topHitsQuery, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_phraseManager, 0);
}

@end