@interface IdsDeviceState
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceState)init;
- (NSData)clientDataHash;
- (NSData)deviceIdHash;
- (NSMutableArray)extensions;
- (id)data;
- (id)description;
- (unint64_t)addedMs;
- (unint64_t)appVersion;
- (unint64_t)expiryMs;
- (unint64_t)parsedLength;
- (void)setAddedMs:(unint64_t)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDeviceState

- (IdsDeviceState)init
{
  v5.receiver = self;
  v5.super_class = (Class)IdsDeviceState;
  v2 = [(IdsDeviceState *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(IdsDeviceState *)v2 setExtensions:v3];
  }
  return v2;
}

- (id)data
{
  v3 = +[NSMutableData data];
  v4 = [(IdsDeviceState *)self deviceIdHash];
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (!v5) {
    goto LABEL_8;
  }
  v6 = [(IdsDeviceState *)self clientDataHash];
  unsigned int v7 = [(TLSMessageClass *)self encodeHashValue:v6 buffer:v3];

  if (!v7) {
    goto LABEL_8;
  }
  if ([(TLSMessageClass *)self encodeUint64:[(IdsDeviceState *)self appVersion] buffer:v3]&& [(TLSMessageClass *)self encodeUint64:[(IdsDeviceState *)self addedMs] buffer:v3]&& [(TLSMessageClass *)self encodeUint64:[(IdsDeviceState *)self expiryMs] buffer:v3]&& ([(IdsDeviceState *)self extensions], v8 = objc_claimAutoreleasedReturnValue(), unsigned int v9 = [(TLSMessageClass *)self encodeExtensions:v8 buffer:v3], v8, v9))
  {
    id v10 = v3;
  }
  else
  {
LABEL_8:
    id v10 = 0;
  }

  return v10;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  unsigned int v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  id v34 = 0;
  id v11 = [v10 parseHashValue:v6 end:v9 result:&v34];
  id v12 = v34;
  if (v11)
  {
    [v10 setDeviceIdHash:v12];
    id v33 = 0;
    id v13 = [v10 parseHashValue:v11 end:v9 result:&v33];
    id v14 = v33;
    if (v13)
    {
      [v10 setClientDataHash:v14];
      uint64_t v32 = 0;
      id v15 = [v10 parseUint64:v13 end:v9 result:&v32];
      if (v15)
      {
        id v16 = v15;
        [v10 setAppVersion:v32];
        uint64_t v31 = 0;
        id v17 = [v10 parseUint64:v16 end:v9 result:&v31];
        if (v17)
        {
          id v18 = v17;
          [v10 setAddedMs:v31];
          uint64_t v30 = 0;
          id v19 = [v10 parseUint64:v18 end:v9 result:&v30];
          if (v19)
          {
            id v20 = v19;
            [v10 setExpiryMs:v30];
            id v29 = 0;
            v21 = [v10 parseExtensions:v20 end:v9 result:&v29];
            id v22 = v29;
            if (v21)
            {
              v23 = +[NSMutableArray arrayWithArray:v22];
              [v10 setExtensions:v23];

              [v10 setParsedLength:v21 - (unsigned char *)[objc_retainAutorelease(v7) bytes]];
              id v24 = v10;
            }
            else if (a4)
            {
              +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-359 description:@"failed to parse extensions from SingleDataRecord"];
              id v24 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v24 = 0;
            }

            goto LABEL_25;
          }
          if (a4)
          {
            uint64_t v25 = kTransparencyErrorDecode;
            CFStringRef v26 = @"failed to parse expiry timestamp from DeviceState";
            uint64_t v27 = -358;
            goto LABEL_19;
          }
LABEL_20:
          id v24 = 0;
          goto LABEL_25;
        }
        if (!a4) {
          goto LABEL_20;
        }
        uint64_t v25 = kTransparencyErrorDecode;
        CFStringRef v26 = @"failed to parse add timestamp from DeviceState";
        uint64_t v27 = -357;
      }
      else
      {
        if (!a4) {
          goto LABEL_20;
        }
        uint64_t v25 = kTransparencyErrorDecode;
        CFStringRef v26 = @"failed to parse app version from DeviceState";
        uint64_t v27 = -356;
      }
    }
    else
    {
      if (!a4) {
        goto LABEL_20;
      }
      uint64_t v25 = kTransparencyErrorDecode;
      CFStringRef v26 = @"failed to parse client data from DeviceState";
      uint64_t v27 = -355;
    }
LABEL_19:
    +[TransparencyError errorWithDomain:v25 code:v27 description:v26];
    id v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

    goto LABEL_26;
  }
  if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-354 description:@"failed to parse device ID from DeviceState"];
    id v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = 0;
  }
LABEL_26:

  return v24;
}

- (id)description
{
  v3 = [(NSData *)self->_deviceIdHash kt_hexString];
  v4 = [(NSData *)self->_clientDataHash kt_hexString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"deviceIdHash:%@; clientDataHash:%@; applicationVersion:%llu; addedMs:%llu; expiryMs:%llu",
    v3,
    v4,
    self->_appVersion,
    self->_addedMs,
  id v5 = self->_expiryMs);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IdsDeviceState *)a3;
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
      id v6 = [(IdsDeviceState *)self data];
      id v7 = [(IdsDeviceState *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
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

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensions:(id)a3
{
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
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);

  objc_storeStrong((id *)&self->_deviceIdHash, 0);
}

@end