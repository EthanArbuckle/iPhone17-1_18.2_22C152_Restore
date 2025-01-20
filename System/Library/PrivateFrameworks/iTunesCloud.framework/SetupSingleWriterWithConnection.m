@interface SetupSingleWriterWithConnection
@end

@implementation SetupSingleWriterWithConnection

BOOL ____SetupSingleWriterWithConnection_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = +[ICDelegateAccountStoreSchema setupWithConnection:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = [[ICDelegateAccountStoreReader alloc] initWithConnection:a1[4]];
    v6 = [(ICDelegateAccountStoreReader *)v5 lastExpirationPruningDate];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v8 = v7;
    if (!v6 || ([v7 timeIntervalSinceDate:v6], v9 >= 43200.0))
    {
      v10 = [[ICDelegateAccountStoreSQLWriter alloc] initWithConnection:a1[4]];
      [(ICDelegateAccountStoreSQLWriter *)v10 removeTokensExpiringBeforeDate:v8 completionHandler:0];
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return v4;
}

@end