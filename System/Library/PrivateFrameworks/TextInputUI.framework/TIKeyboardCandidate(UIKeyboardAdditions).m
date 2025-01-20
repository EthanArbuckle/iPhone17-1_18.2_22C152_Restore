@interface TIKeyboardCandidate(UIKeyboardAdditions)
- (uint64_t)isSlottedCandidate;
- (unint64_t)isAutofillExtraCandidate;
- (unint64_t)isStickerCandidate;
- (unint64_t)isWritingToolsButtonCandidate;
@end

@implementation TIKeyboardCandidate(UIKeyboardAdditions)

- (unint64_t)isStickerCandidate
{
  return ((unint64_t)[a1 customInfoType] >> 12) & 1;
}

- (unint64_t)isWritingToolsButtonCandidate
{
  return ((unint64_t)[a1 customInfoType] >> 16) & 1;
}

- (unint64_t)isAutofillExtraCandidate
{
  return ((unint64_t)[a1 customInfoType] >> 5) & 1;
}

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

@end