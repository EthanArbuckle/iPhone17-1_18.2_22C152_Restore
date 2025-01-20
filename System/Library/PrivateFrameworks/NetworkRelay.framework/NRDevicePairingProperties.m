@interface NRDevicePairingProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isAltAccountPairing;
- (BOOL)pairWithSPPLink;
- (BOOL)wasInitiallySetupUsingIDSPairing;
- (NRDevicePairingProperties)initWithCoder:(id)a3;
- (NSData)awdlAddressData;
- (NSData)bluetoothMACAddress;
- (NSData)outOfBandKey;
- (NSDictionary)peerEndpointDictionary;
- (NSString)candidateService;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAwdlAddressData:(id)a3;
- (void)setBluetoothMACAddress:(id)a3;
- (void)setCandidateService:(id)a3;
- (void)setIsAltAccountPairing:(BOOL)a3;
- (void)setOutOfBandKey:(id)a3;
- (void)setPairWithSPPLink:(BOOL)a3;
- (void)setPeerEndpointDictionary:(id)a3;
- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3;
@end

@implementation NRDevicePairingProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateService, 0);
  objc_storeStrong((id *)&self->_peerEndpointDictionary, 0);
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_outOfBandKey, 0);
}

- (void)setCandidateService:(id)a3
{
}

- (NSString)candidateService
{
  return self->_candidateService;
}

- (void)setPeerEndpointDictionary:(id)a3
{
}

- (NSDictionary)peerEndpointDictionary
{
  return self->_peerEndpointDictionary;
}

- (void)setBluetoothMACAddress:(id)a3
{
}

- (NSData)bluetoothMACAddress
{
  return self->_bluetoothMACAddress;
}

- (void)setIsAltAccountPairing:(BOOL)a3
{
  self->_isAltAccountPairing = a3;
}

- (BOOL)isAltAccountPairing
{
  return self->_isAltAccountPairing;
}

- (void)setPairWithSPPLink:(BOOL)a3
{
  self->_pairWithSPPLink = a3;
}

- (BOOL)pairWithSPPLink
{
  return self->_pairWithSPPLink;
}

- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3
{
  self->_wasInitiallySetupUsingIDSPairing = a3;
}

- (BOOL)wasInitiallySetupUsingIDSPairing
{
  return self->_wasInitiallySetupUsingIDSPairing;
}

- (void)setOutOfBandKey:(id)a3
{
}

- (NSData)outOfBandKey
{
  return self->_outOfBandKey;
}

- (NSData)awdlAddressData
{
  v2 = [(NSDictionary *)self->_peerEndpointDictionary objectForKeyedSubscript:&unk_26BE1DAE8];
  v3 = [v2 addressData];

  return (NSData *)v3;
}

