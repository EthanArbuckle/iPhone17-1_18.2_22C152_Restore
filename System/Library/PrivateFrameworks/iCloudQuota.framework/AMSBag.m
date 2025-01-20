@interface AMSBag
@end

@implementation AMSBag

uint64_t __25__AMSBag_Quota__quotaBag__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"iCloudQuota" profileVersion:@"1"];
  uint64_t v1 = quotaBag_quotaBag;
  quotaBag_quotaBag = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end