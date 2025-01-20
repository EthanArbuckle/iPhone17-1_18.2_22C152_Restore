@interface NSDictionary(FCTodayPrivateDataTransactionQueue)
- (id)fc_transactions;
@end

@implementation NSDictionary(FCTodayPrivateDataTransactionQueue)

- (id)fc_transactions
{
  v1 = [a1 objectForKeyedSubscript:@"a"];
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

@end