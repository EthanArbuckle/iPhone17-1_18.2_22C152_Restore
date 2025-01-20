@interface TransactionsByReason
@end

@implementation TransactionsByReason

uint64_t ___TransactionsByReason_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = _TransactionsByReason___transactions;
  _TransactionsByReason___transactions = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end