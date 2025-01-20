@interface AccountsChanged
@end

@implementation AccountsChanged

uint64_t ____AccountsChanged_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadForAccountsChanged];
}

@end