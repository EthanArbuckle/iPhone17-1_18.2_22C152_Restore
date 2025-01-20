@interface NRDNSProxyServer
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDNSProxyServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_do53Proxy, 0);

  objc_storeStrong((id *)&self->_localIfIndices, 0);
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)NRDNSProxyServer;
  [(NRDNSProxy *)&v4 cancel];
  if (self)
  {
    if (self->_do53Proxy)
    {
      mrc_dns_proxy_invalidate();
      do53Proxy = self->_do53Proxy;
      self->_do53Proxy = 0;
    }
  }
}

- (void)start
{
  if (self)
  {
    if (!self->super._started)
    {
      v7.receiver = self;
      v7.super_class = (Class)NRDNSProxyServer;
      [(NRDNSProxy *)&v7 start];
      if (self->super._state - 1 >= 2)
      {
        if (self->super._dnsProtocol)
        {
          v3 = (void *)_NRCopyLogObjectForNRUUID();
          int IsLevelEnabled = _NRLogIsLevelEnabled();

          if (IsLevelEnabled)
          {
            v5 = self->super._nrUUID;
            v6 = (void *)_NRCopyLogObjectForNRUUID();

            _NRLogWithArgs();
          }
          sub_10001E8F4(self, 4);
        }
        else
        {
          sub_10001EE6C(self);
        }
      }
    }
  }
  else
  {
    v7.receiver = 0;
    v7.super_class = (Class)NRDNSProxyServer;
    [(NRDNSProxy *)&v7 start];
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    if (state >= 5) {
      v6 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%u)", state];
    }
    else {
      v6 = *(&off_1001C6438 + self->super._state);
    }
    localIfIndices = self->_localIfIndices;
  }
  else
  {
    unint64_t identifier = 0;
    localIfIndices = 0;
    v6 = @"Invalid";
  }
  id v8 = [v3 initWithFormat:@"NRDNSProxyServer[%llu, %@, idx:%@]", identifier, v6, localIfIndices];

  return v8;
}

@end