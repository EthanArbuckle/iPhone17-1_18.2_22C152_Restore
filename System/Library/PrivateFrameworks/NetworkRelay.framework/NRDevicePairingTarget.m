@interface NRDevicePairingTarget
+ (BOOL)supportsSecureCoding;
- (NRDeviceOperationalProperties)operationalProperties;
- (NRDevicePairingCandidate)candidate;
- (NRDevicePairingProperties)properties;
- (NRDevicePairingTarget)initWithCoder:(id)a3;
- (NSData)authData;
- (NSData)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)authMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthData:(id)a3;
- (void)setAuthMethod:(unint64_t)a3;
- (void)setCandidate:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setOperationalProperties:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation NRDevicePairingTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setOperationalProperties:(id)a3
{
}

- (NRDeviceOperationalProperties)operationalProperties
{
  return self->_operationalProperties;
}

- (void)setProperties:(id)a3
{
}

- (NRDevicePairingProperties)properties
{
  return self->_properties;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setAuthData:(id)a3
{
}

- (NSData)authData
{
  return self->_authData;
}

- (void)setAuthMethod:(unint64_t)a3
{
  self->_authMethod = a3;
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (void)setCandidate:(id)a3
{
}

- (NRDevicePairingCandidate)candidate
{
  return self->_candidate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NRDevicePairingTarget *)self candidate];
  [v4 encodeObject:v5 forKey:@"candidate"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[NRDevicePairingTarget authMethod](self, "authMethod"), @"authMethod");
  v6 = [(NRDevicePairingTarget *)self authData];
  [v4 encodeObject:v6 forKey:@"authData"];

  v7 = [(NRDevicePairingTarget *)self properties];
  [v4 encodeObject:v7 forKey:@"properties"];

  id v8 = [(NRDevicePairingTarget *)self operationalProperties];
  [v4 encodeObject:v8 forKey:@"operationalProperties"];
}

- (NRDevicePairingTarget)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NRDevicePairingTarget;
  v5 = [(NRDevicePairingTarget *)&v23 init];
  if (!v5)
  {
    v12 = nrCopyLogObj_1256();
    v13 = v12;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v21 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v21 = 136446210;
        *(void *)(v21 + 4) = "-[NRDevicePairingTarget initWithCoder:]";
        id v22 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v22);
      }
    }
    id v15 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
  [(NRDevicePairingTarget *)v6 setCandidate:v7];

  -[NRDevicePairingTarget setAuthMethod:](v6, "setAuthMethod:", [v4 decodeInt64ForKey:@"authMethod"]);
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authData"];
  [(NRDevicePairingTarget *)v6 setAuthData:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
  [(NRDevicePairingTarget *)v6 setProperties:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationalProperties"];
  [(NRDevicePairingTarget *)v6 setOperationalProperties:v10];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NRDevicePairingTarget *)self candidate];
  [v4 setCandidate:v5];

  objc_msgSend(v4, "setAuthMethod:", -[NRDevicePairingTarget authMethod](self, "authMethod"));
  v6 = [(NRDevicePairingTarget *)self authData];
  [v4 setAuthData:v6];

  v7 = [(NRDevicePairingTarget *)self properties];
  [v4 setProperties:v7];

  id v8 = [(NRDevicePairingTarget *)self operationalProperties];
  [v4 setOperationalProperties:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end