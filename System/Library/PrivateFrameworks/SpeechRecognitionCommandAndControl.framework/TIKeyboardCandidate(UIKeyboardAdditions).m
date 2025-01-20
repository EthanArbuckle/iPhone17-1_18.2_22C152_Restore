@interface TIKeyboardCandidate(UIKeyboardAdditions)
- (uint64_t)isSlottedCandidate;
- (unint64_t)isAutofillExtraCandidate;
@end

@implementation TIKeyboardCandidate(UIKeyboardAdditions)

- (uint64_t)isSlottedCandidate
{
  if ([a1 isSecureContentCandidate])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)isAutofillExtraCandidate
{
  return ((unint64_t)[a1 customInfoType] >> 5) & 1;
}

@end