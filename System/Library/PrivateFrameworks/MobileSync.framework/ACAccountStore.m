@interface ACAccountStore
@end

@implementation ACAccountStore

id __58__ACAccountStore_SyncPrivate___mailAccountTypeIdentifiers__block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAF08], *MEMORY[0x263EFAF78], *MEMORY[0x263EFAEE8], *MEMORY[0x263EFAFE0], *MEMORY[0x263EFAF98], *MEMORY[0x263EFAE58], 0);
  _mailAccountTypeIdentifiers_mailAccountTypes = (uint64_t)result;
  return result;
}

@end