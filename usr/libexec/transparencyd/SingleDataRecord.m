@interface SingleDataRecord
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)accountMismatch;
- (BOOL)isEqual:(id)a3;
- (NSData)clientDataHash;
- (NSMutableArray)extensions;
- (SingleDataRecord)init;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)addedMs;
- (unint64_t)appVersion;
- (unint64_t)escrowExpiryMs;
- (unint64_t)expiryMs;
- (unint64_t)markedForDeletionMs;
- (unint64_t)parsedLength;
- (void)setAccountMismatch:(BOOL)a3;
- (void)setAddedMs:(unint64_t)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setEscrowExpiryMs:(unint64_t)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setExtensions:(id)a3;
- (void)setMarkedForDeletionMs:(unint64_t)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation SingleDataRecord

- (SingleDataRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)SingleDataRecord;
  v2 = [(SingleDataRecord *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)data
{
  uint64_t v3 = +[NSMutableData data];
  if (![(TLSMessageClass *)self encodeUint64:[(SingleDataRecord *)self appVersion] buffer:v3])goto LABEL_10; {
  v4 = [(SingleDataRecord *)self clientDataHash];
  }
  unsigned int v5 = [(TLSMessageClass *)self encodeHashValue:v4 buffer:v3];

  if (!v5) {
    goto LABEL_10;
  }
  if ([(TLSMessageClass *)self encodeUint64:[(SingleDataRecord *)self markedForDeletionMs] buffer:v3]&& [(TLSMessageClass *)self encodeUint64:[(SingleDataRecord *)self addedMs] buffer:v3]&& [(TLSMessageClass *)self encodeBool:[(SingleDataRecord *)self accountMismatch] buffer:v3]&& [(TLSMessageClass *)self encodeUint64:[(SingleDataRecord *)self expiryMs] buffer:v3]
    && [(TLSMessageClass *)self encodeUint64:[(SingleDataRecord *)self escrowExpiryMs] buffer:v3]&& ([(SingleDataRecord *)self extensions], objc_super v6 = objc_claimAutoreleasedReturnValue(), v7 = [(TLSMessageClass *)self encodeExtensions:v6 buffer:v3], v6, v7))
  {
    v8 = +[NSData dataWithData:v3];
  }
  else
  {
LABEL_10:
    v8 = 0;
  }

  return v8;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  v10 = objc_alloc_init(SingleDataRecord);
  uint64_t v40 = 0;
  v11 = [(TLSMessageClass *)v10 parseUint64:v6 end:v9 result:&v40];
  if (v11)
  {
    v12 = v11;
    [(SingleDataRecord *)v10 setAppVersion:v40];
    id v39 = 0;
    v13 = [(TLSMessageClass *)v10 parseHashValue:v12 end:v9 result:&v39];
    id v14 = v39;
    if (v13)
    {
      [(SingleDataRecord *)v10 setClientDataHash:v14];
      uint64_t v38 = 0;
      v15 = [(TLSMessageClass *)v10 parseUint64:v13 end:v9 result:&v38];
      if (v15)
      {
        v16 = v15;
        [(SingleDataRecord *)v10 setMarkedForDeletionMs:v38];
        uint64_t v37 = 0;
        v17 = [(TLSMessageClass *)v10 parseUint64:v16 end:v9 result:&v37];
        if (v17)
        {
          v18 = v17;
          [(SingleDataRecord *)v10 setAddedMs:v37];
          unsigned __int8 v36 = 0;
          v19 = [(TLSMessageClass *)v10 parseBool:v18 end:v9 result:&v36];
          if (v19)
          {
            v20 = v19;
            [(SingleDataRecord *)v10 setAccountMismatch:v36];
            uint64_t v35 = 0;
            v21 = [(TLSMessageClass *)v10 parseUint64:v20 end:v9 result:&v35];
            if (v21)
            {
              v22 = v21;
              [(SingleDataRecord *)v10 setExpiryMs:v35];
              uint64_t v34 = 0;
              v23 = [(TLSMessageClass *)v10 parseUint64:v22 end:v9 result:&v34];
              if (v23)
              {
                v24 = v23;
                [(SingleDataRecord *)v10 setEscrowExpiryMs:v34];
                id v33 = 0;
                v25 = [(TLSMessageClass *)v10 parseExtensions:v24 end:v9 result:&v33];
                id v26 = v33;
                if (v25)
                {
                  v27 = +[NSMutableArray arrayWithArray:v26];
                  [(SingleDataRecord *)v10 setExtensions:v27];

                  -[SingleDataRecord setParsedLength:](v10, "setParsedLength:", v25 - (unsigned char *)[objc_retainAutorelease(v7) bytes]);
                  v28 = v10;
                }
                else if (a4)
                {
                  +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-256 description:@"failed to parse extensions from SingleDataRecord"];
                  v28 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v28 = 0;
                }

                goto LABEL_27;
              }
              if (a4)
              {
                uint64_t v29 = kTransparencyErrorDecode;
                CFStringRef v30 = @"failed to parse escrow expiry timestamp from SingleDataRecord";
                uint64_t v31 = -255;
                goto LABEL_25;
              }
LABEL_26:
              v28 = 0;
              goto LABEL_27;
            }
            if (!a4) {
              goto LABEL_26;
            }
            uint64_t v29 = kTransparencyErrorDecode;
            CFStringRef v30 = @"failed to parse expiry timestamp from SingleDataRecord";
            uint64_t v31 = -254;
          }
          else
          {
            if (!a4) {
              goto LABEL_26;
            }
            uint64_t v29 = kTransparencyErrorDecode;
            CFStringRef v30 = @"failed to parse account mismatch from SingleDataRecord";
            uint64_t v31 = -253;
          }
        }
        else
        {
          if (!a4) {
            goto LABEL_26;
          }
          uint64_t v29 = kTransparencyErrorDecode;
          CFStringRef v30 = @"failed to parse add timestamp from SingleDataRecord";
          uint64_t v31 = -252;
        }
      }
      else
      {
        if (!a4) {
          goto LABEL_26;
        }
        uint64_t v29 = kTransparencyErrorDecode;
        CFStringRef v30 = @"failed to parse mark timestamp from SingleDataRecord";
        uint64_t v31 = -251;
      }
    }
    else
    {
      if (!a4) {
        goto LABEL_26;
      }
      uint64_t v29 = kTransparencyErrorDecode;
      CFStringRef v30 = @"failed to parse client data from SingleDataRecord";
      uint64_t v31 = -250;
    }
LABEL_25:
    +[TransparencyError errorWithDomain:v29 code:v31 description:v30];
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  if (a4)
  {
    +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-249 description:@"failed to parse app version from SingleDataRecord"];
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_28:

  return v28;
}

- (id)debugDescription
{
  unint64_t appVersion = self->_appVersion;
  v4 = [(NSData *)self->_clientDataHash kt_hexString];
  id v5 = +[NSString stringWithFormat:@"{\tapplicationVersion:%llu\n\tclientDataHash:%@\n\taccountMismatch:%d\n\tmarkedMs:%llu\n\taddedMs:%llu\n\texpiryMs:%llu\n\tescrowExpiryMs:%llu\n}", appVersion, v4, self->_accountMismatch, self->_markedForDeletionMs, self->_addedMs, self->_expiryMs, self->_escrowExpiryMs];

  return v5;
}

- (id)description
{
  unint64_t appVersion = self->_appVersion;
  v4 = [(NSData *)self->_clientDataHash kt_hexString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"applicationVersion:%llu; clientDataHash:%@; accountMismatch:%d; markedMs:%llu; addedMs:%llu; expiryMs:%llu; escrowExpiryMs:%llu;",
    appVersion,
    v4,
    self->_accountMismatch,
    self->_markedForDeletionMs,
    self->_addedMs,
    self->_expiryMs,
  id v5 = self->_escrowExpiryMs);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SingleDataRecord *)a3;
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
      id v6 = [(SingleDataRecord *)self data];
      id v7 = [(SingleDataRecord *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_unint64_t appVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (unint64_t)markedForDeletionMs
{
  return self->_markedForDeletionMs;
}

- (void)setMarkedForDeletionMs:(unint64_t)a3
{
  self->_markedForDeletionMs = a3;
}

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
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

- (unint64_t)escrowExpiryMs
{
  return self->_escrowExpiryMs;
}

- (void)setEscrowExpiryMs:(unint64_t)a3
{
  self->_escrowExpiryMs = a3;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
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
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedLongLong:[(SingleDataRecord *)self appVersion]];
  [v3 setObject:v4 forKeyedSubscript:@"appVersion"];

  id v5 = [(SingleDataRecord *)self clientDataHash];
  id v6 = [v5 kt_hexString];
  [v3 setObject:v6 forKeyedSubscript:@"clientDataHash"];

  id v7 = +[NSNumber numberWithUnsignedLongLong:[(SingleDataRecord *)self addedMs]];
  [v3 setObject:v7 forKeyedSubscript:@"addedMs"];

  unsigned __int8 v8 = +[NSDate dateWithTimeIntervalSince1970:(double)([(SingleDataRecord *)self addedMs] / 0x3E8)];
  v9 = [v8 kt_toISO_8601_UTCString];
  [v3 setObject:v9 forKeyedSubscript:@"addedDateReadable"];

  if ([(SingleDataRecord *)self markedForDeletionMs])
  {
    v10 = +[NSNumber numberWithUnsignedLongLong:[(SingleDataRecord *)self markedForDeletionMs]];
    [v3 setObject:v10 forKeyedSubscript:@"markedForDeltionMs"];

    v11 = +[NSDate dateWithTimeIntervalSince1970:(double)([(SingleDataRecord *)self markedForDeletionMs] / 0x3E8)];
    v12 = [v11 kt_toISO_8601_UTCString];
    [v3 setObject:v12 forKeyedSubscript:@"markedDateReadable"];
  }
  if ([(SingleDataRecord *)self expiryMs])
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:[(SingleDataRecord *)self expiryMs]];
    [v3 setObject:v13 forKeyedSubscript:@"expiryMs"];

    id v14 = +[NSDate dateWithTimeIntervalSince1970:(double)([(SingleDataRecord *)self expiryMs] / 0x3E8)];
    v15 = [v14 kt_toISO_8601_UTCString];
    [v3 setObject:v15 forKeyedSubscript:@"expiryDateReadable"];
  }
  if ([(SingleDataRecord *)self escrowExpiryMs])
  {
    v16 = +[NSNumber numberWithUnsignedLongLong:[(SingleDataRecord *)self escrowExpiryMs]];
    [v3 setObject:v16 forKeyedSubscript:@"escrowExpiryMs"];

    v17 = +[NSDate dateWithTimeIntervalSince1970:(double)([(SingleDataRecord *)self escrowExpiryMs] / 0x3E8)];
    v18 = [v17 kt_toISO_8601_UTCString];
    [v3 setObject:v18 forKeyedSubscript:@"escrowExpiryDateReadable"];
  }

  return v3;
}

@end