@interface SFRemoteHotspotTrafficFilterParams
+ (BOOL)supportsSecureCoding;
- (NSString)destIPAddress;
- (NSString)srcIPAddress;
- (NSString)trafficClass;
- (SFRemoteHotspotTrafficFilterParams)initWithCoder:(id)a3;
- (id)description;
- (unsigned)destPort;
- (unsigned)idleTimeout;
- (unsigned)ipProtocol;
- (unsigned)ipVersion;
- (unsigned)srcPort;
- (void)encodeWithCoder:(id)a3;
- (void)setDestIPAddress:(id)a3;
- (void)setDestPort:(unsigned __int16)a3;
- (void)setIdleTimeout:(unsigned int)a3;
- (void)setIpProtocol:(unsigned __int16)a3;
- (void)setIpVersion:(unsigned int)a3;
- (void)setSrcIPAddress:(id)a3;
- (void)setSrcPort:(unsigned __int16)a3;
- (void)setTrafficClass:(id)a3;
@end

@implementation SFRemoteHotspotTrafficFilterParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteHotspotTrafficFilterParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFRemoteHotspotTrafficFilterParams;
  v5 = [(SFRemoteHotspotTrafficFilterParams *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_srcPort = v12;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_destPort = v12;
    }
    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_ipProtocol = v12;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_ipVersion = v12;
    }
    uint64_t v12 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_idleTimeout = v12;
    }
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  srcIPAddress = self->_srcIPAddress;
  id v10 = v4;
  if (srcIPAddress)
  {
    [v4 encodeObject:srcIPAddress forKey:@"srcIP"];
    id v4 = v10;
  }
  if (self->_srcPort)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    id v4 = v10;
  }
  destIPAddress = self->_destIPAddress;
  if (destIPAddress)
  {
    [v10 encodeObject:destIPAddress forKey:@"destIP"];
    id v4 = v10;
  }
  if (self->_destPort)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    id v4 = v10;
  }
  if (self->_ipProtocol)
  {
    objc_msgSend(v10, "encodeInteger:forKey:");
    id v4 = v10;
  }
  trafficClass = self->_trafficClass;
  if (trafficClass)
  {
    [v10 encodeObject:trafficClass forKey:@"traCla"];
    id v4 = v10;
  }
  uint64_t ipVersion = self->_ipVersion;
  if (ipVersion)
  {
    [v10 encodeInt64:ipVersion forKey:@"ipVer"];
    id v4 = v10;
  }
  uint64_t idleTimeout = self->_idleTimeout;
  if (idleTimeout)
  {
    [v10 encodeInt64:idleTimeout forKey:@"timeout"];
    id v4 = v10;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_srcIPAddress)
  {
    v15 = v3;
    NSAppendPrintF();
    id v5 = v15;

    id v4 = v5;
  }
  if (self->_srcPort)
  {
    NSAppendPrintF();
    id v6 = v4;

    id v4 = v6;
  }
  if (self->_destIPAddress)
  {
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  if (self->_destPort)
  {
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }
  if (self->_ipProtocol)
  {
    NSAppendPrintF();
    id v9 = v4;

    id v4 = v9;
  }
  if (self->_trafficClass)
  {
    NSAppendPrintF();
    id v10 = v4;

    id v4 = v10;
  }
  if (self->_ipVersion)
  {
    NSAppendPrintF();
    id v11 = v4;

    id v4 = v11;
  }
  if (self->_idleTimeout)
  {
    NSAppendPrintF();
    id v12 = v4;

    id v4 = v12;
  }
  NSAppendPrintF();
  id v13 = v4;

  return v13;
}

- (NSString)srcIPAddress
{
  return self->_srcIPAddress;
}

- (void)setSrcIPAddress:(id)a3
{
}

- (unsigned)srcPort
{
  return self->_srcPort;
}

- (void)setSrcPort:(unsigned __int16)a3
{
  self->_srcPort = a3;
}

- (NSString)destIPAddress
{
  return self->_destIPAddress;
}

- (void)setDestIPAddress:(id)a3
{
}

- (unsigned)destPort
{
  return self->_destPort;
}

- (void)setDestPort:(unsigned __int16)a3
{
  self->_destPort = a3;
}

- (unsigned)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unsigned __int16)a3
{
  self->_ipProtocol = a3;
}

- (NSString)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
}

- (unsigned)ipVersion
{
  return self->_ipVersion;
}

- (void)setIpVersion:(unsigned int)a3
{
  self->_uint64_t ipVersion = a3;
}

- (unsigned)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(unsigned int)a3
{
  self->_uint64_t idleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_destIPAddress, 0);

  objc_storeStrong((id *)&self->_srcIPAddress, 0);
}

@end