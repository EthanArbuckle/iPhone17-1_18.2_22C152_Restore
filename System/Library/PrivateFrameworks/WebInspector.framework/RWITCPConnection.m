@interface RWITCPConnection
@end

@implementation RWITCPConnection

unsigned char *__33___RWITCPConnection_sendMessage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v3 = +[_RWITCPRelayMessage TCPRelayMessageWithPayload:*(void *)(a1 + 40)];
  [v2 addObject:v3];

  result = *(unsigned char **)(a1 + 32);
  if (result[41])
  {
    return (unsigned char *)[result _setOutputSourceSuspended:0];
  }
  return result;
}

uint64_t __40___RWITCPConnection__createOutputSource__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleOutput];
}

uint64_t __40___RWITCPConnection__createOutputSource__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 43) = 1;
  return [*(id *)(a1 + 32) _dispatchSourceCancelled];
}

void __39___RWITCPConnection__closeOutputStream__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    [v4 tcpConnectionDidClose:*(void *)(a1 + 32)];
  }
}

uint64_t __39___RWITCPConnection__createInputSource__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInput];
}

uint64_t __39___RWITCPConnection__createInputSource__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 42) = 1;
  return [*(id *)(a1 + 32) _dispatchSourceCancelled];
}

void __50___RWITCPConnection__processIncomingBytes_length___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) payload];
    [v6 tcpConnection:v3 didReceiveMessage:v4];
  }
}

@end