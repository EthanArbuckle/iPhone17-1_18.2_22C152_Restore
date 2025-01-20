@interface OTInheritanceKey
+ (BOOL)supportsSecureCoding;
+ (id)base32:(const char *)a3 len:(unint64_t)a4;
+ (id)parseBase32:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5;
+ (id)printableWithData:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5;
+ (id)unbase32:(const char *)a3 len:(unint64_t)a4;
- (BOOL)generateWrappingWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOTInheritanceKey:(id)a3;
- (BOOL)isKeyEquals:(id)a3;
- (BOOL)isRecoveryKeyEqual:(id)a3;
- (BOOL)unwrapWithError:(id *)a3;
- (BOOL)wrapWithWrappingKey:(id)a3 error:(id *)a4;
- (NSData)claimTokenData;
- (NSData)recoveryKeyData;
- (NSData)wrappedKeyData;
- (NSData)wrappingKeyData;
- (NSString)claimTokenString;
- (NSString)wrappedKeyString;
- (NSString)wrappingKeyString;
- (NSUUID)uuid;
- (OTInheritanceKey)initWithCoder:(id)a3;
- (OTInheritanceKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithUUID:(id)a3 error:(id *)a4;
- (OTInheritanceKey)initWithUUID:(id)a3 oldIK:(id)a4 error:(id *)a5;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 claimTokenData:(id)a5 uuid:(id)a6 error:(id *)a7;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyString:(id)a4 uuid:(id)a5 error:(id *)a6;
- (OTInheritanceKey)initWithWrappedKeyString:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OTInheritanceKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKeyData, 0);
  objc_storeStrong((id *)&self->_claimTokenString, 0);
  objc_storeStrong((id *)&self->_claimTokenData, 0);
  objc_storeStrong((id *)&self->_wrappedKeyString, 0);
  objc_storeStrong((id *)&self->_wrappedKeyData, 0);
  objc_storeStrong((id *)&self->_wrappingKeyString, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSData)recoveryKeyData
{
  return self->_recoveryKeyData;
}

- (NSString)claimTokenString
{
  return self->_claimTokenString;
}

- (NSData)claimTokenData
{
  return self->_claimTokenData;
}

- (NSString)wrappedKeyString
{
  return self->_wrappedKeyString;
}

- (NSData)wrappedKeyData
{
  return self->_wrappedKeyData;
}

- (NSString)wrappingKeyString
{
  return self->_wrappingKeyString;
}

- (NSData)wrappingKeyData
{
  return self->_wrappingKeyData;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_wrappingKeyData forKey:@"wrappingKeyData"];
  [v5 encodeObject:self->_wrappedKeyData forKey:@"wrappedKeyData"];
  [v5 encodeObject:self->_wrappingKeyString forKey:@"wrappingKeyString"];
  [v5 encodeObject:self->_wrappedKeyString forKey:@"wrappedKeyString"];
  [v5 encodeObject:self->_claimTokenData forKey:@"claimTokenData"];
  [v5 encodeObject:self->_claimTokenString forKey:@"claimTokenString"];
  [v5 encodeObject:self->_recoveryKeyData forKey:@"recoveryKeyData"];
}

- (OTInheritanceKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)OTInheritanceKey;
  id v5 = [(OTInheritanceKey *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKeyData"];
    wrappingKeyData = v5->_wrappingKeyData;
    v5->_wrappingKeyData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKeyData"];
    wrappedKeyData = v5->_wrappedKeyData;
    v5->_wrappedKeyData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKeyString"];
    wrappingKeyString = v5->_wrappingKeyString;
    v5->_wrappingKeyString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKeyString"];
    wrappedKeyString = v5->_wrappedKeyString;
    v5->_wrappedKeyString = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimTokenData"];
    claimTokenData = v5->_claimTokenData;
    v5->_claimTokenData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimTokenString"];
    claimTokenString = v5->_claimTokenString;
    v5->_claimTokenString = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryKeyData"];
    recoveryKeyData = v5->_recoveryKeyData;
    v5->_recoveryKeyData = (NSData *)v20;
  }
  return v5;
}

