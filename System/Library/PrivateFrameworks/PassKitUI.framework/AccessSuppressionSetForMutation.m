@interface AccessSuppressionSetForMutation
@end

@implementation AccessSuppressionSetForMutation

void ___AccessSuppressionSetForMutation_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passkit.passview", 0);
  v1 = (void *)qword_1E94C4280;
  qword_1E94C4280 = (uint64_t)v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28BD0]) initWithCapacity:2];
  v3 = (void *)qword_1E94C4288;
  qword_1E94C4288 = v2;
}

void ___AccessSuppressionSetForMutation_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = (id)[(id)qword_1E94C4288 copy];
  SBSSetAlertSuppressionContexts();
}

@end