- (void)setAwdlAddressData:(id)a3
{
  id v8 = a3;
  v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_peerEndpointDictionary)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:self->_peerEndpointDictionary];

    v4 = (NSDictionary *)v5;
  }
  v6 = objc_msgSend(MEMORY[0x263F143F0], "endpointWithAddress:", objc_msgSend(v8, "bytes"));
  [(NSDictionary *)v4 setObject:v6 forKeyedSubscript:&unk_26BE1DAE8];

  peerEndpointDictionary = self->_peerEndpointDictionary;
  self->_peerEndpointDictionary = v4;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"[NRDevicePairProp pairProtVers=%llu/nr:%u", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
  v4 = [(NRDevicePairingProperties *)self outOfBandKey];

  if (v4)
  {
    uint64_t v5 = [(NRDevicePairingProperties *)self outOfBandKey];
    LogString = _NRKeyCreateLogString(v5);
    [v3 appendFormat:@", oobk %@", LogString];
  }
  if ([(NRDevicePairingProperties *)self wasInitiallySetupUsingIDSPairing]) {
    [v3 appendString:@", IDS"];
  }
  if ([(NRDevicePairingProperties *)self pairWithSPPLink]) {
    [v3 appendString:@", SPP"];
  }
  if ([(NRDevicePairingProperties *)self isAltAccountPairing]) {
    [v3 appendString:@", ALT-ACC"];
  }
  v7 = [(NRDevicePairingProperties *)self bluetoothMACAddress];

  if (v7)
  {
    id v8 = [(NRDevicePairingProperties *)self bluetoothMACAddress];
    v9 = _NRCreateMACAddressString(v8);
    [v3 appendFormat:@", btMAC %@", v9];
  }
  v10 = [(NRDevicePairingProperties *)self peerEndpointDictionary];

  if (v10)
  {
    v11 = [(NRDevicePairingProperties *)self peerEndpointDictionary];
    [v3 appendFormat:@", peerIP %@", v11];
  }
  [v3 appendString:@"]"];
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NRDevicePairingProperties;
  id v4 = a3;
  [(NRDeviceProperties *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(NRDevicePairingProperties *)self outOfBandKey];
  [v4 encodeObject:v5 forKey:@"outOfBandKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties wasInitiallySetupUsingIDSPairing](self, "wasInitiallySetupUsingIDSPairing"), @"wasInitiallySetupUsingIDSPairing");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties pairWithSPPLink](self, "pairWithSPPLink"), @"pairWithSPPLink");
  objc_msgSend(v4, "encodeBool:forKey:", -[NRDevicePairingProperties isAltAccountPairing](self, "isAltAccountPairing"), @"isAltAccountPairing");
  v6 = [(NRDevicePairingProperties *)self bluetoothMACAddress];
  [v4 encodeObject:v6 forKey:@"bluetoothMACAddress"];

  v7 = [(NRDevicePairingProperties *)self peerEndpointDictionary];
  [v4 encodeObject:v7 forKey:@"peerEndpointDictionary"];
}

- (NRDevicePairingProperties)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NRDevicePairingProperties;
  uint64_t v5 = [(NRDeviceProperties *)&v22 initWithCoder:v4];
  if (!v5)
  {
    v11 = nrCopyLogObj_1005();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v20 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v20 = 136446210;
        *(void *)(v20 + 4) = "-[NRDevicePairingProperties initWithCoder:]";
        id v21 = nrCopyLogObj_1005();
        _NRLogAbortWithPack(v21);
      }
    }
    id v14 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super initWithCoder:] failed", v15, v16, v17, v18, v19, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outOfBandKey"];
  [(NRDevicePairingProperties *)v6 setOutOfBandKey:v7];

  -[NRDevicePairingProperties setWasInitiallySetupUsingIDSPairing:](v6, "setWasInitiallySetupUsingIDSPairing:", [v4 decodeBoolForKey:@"wasInitiallySetupUsingIDSPairing"]);
  -[NRDevicePairingProperties setPairWithSPPLink:](v6, "setPairWithSPPLink:", [v4 decodeBoolForKey:@"pairWithSPPLink"]);
  -[NRDevicePairingProperties setIsAltAccountPairing:](v6, "setIsAltAccountPairing:", [v4 decodeBoolForKey:@"isAltAccountPairing"]);
  objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothMACAddress"];
  [(NRDevicePairingProperties *)v6 setBluetoothMACAddress:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerEndpointDictionary"];
  [(NRDevicePairingProperties *)v6 setPeerEndpointDictionary:v9];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NRDevicePairingProperties;
  id v4 = [(NRDeviceProperties *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NRDevicePairingProperties *)self outOfBandKey];
  v6 = (void *)[v5 copy];
  [v4 setOutOfBandKey:v6];

  objc_msgSend(v4, "setWasInitiallySetupUsingIDSPairing:", -[NRDevicePairingProperties wasInitiallySetupUsingIDSPairing](self, "wasInitiallySetupUsingIDSPairing"));
  objc_msgSend(v4, "setPairWithSPPLink:", -[NRDevicePairingProperties pairWithSPPLink](self, "pairWithSPPLink"));
  objc_msgSend(v4, "setIsAltAccountPairing:", -[NRDevicePairingProperties isAltAccountPairing](self, "isAltAccountPairing"));
  v7 = [(NRDevicePairingProperties *)self bluetoothMACAddress];
  objc_super v8 = (void *)[v7 copy];
  [v4 setBluetoothMACAddress:v8];

  v9 = [(NRDevicePairingProperties *)self peerEndpointDictionary];
  v10 = (void *)[v9 copy];
  [v4 setPeerEndpointDictionary:v10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end