@interface STKSIMToolkitResponseProvider
@end

@implementation STKSIMToolkitResponseProvider

id __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 16) sendSIMToolkitUserActivity:0];
}

void __47___STKSIMToolkitResponseProvider_sendResponse___block_invoke_23(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKey:*MEMORY[0x263F032A8]];
  id v2 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendSIMToolkitResponse:session:response:", *(void *)(*(void *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(void *)(a1 + 40)));
}

void __62___STKSIMToolkitResponseProvider_sendResponse_withBOOLResult___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKey:*MEMORY[0x263F032A8]];
  id v2 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendSIMToolkitBooleanResponse:session:response:yesNo:", *(void *)(*(void *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(void *)(a1 + 40)), *(unsigned __int8 *)(a1 + 48));
}

void __64___STKSIMToolkitResponseProvider_sendResponse_withStringResult___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKey:*MEMORY[0x263F032A8]];
  id v2 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendSIMToolkitStringResponse:session:response:string:", *(void *)(*(void *)(a1 + 32) + 24), v3, objc_msgSend(*(id *)(a1 + 32), "_responseFromResponseType:", *(void *)(a1 + 48)), *(void *)(a1 + 40));
}

void __63___STKSIMToolkitResponseProvider_sendSuccessWithSelectedIndex___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKey:*MEMORY[0x263F032A8]];
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 16) selectSIMToolkitListItem:*(void *)(*(void *)(a1 + 32) + 24) session:v4 response:*MEMORY[0x263F031E0] index:v2];
}

@end