@interface CTXPCServiceSubscriptionContext
@end

@implementation CTXPCServiceSubscriptionContext

uint64_t __72__CTXPCServiceSubscriptionContext_TelephonyPreferences__telephonyClient__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F23A80]);
  telephonyClient_telephonyClient = [v0 initWithQueue:MEMORY[0x1E4F14428]];
  return MEMORY[0x1F41817F8]();
}

@end