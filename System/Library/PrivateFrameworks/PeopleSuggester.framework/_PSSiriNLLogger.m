@interface _PSSiriNLLogger
- (void)logPeopleSuggesterDataWithSessionId:(id)a3;
@end

@implementation _PSSiriNLLogger

- (void)logPeopleSuggesterDataWithSessionId:(id)a3
{
  v7 = (__CFString *)a3;
  v3 = +[_PSSuggester suggesterWithDaemon];
  v4 = objc_alloc_init(_PSPredictionContext);
  if (v7) {
    v5 = v7;
  }
  else {
    v5 = &stru_1EF653EA8;
  }
  id v6 = (id)[v3 rankedSiriNLContactSuggestionsFromContext:v4 maxSuggestions:&unk_1EF6754E0 interactionId:v5];
}

@end