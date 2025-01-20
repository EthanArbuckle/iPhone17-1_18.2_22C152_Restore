@interface SAPhonePlayVoiceMail(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAPhonePlayVoiceMail(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end