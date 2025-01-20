@interface NRDevicePairingCandidate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDevicePairingCandidate)initWithCoder:(id)a3;
- (NSData)identifier;
- (NSData)metadata;
- (NSString)fullDescription;
- (NSUUID)cbUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initInternal;
- (id)initInternalWithUUID:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCbUUID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation NRDevicePairingCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_cbUUID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setCbUUID:(id)a3
{
}

- (NSUUID)cbUUID
{
  return self->_cbUUID;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSString)fullDescription
{
  v3 = [(NRDevicePairingCandidate *)self description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(NRDevicePairingCandidate *)self identifier];

  if (v5)
  {
    v6 = [(NRDevicePairingCandidate *)self identifier];
    [v4 appendFormat:@" Identifier %@", v6];
  }
  v7 = [(NRDevicePairingCandidate *)self metadata];

  if (v7)
  {
    v8 = [(NRDevicePairingCandidate *)self metadata];
    [v4 appendFormat:@" Metadata %@", v8];
  }
  v9 = [(NRDevicePairingCandidate *)self cbUUID];

  if (v9)
  {
    v10 = [(NRDevicePairingCandidate *)self cbUUID];
    [v4 appendFormat:@" CBUUID %@", v10];
  }
  return (NSString *)v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NRDevicePairingCandidate *)self uuid];
  v5 = (void *)[v3 initWithFormat:@"NRDevicePairingCandidate[%@]", v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(NRDevicePairingCandidate *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(NRDevicePairingCandidate *)self uuid];
    v7 = [v5 uuid];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NRDevicePairingCandidate *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  v6 = [(NRDevicePairingCandidate *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(NRDevicePairingCandidate *)self metadata];
  [v4 encodeObject:v7 forKey:@"metadata"];

  id v8 = [(NRDevicePairingCandidate *)self cbUUID];
  [v4 encodeObject:v8 forKey:@"cbUUID"];
}

- (NRDevicePairingCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  v6 = [(NRDevicePairingCandidate *)self initInternalWithUUID:v5];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(NRDevicePairingCandidate *)v6 setIdentifier:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    [(NRDevicePairingCandidate *)v6 setMetadata:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cbUUID"];
    [(NRDevicePairingCandidate *)v6 setCbUUID:v9];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NRDevicePairingCandidate *)self uuid];
  v6 = (void *)[v4 initInternalWithUUID:v5];

  if (v6)
  {
    v7 = [(NRDevicePairingCandidate *)self identifier];
    id v8 = (void *)[v7 copy];
    [v6 setIdentifier:v8];

    v9 = [(NRDevicePairingCandidate *)self metadata];
    v10 = (void *)[v9 copy];
    [v6 setMetadata:v10];

    v11 = [(NRDevicePairingCandidate *)self cbUUID];
    [v6 setCbUUID:v11];
  }
  return v6;
}

- (id)initInternal
{
  unint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [(NRDevicePairingCandidate *)self initInternalWithUUID:v3];

  return v4;
}

- (id)initInternalWithUUID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v10 = nrCopyLogObj_1256();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v23)
      {
LABEL_15:
        id v8 = 0;
        goto LABEL_4;
      }
    }
    id v24 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null uuid", v25, v26, v27, v28, v29, (uint64_t)"-[NRDevicePairingCandidate initInternalWithUUID:]");

    goto LABEL_15;
  }
  v30.receiver = self;
  v30.super_class = (Class)NRDevicePairingCandidate;
  v6 = [(NRDevicePairingCandidate *)&v30 init];
  if (!v6)
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
LABEL_12:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v21 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v21 = 136446210;
        *(void *)(v21 + 4) = "-[NRDevicePairingCandidate initInternalWithUUID:]";
        id v22 = nrCopyLogObj_1256();
        _NRLogAbortWithPack(v22);
      }
    }
    id v15 = nrCopyLogObj_1256();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_12;
  }
  v7 = v6;
  objc_storeStrong((id *)&v6->_uuid, a3);
  self = v7;
  id v8 = self;
LABEL_4:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end