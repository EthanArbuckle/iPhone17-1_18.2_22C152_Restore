@interface NRDNANPeer
- (BOOL)hasActiveDataSession;
- (BOOL)isInitiator;
- (NRDNANPeer)init;
- (NSString)remoteIDSDeviceID;
- (NSString)serviceName;
- (NWAddressEndpoint)peerEndpoint;
- (WiFiAwareDataSession)initiatorDataSession;
- (WiFiAwareDiscoveryResult)initiatorDiscoveryResult;
- (WiFiAwarePublisherDataSessionHandle)responderDataSession;
- (id)description;
- (unsigned)identifier;
- (unsigned)localInterfaceIndex;
- (unsigned)peerInstanceID;
- (void)setInitiatorDataSession:(id)a3;
- (void)setInitiatorDiscoveryResult:(id)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)setLocalInterfaceIndex:(unsigned int)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setPeerInstanceID:(unsigned __int8)a3;
- (void)setRemoteIDSDeviceID:(id)a3;
- (void)setResponderDataSession:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NRDNANPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_responderDataSession, 0);
  objc_storeStrong((id *)&self->_initiatorDataSession, 0);
  objc_storeStrong((id *)&self->_initiatorDiscoveryResult, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)setRemoteIDSDeviceID:(id)a3
{
}

- (NSString)remoteIDSDeviceID
{
  return self->_remoteIDSDeviceID;
}

- (void)setResponderDataSession:(id)a3
{
}

- (WiFiAwarePublisherDataSessionHandle)responderDataSession
{
  return self->_responderDataSession;
}

- (void)setInitiatorDataSession:(id)a3
{
}

- (WiFiAwareDataSession)initiatorDataSession
{
  return self->_initiatorDataSession;
}

- (void)setInitiatorDiscoveryResult:(id)a3
{
}

- (WiFiAwareDiscoveryResult)initiatorDiscoveryResult
{
  return self->_initiatorDiscoveryResult;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void)setPeerInstanceID:(unsigned __int8)a3
{
  self->_peerInstanceID = a3;
}

- (unsigned)peerInstanceID
{
  return self->_peerInstanceID;
}

- (void)setPeerEndpoint:(id)a3
{
}

- (NWAddressEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (BOOL)hasActiveDataSession
{
  return self->_localInterfaceIndex != 0;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self->_isInitiator) {
    v4 = "I";
  }
  else {
    v4 = "R";
  }
  uint64_t peerInstanceID = self->_peerInstanceID;
  uint64_t identifier = self->_identifier;
  v7 = [(NWAddressEndpoint *)self->_peerEndpoint hostname];
  id v8 = [v3 initWithFormat:@"NRDNANPeer[%u, %s, id %u, %@]", identifier, v4, peerInstanceID, v7];

  return v8;
}

- (NRDNANPeer)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRDNANPeer;
  result = [(NRDNANPeer *)&v7 init];
  if (!result)
  {
    id v3 = sub_100122450();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v5 = sub_100122450();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "-[NRDNANPeer init]";
    sub_100122450();
    _NRLogAbortWithPack();
  }
  result->_uint64_t identifier = ++dword_1001F4CA8;
  return result;
}

@end