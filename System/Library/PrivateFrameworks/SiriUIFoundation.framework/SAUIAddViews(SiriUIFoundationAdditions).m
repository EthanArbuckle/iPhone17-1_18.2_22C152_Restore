@interface SAUIAddViews(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIAddViews(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  v1 = objc_msgSend(a1, "af_dialogPhase");
  int v2 = [v1 isReflectionDialogPhase];

  return v2 ^ 1u;
}

@end