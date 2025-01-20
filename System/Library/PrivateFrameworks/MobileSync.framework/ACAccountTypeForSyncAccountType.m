@interface ACAccountTypeForSyncAccountType
@end

@implementation ACAccountTypeForSyncAccountType

id ___ACAccountTypeForSyncAccountType_block_invoke()
{
  v6[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFAF98];
  v5[0] = @"SMTPAccount";
  v5[1] = @"iToolsAccount";
  uint64_t v1 = *MEMORY[0x263EFAE58];
  v6[0] = v0;
  v6[1] = v1;
  v5[2] = @"YahooAccount";
  v5[3] = @"GmailAccount";
  uint64_t v2 = *MEMORY[0x263EFAEE8];
  v6[2] = *MEMORY[0x263EFAFE0];
  v6[3] = v2;
  v5[4] = @".Mac";
  v5[5] = @"IMAPAccount";
  uint64_t v3 = *MEMORY[0x263EFAF08];
  v6[4] = v1;
  v6[5] = v3;
  v5[6] = @"POPAccount";
  v6[6] = *MEMORY[0x263EFAF78];
  id result = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:7];
  _ACAccountTypeForSyncAccountType_accountTypeForAccountClass = (uint64_t)result;
  return result;
}

@end