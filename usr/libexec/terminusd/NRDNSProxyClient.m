@interface NRDNSProxyClient
- (id)description;
- (void)cancel;
- (void)start;
@end

@implementation NRDNSProxyClient

- (void).cxx_destruct
{
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)NRDNSProxyClient;
  [(NRDNSProxy *)&v4 cancel];
  if (self)
  {
    if (self->_discoveryProxyClient)
    {
      mrc_discovery_proxy_invalidate();
      discoveryProxyClient = self->_discoveryProxyClient;
      self->_discoveryProxyClient = 0;
    }
  }
}

- (id)description
{
  if (self)
  {
    if (self->super._isDiscoveryProxy) {
      v3 = "NRDiscoveryProxyClient";
    }
    else {
      v3 = "NRDNSProxyClient";
    }
    id v4 = objc_alloc((Class)NSString);
    unint64_t identifier = self->super._identifier;
    uint64_t state = self->super._state;
    v7 = @"Invalid";
    switch((int)state)
    {
      case 0:
        break;
      case 1:
        v7 = @"Preparing";
        break;
      case 2:
        v7 = @"Ready";
        break;
      case 3:
        v7 = @"Restarting";
        break;
      case 4:
        v7 = @"Failed";
        break;
      default:
        v7 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%u)", state];
        break;
    }
  }
  else
  {
    id v4 = objc_alloc((Class)NSString);
    unint64_t identifier = 0;
    v7 = @"Invalid";
    v3 = "NRDNSProxyClient";
  }
  id v8 = [v4 initWithFormat:@"%s[%llu, %@]", v3, identifier, v7];

  return v8;
}

- (void)start
{
  if (!self)
  {
    v37.receiver = 0;
    v37.super_class = (Class)NRDNSProxyClient;
    [(NRDNSProxy *)&v37 start];
    return;
  }
  if (!self->super._started)
  {
    v37.receiver = self;
    v37.super_class = (Class)NRDNSProxyClient;
    [(NRDNSProxy *)&v37 start];
    int dnsProtocol = self->super._dnsProtocol;
    if (dnsProtocol != 1)
    {
      if (!dnsProtocol)
      {
        id v4 = self;
        int v5 = 2;
LABEL_16:
        sub_10001E8F4(v4, v5);
        return;
      }
      goto LABEL_13;
    }
    if (!self->super._isDiscoveryProxy)
    {
LABEL_13:
      v13 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        v15 = self->super._nrUUID;
        v16 = (void *)_NRCopyLogObjectForNRUUID();

        _NRLogWithArgs();
      }
LABEL_15:
      id v4 = self;
      int v5 = 4;
      goto LABEL_16;
    }
    if (!self->super._serverCertificateData)
    {
      if (qword_1001F4870 != -1) {
        dispatch_once(&qword_1001F4870, &stru_1001C6418);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4870 != -1) {
          dispatch_once(&qword_1001F4870, &stru_1001C6418);
        }
        _NRLogWithArgs();
      }
      goto LABEL_15;
    }
    v6 = (void *)mrc_discovery_proxy_parameters_create();
    if (v6)
    {
      v7 = (void *)_NRCopyLogObjectForNRUUID();
      int v8 = _NRLogIsLevelEnabled();

      if (v8)
      {
        v9 = self->super._nrUUID;
        v10 = (void *)_NRCopyLogObjectForNRUUID();
        uint64_t v35 = 197;
        serverEndpoint = self->super._serverEndpoint;
        v33 = "";
        v34 = "-[NRDNSProxyClient startDiscoveryProxyClient]";
        _NRLogWithArgs();
      }
      id v11 = [(NWAddressEndpoint *)self->super._serverEndpoint addressFamily];
      v12 = self->super._serverEndpoint;
      if (v11 == (id)2)
      {
        [(NWAddressEndpoint *)v12 address];
        mrc_discovery_proxy_parameters_add_server_ipv4_address();
      }
      else if ([(NWAddressEndpoint *)v12 addressFamily] == (id)30)
      {
        [(NWAddressEndpoint *)self->super._serverEndpoint address];
        mrc_discovery_proxy_parameters_add_server_ipv6_address();
      }
      mrc_discovery_proxy_parameters_add_match_domain();
      v17 = self->super._serverCertificateData;
      [(NSData *)v17 bytes];
      [(NSData *)v17 length];
      mrc_discovery_proxy_parameters_add_server_certificate();
      mrc_discovery_proxy_parameters_set_interface();
      v18 = (void *)_NRCopyLogObjectForNRUUID();
      int v19 = _NRLogIsLevelEnabled();

      if (v19)
      {
        v20 = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
      }
      v21 = (void *)mrc_discovery_proxy_create();
      if (v21)
      {
        mrc_discovery_proxy_set_queue();
        objc_initWeak(&location, self);
        v38 = _NSConcreteStackBlock;
        uint64_t v39 = 3221225472;
        v40 = sub_10001E9E0;
        v41 = &unk_1001C6380;
        objc_copyWeak(&v43, &location);
        id v42 = v21;
        mrc_discovery_proxy_set_event_handler();
        mrc_discovery_proxy_activate();
        v22 = self->super._nrUUID;
        v23 = (void *)_NRCopyLogObjectForNRUUID();
        char v24 = _NRLogIsLevelEnabled();

        if (v24)
        {
          v25 = self->super._nrUUID;
          v26 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        objc_storeStrong((id *)&self->_discoveryProxyClient, v21);
        sub_10001E8F4(self, 1);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
      else
      {
        id v30 = sub_10001E14C();
        int v31 = _NRLogIsLevelEnabled();

        if (v31)
        {
          id v32 = sub_10001E14C();
          _NRLogWithArgs();
        }
        sub_10001E8F4(self, 4);
      }
    }
    else
    {
      id v27 = sub_10001E14C();
      int v28 = _NRLogIsLevelEnabled();

      if (v28)
      {
        id v29 = sub_10001E14C();
        _NRLogWithArgs();
      }
      sub_10001E8F4(self, 4);
    }
  }
}

@end