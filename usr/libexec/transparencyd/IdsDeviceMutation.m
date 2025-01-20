@interface IdsDeviceMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)accountMismatch;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutation)init;
- (IdsMutation)idsMutation;
- (NSData)accountKeyHash;
- (NSData)clientDataHash;
- (NSData)deviceIdHash;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)appVersion;
- (unint64_t)expiryMs;
- (unint64_t)parsedLength;
- (void)setAccountKeyHash:(id)a3;
- (void)setAccountMismatch:(BOOL)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setIdsMutation:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDeviceMutation

- (IdsDeviceMutation)init
{
  v3.receiver = self;
  v3.super_class = (Class)IdsDeviceMutation;
  return [(IdsDeviceMutation *)&v3 init];
}

- (id)data
{
  objc_super v3 = +[NSMutableData data];
  v4 = [(IdsDeviceMutation *)self accountKeyHash];
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (!v5) {
    goto LABEL_14;
  }
  v6 = [(IdsDeviceMutation *)self deviceIdHash];
  unsigned int v7 = [(TLSMessageClass *)self encodeHashValue:v6 buffer:v3];

  if (!v7) {
    goto LABEL_14;
  }
  v8 = [(IdsDeviceMutation *)self clientDataHash];
  unsigned int v9 = [(TLSMessageClass *)self encodeHashValue:v8 buffer:v3];

  if (!v9
    || ![(TLSMessageClass *)self encodeUint64:[(IdsDeviceMutation *)self appVersion] buffer:v3])
  {
    goto LABEL_14;
  }
  v10 = [(IdsDeviceMutation *)self idsMutation];
  unsigned int v11 = [v10 mutationType];

  BOOL v12 = v11 == 1 && [(IdsDeviceMutation *)self accountMismatch];
  if ([(TLSMessageClass *)self encodeBool:v12 buffer:v3]
    && (([(IdsDeviceMutation *)self idsMutation],
         v13 = objc_claimAutoreleasedReturnValue(),
         unsigned int v14 = [v13 mutationType],
         v13,
         v14 != 1)
      ? (unint64_t v15 = 0)
      : (unint64_t v15 = [(IdsDeviceMutation *)self expiryMs]),
        [(TLSMessageClass *)self encodeUint64:v15 buffer:v3]))
  {
    id v16 = v3;
  }
  else
  {
LABEL_14:
    id v16 = 0;
  }

  return v16;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  unsigned int v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  id v33 = 0;
  id v11 = [v10 parseHashValue:v6 end:v9 result:&v33];
  id v12 = v33;
  if (v11)
  {
    [v10 setAccountKeyHash:v12];
    id v32 = 0;
    id v13 = [v10 parseHashValue:v11 end:v9 result:&v32];
    id v14 = v32;
    if (!v13)
    {
      if (a4)
      {
        +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-243 description:@"failed to parse device ID from Mutation"];
        id v23 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v23 = 0;
      }
      goto LABEL_25;
    }
    [v10 setDeviceIdHash:v14];
    id v31 = 0;
    id v15 = [v10 parseHashValue:v13 end:v9 result:&v31];
    id v16 = v31;
    if (v15)
    {
      [v10 setClientDataHash:v16];
      uint64_t v30 = 0;
      id v17 = [v10 parseUint64:v15 end:v9 result:&v30];
      if (v17)
      {
        id v18 = v17;
        [v10 setAppVersion:v30];
        unsigned __int8 v29 = 0;
        [v10 setAccountMismatch:0];
        id v19 = [v10 parseBool:v18 end:v9 result:&v29];
        if (v19)
        {
          id v20 = v19;
          [v10 setAccountMismatch:v29];
          uint64_t v28 = 0;
          v21 = [v10 parseUint64:v20 end:v9 result:&v28];
          if (v21)
          {
            v22 = v21;
            [v10 setExpiryMs:v28];
            [v10 setParsedLength:v22 - (unsigned char *)[objc_retainAutorelease(v7) bytes]];
            id v23 = v10;
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          if (a4)
          {
            uint64_t v24 = kTransparencyErrorDecode;
            CFStringRef v25 = @"failed to parse expiry timestamp from Mutation";
            uint64_t v26 = -247;
            goto LABEL_22;
          }
LABEL_23:
          id v23 = 0;
          goto LABEL_24;
        }
        if (!a4) {
          goto LABEL_23;
        }
        uint64_t v24 = kTransparencyErrorDecode;
        CFStringRef v25 = @"failed to parse account mismatch from Mutation";
        uint64_t v26 = -246;
      }
      else
      {
        if (!a4) {
          goto LABEL_23;
        }
        uint64_t v24 = kTransparencyErrorDecode;
        CFStringRef v25 = @"failed to parse app version from Mutation";
        uint64_t v26 = -245;
      }
    }
    else
    {
      if (!a4) {
        goto LABEL_23;
      }
      uint64_t v24 = kTransparencyErrorDecode;
      CFStringRef v25 = @"failed to parse client data from Mutation";
      uint64_t v26 = -244;
    }
LABEL_22:
    +[TransparencyError errorWithDomain:v24 code:v26 description:v25];
    id v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-242 description:@"failed to parse account key from Mutation"];
    id v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }
LABEL_26:

  return v23;
}

- (id)debugDescription
{
  objc_super v3 = [(NSData *)self->_accountKeyHash kt_hexString];
  v4 = [(NSData *)self->_deviceIdHash kt_hexString];
  id v5 = [(NSData *)self->_clientDataHash kt_hexString];
  id v6 = +[NSString stringWithFormat:@"{\t\taccountKeyHash:%@\n\t\tdeviceIdHash:%@\n\t\tclientDataHash:%@\n\t\tapplicationVersion:%llu\n\t\taccountMismatch:%lu\n\t\texpiryMs:%llu\n}", v3, v4, v5, self->_appVersion, self->_accountMismatch, self->_expiryMs];

  return v6;
}

- (id)description
{
  objc_super v3 = [(NSData *)self->_accountKeyHash kt_hexString];
  v4 = [(NSData *)self->_deviceIdHash kt_hexString];
  id v5 = [(NSData *)self->_clientDataHash kt_hexString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"accountKeyHash:%@; deviceIdHash::%@; clientDataHash:%@; applicationVersion:%llu; accountMismatch:%lu; expiryMs:%llu",
    v3,
    v4,
    v5,
    self->_appVersion,
    self->_accountMismatch,
  id v6 = self->_expiryMs);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IdsDeviceMutation *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(IdsDeviceMutation *)self data];
      id v7 = [(IdsDeviceMutation *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (IdsMutation)idsMutation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsMutation);

  return (IdsMutation *)WeakRetained;
}

- (void)setIdsMutation:(id)a3
{
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_appVersion = a3;
}

- (BOOL)accountMismatch
{
  return self->_accountMismatch;
}

- (void)setAccountMismatch:(BOOL)a3
{
  self->_accountMismatch = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);

  objc_destroyWeak((id *)&self->_idsMutation);
}

- (id)diagnosticsJsonDictionary
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  v4 = [(IdsDeviceMutation *)self accountKeyHash];
  id v5 = [v4 kt_hexString];
  [v3 setObject:v5 forKeyedSubscript:@"accountKeyHash"];

  id v6 = [(IdsDeviceMutation *)self deviceIdHash];
  id v7 = [v6 kt_hexString];
  [v3 setObject:v7 forKeyedSubscript:@"deviceIdHash"];

  unsigned __int8 v8 = [(IdsDeviceMutation *)self clientDataHash];
  unsigned int v9 = [v8 kt_hexString];
  [v3 setObject:v9 forKeyedSubscript:@"clientDataHash"];

  id v10 = +[NSNumber numberWithUnsignedLongLong:[(IdsDeviceMutation *)self appVersion]];
  [v3 setObject:v10 forKeyedSubscript:@"appVersion"];

  if ([(IdsDeviceMutation *)self expiryMs])
  {
    id v11 = +[NSNumber numberWithUnsignedLongLong:[(IdsDeviceMutation *)self expiryMs]];
    [v3 setObject:v11 forKeyedSubscript:@"expiryMs"];

    id v12 = +[NSDate dateWithTimeIntervalSince1970:(double)([(IdsDeviceMutation *)self expiryMs] / 0x3E8)];
    id v13 = [v12 kt_toISO_8601_UTCString];
    [v3 setObject:v13 forKeyedSubscript:@"expiryDateReadable"];
  }

  return v3;
}

@end