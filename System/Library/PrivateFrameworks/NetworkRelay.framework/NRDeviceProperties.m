@interface NRDeviceProperties
+ (BOOL)supportsSecureCoding;
+ (unsigned)getNetworkRelayVersion;
- (NRDeviceProperties)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)pairingProtocolVersion;
- (unsigned)peerNetworkRelayVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setPairingProtocolVersion:(unint64_t)a3;
- (void)setPeerNetworkRelayVersion:(unsigned __int16)a3;
@end

@implementation NRDeviceProperties

- (void)setPeerNetworkRelayVersion:(unsigned __int16)a3
{
  self->_peerNetworkRelayVersion = a3;
}

- (unsigned)peerNetworkRelayVersion
{
  return self->_peerNetworkRelayVersion;
}

- (void)setPairingProtocolVersion:(unint64_t)a3
{
  self->_pairingProtocolVersion = a3;
}

- (unint64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"[NRDeviceProp pairProtVers=%llu/nr:%u]", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"), @"pairingProtocolVersion");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"), @"peerNetworkRelayVersion");
}

- (NRDeviceProperties)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NRDeviceProperties;
  v5 = [(NRDeviceProperties *)&v19 init];
  if (!v5)
  {
    v8 = nrCopyLogObj_1005();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v17 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v17 = 136446210;
        *(void *)(v17 + 4) = "-[NRDeviceProperties initWithCoder:]";
        id v18 = nrCopyLogObj_1005();
        _NRLogAbortWithPack(v18);
      }
    }
    id v11 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v11, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v12, v13, v14, v15, v16, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDeviceProperties setPairingProtocolVersion:](v5, "setPairingProtocolVersion:", [v4 decodeInt64ForKey:@"pairingProtocolVersion"]);
  -[NRDeviceProperties setPeerNetworkRelayVersion:](v6, "setPeerNetworkRelayVersion:", (unsigned __int16)[v4 decodeInt32ForKey:@"peerNetworkRelayVersion"]);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPairingProtocolVersion:", -[NRDeviceProperties pairingProtocolVersion](self, "pairingProtocolVersion"));
  objc_msgSend(v4, "setPeerNetworkRelayVersion:", -[NRDeviceProperties peerNetworkRelayVersion](self, "peerNetworkRelayVersion"));
  return v4;
}

+ (unsigned)getNetworkRelayVersion
{
  if (getNetworkRelayVersion_onceToken != -1) {
    dispatch_once(&getNetworkRelayVersion_onceToken, &__block_literal_global_1019);
  }
  return getNetworkRelayVersion_version;
}

uint64_t __44__NRDeviceProperties_getNetworkRelayVersion__block_invoke()
{
  uint64_t result = nrXPCGetNetworkRelayVersion();
  getNetworkRelayVersion_version = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end