- (id)dictionary
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v19[0] = @"uuid";
  uint64_t v18 = [(OTInheritanceKey *)self uuid];
  v17 = [v18 description];
  v20[0] = v17;
  v19[1] = @"wrappingKeyData";
  uint64_t v16 = [(OTInheritanceKey *)self wrappingKeyData];
  v3 = [v16 base64EncodedStringWithOptions:0];
  v20[1] = v3;
  v19[2] = @"wrappingKeyString";
  id v4 = [(OTInheritanceKey *)self wrappingKeyString];
  v20[2] = v4;
  v19[3] = @"wrappedKeyData";
  id v5 = [(OTInheritanceKey *)self wrappedKeyData];
  uint64_t v6 = [v5 base64EncodedStringWithOptions:0];
  v20[3] = v6;
  v19[4] = @"wrappedKeyString";
  v7 = [(OTInheritanceKey *)self wrappedKeyString];
  v20[4] = v7;
  v19[5] = @"recoveryKeyData";
  uint64_t v8 = [(OTInheritanceKey *)self recoveryKeyData];
  v9 = [v8 base64EncodedStringWithOptions:0];
  v20[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(OTInheritanceKey *)self claimTokenData];
  v13 = [v12 base64EncodedStringWithOptions:0];
  [v11 setObject:v13 forKeyedSubscript:@"claimTokenData"];

  uint64_t v14 = [(OTInheritanceKey *)self claimTokenString];
  [v11 setObject:v14 forKeyedSubscript:@"claimTokenString"];

  return v11;
}

