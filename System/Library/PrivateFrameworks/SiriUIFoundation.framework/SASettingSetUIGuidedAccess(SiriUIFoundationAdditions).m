@interface SASettingSetUIGuidedAccess(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SASettingSetUIGuidedAccess(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return [a1 dryRun] ^ 1;
}

@end