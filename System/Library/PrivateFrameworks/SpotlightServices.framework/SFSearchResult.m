@interface SFSearchResult
@end

@implementation SFSearchResult

uint64_t __47__SFSearchResult_SPFeedback__objectForFeedback__block_invoke()
{
  uint64_t v0 = NSClassFromString(&cfstr_Atxsearchresul.isa);
  v1 = (void *)objectForFeedback_atxAppClass;
  objectForFeedback_atxAppClass = v0;

  uint64_t v2 = NSClassFromString(&cfstr_Atxactionsearc.isa);
  v3 = (void *)objectForFeedback_atxResultClass;
  objectForFeedback_atxResultClass = v2;

  objectForFeedback_atxSuggestionResultClass = NSClassFromString(&cfstr_Atxsuggestions.isa);
  return MEMORY[0x1F41817F8]();
}

@end