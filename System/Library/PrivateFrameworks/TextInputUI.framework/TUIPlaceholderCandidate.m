@interface TUIPlaceholderCandidate
+ (id)placeholderCandidate;
@end

@implementation TUIPlaceholderCandidate

+ (id)placeholderCandidate
{
  v2 = [(TIKeyboardCandidateSingle *)[TUIPlaceholderCandidate alloc] initWithUnchangedInput:&stru_1EDC653C0];
  return v2;
}

@end