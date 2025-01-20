@interface SiriSuggestionStatusProvider
- (BOOL)isOptedInToSiriSuggestions;
@end

@implementation SiriSuggestionStatusProvider

- (BOOL)isOptedInToSiriSuggestions
{
  return objc_msgSend(*(id *)self->userInfo, sel_progressivePersonalization) == (id)2;
}

@end