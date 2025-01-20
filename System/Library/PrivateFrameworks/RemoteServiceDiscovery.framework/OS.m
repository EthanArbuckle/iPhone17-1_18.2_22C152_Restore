@interface OS
@end

@implementation OS

void __46__OS_remote_service_proxySocketOverRemoteXPC___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 removeObject:WeakRetained];
}

@end