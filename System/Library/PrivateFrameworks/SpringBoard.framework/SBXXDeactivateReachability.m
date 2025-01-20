@interface SBXXDeactivateReachability
@end

@implementation SBXXDeactivateReachability

void ___SBXXDeactivateReachability_block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FA75F8];
  v6[0] = &unk_1F3349650;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v1 = (void *)MEMORY[0x1E4FA5E78];
  id v2 = v0;
  v3 = [v1 sharedInstance];
  [v3 emitEvent:8 withPayload:v2];

  v4 = +[SBReachabilityManager sharedInstance];
  [v4 deactivateReachability];
}

@end