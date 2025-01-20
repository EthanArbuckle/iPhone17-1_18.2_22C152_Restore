@interface NRDiscoveryProxyServer
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDiscoveryProxyServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifNamesSet, 0);

  objc_storeStrong((id *)&self->_certificateFetcherSource, 0);
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)NRDiscoveryProxyServer;
  [(NRDNSProxy *)&v8 cancel];
  if (self)
  {
    int certificateUpdateNotifyToken = self->_certificateUpdateNotifyToken;
    if (certificateUpdateNotifyToken != -1)
    {
      notify_cancel(certificateUpdateNotifyToken);
      self->_int certificateUpdateNotifyToken = -1;
    }
    if (self->_discoveryProxyRef)
    {
      advertising_proxy_ref_dealloc();
      v4 = (void *)qword_1001F4860;
      v5 = +[NSNumber numberWithUnsignedLong:self->_discoveryProxyRef];
      [v4 setObject:0 forKeyedSubscript:v5];

      self->_discoveryProxyRef = 0;
    }
    certificateFetcherSource = self->_certificateFetcherSource;
    if (certificateFetcherSource)
    {
      dispatch_source_cancel(certificateFetcherSource);
      v7 = self->_certificateFetcherSource;
      self->_certificateFetcherSource = 0;
    }
  }
  else
  {
    notify_cancel(0);
  }
}

- (void)start
{
  if (self)
  {
    if (!self->super._started)
    {
      v3.receiver = self;
      v3.super_class = (Class)NRDiscoveryProxyServer;
      [(NRDNSProxy *)&v3 start];
      if (self->super._state - 1 >= 2)
      {
        self->_int certificateUpdateNotifyToken = -1;
        sub_10001F7A0((uint64_t)self);
      }
    }
  }
  else
  {
    v3.receiver = 0;
    v3.super_class = (Class)NRDiscoveryProxyServer;
    [(NRDNSProxy *)&v3 start];
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    v6 = @"Invalid";
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        v6 = @"Preparing";
        break;
      case 2:
        v6 = @"Ready";
        break;
      case 3:
        v6 = @"Restarting";
        break;
      case 4:
        v6 = @"Failed";
        break;
      default:
        v6 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%u)", state];
        break;
    }
  }
  else
  {
    unint64_t identifier = 0;
    v6 = @"Invalid";
  }
  id v7 = [v3 initWithFormat:@"NRDiscoveryProxyServer[%llu, %@]", identifier, v6];

  return v7;
}

@end