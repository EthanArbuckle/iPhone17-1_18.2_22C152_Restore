@interface CTXPCServiceSubscriptionContext
- (BOOL)csd_isTelephony;
@end

@implementation CTXPCServiceSubscriptionContext

- (BOOL)csd_isTelephony
{
  return [(CTXPCServiceSubscriptionContext *)self slotID] != 0;
}

@end