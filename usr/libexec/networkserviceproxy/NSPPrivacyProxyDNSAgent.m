@interface NSPPrivacyProxyDNSAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
+ (id)dnsAgentUUID;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (NSPPrivacyProxyDNSAgent)initWithDelegate:(id)a3;
- (NSPPrivacyProxyDNSAgentDelegate)delegate;
- (NSPPrivacyProxyResolverInfo)resolver;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (NSUUID)proxyAgentUUID;
- (id)copyAgentData;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setProxyAgentUUID:(id)a3;
- (void)setResolver:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NSPPrivacyProxyDNSAgent

- (NSPPrivacyProxyDNSAgent)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPPrivacyProxyDNSAgent;
  v5 = [(NSPPrivacyProxyDNSAgent *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(NSPPrivacyProxyDNSAgent *)v5 setActive:1];
    [(NSPPrivacyProxyDNSAgent *)v6 setKernelActivated:0];
    [(NSPPrivacyProxyDNSAgent *)v6 setUserActivated:0];
    [(NSPPrivacyProxyDNSAgent *)v6 setVoluntary:1];
    objc_storeWeak((id *)&v6->_delegate, v4);
    [(NSPPrivacyProxyDNSAgent *)v6 setAgentDescription:@"iCloud Private Relay"];
    v7 = [(id)objc_opt_class() dnsAgentUUID];
    [(NSPPrivacyProxyDNSAgent *)v6 setAgentUUID:v7];
  }
  return v6;
}

+ (id)dnsAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&ne_privacy_dns_netagent_id];

  return v2;
}

+ (id)agentDomain
{
  return @"SystemConfig";
}

+ (id)agentType
{
  return @"DNSAgent";
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  v3 = [(NSPPrivacyProxyDNSAgent *)self resolver];
  if (v3)
  {
    id v4 = (void *)nw_resolver_config_create();
    v5 = [v3 obliviousDoHConfig];
    [(NSPPrivacyProxyDNSAgent *)self proxyAgentUUID];

    nw_resolver_config_set_class();
    nw_resolver_config_set_protocol();
    nw_resolver_config_set_allow_failover();
    v6 = [v3 dohURL];
    v7 = +[NSURL URLWithString:v6];

    id v8 = [objc_alloc((Class)NSURLComponents) initWithURL:v7 resolvingAgainstBaseURL:0];
    objc_super v9 = [v8 percentEncodedHost];
    v10 = [v8 percentEncodedPath];
    [v9 UTF8String];
    nw_resolver_config_set_provider_name();
    [v10 UTF8String];
    nw_resolver_config_set_provider_path();
    v11 = [(NSPPrivacyProxyDNSAgent *)self proxyAgentUUID];
    v12 = [v11 UUIDString];

    if (v12)
    {
      [v12 UTF8String];
      nw_resolver_config_set_proxy_agent();
    }
    if (v5 && [v5 length])
    {
      [v5 bytes];
      [v5 length];
      nw_resolver_config_set_odoh_config();
    }
    v13 = (void *)nw_resolver_config_copy_plist_data();
  }
  else
  {
    v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No resolver info set", v16, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(NSPPrivacyProxyDNSAgent *)self delegate];
  [v7 reportErrorForDNSAgent:self error:v4 withOptions:v6];

  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return (NSPPrivacyProxyResolverInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResolver:(id)a3
{
}

- (NSUUID)proxyAgentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProxyAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyDNSAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSPPrivacyProxyDNSAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end