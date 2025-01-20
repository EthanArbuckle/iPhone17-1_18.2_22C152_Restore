@interface UIApplication(SBUIApplicationAdditions)
- (uint64_t)sb_performBlockAfterCATransactionSynchronizedCommit:()SBUIApplicationAdditions;
@end

@implementation UIApplication(SBUIApplicationAdditions)

- (uint64_t)sb_performBlockAfterCATransactionSynchronizedCommit:()SBUIApplicationAdditions
{
  return objc_msgSend(MEMORY[0x1E4F39CF8], "bs_performAfterSynchronizedCommit:");
}

@end