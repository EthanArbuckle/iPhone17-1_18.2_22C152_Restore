@interface SSBDatabaseUpdateFetchDataSessionHandler
@end

@implementation SSBDatabaseUpdateFetchDataSessionHandler

void *__80___SSBDatabaseUpdateFetchDataSessionHandler_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ByteProvider::dataReceived(*(void **)(*(void *)(a1 + 32) + 16), a2, a4);
}

@end