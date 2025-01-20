@interface STXPCStoreServerEndpointFactory
- (id)newEndpoint;
- (void)newEndpoint;
@end

@implementation STXPCStoreServerEndpointFactory

- (id)newEndpoint
{
  v2 = objc_opt_new();
  id v7 = 0;
  v3 = [v2 startCoreDataServerWithError:&v7];
  id v4 = v7;
  if (!v3)
  {
    v5 = +[STLog persistence];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(STXPCStoreServerEndpointFactory *)(uint64_t)v4 newEndpoint];
    }
  }
  return v3;
}

- (void)newEndpoint
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Error getting endpoint for CoreData server: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end