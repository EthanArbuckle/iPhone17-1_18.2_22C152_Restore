@interface CAFdConnectionProxy
@end

@implementation CAFdConnectionProxy

void __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CAFDLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  v3 = [WeakRetained agent];
  [v3 _removeConnection:WeakRetained];

  [WeakRetained invalidateAndRemoveAssertions];
}

void __49___CAFdConnectionProxy_initWithConnection_agent___block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CAFDLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  v3 = [WeakRetained agent];
  [v3 _removeConnection:WeakRetained];

  [WeakRetained invalidateAndRemoveAssertions];
}

void __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  id v5 = [*v2 assertions];
  [v5 removeObject:v4];

  v6 = CAFDAssertionLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke_cold_1(v2, v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 4);
}

id __89___CAFdConnectionProxy_removeRegistrationFromPluginID_instanceIDs_priority_withResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

void __75___CAFdConnectionProxy_readFromPluginID_instanceIDs_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc((Class)CAFResponse);
  id v4 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:2 userInfo:0];
  id v3 = [v2 initWithError:v4];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

void __69___CAFdConnectionProxy_writeToPluginID_values_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc((Class)CAFResponse);
  id v4 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:2 userInfo:0];
  id v3 = [v2 initWithError:v4];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

void __79___CAFdConnectionProxy_requestPluginID_instanceID_value_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:2 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __50___CAFdConnectionProxy_didUpdateCurrentCarConfig___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 didUpdateCurrentCarConfig:*(void *)(a1 + 40)];
}

void __40___CAFdConnectionProxy_didUpdateConfig___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 didUpdateConfig:*(void *)(a1 + 40)];
}

void __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __49___CAFdConnectionProxy_didUpdatePluginID_values___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 didUpdatePluginID:*(void *)(a1 + 40) values:*(void *)(a1 + 48)];
}

void __73___CAFdConnectionProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 didRequestPluginID:*(void *)(a1 + 40) instanceID:*(void *)(a1 + 48) value:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64)];
}

void __59___CAFdConnectionProxy_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 didNotifyPluginID:*(void *)(a1 + 40) instanceID:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];
}

void __50___CAFdConnectionProxy_createAssertionWithAction___block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3 = *a1;
  id v4 = [*a1 assertions];
  [v4 count];
  int v6 = 138543618;
  id v7 = v3;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a2, v5, "%{public}@ Assertion released. active count=%lu", (uint8_t *)&v6);
}

@end