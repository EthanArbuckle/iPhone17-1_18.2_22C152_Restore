@interface ATXProactiveSuggestion(ATXProactiveCardSuggestionClient)
- (void)infoSuggestion;
@end

@implementation ATXProactiveSuggestion(ATXProactiveCardSuggestionClient)

- (void)infoSuggestion
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "No info suggestion for a card suggestion client object", v1, 2u);
}

@end