@interface NRDevicePairingCriteria
+ (BOOL)supportsSecureCoding;
- (NRDevicePairingCriteria)initWithCoder:(id)a3;
- (NSNumber)rssi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)deviceType;
- (unsigned)pairingTransport;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setPairingTransport:(unsigned __int8)a3;
- (void)setRssi:(id)a3;
@end

@implementation NRDevicePairingCriteria

- (void).cxx_destruct
{
}

- (void)setRssi:(id)a3
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setPairingTransport:(unsigned __int8)a3
{
  self->_pairingTransport = a3;
}

- (unsigned)pairingTransport
{
  return self->_pairingTransport;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"Type %zu Transport %u", -[NRDevicePairingCriteria deviceType](self, "deviceType"), -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"));
  v4 = [(NRDevicePairingCriteria *)self rssi];

  if (v4)
  {
    v5 = [(NRDevicePairingCriteria *)self rssi];
    [v3 appendFormat:@" RSSI %@", v5];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDevicePairingCriteria deviceType](self, "deviceType"), @"deviceType");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"), @"pairingTransport");
  id v5 = [(NRDevicePairingCriteria *)self rssi];
  [v4 encodeObject:v5 forKey:@"rssi"];
}

- (NRDevicePairingCriteria)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRDevicePairingCriteria;
  id v5 = [(NRDevicePairingCriteria *)&v20 init];
  if (!v5)
  {
    v9 = nrCopyLogObj_1256();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "-[NRDevicePairingCriteria initWithCoder:]";
        id v19 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  -[NRDevicePairingCriteria setDeviceType:](v5, "setDeviceType:", [v4 decodeInt64ForKey:@"deviceType"]);
  -[NRDevicePairingCriteria setPairingTransport:](v6, "setPairingTransport:", [v4 decodeInt32ForKey:@"pairingTransport"]);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rssi"];
  [(NRDevicePairingCriteria *)v6 setRssi:v7];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDeviceType:", -[NRDevicePairingCriteria deviceType](self, "deviceType"));
  objc_msgSend(v4, "setPairingTransport:", -[NRDevicePairingCriteria pairingTransport](self, "pairingTransport"));
  id v5 = [(NRDevicePairingCriteria *)self rssi];
  [v4 setRssi:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end