- (BOOL)isKeyEquals:(id)a3
{
  id v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    id v5 = [(OTInheritanceKey *)self wrappingKeyData];
    uint64_t v6 = [(OTInheritanceKey *)v4 wrappingKeyData];
    if ([v5 isEqualToData:v6])
    {
      v7 = [(OTInheritanceKey *)self wrappingKeyString];
      uint64_t v8 = [(OTInheritanceKey *)v4 wrappingKeyString];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(OTInheritanceKey *)self wrappedKeyData];
        uint64_t v10 = [(OTInheritanceKey *)v4 wrappedKeyData];
        if ([v9 isEqualToData:v10])
        {
          v11 = [(OTInheritanceKey *)self wrappedKeyString];
          uint64_t v12 = [(OTInheritanceKey *)v4 wrappedKeyString];
          if ([v11 isEqualToString:v12])
          {
            objc_super v23 = v11;
            v13 = [(OTInheritanceKey *)self claimTokenData];
            [(OTInheritanceKey *)v4 claimTokenData];
            v22 = v24 = v13;
            if (objc_msgSend(v13, "isEqualToData:"))
            {
              uint64_t v14 = [(OTInheritanceKey *)self claimTokenString];
              uint64_t v20 = [(OTInheritanceKey *)v4 claimTokenString];
              v21 = v14;
              int v15 = objc_msgSend(v14, "isEqualToString:");
              v11 = v23;
              if (v15)
              {
                v19 = [(OTInheritanceKey *)self recoveryKeyData];
                uint64_t v18 = [(OTInheritanceKey *)v4 recoveryKeyData];
                char v16 = [v19 isEqualToData:v18];
              }
              else
              {
                char v16 = 0;
              }
            }
            else
            {
              char v16 = 0;
              v11 = v23;
            }
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  return v16;
}

- (BOOL)isRecoveryKeyEqual:(id)a3
{
  id v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    id v5 = [(OTInheritanceKey *)self uuid];
    uint64_t v6 = [(OTInheritanceKey *)v4 uuid];
    if ([v5 isEqual:v6])
    {
      v7 = [(OTInheritanceKey *)self wrappingKeyData];
      uint64_t v8 = [(OTInheritanceKey *)v4 wrappingKeyData];
      if ([v7 isEqualToData:v8])
      {
        v9 = [(OTInheritanceKey *)self wrappingKeyString];
        uint64_t v10 = [(OTInheritanceKey *)v4 wrappingKeyString];
        if ([v9 isEqualToString:v10])
        {
          v11 = [(OTInheritanceKey *)self wrappedKeyData];
          uint64_t v12 = [(OTInheritanceKey *)v4 wrappedKeyData];
          if ([v11 isEqualToData:v12])
          {
            v21 = v11;
            uint64_t v13 = [(OTInheritanceKey *)self wrappedKeyString];
            uint64_t v14 = [(OTInheritanceKey *)v4 wrappedKeyString];
            v22 = (void *)v13;
            int v15 = (void *)v13;
            char v16 = (void *)v14;
            if ([v15 isEqualToString:v14])
            {
              uint64_t v20 = [(OTInheritanceKey *)self recoveryKeyData];
              v19 = [(OTInheritanceKey *)v4 recoveryKeyData];
              char v17 = [v20 isEqualToData:v19];
            }
            else
            {
              char v17 = 0;
            }

            v11 = v21;
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(OTInheritanceKey *)self isEqualToOTInheritanceKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToOTInheritanceKey:(id)a3
{
  id v4 = (OTInheritanceKey *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    BOOL v5 = [(OTInheritanceKey *)self uuid];
    uint64_t v6 = [(OTInheritanceKey *)v4 uuid];
    if ([v5 isEqual:v6])
    {
      v7 = [(OTInheritanceKey *)self wrappingKeyData];
      uint64_t v8 = [(OTInheritanceKey *)v4 wrappingKeyData];
      if ([v7 isEqualToData:v8])
      {
        v9 = [(OTInheritanceKey *)self wrappingKeyString];
        uint64_t v10 = [(OTInheritanceKey *)v4 wrappingKeyString];
        if ([v9 isEqualToString:v10])
        {
          v11 = [(OTInheritanceKey *)self wrappedKeyData];
          uint64_t v12 = [(OTInheritanceKey *)v4 wrappedKeyData];
          if ([v11 isEqualToData:v12])
          {
            v25 = v11;
            uint64_t v13 = [(OTInheritanceKey *)self wrappedKeyString];
            v26 = [(OTInheritanceKey *)v4 wrappedKeyString];
            v27 = v13;
            if (objc_msgSend(v13, "isEqualToString:"))
            {
              uint64_t v14 = [(OTInheritanceKey *)self claimTokenData];
              objc_super v23 = [(OTInheritanceKey *)v4 claimTokenData];
              v24 = v14;
              if (objc_msgSend(v14, "isEqualToData:"))
              {
                int v15 = [(OTInheritanceKey *)self claimTokenString];
                v21 = [(OTInheritanceKey *)v4 claimTokenString];
                v22 = v15;
                int v16 = objc_msgSend(v15, "isEqualToString:");
                v11 = v25;
                if (v16)
                {
                  uint64_t v20 = [(OTInheritanceKey *)self recoveryKeyData];
                  v19 = [(OTInheritanceKey *)v4 recoveryKeyData];
                  char v17 = [v20 isEqualToData:v19];
                }
                else
                {
                  char v17 = 0;
                }
              }
              else
              {
                char v17 = 0;
                v11 = v25;
              }
            }
            else
            {
              char v17 = 0;
              v11 = v25;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  return v17;
}

- (OTInheritanceKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)OTInheritanceKey;
  uint64_t v14 = [(OTInheritanceKey *)&v27 init];
  int v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_claimTokenData, a4);
    uint64_t v16 = +[OTInheritanceKey printableWithData:v15->_claimTokenData checksumSize:4 error:a6];
    claimTokenString = v15->_claimTokenString;
    v15->_claimTokenString = (NSString *)v16;

    if (!v15->_claimTokenString) {
      goto LABEL_8;
    }
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    bytes[2] = v18;
    bytes[3] = v18;
    bytes[0] = v18;
    bytes[1] = v18;
    uint64_t v19 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x40uLL, bytes);
    if (v19)
    {
      uint64_t v20 = v19;
      memset_s(bytes, 0x40uLL, 0, 0x40uLL);
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        v22 = objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v20);
        *a6 = [v21 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v22];
      }
      goto LABEL_8;
    }
    uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:64];
    recoveryKeyData = v15->_recoveryKeyData;
    v15->_recoveryKeyData = (NSData *)v23;

    memset_s(bytes, 0x40uLL, 0, 0x40uLL);
    if (![(OTInheritanceKey *)v15 wrapWithWrappingKey:v13 error:a6])
    {
LABEL_8:
      v25 = 0;
      goto LABEL_9;
    }
  }
  v25 = v15;
LABEL_9:

  return v25;
}

- (OTInheritanceKey)initWithUUID:(id)a3 oldIK:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)OTInheritanceKey;
  id v11 = [(OTInheritanceKey *)&v30 init];
  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v10 uuid];
  int v13 = [v9 isEqual:v12];

  if (!v13)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    uint64_t v15 = [v10 wrappingKeyData];
    wrappingKeyData = v11->_wrappingKeyData;
    v11->_wrappingKeyData = (NSData *)v15;

    uint64_t v17 = [v10 wrappingKeyString];
    wrappingKeyString = v11->_wrappingKeyString;
    v11->_wrappingKeyString = (NSString *)v17;

    uint64_t v19 = [v10 wrappedKeyData];
    wrappedKeyData = v11->_wrappedKeyData;
    v11->_wrappedKeyData = (NSData *)v19;

    uint64_t v21 = [v10 wrappedKeyString];
    wrappedKeyString = v11->_wrappedKeyString;
    v11->_wrappedKeyString = (NSString *)v21;

    uint64_t v23 = [v10 claimTokenData];
    claimTokenData = v11->_claimTokenData;
    v11->_claimTokenData = (NSData *)v23;

    uint64_t v25 = [v10 claimTokenString];
    claimTokenString = v11->_claimTokenString;
    v11->_claimTokenString = (NSString *)v25;

    uint64_t v27 = [v10 recoveryKeyData];
    recoveryKeyData = v11->_recoveryKeyData;
    v11->_recoveryKeyData = (NSData *)v27;

LABEL_6:
    uint64_t v14 = v11;
    goto LABEL_7;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:11 description:@"recreate needs a different UUID"];
    uint64_t v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_7:

  return v14;
}

- (OTInheritanceKey)initWithWrappedKeyString:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = +[OTInheritanceKey parseBase32:a3 checksumSize:3 error:a6];
  if (v12)
  {
    self = [(OTInheritanceKey *)self initWithWrappedKeyData:v12 wrappingKeyData:v10 uuid:v11 error:a6];
    int v13 = self;
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyString:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = +[OTInheritanceKey parseBase32:a4 checksumSize:3 error:a6];
  if (v12)
  {
    self = [(OTInheritanceKey *)self initWithWrappedKeyData:v10 wrappingKeyData:v12 uuid:v11 error:a6];
    int v13 = self;
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 uuid:(id)a5 error:(id *)a6
{
  return [(OTInheritanceKey *)self initWithWrappedKeyData:a3 wrappingKeyData:a4 claimTokenData:0 uuid:a5 error:a6];
}

- (OTInheritanceKey)initWithWrappedKeyData:(id)a3 wrappingKeyData:(id)a4 claimTokenData:(id)a5 uuid:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)OTInheritanceKey;
  uint64_t v17 = [(OTInheritanceKey *)&v28 init];
  long long v18 = v17;
  if (!v17) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v17->_uuid, a6);
  objc_storeStrong((id *)&v18->_wrappedKeyData, a3);
  objc_storeStrong((id *)&v18->_wrappingKeyData, a4);
  if (![(OTInheritanceKey *)v18 unwrapWithError:a7]) {
    goto LABEL_7;
  }
  uint64_t v19 = +[OTInheritanceKey printableWithData:v18->_wrappingKeyData checksumSize:3 error:a7];
  wrappingKeyString = v18->_wrappingKeyString;
  v18->_wrappingKeyString = (NSString *)v19;

  if (!v18->_wrappingKeyString) {
    goto LABEL_7;
  }
  uint64_t v21 = +[OTInheritanceKey printableWithData:v18->_wrappedKeyData checksumSize:3 error:a7];
  wrappedKeyString = v18->_wrappedKeyString;
  v18->_wrappedKeyString = (NSString *)v21;

  if (!v18->_wrappedKeyString) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v18->_claimTokenData, a5);
  if (!v15)
  {
    claimTokenString = v18->_claimTokenString;
    v18->_claimTokenString = 0;

    goto LABEL_9;
  }
  uint64_t v23 = +[OTInheritanceKey printableWithData:v18->_claimTokenData checksumSize:4 error:a7];
  v24 = v18->_claimTokenString;
  v18->_claimTokenString = (NSString *)v23;

  if (v18->_claimTokenString)
  {
LABEL_9:
    uint64_t v25 = v18;
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v25 = 0;
LABEL_10:

  return v25;
}

- (BOOL)unwrapWithError:(id *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if ([(NSData *)self->_wrappingKeyData length] == 32)
  {
    if ([(NSData *)self->_wrappedKeyData length] == 72)
    {
      [(NSData *)self->_wrappedKeyData length];
      uint64_t v5 = ccwrap_unwrapped_size();
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", v5, v5);
      unint64_t v7 = *(void *)ccaes_ecb_decrypt_mode() + 15;
      unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFF0;
      if (v7 >= 0x10)
      {
        id v9 = (void *)((char *)v26 - (v7 & 0xFFFFFFFFFFFFFFF0));
        do
        {
          void *v9 = 0xAAAAAAAAAAAAAAAALL;
          v9[1] = 0xAAAAAAAAAAAAAAAALL;
          v9 += 2;
          v8 -= 16;
        }
        while (v8);
      }
      [(NSData *)self->_wrappingKeyData length];
      [(NSData *)self->_wrappingKeyData bytes];
      uint64_t v10 = ccecb_init();
      if (v10)
      {
        if (a3)
        {
          id v11 = (void *)MEMORY[0x1E4F28C58];
          recoveryKeyData = objc_msgSend(NSString, "stringWithFormat:", @"ccecb_init failed: %d", v10);
          id v13 = v11;
          uint64_t v14 = 9;
LABEL_18:
          [v13 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v14 description:recoveryKeyData];
          BOOL v20 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        [(NSData *)self->_wrappedKeyData length];
        [(NSData *)self->_wrappedKeyData bytes];
        id v21 = v6;
        [v21 mutableBytes];
        uint64_t v22 = ccwrap_auth_decrypt();
        cc_clear();
        if (!v22)
        {
          v24 = (NSData *)v21;
          recoveryKeyData = self->_recoveryKeyData;
          self->_recoveryKeyData = v24;
          BOOL v20 = 1;
          goto LABEL_21;
        }
        if (a3)
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
          recoveryKeyData = objc_msgSend(NSString, "stringWithFormat:", @"ccwrap_auth_decrypt: %d", v22);
          id v13 = v23;
          uint64_t v14 = 5;
          goto LABEL_18;
        }
      }
      BOOL v20 = 0;
LABEL_22:

      return v20;
    }
    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"wrong wrapped key length: %u", -[NSData length](self->_wrappedKeyData, "length"));
      uint64_t v17 = v19;
      uint64_t v18 = 10;
      goto LABEL_13;
    }
  }
  else if (a3)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"wrong wrapping key length: %u", -[NSData length](self->_wrappingKeyData, "length"));
    uint64_t v17 = v15;
    uint64_t v18 = 8;
