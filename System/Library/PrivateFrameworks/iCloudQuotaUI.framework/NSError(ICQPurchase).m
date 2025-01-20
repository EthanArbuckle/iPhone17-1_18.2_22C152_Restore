@interface NSError(ICQPurchase)
- (uint64_t)icq_isPSD2StepUpError;
@end

@implementation NSError(ICQPurchase)

- (uint64_t)icq_isPSD2StepUpError
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F27868]];

  v3 = [v2 objectForKeyedSubscript:@"metrics"];
  v4 = [v3 objectForKeyedSubscript:@"dialogId"];
  uint64_t v5 = [v4 isEqualToString:@"MZCommerce.Secure3dV2StepUp"];

  return v5;
}

@end