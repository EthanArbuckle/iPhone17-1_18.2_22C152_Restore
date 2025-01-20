@interface MDNSNEDNSProxyWatcher
- (void)configurationChanged:(id)a3;
- (void)dnsProxyStatusDidChange:(id)a3;
@end

@implementation MDNSNEDNSProxyWatcher

- (void)dnsProxyStatusDidChange:(id)a3
{
  id v3 = a3;
  v4 = _mdns_ne_dns_proxy_state_watch_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DNS proxy status changed for manager -- address: %p", buf, 0xCu);
  }

  v5 = _mdns_ne_dns_proxy_state_watch_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke;
  block[3] = &unk_100149170;
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuration changed", v4, 2u);
  }

  if (configurationChanged__s_once != -1) {
    dispatch_once(&configurationChanged__s_once, &__block_literal_global_2211);
  }
  dispatch_source_merge_data((dispatch_source_t)configurationChanged__s_loader, 1uLL);
}

void __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke(id a1)
{
  v1 = _mdns_ne_dns_proxy_state_watch_queue();
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v1);
  id v3 = (void *)configurationChanged__s_loader;
  configurationChanged__s_loader = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)configurationChanged__s_loader, &__block_literal_global_2);
  v4 = configurationChanged__s_loader;

  dispatch_activate(v4);
}

@end