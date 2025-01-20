@interface MDNSNEDNSProxyWatcher
- (void)configurationChanged:(id)a3;
- (void)dnsProxyStatusDidChange:(id)a3;
@end

@implementation MDNSNEDNSProxyWatcher

- (void)dnsProxyStatusDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v10 = v3;
    _os_log_impl(&dword_23814D000, v4, OS_LOG_TYPE_DEFAULT, "DNS proxy status changed for manager -- address: %p", buf, 0xCu);
  }

  v5 = _mdns_ne_dns_proxy_state_watch_queue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke;
  block[3] = &unk_264D076F0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke(uint64_t a1)
{
}

- (void)configurationChanged:(id)a3
{
  id v3 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23814D000, v3, OS_LOG_TYPE_DEFAULT, "Configuration changed", v4, 2u);
  }

  if (configurationChanged__s_once != -1) {
    dispatch_once(&configurationChanged__s_once, &__block_literal_global_968);
  }
  dispatch_source_merge_data((dispatch_source_t)configurationChanged__s_loader, 1uLL);
}

void __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke()
{
  v0 = _mdns_ne_dns_proxy_state_watch_queue();
  dispatch_source_t v1 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v0);
  v2 = (void *)configurationChanged__s_loader;
  configurationChanged__s_loader = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)configurationChanged__s_loader, &__block_literal_global_2);
  id v3 = configurationChanged__s_loader;

  dispatch_activate(v3);
}

uint64_t __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke_2()
{
  v0 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23814D000, v0, OS_LOG_TYPE_INFO, "Loading new manager array", v2, 2u);
  }

  return unk_26EB24F94(&off_26EB25968, "loadAllFromPreferencesWithCompletionHandler:", &__block_literal_global_20);
}

@end