LABEL_13:
    *a3 = [v17 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v18 description:v16];
  }
  return 0;
}

- (OTInheritanceKey)initWithUUID:(id)a3 error:(id *)a4
{
  bytes[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)OTInheritanceKey;
  unint64_t v8 = [(OTInheritanceKey *)&v28 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    bytes[0] = 0xAAAAAAAAAAAAAAAALL;
    bytes[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v10 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    uint64_t v11 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x10uLL, bytes);
    if (v11)
    {
      uint64_t v12 = v11;
      memset_s(bytes, 0x10uLL, 0, 0x10uLL);
      if (a4)
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v12);
        *a4 = [v13 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v14];
      }
      goto LABEL_11;
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:16];
    claimTokenData = v9->_claimTokenData;
    v9->_claimTokenData = (NSData *)v15;

    memset_s(bytes, 0x10uLL, 0, 0x10uLL);
    uint64_t v17 = +[OTInheritanceKey printableWithData:v9->_claimTokenData checksumSize:4 error:a4];
    claimTokenString = v9->_claimTokenString;
    v9->_claimTokenString = (NSString *)v17;

    if (!v9->_claimTokenString) {
      goto LABEL_11;
    }
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s[2] = v19;
    __s[3] = v19;
    __s[0] = v19;
    __s[1] = v19;
    uint64_t v20 = SecRandomCopyBytes(v10, 0x40uLL, __s);
    if (v20)
    {
      uint64_t v21 = v20;
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"SecRandomCopyBytes: %d", v21);
        *a4 = [v22 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:7 description:v23];
      }
      goto LABEL_11;
    }
    uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:64];
    recoveryKeyData = v9->_recoveryKeyData;
    v9->_recoveryKeyData = (NSData *)v24;

    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (![(OTInheritanceKey *)v9 generateWrappingWithError:a4])
    {
LABEL_11:
      v26 = 0;
      goto LABEL_12;
    }
  }
  v26 = v9;
