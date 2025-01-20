@interface STKUSSDResponseProvider
@end

@implementation STKUSSDResponseProvider

void __41___STKUSSDResponseProvider_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_221DC0000, v2, OS_LOG_TYPE_DEFAULT, "_STKUSSDResponseProvider: sendResponse: _options:%@", (uint8_t *)&v5, 0xCu);
  }
  if (*(void *)(a1 + 40) == 1) {
    id v4 = (id)[*(id *)(*(void *)(a1 + 32) + 16) cancelSIMToolkitUSSDSession:0];
  }
}

void *__58___STKUSSDResponseProvider_sendResponse_withStringResult___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  if (v1 == 1) {
    return (id)[*(id *)(result[4] + 16) cancelSIMToolkitUSSDSession:0];
  }
  if (!v1) {
    return (id)[*(id *)(result[4] + 16) sendSIMToolkitUSSDResponse:0 response:result[5]];
  }
  return result;
}

@end