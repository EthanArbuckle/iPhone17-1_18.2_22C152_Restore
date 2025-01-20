@interface SABaseCommand(SiriUIFoundationAdditions)
- (uint64_t)sruif_aceCommandType;
@end

@implementation SABaseCommand(SiriUIFoundationAdditions)

- (uint64_t)sruif_aceCommandType
{
  return 1;
}

@end