LABEL_12:

  return v26;
}

- (BOOL)wrapWithWrappingKey:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSData *)self->_recoveryKeyData length];
  uint64_t v7 = ccwrap_wrapped_size();
  unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", v7, v7, v27);
  unint64_t v9 = *(void *)ccaes_ecb_encrypt_mode() + 15;
  unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFF0;
  if (v9 >= 0x10)
  {
    uint64_t v11 = (uint64_t *)((char *)&v26 - (v9 & 0xFFFFFFFFFFFFFFF0));
    do
    {
      void *v11 = 0xAAAAAAAAAAAAAAAALL;
      v11[1] = 0xAAAAAAAAAAAAAAAALL;
      v11 += 2;
      v10 -= 16;
    }
    while (v10);
  }
  [v6 length];
  id v12 = v6;
  [v12 bytes];
  uint64_t v13 = ccecb_init();
  if (v13)
  {
    if (a4)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"ccecb_init failed: %d", v13);
      id v16 = v14;
      uint64_t v17 = 9;
LABEL_10:
      *a4 = [v16 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v17 description:v15];

LABEL_11:
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    [(NSData *)self->_recoveryKeyData length];
    [(NSData *)self->_recoveryKeyData bytes];
    id v18 = v8;
    [v18 mutableBytes];
    uint64_t v19 = ccwrap_auth_encrypt();
    cc_clear();
    if (!v19)
    {
      objc_storeStrong((id *)&self->_wrappingKeyData, v12);
      uint64_t v22 = +[OTInheritanceKey printableWithData:self->_wrappingKeyData checksumSize:3 error:a4];
      wrappingKeyString = self->_wrappingKeyString;
      self->_wrappingKeyString = v22;

      if (self->_wrappingKeyString)
      {
        objc_storeStrong((id *)&self->_wrappedKeyData, v18);
        uint64_t v24 = +[OTInheritanceKey printableWithData:self->_wrappedKeyData checksumSize:3 error:a4];
        wrappedKeyString = self->_wrappedKeyString;
        self->_wrappedKeyString = v24;

        LOBYTE(a4) = self->_wrappedKeyString != 0;
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (a4)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"ccwrap_auth_encrypt: %d", v19);
      id v16 = v20;
      uint64_t v17 = 4;
      goto LABEL_10;
    }
  }
