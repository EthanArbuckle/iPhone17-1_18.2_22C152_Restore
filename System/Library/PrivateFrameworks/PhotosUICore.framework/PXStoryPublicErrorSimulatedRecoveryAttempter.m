@interface PXStoryPublicErrorSimulatedRecoveryAttempter
@end

@implementation PXStoryPublicErrorSimulatedRecoveryAttempter

void __86___PXStoryPublicErrorSimulatedRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:@"Simulated Recovery"];
  objc_msgSend(NSString, "stringWithFormat:", @"The simulated recovery option #%li was selected.", *(void *)(a1 + 32) + 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setMessage:v4];
}

@end