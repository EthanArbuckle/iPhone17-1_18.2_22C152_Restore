@interface NRDevicePairingManagerInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDevicePairingCriteria)pairingCriteria;
- (NRDevicePairingManagerInfo)init;
- (NRDevicePairingManagerInfo)initWithCoder:(id)a3;
- (NSData)identifier;
- (NSData)metadata;
- (NSString)fullDescription;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPairingCriteria:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NRDevicePairingManagerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pairingCriteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setPairingCriteria:(id)a3
{
}

- (NRDevicePairingCriteria)pairingCriteria
{
  return self->_pairingCriteria;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)fullDescription
{
  v3 = [(NRDevicePairingManagerInfo *)self description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(NRDevicePairingManagerInfo *)self identifier];

  if (v5)
  {
    v6 = [(NRDevicePairingManagerInfo *)self identifier];
    [v4 appendFormat:@" Identifier %@", v6];
  }
  v7 = [(NRDevicePairingManagerInfo *)self metadata];

  if (v7)
  {
    v8 = [(NRDevicePairingManagerInfo *)self metadata];
    [v4 appendFormat:@" Metadata %@", v8];
  }
  v9 = [(NRDevicePairingManagerInfo *)self pairingCriteria];
  [v4 appendFormat:@" Pairing Criteria %@", v9];

  return (NSString *)v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NRDevicePairingManagerInfo *)self uuid];
  v5 = (void *)[v3 initWithFormat:@"NRDevicePairingManager[%@]", v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(NRDevicePairingManagerInfo *)self uuid];
    v7 = [v5 uuid];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(NRDevicePairingManagerInfo *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NRDevicePairingManagerInfo *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  v6 = [(NRDevicePairingManagerInfo *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(NRDevicePairingManagerInfo *)self pairingCriteria];
  [v4 encodeObject:v7 forKey:@"pairingCriteria"];

  id v8 = [(NRDevicePairingManagerInfo *)self metadata];
  [v4 encodeObject:v8 forKey:@"metadata"];
}

- (NRDevicePairingManagerInfo)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NRDevicePairingManagerInfo;
  id v5 = [(NRDevicePairingManagerInfo *)&v23 init];
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
        *(void *)(v21 + 4) = "-[NRDevicePairingManagerInfo initWithCoder:]";
        id v22 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v22);
      }
    }
    id v15 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  [(NRDevicePairingManagerInfo *)v6 setUuid:v7];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(NRDevicePairingManagerInfo *)v6 setIdentifier:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingCriteria"];
  [(NRDevicePairingManagerInfo *)v6 setPairingCriteria:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  [(NRDevicePairingManagerInfo *)v6 setMetadata:v10];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(NRDevicePairingManagerInfo *)self uuid];
  [v4 setUuid:v5];

  v6 = [(NRDevicePairingManagerInfo *)self identifier];
  v7 = (void *)[v6 copy];
  [v4 setIdentifier:v7];

  id v8 = [(NRDevicePairingManagerInfo *)self pairingCriteria];
  v9 = (void *)[v8 copy];
  [v4 setPairingCriteria:v9];

  v10 = [(NRDevicePairingManagerInfo *)self metadata];
  v11 = (void *)[v10 copy];
  [v4 setMetadata:v11];

  return v4;
}

- (NRDevicePairingManagerInfo)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)NRDevicePairingManagerInfo;
  v2 = [(NRDevicePairingManagerInfo *)&v17 init];
  if (!v2)
  {
    v6 = nrCopyLogObj_1256();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v15 = 136446210;
        *(void *)(v15 + 4) = "-[NRDevicePairingManagerInfo init]";
        id v16 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v16);
      }
    }
    id v9 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_8;
  }
  unint64_t v3 = v2;
  id v4 = [MEMORY[0x263F08C38] UUID];
  [(NRDevicePairingManagerInfo *)v3 setUuid:v4];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end