LABEL_12:

  return (char)a4;
}

- (BOOL)generateWrappingWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))ccrng();
  uint64_t v7 = ccrng();
  uint64_t v8 = [v5 length];
  id v9 = v5;
  v6(v7, v8, [v9 mutableBytes]);
  LOBYTE(a3) = [(OTInheritanceKey *)self wrapWithWrappingKey:v9 error:a3];

  return (char)a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parseBase32:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EED4A680];
  unint64_t v6 = [v5 length];
  uint64_t v7 = [MEMORY[0x1E4F1CA58] dataWithLength:0];
  id v31 = v5;
  uint64_t v8 = [v31 UTF8String];
  if (v6)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    unint64_t v11 = v6;
    while (1)
    {
      unint64_t v12 = v11 - 8;
      uint64_t v13 = v11 >= 8 ? 8 : v11;
      uint64_t v14 = +[OTInheritanceKey unbase32:v9 + v10 len:v13];
      if (!v14) {
        break;
      }
      uint64_t v15 = (void *)v14;
      [v7 appendData:v14];

      v10 += 8;
      unint64_t v11 = v12;
      if (v10 >= v6) {
        goto LABEL_8;
      }
    }
    id v16 = a5;
    if (!a5) {
      goto LABEL_21;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot parse %.*s", v13, v9 + v10);
    uint64_t v24 = v22;
    uint64_t v25 = 1;
    goto LABEL_20;
  }
