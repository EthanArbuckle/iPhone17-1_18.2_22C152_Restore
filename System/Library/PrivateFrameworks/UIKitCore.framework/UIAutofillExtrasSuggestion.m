@interface UIAutofillExtrasSuggestion
+ (id)autofillExtrasSuggestion;
- (id)_keyboardCandidate;
@end

@implementation UIAutofillExtrasSuggestion

+ (id)autofillExtrasSuggestion
{
  return (id)[a1 textSuggestionWithInputText:0];
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:self customInfoType:32];
}

@end