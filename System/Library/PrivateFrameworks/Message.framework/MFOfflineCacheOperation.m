@interface MFOfflineCacheOperation
@end

@implementation MFOfflineCacheOperation

void __84___MFOfflineCacheOperation_databaseID_andMailbox_forMessageWithRemoteID_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  v6 = [v14 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 numberValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [v14 objectAtIndexedSubscript:1];
  uint64_t v11 = [v10 numberValue];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *a4 = 1;
}

@end