LABEL_8:
  if ([v7 length] < a4)
  {
    id v16 = a5;
    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      objc_msgSend(NSString, "stringWithFormat:", @"Length (%zu) shorter than checksumsize (%zu)", objc_msgSend(v7, "length"), a4);
      uint64_t v21 = LABEL_14:;
      *id v16 = [v17 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:3 description:v21];

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __s2[0] = v18;
  __s2[1] = v18;
  unint64_t v19 = [v7 length] - a4;
  ccsha256_di();
  id v20 = v7;
  [v20 bytes];
  ccdigest();
  id v16 = a5;
  if (a4 >= 0x21)
  {
    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      objc_msgSend(NSString, "stringWithFormat:", @"checksumsize (%zu) too long (expected %zu)", a4, 32);
      goto LABEL_14;
    }
LABEL_21:
    objc_super v28 = 0;
    goto LABEL_22;
  }
  id v26 = v20;
  if (memcmp((const void *)([v26 bytes] + v19), __s2, a4))
  {
    if (a5)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = [NSString stringWithFormat:@"Checksum does not match"];
      uint64_t v24 = v27;
      uint64_t v25 = 2;
LABEL_20:
      *id v16 = [v24 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v25 description:v23];

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_super v28 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v26, "bytes"), v19);
LABEL_22:

  return v28;
}

+ (id)printableWithData:(id)a3 checksumSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v7, "length") + a4);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = v9;
  v29[1] = v9;
  ccsha256_di();
  [v7 length];
  id v10 = v7;
  [v10 bytes];
  ccdigest();
  [v8 appendData:v10];
  if (a4 < 0x21)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:a4];
    [v8 appendData:v14];

    id v15 = v8;
    uint64_t v16 = [v15 bytes];
    unint64_t v17 = [v15 length];
    id v12 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
    if (v17)
    {
      unint64_t v18 = v17 - 5;
      if (v17 >= 5) {
        uint64_t v19 = 5;
      }
      else {
        uint64_t v19 = v17;
      }
      uint64_t v20 = +[OTInheritanceKey base32:v16 len:v19];
      if (!v20)
      {
LABEL_19:
        if (a5)
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          id v26 = objc_msgSend(NSString, "stringWithFormat:", @"bad chunkLen (%zu)", v19);
          *a5 = [v25 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:6 description:v26];
        }
        uint64_t v13 = 0;
        goto LABEL_25;
      }
      uint64_t v21 = (void *)v20;
      id v28 = v10;
      unint64_t v22 = 5;
      while (1)
      {
        if ((unint64_t)[v21 length] < 5)
        {
          [v12 appendString:v21];
        }
        else
        {
          uint64_t v23 = [v21 substringToIndex:4];
          [v12 appendString:v23];

          [v12 appendString:@"-"];
          uint64_t v24 = [v21 substringFromIndex:4];
          [v12 appendString:v24];
        }
        if (v22 >= v17) {
          break;
        }
        [v12 appendString:@"-"];

        if (v18 >= 5) {
          uint64_t v19 = 5;
        }
        else {
          uint64_t v19 = v18;
        }
        uint64_t v21 = +[OTInheritanceKey base32:v16 + v22 len:v19];
        v22 += 5;
        v18 -= 5;
        if (!v21)
        {
          id v10 = v28;
          goto LABEL_19;
        }
      }

      id v10 = v28;
    }
    id v12 = v12;
    uint64_t v13 = v12;
  }
  else
  {
    if (!a5)
    {
      uint64_t v13 = 0;
      goto LABEL_26;
    }
    unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    objc_msgSend(NSString, "stringWithFormat:", @"checksumSize (%zu) too large (%zu)", a4, 32);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:3 description:v12];
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:

