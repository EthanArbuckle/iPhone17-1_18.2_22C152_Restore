@interface ATXProactiveSuggestioniOSGroupedUIFeedbackQuery
- (ATXProactiveSuggestioniOSGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6;
@end

@implementation ATXProactiveSuggestioniOSGroupedUIFeedbackQuery

- (ATXProactiveSuggestioniOSGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[ATXBlendingLayerHyperParameters sharedInstance];
  v14 = [(ATXProactiveSuggestionGroupedUIFeedbackQuery *)self initWithClientModelIds:v12 consumerSubTypeToConsider:v7 startDateForResults:v11 bookmarkURLPath:v10 hyperParameters:v13];

  return v14;
}

@end