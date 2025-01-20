@interface MRRegisteredTransactionsInitialize
@end

@implementation MRRegisteredTransactionsInitialize

void ___MRRegisteredTransactionsInitialize_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  v1 = (void *)__registeredTransactions;
  __registeredTransactions = v0;

  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaremote.MRUtility/registeredTransactionsQueue", v2);
  v4 = (void *)__registeredTransactionsQueue;
  __registeredTransactionsQueue = (uint64_t)v3;

  __transactionShutdownTriggered = 0;
}

@end