LABEL_26:
  return v13;
}

+ (id)unbase32:(const char *)a3 len:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v15 = -1431655766;
  unint64_t v4 = a4 - 2;
  if (a4 - 2 <= 6 && ((0x6Du >> v4) & 1) != 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = qword_19C7DB8D0[v4];
    *(void *)&long long v11 = -1;
    *((void *)&v11 + 1) = -1;
    long long v18 = v11;
    long long v19 = v11;
    long long v16 = v11;
    long long v17 = v11;
    while (1)
    {
      id v12 = memchr("ABCDEFGHJKLMNPQRSTUVWXYZ23456789", a3[v9], 0x21uLL);
      uint64_t v13 = v12 - "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
      if (!v12) {
        uint64_t v13 = -1;
      }
      *((void *)&v16 + v9) = v13;
      if (v13 < 0) {
        break;
      }
      if (a4 == ++v9)
      {
        char v14 = (DWORD2(v16) >> 2) | (8 * v16);
        if (a4 >= 4)
        {
          LOBYTE(v15) = (2 * v17) | (BYTE8(v16) << 6) | (DWORD2(v17) >> 4);
          if (a4 != 4)
          {
            BYTE1(v15) = (v18 >> 1) | (16 * BYTE8(v17));
            if (a4 >= 7)
            {
              BYTE2(v15) = (4 * BYTE8(v18)) | ((_BYTE)v18 << 7) | (v19 >> 3);
              if (a4 == 8) {
                HIBYTE(v15) = BYTE8(v19) | (32 * v19);
              }
            }
          }
        }
        uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:v10];
        goto LABEL_4;
      }
    }
  }
  uint64_t v5 = 0;
LABEL_4:
  return v5;
}

+ (id)base32:(const char *)a3 len:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 170, sizeof(v15));
  if (!a4) {
    goto LABEL_11;
  }
  unint64_t v4 = *(unsigned __int8 *)a3;
  char v14 = printableChars[v4 >> 3];
  unint64_t v5 = 4 * (v4 & 7);
  if (a4 != 1)
  {
    unint64_t v8 = *((unsigned __int8 *)a3 + 1);
    v15[0] = printableChars[v5 | (v8 >> 6)];
    v15[1] = printableChars[(v8 >> 1) & 0x1F];
    unint64_t v5 = 16 * (v8 & 1);
    if (a4 == 2)
    {
      unint64_t v6 = &v15[2];
      uint64_t v7 = 4;
      goto LABEL_13;
    }
    unint64_t v9 = *((unsigned __int8 *)a3 + 2);
    v15[2] = printableChars[v5 | (v9 >> 4)];
    uint64_t v10 = 2 * (v9 & 0xF);
    if (a4 == 3)
    {
      unint64_t v6 = &v15[3];
      uint64_t v7 = 5;
      LODWORD(v5) = v10;
      goto LABEL_13;
    }
    unint64_t v5 = *((unsigned __int8 *)a3 + 3);
    v15[3] = printableChars[v10 | (v5 >> 7)];
    v15[4] = printableChars[(v5 >> 2) & 0x1F];
    if (a4 == 5)
    {
      unint64_t v6 = &v15[6];
      unsigned int v12 = *((unsigned __int8 *)a3 + 4);
      v15[5] = printableChars[(v12 >> 5) & 0xFFFFFFE7 | (8 * (v5 & 3))];
      LODWORD(v5) = v12 & 0x1F;
      uint64_t v7 = 8;
      goto LABEL_13;
    }
    if (a4 == 4)
    {
      unint64_t v6 = &v15[5];
      LODWORD(v5) = 8 * (v5 & 3);
      uint64_t v7 = 7;
      goto LABEL_13;
    }
LABEL_11:
    long long v11 = 0;
    goto LABEL_14;
  }
  unint64_t v6 = v15;
  uint64_t v7 = 2;
LABEL_13:
  *unint64_t v6 = printableChars[v5];
  long long v11 = (void *)[[NSString alloc] initWithBytes:&v14 length:v7 encoding:4];
LABEL_14:
  return v11;
}

@end