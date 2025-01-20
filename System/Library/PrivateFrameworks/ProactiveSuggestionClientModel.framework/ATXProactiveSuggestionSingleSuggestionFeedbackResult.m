@interface ATXProactiveSuggestionSingleSuggestionFeedbackResult
- (ATXProactiveSuggestion)suggestion;
- (ATXProactiveSuggestionSingleSuggestionFeedbackResult)initWithEngagementType:(int64_t)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 clientCacheUpdate:(id)a6 uiCacheUpdate:(id)a7 context:(id)a8;
- (int64_t)engagementType;
@end

@implementation ATXProactiveSuggestionSingleSuggestionFeedbackResult

- (ATXProactiveSuggestionSingleSuggestionFeedbackResult)initWithEngagementType:(int64_t)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 clientCacheUpdate:(id)a6 uiCacheUpdate:(id)a7 context:(id)a8
{
  uint64_t v11 = a5;
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestionSingleSuggestionFeedbackResult;
  v16 = [(ATXProactiveSuggestionFeedbackResult *)&v19 initWithConsumerSubType:v11 sessionType:1 clientCacheUpdate:a6 uiCacheUpdate:a7 context:a8];
  v17 = v16;
  if (v16)
  {
    v16->_engagementType = a3;
    objc_storeStrong((id *)&v16->_suggestion, a4);
  }

  return v17;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
}

@end